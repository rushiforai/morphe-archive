// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsapatches;
import local.maps.gsa.ProviderPolicy;
import static local.maps.gsa.ProviderPolicy.State.*;
public final class PolicyRoutesTest {
 static int count=0;static void eq(Object a,Object b){count++;if(!a.equals(b))throw new AssertionError(a+" != "+b);}
 public static void main(String[] args){
  eq(ProviderPolicy.evaluate(false,false,false,0,false,false,false),MISSING);
  eq(ProviderPolicy.evaluate(true,true,false,999999999,true,true,true),UNTRUSTED);
  eq(ProviderPolicy.evaluate(true,false,true,255070225,true,true,true),DISABLED);
  eq(ProviderPolicy.evaluate(true,true,true,255070217,true,true,true),OUTDATED);
  eq(ProviderPolicy.evaluate(true,true,true,255070218,true,true,true),OUTDATED);
  eq(ProviderPolicy.evaluate(true,true,true,255070225,true,true,true),READY);
  for(int mask=0;mask<7;mask++)eq(ProviderPolicy.evaluate(true,true,true,255070225,(mask&1)!=0,(mask&2)!=0,(mask&4)!=0),INCOMPLETE);
  eq(ProviderPolicy.availability(READY),0);eq(ProviderPolicy.availability(MISSING),1);eq(ProviderPolicy.availability(DISABLED),3);eq(ProviderPolicy.availability(OUTDATED),2);eq(ProviderPolicy.availability(UNTRUSTED),9);eq(ProviderPolicy.availability(INCOMPLETE),9);
  eq(ProtocolRoutes.route("com.google"),"app.revanced");eq(ProtocolRoutes.route("com.google.android.gms"),"app.revanced.android.gms");eq(ProtocolRoutes.route("com.google.android.gms.auth.accounts"),"app.revanced.android.gms.auth.accounts");eq(ProtocolRoutes.route("content://com.google.android.gsf.gservices/prefix"),"content://app.revanced.android.gsf.gservices/prefix");
  for(String s:new String[]{"com.google.android.gms.auth.GetToken","com.google.android.gms.common.internal.IGmsServiceBroker","com.google.android.googlequicksearchbox","com.google.android.apps.maps.automotive","com.google.android.gms.attacker"})eq(ProtocolRoutes.route(s),s);
  for(String a:ServiceActions.RENAMED)eq(ProtocolRoutes.route(a),"app.revanced."+a.substring("com.google.".length()));
  eq(ProtocolRoutes.route("com.google.android.apps.maps"),"com.google.android.apps.maps.automotive");
  eq(ProtocolRoutes.route("com.google.android.apps.maps.example"),"com.google.android.apps.maps.example");
  System.out.println("PASS "+count+" provider/routing checks");
 }
}
