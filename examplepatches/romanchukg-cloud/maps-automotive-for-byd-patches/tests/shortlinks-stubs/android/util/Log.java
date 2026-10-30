// SPDX-License-Identifier: GPL-3.0-only
package android.util;
public final class Log{public static final java.util.List<String> lines=new java.util.ArrayList<>();
 public static int i(String t,String m){lines.add(t+" "+m);return 0;} public static int w(String t,String m){lines.add(t+" "+m);return 0;}}
