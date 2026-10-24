package imagevpn

import (
    "context"
    "encoding/base64"
    "encoding/binary"
    "io"
    "net/http"
    "strings"
    "sync"
    "testing"

    "gvisor.dev/gvisor/pkg/buffer"
    "gvisor.dev/gvisor/pkg/tcpip"
    "gvisor.dev/gvisor/pkg/tcpip/adapters/gonet"
    "gvisor.dev/gvisor/pkg/tcpip/link/channel"
    "gvisor.dev/gvisor/pkg/tcpip/network/ipv4"
    "gvisor.dev/gvisor/pkg/tcpip/stack"
    "gvisor.dev/gvisor/pkg/tcpip/transport/tcp"
    "gvisor.dev/gvisor/pkg/tcpip/transport/udp"
)

// Offline peer emulates a VPN exit. All addresses are virtual: no net.Listen,
// OS resolver, external HTTP client or operating-system socket is used.
type offlinePeer struct { link *channel.Endpoint }
func (p *offlinePeer) WritePacket(bytes []byte) error {
    packet := stack.NewPacketBuffer(stack.PacketBufferOptions{Payload: buffer.MakeWithData(append([]byte(nil), bytes...))})
    defer packet.DecRef()
    p.link.InjectInbound(ipv4.ProtocolNumber, packet)
    return nil
}

func TestPrivateImageAndRedirectPipeline(t *testing.T) {
    ctx, cancel := context.WithCancel(context.Background())
    defer cancel()
    peer := stack.New(stack.Options{NetworkProtocols: []stack.NetworkProtocolFactory{ipv4.NewProtocol},
        TransportProtocols: []stack.TransportProtocolFactory{tcp.NewProtocol, udp.NewProtocol}})
    defer peer.Close()
    link := channel.New(128, 1500, "")
    defer link.Close()
    if err := peer.CreateNIC(1, link); err != nil { t.Fatal(err) }
    for _, address := range [][4]byte{{10,8,0,1}, {8,8,8,8}} {
        err := peer.AddProtocolAddress(1, tcpip.ProtocolAddress{Protocol: ipv4.ProtocolNumber,
            AddressWithPrefix: tcpip.AddrFrom4(address).WithPrefix()}, stack.AddressProperties{})
        if err != nil { t.Fatal(err) }
    }
    peer.SetRouteTable([]tcpip.Route{{Destination: tcpip.AddressWithPrefix{
        Address: tcpip.AddrFrom4([4]byte{}), PrefixLen: 0}.Subnet(), NIC: 1}})
    session, err := NewSession("10.8.0.2", "10.8.0.1", testRoots(t), 1500, &offlinePeer{link})
    if err != nil { t.Fatal(err) }
    defer session.Close()
    go func() {
        for {
            packet := link.ReadContext(ctx)
            if packet == nil { return }
            view := packet.ToView()
            data := append([]byte(nil), view.AsSlice()...)
            view.Release(); packet.DecRef()
            if session.Receive(data) != nil { return }
        }
    }()
    dns, err := gonet.DialUDP(peer, &tcpip.FullAddress{NIC:1,
        Addr:tcpip.AddrFrom4([4]byte{10,8,0,1}), Port:53}, nil, ipv4.ProtocolNumber)
    if err != nil { t.Fatal(err) }
    defer dns.Close()
    var namesMu sync.Mutex
    var names []string
    go func() {
        data := make([]byte, 4096)
        for {
            size, address, readErr := dns.ReadFrom(data)
            if readErr != nil { return }
            query := append([]byte(nil), data[:size]...)
            if size < 17 || binary.BigEndian.Uint16(query[4:6]) != 1 { continue }
            at := 12
            name := ""
            for at < size && query[at] != 0 {
                length := int(query[at]); at++
                if length > 63 || at+length >= size { at = size; break }
                if name != "" { name += "." }; name += string(query[at:at+length]); at += length
            }
            at++
            if at+4 > size || binary.BigEndian.Uint16(query[at:at+2]) != 1 { continue }
            at += 4
            namesMu.Lock(); names = append(names, name); namesMu.Unlock()
            answer := append([]byte(nil), query[:at]...)
            binary.BigEndian.PutUint16(answer[2:4], 0x8180)
            binary.BigEndian.PutUint16(answer[6:8], 1)
            binary.BigEndian.PutUint16(answer[8:10], 0)
            binary.BigEndian.PutUint16(answer[10:12], 0)
            answer = append(answer, 0xc0,0x0c, 0,1, 0,1, 0,0,0,60, 0,4, 8,8,8,8)
            dns.WriteTo(answer, address)
        }
    }()
    listener, err := gonet.ListenTCP(peer, tcpip.FullAddress{NIC:1,
        Addr:tcpip.AddrFrom4([4]byte{8,8,8,8}), Port:80}, ipv4.ProtocolNumber)
    if err != nil { t.Fatal(err) }
    defer listener.Close()
    png, err := base64.StdEncoding.DecodeString("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+jRZkAAAAASUVORK5CYII=")
    if err != nil { t.Fatal(err) }
    server := &http.Server{Handler:http.HandlerFunc(func(w http.ResponseWriter, request *http.Request) {
        switch request.URL.Path {
        case "/redirect": http.Redirect(w, request, "http://offline-redirect.example/image", 302)
        case "/private": http.Redirect(w, request, "http://127.0.0.1/image", 302)
        case "/loop": http.Redirect(w, request, "/loop", 302)
        case "/text": io.WriteString(w, "not an image")
        case "/html": w.Header().Set("Content-Type", "text/html"); io.WriteString(w, "<!doctype html><title>Offline preview</title>")
        default: w.Header().Set("Content-Type", "image/png"); w.Write(png)
        }
    })}
    defer server.Close()
    go server.Serve(listener)
    image, err := session.Fetch("http://tools.yajuvideo.st/redirect", 1024, 5000)
    if err != nil { t.Fatal(err) }
    if string(image.Body) != string(png) || image.ContentType != "image/png" { t.Fatal("Image bytes changed") }
    for _, host := range []string{"www.activetk.jp", "loggerip.web.app", "custom-image.example"} {
        // These names resolve only inside the fake peer. No access to the real sites.
        result, err := session.Fetch("http://"+host+"/image", 1024, 5000)
        if err != nil || string(result.Body) != string(png) { t.Fatal("Registered image", host, err) }
    }
    preview, err := session.FetchPreview("http://offline-preview.example/html",1024,5000)
    if err != nil || !strings.HasPrefix(preview.ContentType,"text/html") || preview.URL!="http://offline-preview.example/html" {
        t.Fatal("Private HTML preview",err)
    }
    namesMu.Lock()
    seen := map[string]bool{}
    for _, name := range names { seen[name] = true }
    namesMu.Unlock()
    if !seen["tools.yajuvideo.st"] || !seen["offline-redirect.example"] { t.Fatal("Redirect DNS left private peer", seen) }
    for _, path := range []string{"/private", "/loop", "/text"} {
        if _, err := session.Fetch("http://tools.yajuvideo.st"+path, 1024, 5000); err == nil { t.Fatal("Invalid response accepted", path) }
    }
    if _, err := session.Fetch("http://tools.yajuvideo.st/image", 16, 5000); err == nil { t.Fatal("Image size limit ignored") }
    session.Close()
    if _, err := session.Fetch("http://tools.yajuvideo.st/image", 1024, 1000); err == nil { t.Fatal("Disconnected fetch succeeded") }
}
