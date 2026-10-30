// SPDX-License-Identifier: GPL-3.0-only
package android.content;
public class Context{public final java.util.List<Intent> started=new java.util.ArrayList<>();public String getPackageName(){return "com.google.android.apps.maps.automotive";}
 public void startActivity(Intent i){started.add(i);}}
