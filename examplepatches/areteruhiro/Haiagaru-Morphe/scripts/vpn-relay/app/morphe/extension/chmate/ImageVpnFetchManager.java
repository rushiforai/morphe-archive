package app.morphe.extension.chmate;
import java.io.IOException;
import app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image;
/** Offline backend only; not compiled into Android. */
public final class ImageVpnFetchManager {
    private static ImageVpnFetchManager instance;
    public static ImageVpnFetchManager getInstance(android.content.Context context) {
        if (instance == null || instance.closed) instance = new ImageVpnFetchManager();
        return instance;
    }
    public String status() { return "IMAGE_VPN_FAKE_BACKEND"; }
    public int calls;
    public boolean fail, closed;
    public Image fetch(String url) throws IOException {
        calls++;
        if (fail || closed) throw new IOException("IMAGE_VPN_DISCONNECTED");
        return new Image();
    }
    public Image fetchPreview(String url) throws IOException { return fetch(url); }
    public void close() { closed = true; }
}
