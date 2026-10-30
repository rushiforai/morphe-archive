// SPDX-License-Identifier: GPL-3.0-only
package android.content.pm;
public class PackageManager{public static final int GET_META_DATA=128;public static java.util.Set<String> installed=new java.util.HashSet<>();public static android.os.Bundle meta;public static int metaCalls;
 public static class NameNotFoundException extends Exception{}
 public PackageInfo getPackageInfo(String p,int f)throws NameNotFoundException{if(!installed.contains(p))throw new NameNotFoundException();return new PackageInfo();}
 public ApplicationInfo getApplicationInfo(String p,int f)throws NameNotFoundException{metaCalls++;ApplicationInfo a=new ApplicationInfo();a.metaData=meta;return a;}}
