// SPDX-License-Identifier: GPL-3.0-only
package android.content;
public class Context{public static final android.os.PowerManager power=new android.os.PowerManager();public String getPackageName(){return "com.google.android.apps.maps.automotive";}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}public Context getApplicationContext(){return this;}
 public java.io.File getNoBackupFilesDir(){return new java.io.File("/tmp");}
 @SuppressWarnings("unchecked") public <T> T getSystemService(Class<T> c){return c==android.os.PowerManager.class?(T)power:null;}}
