package android.util;
public final class Base64 { public static final int DEFAULT=0,NO_WRAP=2; public static byte[] decode(String s,int flags){return java.util.Base64.getDecoder().decode(s);} public static String encodeToString(byte[] b,int flags){return java.util.Base64.getEncoder().encodeToString(b);} }
