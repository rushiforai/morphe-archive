package app.afterglow.extension.litho;

/**
 * YouTube's native (Upb) element proto, as the Afterglow filters see it.
 *
 * <p>The Litho filter patch adds this interface to the Upb message class
 * ({@code Lvgs;} in 21.43.523), whose subclass {@code Lwmw;} is the element
 * being converted. Encoding is done only when a matched filter asks for the
 * bytes ({@link LithoComponent#buffer()}), not for every component.
 *
 * <p>Elements of the other element class ({@code Lvxc;}) cannot be encoded
 * (YouTube's own encoder throws for them) and have no bytes.
 */
public interface ElementProto {
    /** The element encoded as protobuf bytes, by YouTube's own encoder. */
    byte[] afterglow_encodeProto();
}
