package android.util;
public class Log {
 public static int d(String t,String m){System.out.println(t+": "+m);return 0;}
 public static int w(String t,String m){System.out.println(t+": WARN "+m);return 0;}
 public static int w(String t,String m,Throwable x){System.out.println(t+": WARN "+m+" "+x);return 0;}
}
