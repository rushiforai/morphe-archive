// SPDX-License-Identifier: GPL-3.0-only
package android.content;
public class Intent{public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000;android.net.Uri data;java.util.Map<String,Object> extras=new java.util.HashMap<>();ComponentName cmp;public int flags;public String action;
 public Intent(){} public Intent(Intent o){data=o.data;extras.putAll(o.extras);cmp=o.cmp;flags=o.flags;action=o.action;}
 public android.net.Uri getData(){return data;} public Intent setData(android.net.Uri u){data=u;return this;}
 public boolean getBooleanExtra(String k,boolean d){Object v=extras.get(k);return v instanceof Boolean?(Boolean)v:d;}
 public Intent putExtra(String k,boolean v){extras.put(k,v);return this;} public Intent putExtra(String k,String v){extras.put(k,v);return this;}
 public Object extra(String k){return extras.get(k);} public ComponentName getComponent(){return cmp;}
 public Intent setClassName(Context c,String cls){cmp=new ComponentName(c.getPackageName(),cls);return this;} public Intent addFlags(int f){flags|=f;return this;}}
