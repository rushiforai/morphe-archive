package android.content;
public abstract class Context {
 public static final int MODE_PRIVATE = 0;
 public Context getApplicationContext(){return this;}
 public abstract SharedPreferences getSharedPreferences(String name,int mode);
 public android.content.res.Resources getResources(){return new android.content.res.Resources();}
 public ClassLoader getClassLoader(){return getClass().getClassLoader();}
}
