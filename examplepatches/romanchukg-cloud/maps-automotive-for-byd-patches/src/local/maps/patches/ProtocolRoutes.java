// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;
import java.util.*;
final class ProtocolRoutes {
 static final String GMS="app.revanced.android.gms";
 /** Served by MicroG-RE 7.2.2 as app.revanced.android.c2dm.intent.*, app.revanced.android.gcm.intent.SEND and app.revanced.iid.TOKEN_REQUEST. */
 static final List<String> PUSH_ACTIONS=List.of("com.google.android.c2dm.intent.REGISTER","com.google.android.c2dm.intent.REGISTRATION",
  "com.google.android.c2dm.intent.UNREGISTER","com.google.android.c2dm.intent.RECEIVE","com.google.android.gcm.intent.SEND","com.google.iid.TOKEN_REQUEST");
 static String route(String s) {
  if(s.equals("com.google")) return "app.revanced";
  if(s.equals("com.google.android.gms")) return GMS;
  for(String suffix:List.of(".auth.accounts",".chimera",".fonts",".permission.CAR_SPEED",".phenotype"))
   if(s.equals("com.google.android.gms"+suffix)) return GMS+suffix;
  if(s.equals("com.google.android.providers.gsf.permission.READ_GSERVICES")) return "app.revanced.android.providers.gsf.permission.READ_GSERVICES";
  if(s.equals("subscribedfeeds")) return "app.revanced.subscribedfeeds";
  if(s.equals("com.google.android.c2dm.permission.RECEIVE")||s.equals("com.google.android.c2dm.permission.SEND")) return s.replace("com.google.android.c2dm","app.revanced.android.c2dm");
  // Push (GCM/FCM) actions under MicroG-RE's names, so Chime can register and receive "Send to car".
  for(String action:PUSH_ACTIONS) if(s.equals(action)) return "app.revanced"+s.substring("com.google".length());
  for(String[] p:new String[][]{{"content://com.google.android.gms.phenotype","content://"+GMS+".phenotype"},{"content://com.google.android.gsf.gservices","content://app.revanced.android.gsf.gservices"},{"content://com.google.settings","content://app.revanced.settings"},{"content://subscribedfeeds","content://app.revanced.subscribedfeeds"}})
   if(s.startsWith(p[0])) return p[1]+s.substring(p[0].length());
  return s;
 }
}
