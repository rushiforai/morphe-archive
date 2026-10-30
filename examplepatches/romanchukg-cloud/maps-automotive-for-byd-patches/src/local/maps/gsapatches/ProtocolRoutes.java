// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsapatches;
import java.util.*;
final class ProtocolRoutes {
 static final String GMS="app.revanced.android.gms";
 static String route(String s) {
  if(s.equals("com.google.android.apps.maps"))return "com.google.android.apps.maps.automotive";
  if(ServiceActions.RENAMED.contains(s))return "app.revanced."+s.substring("com.google.".length());
  if(s.equals("com.google")) return "app.revanced";
  if(s.equals("com.google.android.gms")) return GMS;
  for(String suffix:List.of(".auth.accounts",".chimera",".fonts",".permission.CAR_SPEED",".phenotype"))
   if(s.equals("com.google.android.gms"+suffix)) return GMS+suffix;
  if(s.equals("com.google.android.providers.gsf.permission.READ_GSERVICES")) return "app.revanced.android.providers.gsf.permission.READ_GSERVICES";
  if(s.equals("subscribedfeeds")) return "app.revanced.subscribedfeeds";
  if(s.equals("com.google.android.c2dm.permission.RECEIVE")||s.equals("com.google.android.c2dm.permission.SEND")) return s.replace("com.google.android.c2dm","app.revanced.android.c2dm");
  for(String[] p:new String[][]{{"content://com.google.android.gms.phenotype","content://"+GMS+".phenotype"},{"content://com.google.android.gsf.gservices","content://app.revanced.android.gsf.gservices"},{"content://com.google.settings","content://app.revanced.settings"},{"content://subscribedfeeds","content://app.revanced.subscribedfeeds"}})
   if(s.startsWith(p[0])) return p[1]+s.substring(p[0].length());
  return s;
 }
}
