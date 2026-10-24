// Image-only userspace network stack. No OS routes or default network dialers.
package imagevpn

import (
    "context"
    "crypto/tls"
    "crypto/x509"
    "errors"
    "fmt"
    "io"
    "net"
    "net/http"
    "net/url"
    "strconv"
    "strings"
    "sync"
    "time"

    "gvisor.dev/gvisor/pkg/buffer"
    "gvisor.dev/gvisor/pkg/tcpip"
    "gvisor.dev/gvisor/pkg/tcpip/adapters/gonet"
    "gvisor.dev/gvisor/pkg/tcpip/link/channel"
    "gvisor.dev/gvisor/pkg/tcpip/network/ipv4"
    "gvisor.dev/gvisor/pkg/tcpip/stack"
    "gvisor.dev/gvisor/pkg/tcpip/transport/tcp"
    "gvisor.dev/gvisor/pkg/tcpip/transport/udp"
)

// PacketSink is the SSTP engine's private IP-packet output, not a TUN device.
type PacketSink interface { WritePacket(packet []byte) error }

type Session struct {
    mu sync.Mutex
    network *stack.Stack
    link *channel.Endpoint
    cancel context.CancelFunc
    ctx context.Context
    resolver *net.Resolver
    roots *x509.CertPool
    closed bool
}

func NewSession(localAddress, dnsAddress, rootsPEM string, mtu int, sink PacketSink) (*Session, error) {
    local, dns := net.ParseIP(localAddress).To4(), net.ParseIP(dnsAddress).To4()
    if local == nil || dns == nil || sink == nil || mtu < 576 || mtu > 2000 {
        return nil, errors.New("IMAGE_VPN_INVALID_STACK_PARAMETERS")
    }
    roots := x509.NewCertPool()
    if !roots.AppendCertsFromPEM([]byte(rootsPEM)) { return nil, errors.New("IMAGE_VPN_NO_TRUST_ROOTS") }
    ctx, cancel := context.WithCancel(context.Background())
    s := &Session{ctx: ctx, cancel: cancel, roots: roots}
    s.network = stack.New(stack.Options{
        NetworkProtocols: []stack.NetworkProtocolFactory{ipv4.NewProtocol},
        TransportProtocols: []stack.TransportProtocolFactory{tcp.NewProtocol, udp.NewProtocol},
    })
    s.link = channel.New(128, uint32(mtu), "")
    if err := s.network.CreateNIC(1, s.link); err != nil { s.Close(); return nil, fmt.Errorf("IMAGE_VPN_NIC: %s", err.String()) }
    address := tcpip.AddrFrom4Slice(local)
    if err := s.network.AddProtocolAddress(1, tcpip.ProtocolAddress{Protocol: ipv4.ProtocolNumber,
        AddressWithPrefix: address.WithPrefix()}, stack.AddressProperties{}); err != nil {
        s.Close(); return nil, fmt.Errorf("IMAGE_VPN_ADDRESS: %s", err.String())
    }
    s.network.SetRouteTable([]tcpip.Route{{Destination: tcpip.AddressWithPrefix{
        Address: tcpip.AddrFrom4([4]byte{}), PrefixLen: 0}.Subnet(), NIC: 1}})
    s.resolver = &net.Resolver{PreferGo: true, Dial: func(ctx context.Context, _, _ string) (net.Conn, error) {
        select { case <-s.ctx.Done(): return nil, errors.New("IMAGE_VPN_DISCONNECTED"); default: }
        remote := tcpip.FullAddress{NIC: 1, Addr: tcpip.AddrFrom4Slice(dns), Port: 53}
        // No net.Dial fallback; resolver packets are carried by the private link.
        return gonet.DialUDP(s.network, nil, &remote, ipv4.ProtocolNumber)
    }}
    go func() {
        for {
            packet := s.link.ReadContext(ctx)
            if packet == nil { return }
            view := packet.ToView()
            bytes := append([]byte(nil), view.AsSlice()...)
            view.Release(); packet.DecRef()
            if err := sink.WritePacket(bytes); err != nil { s.Close(); return }
        }
    }()
    return s, nil
}

// Receive accepts decrypted IP packets only from the current SSTP session.
func (s *Session) Receive(packet []byte) error {
    if len(packet) < 20 || packet[0] >> 4 != 4 { return errors.New("IMAGE_VPN_INVALID_IP_PACKET") }
    s.mu.Lock(); defer s.mu.Unlock()
    if s.closed { return errors.New("IMAGE_VPN_DISCONNECTED") }
    pkt := stack.NewPacketBuffer(stack.PacketBufferOptions{Payload: buffer.MakeWithData(append([]byte(nil), packet...))})
    s.link.InjectInbound(ipv4.ProtocolNumber, pkt)
    pkt.DecRef()
    return nil
}

func (s *Session) dial(ctx context.Context, _, address string) (net.Conn, error) {
    host, portText, err := net.SplitHostPort(address)
    if err != nil { return nil, errors.New("IMAGE_VPN_INVALID_DESTINATION") }
    port, err := strconv.Atoi(portText)
    if err != nil || (port != 80 && port != 443) { return nil, errors.New("IMAGE_VPN_INVALID_PORT") }
    ips, err := s.resolver.LookupIP(ctx, "ip4", host)
    if err != nil { return nil, fmt.Errorf("IMAGE_VPN_DNS: %w", err) }
    var last error
    for _, ip := range ips {
        if !publicIPv4(ip) { return nil, errors.New("IMAGE_VPN_NONPUBLIC_DESTINATION") }
    }
    for _, ip := range ips {
        select { case <-s.ctx.Done(): return nil, errors.New("IMAGE_VPN_DISCONNECTED"); default: }
        conn, err := gonet.DialContextTCP(ctx, s.network, tcpip.FullAddress{
            NIC: 1, Addr: tcpip.AddrFrom4Slice(ip.To4()), Port: uint16(port)}, ipv4.ProtocolNumber)
        if err == nil { return conn, nil }; last = err
    }
    if last == nil { last = errors.New("IMAGE_VPN_NO_ADDRESS") }
    return nil, last
}

func publicIPv4(ip net.IP) bool {
    ip = ip.To4()
    if ip == nil || !ip.IsGlobalUnicast() || ip.IsPrivate() { return false }
    for _, cidr := range []string{"0.0.0.0/8", "100.64.0.0/10", "127.0.0.0/8", "169.254.0.0/16",
        "192.0.0.0/24", "192.0.2.0/24", "198.18.0.0/15", "198.51.100.0/24", "203.0.113.0/24", "224.0.0.0/3"} {
        _, network, _ := net.ParseCIDR(cidr)
        if network.Contains(ip) { return false }
    }
    return true
}

type Image struct { Body []byte; ContentType string; URL string }

// Fetch is reached only through Java's registered-domain policy and local capability relay.
func (s *Session) Fetch(rawURL string, maxBytes, timeoutMillis int64) (*Image, error) {
    u, err := url.Parse(rawURL)
    if err != nil || u.Hostname() == "" || u.User != nil ||
        (u.Scheme != "http" && u.Scheme != "https") || (u.Port() != "" && u.Port() != "80" && u.Port() != "443") {
        return nil, errors.New("IMAGE_VPN_INVALID_IMAGE_URL")
    }
    return s.fetch(rawURL, maxBytes, timeoutMillis, true)
}

// FetchPreview is internal to the app's registered-domain preview pipeline.
// DNS, redirects and TLS use the same private transport; no browser state or fallback.
func (s *Session) FetchPreview(rawURL string, maxBytes, timeoutMillis int64) (*Image, error) {
    u, err := url.Parse(rawURL)
    if err != nil || u.Hostname() == "" || u.User != nil ||
        (u.Scheme != "http" && u.Scheme != "https") || (u.Port() != "" && u.Port() != "80" && u.Port() != "443") {
        return nil, errors.New("IMAGE_VPN_INVALID_PREVIEW_URL")
    }
    return s.fetch(rawURL, maxBytes, timeoutMillis, false)
}

// ProbeExitAddress is a fixed diagnostic endpoint, never an arbitrary forwarding URL.
// It uses precisely the same private DNS/TCP/TLS transport as image downloads.
func (s *Session) ProbeExitAddress() (string, error) {
    response, err := s.fetch("https://api.ipify.org/", 128, 15000, false)
    if err != nil { return "", err }
    address := strings.TrimSpace(string(response.Body))
    if !publicIPv4(net.ParseIP(address)) { return "", errors.New("IMAGE_VPN_INVALID_EXIT_ADDRESS") }
    return address, nil
}

func (s *Session) fetch(rawURL string, maxBytes, timeoutMillis int64, expectImage bool) (*Image, error) {
    if maxBytes < 1 || maxBytes > 32*1024*1024 || timeoutMillis < 1000 || timeoutMillis > 120000 {
        return nil, errors.New("IMAGE_VPN_INVALID_FETCH_LIMITS")
    }
    ctx, cancel := context.WithTimeout(s.ctx, time.Duration(timeoutMillis)*time.Millisecond)
    defer cancel()
    transport := &http.Transport{Proxy: nil, DialContext: s.dial,
        TLSClientConfig: &tls.Config{RootCAs: s.roots, MinVersion: tls.VersionTLS12},
        DisableKeepAlives: true, MaxResponseHeaderBytes: 64*1024}
    defer transport.CloseIdleConnections()
    client := &http.Client{Transport: transport, CheckRedirect: func(req *http.Request, via []*http.Request) error {
        if len(via) > 5 || req.URL.User != nil || (req.URL.Scheme != "http" && req.URL.Scheme != "https") ||
            (req.URL.Port() != "" && req.URL.Port() != "80" && req.URL.Port() != "443") ||
            (via[len(via)-1].URL.Scheme == "https" && req.URL.Scheme != "https") {
            return errors.New("IMAGE_VPN_INVALID_REDIRECT")
        }
        // Redirects stay on this transport and resolver, including across hosts.
        return nil
    }}
    request, err := http.NewRequestWithContext(ctx, http.MethodGet, rawURL, nil)
    if err != nil { return nil, err }
    if expectImage { request.Header.Set("Accept", "image/*") } else {
        request.Header.Set("Accept", "text/html,application/xhtml+xml,image/*")
    }
    // No ChMate cookies, account tokens or posting headers are forwarded.
    response, err := client.Do(request)
    if err != nil { return nil, err }
    defer response.Body.Close()
    if response.StatusCode != http.StatusOK { return nil, fmt.Errorf("IMAGE_VPN_HTTP_%d", response.StatusCode) }
    if response.ContentLength > maxBytes { return nil, errors.New("IMAGE_VPN_IMAGE_TOO_LARGE") }
    data, err := io.ReadAll(io.LimitReader(response.Body, maxBytes+1))
    if err != nil { return nil, err }
    if int64(len(data)) > maxBytes { return nil, errors.New("IMAGE_VPN_IMAGE_TOO_LARGE") }
    contentType := http.DetectContentType(data)
    if expectImage && !strings.HasPrefix(contentType, "image/") { return nil, errors.New("IMAGE_VPN_NOT_AN_IMAGE") }
    return &Image{Body: data, ContentType: contentType, URL: response.Request.URL.String()}, nil
}

func (s *Session) Close() {
    s.mu.Lock(); defer s.mu.Unlock()
    if s.closed { return }; s.closed = true
    if s.cancel != nil { s.cancel() }
    if s.network != nil { s.network.Close() }
    if s.link != nil { s.link.Close() }
}
