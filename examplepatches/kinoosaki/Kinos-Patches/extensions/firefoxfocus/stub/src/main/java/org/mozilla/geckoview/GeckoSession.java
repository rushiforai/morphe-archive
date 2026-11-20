package org.mozilla.geckoview;

/** Stub of the GeckoSession members the extension uses (Focus 158.0 / GeckoView 158.0.1). */
public class GeckoSession {
    public GeckoSession(GeckoSessionSettings settings) {
        throw new RuntimeException("Stub!");
    }

    public void open(GeckoRuntime runtime) {
        throw new RuntimeException("Stub!");
    }

    public boolean isOpen() {
        throw new RuntimeException("Stub!");
    }

    public void close() {
        throw new RuntimeException("Stub!");
    }

    public void loadUri(String uri) {
        throw new RuntimeException("Stub!");
    }

    public void setActive(boolean active) {
        throw new RuntimeException("Stub!");
    }

    public void setFocused(boolean focused) {
        throw new RuntimeException("Stub!");
    }

    public ContentDelegate getContentDelegate() {
        throw new RuntimeException("Stub!");
    }

    public void setContentDelegate(ContentDelegate delegate) {
        throw new RuntimeException("Stub!");
    }

    /** The real interface has many more default methods; the extension proxies all of them. */
    public interface ContentDelegate {
        default void onCloseRequest(GeckoSession session) {
        }
    }
}
