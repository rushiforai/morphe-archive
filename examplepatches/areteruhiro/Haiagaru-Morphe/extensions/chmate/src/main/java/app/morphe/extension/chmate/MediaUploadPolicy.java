package app.morphe.extension.chmate;

import java.io.*;
import java.net.URI;
import java.nio.charset.StandardCharsets;

/** No Android state, credentials or network access. Fail closed before sending media. */
public final class MediaUploadPolicy {
    public static final String NATIVE = "native", IMGBOX = "imgbox", IMGPILE = "imgpile",
            IMGPILE_WEB = "imgpile-web", SENDVID = "sendvid", UGUU = "uguu";
    public static final long UGUU_LIMIT = 128L * 1024 * 1024;
    public static final long IMGBOX_LIMIT = 10_000_000L, IMGPILE_LIMIT = 97_000_000L;
    public static final long IMGPILE_WEB_LIMIT = 100_000_000L, SENDVID_LIMIT = 1000L * 1024 * 1024;
    private MediaUploadPolicy() {}

    public static String destination(String imageHost,String videoHost,String mime) throws IOException {
        String selected=mime.startsWith("video/")?videoHost:imageHost;
        if (!NATIVE.equals(selected) && !IMGBOX.equals(selected) && !IMGPILE.equals(selected)
                && !IMGPILE_WEB.equals(selected) && !SENDVID.equals(selected) && !UGUU.equals(selected))
            throw new IOException("アップロード先の設定を確認してください");
        return selected;
    }

    public static String mime(File file) throws IOException {
        byte[] b = new byte[32]; int n;
        try (InputStream input = new FileInputStream(file)) { n = input.read(b); }
        if (n >= 8 && (b[0]&255)==137 && ascii(b,1,3).equals("PNG")
                && b[4]==13 && b[5]==10 && b[6]==26 && b[7]==10) return "image/png";
        if (n >= 3 && (b[0]&255)==255 && (b[1]&255)==216 && (b[2]&255)==255) return "image/jpeg";
        if (n >= 6 && (ascii(b,0,6).equals("GIF87a") || ascii(b,0,6).equals("GIF89a"))) return "image/gif";
        if (n >= 12 && ascii(b,0,4).equals("RIFF") && ascii(b,8,4).equals("WEBP")) return "image/webp";
        if (n >= 12 && ascii(b,4,4).equals("ftyp")) {
            String brand = ascii(b,8,4);
            // HEIF/AVIF share the ISO container, but are not MP4 videos.
            if (brand.equals("avif") || brand.equals("avis")) return "image/avif";
            if (brand.matches("hei[cfvx]|mif1|msf1")) return "image/heic";
            if (brand.equals("qt  ")) return "video/quicktime";
            if (brand.matches("isom|iso[2-9]|mp4[12]|avc1|M4V |MSNV|dash")) return "video/mp4";
        }
        if (n >= 4 && (b[0]&255)==26 && (b[1]&255)==69 && (b[2]&255)==223 && (b[3]&255)==163)
            return "video/webm";
        throw new IOException("アップロードできる画像・動画形式を判別できません");
    }
    private static String ascii(byte[] b,int offset,int size) { return new String(b,offset,size,StandardCharsets.US_ASCII); }

    public static void validate(String provider,String mime,long length,String apiKey) throws IOException {
        if(UGUU.equals(provider)){
            if(length<=0)throw new IOException("送信ファイルが空です");
            if(!(mime.equals("image/png")||mime.equals("image/jpeg")||mime.equals("image/gif")||mime.equals("image/webp")
                    ||mime.equals("video/mp4")||mime.equals("video/webm")||mime.equals("video/quicktime")))throw new IOException("この形式はuguu.se送信に対応していません");
            if(length>UGUU_LIMIT)throw new MediaUploadSizeException();
            return;
        }
        if (IMGPILE_WEB.equals(provider) || SENDVID.equals(provider)) {
            if (length <= 0) throw new IOException("送信ファイルが空です");
            if (SENDVID.equals(provider)) {
                if (!(mime.equals("video/mp4") || mime.equals("video/webm") || mime.equals("video/quicktime")))
                    throw new IOException("Sendvidは動画専用です");
                if (length > SENDVID_LIMIT) throw new IOException("Sendvidの上限は1000MiBです（サイト側の判定が優先されます）");
            } else {
                // Same supported types as the API, but the Web route does not need a key.
                validate(IMGPILE, mime, Math.min(length, IMGPILE_LIMIT), "web-validation");
                if (length > IMGPILE_WEB_LIMIT) throw new IOException("imgpile Web送信の上限は100MBです");
            }
            return;
        }
        if (!provider.equals(IMGBOX) && !provider.equals(IMGPILE)) throw new IOException("未対応のアップロード先です");
        if (length <= 0) throw new IOException("送信ファイルが空です");
        if (provider.equals(IMGBOX)) {
            if (!(mime.equals("image/png") || mime.equals("image/jpeg") || mime.equals("image/gif")))
                throw new IOException("imgboxはJPEG・PNG・GIF画像専用です。動画はimgpileまたはImgurを選んでください");
            if (length > IMGBOX_LIMIT) throw new IOException("imgboxの上限は1ファイル10MBです");
        } else {
            if (!(mime.equals("image/png") || mime.equals("image/jpeg") || mime.equals("image/gif")
                    || mime.equals("image/webp") || mime.equals("video/mp4") || mime.equals("video/webm")
                    || mime.equals("video/quicktime"))) throw new IOException("この形式はimgpile送信に対応していません");
            if (length > IMGPILE_LIMIT) throw new IOException("imgpileの上限は1ファイル97MBです");
            if (!validKey(apiKey)) throw new IOException("Haiagaruのアップロード先設定でimgpileのAPIキーを設定してください");
        }
    }
    public static boolean validKey(String key) {
        return key != null && key.length() >= 1 && key.length() <= 4096 && key.matches("[!-~]+");
    }
    public static boolean mediaUrl(String provider,String url) {
        if (IMGPILE_WEB.equals(provider)) provider = IMGPILE;
        try {
            URI u = new URI(url);
            if (!"https".equals(u.getScheme()) || u.getRawUserInfo()!=null
                    || (u.getPort()!=-1 && u.getPort()!=443) || u.getRawQuery()!=null || u.getRawFragment()!=null) return false;
            String host = u.getHost(),path=u.getPath();
            if (host==null || path==null) return false;
            if(UGUU.equals(provider))return (host.equals("uguu.se")||host.equals("a.uguu.se"))&&path.matches("/[A-Za-z0-9_-]{1,128}\\.(?i:jpg|jpeg|png|gif|webp|mp4|webm|mov)");
            if (SENDVID.equals(provider)) return host.equals("sendvid.com") && path.matches("/[A-Za-z0-9]{4,64}");
            if (provider.equals(IMGBOX)) return host.matches("images[0-9]*\\.imgbox\\.com")
                    && path.matches("/[a-zA-Z0-9/_-]+\\.(?i:jpg|jpeg|png|gif)");
            return provider.equals(IMGPILE) && host.equals("cdn.imgpile.com")
                    && path.matches("/f/[a-zA-Z0-9_-]+\\.(?i:jpg|jpeg|png|gif|webp|mp4|webm|mov)");
        } catch (Exception ignored) { return false; }
    }
    public static String extension(String mime) {
        if (mime.equals("image/jpeg")) return "jpg";
        if (mime.equals("video/quicktime")) return "mov";
        return mime.substring(mime.indexOf('/')+1);
    }
}
