package android.util;
public class Base64 {
 public static final int URL_SAFE=8, NO_WRAP=2, NO_PADDING=1, DEFAULT=0;
 public static String encodeToString(byte[] b,int f){return java.util.Base64.getUrlEncoder().withoutPadding().encodeToString(b);}
 public static byte[] decode(String s,int f){return java.util.Base64.getDecoder().decode(s);}
}