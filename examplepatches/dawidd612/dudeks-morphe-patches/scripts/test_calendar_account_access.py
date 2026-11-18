#!/usr/bin/env python3
"""Exercise the production Activity lifecycle; fakes do not prove Google auth."""
from pathlib import Path
import subprocess
import tempfile
ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
'pl/dudek/extension/calendar/CalendarMicroGAccessActivity.java': 'package pl.dudek.extension.calendar; import android.app.Activity;import android.content.Intent;public class CalendarMicroGAccessActivity {public static boolean launchIfEnabled(Activity a,Intent i){return false;}}',
'android/content/Context.java': 'package android.content; public class Context {}',
'android/content/ComponentName.java': '''package android.content; public class ComponentName { public String name; public ComponentName(Context c,String n){name=n;} }''',
'android/content/Intent.java': '''package android.content; import java.util.*; public class Intent { public String action="original", data="event-data"; public int flags=42; public Map<String,String> extras=new HashMap<>(); public ComponentName component; public Intent(){} public Intent(Intent i){action=i.action;data=i.data;flags=i.flags;extras.putAll(i.extras);component=i.component;} public Intent setComponent(ComponentName c){component=c;return this;} }''',
'android/os/Bundle.java': '''package android.os; import java.util.*; public class Bundle { private Map<String,Boolean> map=new HashMap<>(); public boolean getBoolean(String k,boolean d){return map.getOrDefault(k,d);} public void putBoolean(String k,boolean v){map.put(k,v);} }''',
'android/accounts/Account.java': '''package android.accounts; public class Account {}''',
'android/accounts/AccountManager.java': '''package android.accounts; import android.content.*; import android.os.*; import java.util.*; public class AccountManager { public static int visible,queries,choosers; public static boolean queryFailure; public static AccountManager get(Context c){return new AccountManager();} public Account[] getAccountsByType(String type){if(!type.equals("com.google"))throw new AssertionError();queries++;if(queryFailure)throw new SecurityException();return new Account[visible];} public static Intent newChooseAccountIntent(Account a,List<Account> b,String[] types,String d,String e,String[] f,Bundle g){if(a!=null||b!=null||types.length!=1||!types[0].equals("com.google")||d!=null||e!=null||f!=null||g!=null)throw new AssertionError();choosers++;Intent i=new Intent();i.action="SYSTEM_CHOOSER";return i;} }''',
'android/app/Activity.java': '''package android.app; import android.content.*;import android.os.*;public class Activity extends Context {public static final int RESULT_OK=-1,RESULT_CANCELED=0; public Intent source=new Intent(),opened,chooser;public int request,starts,finishes;public boolean chooserFailure; protected void onCreate(Bundle b){} protected void onNewIntent(Intent i){} protected void onSaveInstanceState(Bundle b){} protected void onActivityResult(int q,int r,Intent i){} public Intent getIntent(){return source;}public void setIntent(Intent i){source=i;}public void startActivityForResult(Intent i,int r){if(chooserFailure)throw new SecurityException();chooser=i;request=r;}public void startActivity(Intent i){opened=i;starts++;}public void finish(){finishes++;} }''',
'android/widget/Toast.java': '''package android.widget;import android.content.*;public class Toast {public static final int LENGTH_LONG=1;public static int messages;public static Toast makeText(Context c,String t,int l){return new Toast();}public void show(){messages++;}}''',
'pl/dudek/extension/calendar/AccountAccessTest.java': '''package pl.dudek.extension.calendar;
import android.accounts.AccountManager;import android.content.Intent;import android.os.Bundle;import android.widget.Toast;
public class AccountAccessTest {
 static void check(boolean ok){if(!ok)throw new AssertionError();}
 static void reset(){AccountManager.visible=0;AccountManager.queries=0;AccountManager.choosers=0;AccountManager.queryFailure=false;Toast.messages=0;}
 static CalendarAccountAccessActivity fresh(){CalendarAccountAccessActivity a=new CalendarAccountAccessActivity();a.source.extras.put("event","retain");return a;}
 static void forwarded(CalendarAccountAccessActivity a){check(a.starts==1&&a.finishes==1);check(a.opened.component.name.equals("com.android.calendar.event.LaunchInfoActivity"));check(a.opened!=a.source);check(a.opened.action.equals(a.source.action)&&a.opened.data.equals(a.source.data)&&a.opened.flags==a.source.flags&&a.opened.extras.equals(a.source.extras));check(a.source.component==null);}
 public static void main(String[] args){
  reset();AccountManager.visible=1;var a=fresh();a.onCreate(null);forwarded(a);check(AccountManager.choosers==0);
  reset();a=fresh();a.onCreate(null);check(a.starts==0&&a.chooser.action.equals("SYSTEM_CHOOSER"));int request=a.request;
  a.onActivityResult(request+1,-1,new Intent());check(a.starts==0&&a.finishes==0);
  AccountManager.visible=1;a.onActivityResult(request,-1,new Intent());forwarded(a);check(AccountManager.queries==2);
  reset();a=fresh();a.onCreate(null);a.onActivityResult(a.request,0,null);check(a.starts==0&&a.finishes==1&&Toast.messages==0);
  reset();a=fresh();a.onCreate(null);a.onActivityResult(a.request,-1,new Intent());check(a.starts==0&&a.finishes==1&&Toast.messages==1);
  reset();a=fresh();a.onCreate(null);Bundle state=new Bundle();a.onSaveInstanceState(state);var recreated=fresh();recreated.onCreate(state);check(AccountManager.choosers==1&&recreated.starts==0);AccountManager.visible=1;recreated.onActivityResult(a.request,-1,null);forwarded(recreated);
  reset();a=fresh();a.onCreate(null);Intent latest=new Intent();latest.data="latest-click";a.onNewIntent(latest);check(AccountManager.choosers==1);AccountManager.visible=1;a.onActivityResult(a.request,-1,null);forwarded(a);check(a.opened.data.equals("latest-click"));
  reset();a=fresh();a.chooserFailure=true;a.onCreate(null);forwarded(a);
  reset();AccountManager.queryFailure=true;a=fresh();a.onCreate(null);check(a.starts==0&&AccountManager.choosers==1);a.onActivityResult(a.request,-1,null);check(a.starts==0&&a.finishes==1);
  System.out.println("PASS: production account chooser, visibility recheck, cancellation, failure, rotation, latest intent and native payload forwarding");
 }
}''',
}
with tempfile.TemporaryDirectory(prefix='calendar-account-access-') as temporary:
    directory=Path(temporary)
    for name,content in SOURCES.items():
        path=directory/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content)
    production=ROOT/'extensions/calendar/src/main/java/pl/dudek/extension/calendar/CalendarAccountAccessActivity.java'
    subprocess.run(['javac','-d',str(directory),*map(str,directory.rglob('*.java')),str(production)],check=True)
    subprocess.run(['java','-cp',str(directory),'pl.dudek.extension.calendar.AccountAccessTest'],check=True)
