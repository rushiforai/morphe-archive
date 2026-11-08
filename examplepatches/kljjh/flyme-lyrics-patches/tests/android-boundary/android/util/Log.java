package android.util;
public class Log {
    public static int errors;
    public static int w(String tag,String message,Throwable error){errors++;return 0;}
}
