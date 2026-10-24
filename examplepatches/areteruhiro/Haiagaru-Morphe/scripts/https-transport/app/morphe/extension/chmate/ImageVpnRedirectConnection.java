package app.morphe.extension.chmate;
import java.net.*;
/** VPN wrapping is out of scope for this policy test. */
public final class ImageVpnRedirectConnection {
    public static URLConnection wrap(URLConnection connection,URL url,Proxy proxy,boolean explicit){return connection;}
}
