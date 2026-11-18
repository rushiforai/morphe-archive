package app.afterglow.extension.navigation;

/** Implemented on native Lavcl; byte serialization uses YouTube's existing protobuf runtime. */
public interface NativeTabItem {
    byte[] afterglow_tabProto();
}
