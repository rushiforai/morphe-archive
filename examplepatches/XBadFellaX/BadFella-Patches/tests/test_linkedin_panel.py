"""Exercise production drawer ordering and footer insertion against LinkedIn model boundaries."""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest
import test_linkedin_regressions as regressions

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/extension/src/main/java/app/badfella/extension/linkedin'
STUBS = {
'android/content/Context.java': 'package android.content; public class Context { public String getPackageName(){return "com.linkedin.android";} public void startActivity(Intent i){} }',
'android/content/ContextWrapper.java': 'package android.content; public class ContextWrapper extends Context { private final Context base; public ContextWrapper(Context c){base=c;} public Context getBaseContext(){return base;} }',
'android/app/Activity.java': 'package android.app; public class Activity extends android.content.ContextWrapper { public Activity(){super(null);} }',
'android/util/DisplayMetrics.java': 'package android.util; public class DisplayMetrics { public float density=2; }',
'android/content/res/Resources.java': 'package android.content.res; public class Resources { public int getIdentifier(String n,String t,String p){return 1;} public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();} }',
'android/graphics/drawable/Drawable.java': 'package android.graphics.drawable; public abstract class Drawable { public void setBounds(int a,int b,int c,int d){} }',
'android/view/View.java': r'''package android.view;
public class View {
 public interface OnClickListener { void onClick(View v); }
 public android.content.Context context=new android.app.Activity();
 public android.widget.TextView title;
 public ViewGroup.LayoutParams params=new ViewGroup.MarginLayoutParams();
 public android.content.Context getContext(){return context;}
 public android.content.res.Resources getResources(){return new android.content.res.Resources();}
 public View findViewById(int id){return title;}
 public ViewGroup.LayoutParams getLayoutParams(){return params;}
 public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}
}
''',
'android/view/ViewGroup.java': r'''package android.view; public class ViewGroup extends View {
 public static class LayoutParams {}
 public static class MarginLayoutParams extends LayoutParams {
  public int start=3,end=5,bottomMargin=7;
  public int getMarginStart(){return start;} public int getMarginEnd(){return end;}
  public void setMarginStart(int v){start=v;} public void setMarginEnd(int v){end=v;}
 }
}''',
'android/widget/TextView.java': r'''package android.widget; public class TextView extends android.view.View {
 private android.graphics.drawable.Drawable[] icons=new android.graphics.drawable.Drawable[4];
 public int padding;
 public int getCurrentTextColor(){return 123;}
 public android.graphics.drawable.Drawable[] getCompoundDrawablesRelative(){return icons;}
 public void setCompoundDrawablesRelative(android.graphics.drawable.Drawable a,android.graphics.drawable.Drawable b,
 android.graphics.drawable.Drawable c,android.graphics.drawable.Drawable d){icons=new android.graphics.drawable.Drawable[]{a,b,c,d};}
 public void setCompoundDrawablePadding(int p){padding=p;}
}''',

'app/badfella/extension/linkedin/Boundaries.java': r'''package app.badfella.extension.linkedin;
class Settings {
 static final String MORE_ITEM_PREFIX="item-", MORE_ITEMS="items";
 static boolean moved=true, hide=false; static String hidden="";
 static String getString(String k,String d) { return d; }
 static boolean moveMoreItems() { return moved; }
 static boolean get(String k,boolean d) { return !k.equals("item-"+hidden); }
 static boolean moreMenu() { return true; } static boolean isMoreMenuIncluded() { return true; }
 static boolean hideGames() { return hide; }
 static void setString(String k,String v) {} static void debugLog(String s) {}
}
class Diagnostics { static void error(String s,Throwable t) { throw new AssertionError(s,t); } }
class SettingsActivity { static android.content.Context opened; static void open(android.content.Context c) { opened=c; } }
class ProtoScanner {
 static class Result { java.util.List<String> strings=java.util.Collections.emptyList(); }
 static Result scan(byte[] b) { return new Result(); }
}
class IconDrawable extends android.graphics.drawable.Drawable {
 static final String APPS="apps",PUZZLE="puzzle",GROUPS="groups",EVENTS="events",ARTICLE="article";
 IconDrawable(String p,int c) {} public void draw(android.graphics.Canvas c) {}
 public void setAlpha(int a) {} public void setColorFilter(android.graphics.ColorFilter c) {}
 public int getOpacity() { return 0; }
}
''',
'com/linkedin/android/home/navpanel/SectionType.java':
 'package com.linkedin.android.home.navpanel; public enum SectionType { SAVED_POSTS,GAMES,MANAGE }',
'com/linkedin/android/home/navpanel/HomeNavPanelSectionChevronType.java':
 'package com.linkedin.android.home.navpanel; public enum HomeNavPanelSectionChevronType { RIGHT }',
'com/linkedin/android/home/navpanel/HomeNavPanelSectionV2ViewData.java': r'''package com.linkedin.android.home.navpanel;
public class HomeNavPanelSectionV2ViewData {
 public final String title; public final SectionType sectionType;
 public HomeNavPanelSectionV2ViewData(String t,SectionType s,HomeNavPanelSectionChevronType c,
 java.util.List<?> items,Object analytics,java.util.List<?> collapsed,int count,int mask) {
 title=t; sectionType=s;
 if(c!=HomeNavPanelSectionChevronType.RIGHT || !items.isEmpty() || !collapsed.isEmpty())
 throw new AssertionError("Invalid card model");
 }
}
''',
}

class LinkedInPanelTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  regressions.LinkedInRegressionTests.setUpClass()
  cls.addClassCleanup(regressions.LinkedInRegressionTests.doClassCleanups)
  cls.java,cls.android=regressions.LinkedInRegressionTests.java,regressions.LinkedInRegressionTests.android
  directory=tempfile.TemporaryDirectory(prefix='linkedin-panel-')
  cls.addClassCleanup(directory.cleanup); cls.work=Path(directory.name)
  files=[]
  for name,code in STUBS.items():
   p=cls.work/name; p.parent.mkdir(parents=True,exist_ok=True); p.write_text(code); files.append(p)
  files += [SOURCE/name for name in ('MoreMenu.java','NavPanelPatch.java','Reflect.java')]
  files.append(ROOT/'tests/LinkedInPanelCheck.java')
  javac=cls.java.with_name('javac.exe' if os.name=='nt' else 'javac')
  result=subprocess.run([str(javac),'-cp',str(cls.android),'-d',str(cls.work),*map(str,files)],capture_output=True,text=True)
  if result.returncode: raise RuntimeError(result.stdout+result.stderr)

 def test_footer_order_fallback_and_native_filter(self):
  result=subprocess.run([str(self.java),'-cp',str(self.work)+os.pathsep+str(self.android),
   'app.badfella.extension.linkedin.LinkedInPanelCheck'],capture_output=True,text=True,timeout=30)
  self.assertEqual(result.returncode,0,result.stdout+result.stderr)
