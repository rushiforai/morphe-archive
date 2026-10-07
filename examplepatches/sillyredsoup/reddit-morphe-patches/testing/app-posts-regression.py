#!/usr/bin/env python3
"""Check legacy and server-driven Devvit cards, compact layout and saved settings."""
from pathlib import Path
import subprocess
import tempfile

repo = Path(__file__).resolve().parents[1]
fixtures = {
 'android/content/Context.java': '''package android.content;
public class Context { public static final int MODE_PRIVATE=0; public boolean hide=true;
 public Context getApplicationContext(){return this;}
 public SharedPreferences getSharedPreferences(String name,int mode){return new SharedPreferences(){
 public boolean getBoolean(String key,boolean fallback){return hide;}
 public Editor edit(){return new Editor(){public Editor putBoolean(String key,boolean value){hide=value;return this;}public void apply(){}};}};}
}''',
 'android/content/SharedPreferences.java': '''package android.content;public interface SharedPreferences {
 boolean getBoolean(String key,boolean fallback);Editor edit();interface Editor{Editor putBoolean(String key,boolean value);void apply();}}''',
 'android/preference/Preference.java': '''package android.preference;public class Preference {
 public Preference(android.content.Context c){}public void setKey(String s){}public void setTitle(String s){}public void setOrder(int i){}
 public interface OnPreferenceChangeListener{boolean onPreferenceChange(Preference p,Object n);}
 }''',
 'android/preference/PreferenceGroup.java': '''package android.preference;public class PreferenceGroup extends Preference {
 public PreferenceGroup(android.content.Context c){super(c);}public void addPreference(Preference p){}public int getPreferenceCount(){return 0;}public Preference getPreference(int i){return null;}}''',
 'android/preference/PreferenceScreen.java': '''package android.preference;public class PreferenceScreen extends PreferenceGroup {
 public PreferenceScreen(android.content.Context c){super(c);}public Preference findPreference(String s){return null;}public android.content.Context getContext(){return null;}}''',
 'android/preference/SwitchPreference.java': '''package android.preference;public class SwitchPreference extends Preference {
 public SwitchPreference(android.content.Context c){super(c);}public void setPersistent(boolean b){}public void setChecked(boolean b){}public void setOnPreferenceChangeListener(OnPreferenceChangeListener l){}}''',
 'com/reddit/domain/model/Link.java': '''package com.reddit.domain.model;public class Link {
 public boolean app;public Link(boolean app){this.app=app;}public boolean getIsDevPlatformCustomPost(){return app;}}''',
 'com/reddit/devplatform/feed/custompost/b.java': 'package com.reddit.devplatform.feed.custompost;public class b {}',
 'ym1/u1.java': '''package ym1;public class u1 {public java.util.List<?> content;public u1(Object... content){this.content=java.util.Arrays.asList(content);}public java.util.List<?> o(){return content;}}''',
 'ym1/v0.java': 'package ym1;public class v0 {public boolean k;public v0(boolean app){k=app;}}',
 'ym1/z.java': 'package ym1;public class z {public v0 o;public z(boolean app){o=new v0(app);}}',
 'TestApps.java': '''import java.util.*;import local.reddit.extension.AppPostFilter;import com.reddit.domain.model.Link;
public class TestApps {
 static int checks;static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
 public static class Child {public Object data;Child(Object data){this.data=data;}}
 public static void main(String[] args){
 android.content.Context context=new android.content.Context();AppPostFilter.initialize(context);
 Link one=new Link(false),app=new Link(true),two=new Link(false);List<?> legacy=Arrays.asList(one,new Child(app),two);
 List<?> kept=AppPostFilter.filterListing(legacy);check(kept.equals(Arrays.asList(one,two)),"legacy children preserve ordinary post order");
 List<?> ordinary=Arrays.asList(one,two);check(AppPostFilter.filterListing(ordinary)==ordinary,"unchanged listing keeps identity");
 Object card=new Object(),game=new com.reddit.devplatform.feed.custompost.b();
 check(AppPostFilter.filterConverted(new ym1.u1("header",game,"actions"),card)==null,"server-driven game removes whole card");
 check(AppPostFilter.filterConverted(new ym1.u1("image","APP author badge"),card)==card,"ordinary posts and app account badges retained");
 check(AppPostFilter.filterConverted(new ym1.z(true),card)==null,"compact Dev Platform indicator removes card");
 check(AppPostFilter.filterConverted(new ym1.z(false),card)==card,"ordinary compact card retained");
 check(AppPostFilter.filterConverted(game,card)==card,"child conversion does not leave a header-only card");
 check(AppPostFilter.filterConverted(new ym1.u1(game),null)==null,"composes with an already removed NSFW card");
 context.hide=false;AppPostFilter.initialize(context);
 check(AppPostFilter.filterListing(legacy)==legacy && AppPostFilter.filterConverted(new ym1.u1(game),card)==card,"saved disabled setting works before first feed");
 context.hide=true;AppPostFilter.initialize(context);
 check(AppPostFilter.filterConverted(new ym1.u1(game),card)==null,"cached game is checked on reconversion");
 System.out.println("PASS: "+checks+" app-post checks");
 }}'''
}
with tempfile.TemporaryDirectory(prefix='reddit-app-filter-test-') as tmp:
 root=Path(tmp)
 for name,source in fixtures.items():
  path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source)
 extension=root/'local/reddit/extension/AppPostFilter.java';extension.parent.mkdir(parents=True,exist_ok=True)
 extension.write_text((repo/'extensions/extension/src/main/java/local/reddit/extension/AppPostFilter.java').read_text())
 subprocess.run(['javac','-d',str(root),*[str(p) for p in root.rglob('*.java')]],check=True)
 subprocess.run(['java','-cp',str(root),'TestApps'],check=True)
