// SPDX-License-Identifier: GPL-3.0-only
package android.net;
public final class Uri{private final java.net.URI u;private final String s;private Uri(String s){this.s=s;java.net.URI x;try{x=new java.net.URI(s);}catch(Exception e){x=null;}u=x;}
 public static Uri parse(String s){return new Uri(s);} public String getScheme(){return u==null?null:u.getScheme();} public String getHost(){return u==null?null:u.getHost();}
 public String getPath(){return u==null?null:u.getPath();} public String toString(){return s;}}
