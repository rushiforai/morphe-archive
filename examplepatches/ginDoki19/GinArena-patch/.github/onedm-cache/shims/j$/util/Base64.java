package j$.util;

public final class Base64 {
    private Base64() {}

    public static Encoder getEncoder() {
        return new Encoder(java.util.Base64.getEncoder());
    }

    public static Decoder getDecoder() {
        return new Decoder(java.util.Base64.getDecoder());
    }

    public static final class Encoder {
        private final java.util.Base64.Encoder delegate;
        Encoder(java.util.Base64.Encoder d) { this.delegate = d; }
        public String encodeToString(byte[] src) { return delegate.encodeToString(src); }
        public byte[] encode(byte[] src) { return delegate.encode(src); }
    }

    public static final class Decoder {
        private final java.util.Base64.Decoder delegate;
        Decoder(java.util.Base64.Decoder d) { this.delegate = d; }
        public byte[] decode(String src) { return delegate.decode(src); }
        public byte[] decode(byte[] src) { return delegate.decode(src); }
    }
}
