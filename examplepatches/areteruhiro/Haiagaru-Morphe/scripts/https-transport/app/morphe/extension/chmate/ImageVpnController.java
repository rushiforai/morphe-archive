package app.morphe.extension.chmate;
import java.net.URL;
/** Disabled optional VPN for the pure HTTPS policy/loopback test. */
public final class ImageVpnController {
    public static boolean enabled(){return false;}
    public static boolean isLocalEndpoint(String host,int port){return false;}
    public static URL route(URL url){return url;}
}
