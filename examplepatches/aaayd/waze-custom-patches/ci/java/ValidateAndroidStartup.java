/** Load patched entry-point classes on ART without starting Waze or touching its data. */
public class ValidateAndroidStartup {
    public static void main(String[] args) throws Exception {
      try {
        Class<?> looper=Class.forName("android.os.Looper");
        if(looper.getMethod("getMainLooper").invoke(null)==null)looper.getMethod("prepareMainLooper").invoke(null);
        for(String name:args){
            Class<?> type=Class.forName(name,true,ClassLoader.getSystemClassLoader());
            type.getDeclaredMethods();
            type.getDeclaredConstructors();
            System.out.println("PASS ART class verification: "+name);
        }
      } catch(Throwable failure) { failure.printStackTrace(System.out); System.exit(2); }
    }
}
