package imagevpn

import (
    "crypto/ecdsa"
    "crypto/elliptic"
    "crypto/rand"
    "crypto/x509"
    "crypto/x509/pkix"
    "encoding/pem"
    "math/big"
    "net"
    "strings"
    "sync"
    "testing"
    "time"
)

type testSink struct { mu sync.Mutex; packets [][]byte }
func (s *testSink) WritePacket(packet []byte) error {
    s.mu.Lock(); defer s.mu.Unlock(); s.packets = append(s.packets, append([]byte(nil), packet...)); return nil
}

func testRoots(t *testing.T) string {
    t.Helper()
    key, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader); if err != nil { t.Fatal(err) }
    template := &x509.Certificate{SerialNumber: big.NewInt(1), Subject: pkix.Name{CommonName: "Offline test root"},
        NotBefore: time.Now().Add(-time.Hour), NotAfter: time.Now().Add(time.Hour),
        IsCA: true, BasicConstraintsValid: true, KeyUsage: x509.KeyUsageCertSign}
    der, err := x509.CreateCertificate(rand.Reader, template, template, &key.PublicKey, key); if err != nil { t.Fatal(err) }
    return string(pem.EncodeToMemory(&pem.Block{Type: "CERTIFICATE", Bytes: der}))
}

func TestPublicAddresses(t *testing.T) {
    for _, text := range []string{"127.0.0.1", "10.0.0.1", "169.254.169.254", "192.168.1.1", "100.64.0.1", "192.0.2.1", "198.18.0.1", "203.0.113.1", "::1"} {
        if publicIPv4(net.ParseIP(text)) { t.Fatal("Nonpublic accepted", text) }
    }
    if !publicIPv4(net.ParseIP("1.1.1.1")) { t.Fatal("Public rejected") }
}

func TestOnlyPrivatePacketLinkForDNS(t *testing.T) {
    sink := &testSink{}
    session, err := NewSession("10.8.0.2", "10.8.0.1", testRoots(t), 1500, sink)
    if err != nil { t.Fatal(err) }; defer session.Close()
    // No peer exists. Fetch must time out after emitting DNS through our fake packet link.
    _, err = session.Fetch("https://tools.yajuvideo.st/om/offline.jpg", 1024, 1000)
    if err == nil { t.Fatal("Fetch succeeded without tunnel peer") }
    sink.mu.Lock(); defer sink.mu.Unlock()
    if len(sink.packets) == 0 { t.Fatal("No tunnel DNS packet") }
    for _, packet := range sink.packets {
        if len(packet) < 28 || packet[9] != 17 || !net.IP(packet[12:16]).Equal(net.ParseIP("10.8.0.2")) ||
            !net.IP(packet[16:20]).Equal(net.ParseIP("10.8.0.1")) || packet[22] != 0 || packet[23] != 53 {
            t.Fatal("Packet escaped DNS-only private link", packet)
        }
    }
}

func TestFailClosedAndInputs(t *testing.T) {
    session, err := NewSession("10.8.0.2", "10.8.0.1", testRoots(t), 1500, &testSink{})
    if err != nil { t.Fatal(err) }
    for _, raw := range []string{"https:///a.jpg", "file:///etc/passwd", "https://user@tools.yajuvideo.st/a.jpg", "https://tools.yajuvideo.st:8080/a.jpg"} {
        if _, err := session.Fetch(raw, 1024, 1000); err == nil { t.Fatal("URL accepted", raw) }
    }
    session.Close()
    if err := session.Receive(make([]byte, 20)); err == nil { t.Fatal("Invalid packet accepted") }
    _, err = session.Fetch("https://tools.yajuvideo.st/om/offline.jpg", 1024, 1000)
    if err == nil || !(strings.Contains(err.Error(), "cancel") || strings.Contains(err.Error(), "DISCONNECTED")) { t.Fatal("Disconnected request", err) }
}
