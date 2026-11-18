package app.afterglow.extension.menus;

import java.net.URI;
import java.util.Locale;
import java.util.regex.Pattern;

/** Only the verified native avatar image leaf can expose these actions. */
public final class AvatarPhotoPolicy {
    private static final Pattern AVATAR=Pattern.compile("(?:^|\\|)avatar\\.eml-fe\\|[0-9a-f]{16}\\|ImageType\\|?$");
    private static final Pattern SIZE=Pattern.compile("=s[0-9]{1,5}(?=-|$)");
    private AvatarPhotoPolicy() {}
    public static boolean avatarPath(String path){return path!=null&&path.length()<=8192&&AVATAR.matcher(path).find();}
    public static boolean allowed(URI uri) {
        if(uri==null||!"https".equalsIgnoreCase(uri.getScheme())||uri.getRawUserInfo()!=null
                ||uri.getFragment()!=null||(uri.getPort()!=-1&&uri.getPort()!=443))return false;
        String host=uri.getHost();if(host==null)return false;host=host.toLowerCase(Locale.ROOT);
        return host.equals("yt3.ggpht.com")||host.equals("yt4.ggpht.com")
            ||host.equals("yt3.googleusercontent.com")||host.equals("yt4.googleusercontent.com")
            ||host.matches("lh[3-6]\\.googleusercontent\\.com");
    }
    /** Preserve the native URL and crop options, changing only its explicit image-size token. */
    public static String largeUrl(String original) {
        if(original==null||original.length()>8192)return null;
        try {
            URI uri=new URI(original);if(!allowed(uri))return null;
            String raw=uri.getRawPath(),large=SIZE.matcher(raw==null?"":raw).replaceFirst("=s1024");
            if(raw==null||raw.equals(large))return original;
            int pathStart=original.indexOf(raw,original.indexOf("://")+3);
            return pathStart<0?null:original.substring(0,pathStart)+large+original.substring(pathStart+raw.length());
        }catch(Exception ignored){return null;}
    }
}
