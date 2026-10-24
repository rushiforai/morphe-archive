package app.morphe.extension.chmate;

import android.content.Context;
import android.text.*;
import android.text.style.URLSpan;
import java.lang.reflect.Field;

/** Synthetic display text only; preserves native models, preferences and source spans. */
public final class DenseAnchorRenderAndroidTest {
 public static final class Board {
  public String d(int n){return "https://example.invalid/test/read.cgi/fixture/1234567890/"+n;}
  public String e(int n){return d(n);}
  public String c(int n){return d(n);}
 }
 public static String run(Context context)throws Exception {
  String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
  boolean old=version.contains("191"),middle=version.contains("226");
  Class<?> type=Class.forName(old?"o.processAdDisplayErrorPostbackForUserError":middle?"o.BouncyCastleSocketAdapterCompanion":"o.KeJ11",true,context.getClassLoader());
  Object response=PopularModesAndroidTest.alloc(type);
  PopularModesAndroidTest.field(type,middle?"l":"o").setInt(response,1);
  PopularModesAndroidTest.field(type,old?"h":middle?"j":"g").set(response,"HaiagaruSynthetic");
  PopularModesAndroidTest.field(type,old?"n":middle?"m":"n").set(response,"verification");
  PopularModesAndroidTest.field(type,old?"q":middle?"t":"p").set(response,"");
  Object board=new Board();
  Field enabled=PosterHighlight.class.getDeclaredField("enabled"),rules=PosterHighlight.class.getDeclaredField("rules");enabled.setAccessible(true);rules.setAccessible(true);boolean previous=enabled.getBoolean(null);Object previousRules=rules.get(null);
  StringBuilder report=new StringBuilder("DENSE_ANCHOR_RENDER "+version);int checks=0;
  try{
   enabled.setBoolean(null,false);
   for(int count:new int[]{0,20,100,500}){
    SpannableStringBuilder text=new SpannableStringBuilder();
    for(int i=0;i<count;i++){int start=text.length();text.append(">>").append(Integer.toString(i+1)).append(" ");text.setSpan(new URLSpan("#"+(i+1)),start,text.length()-1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
    text.append("本文");Spanned source=new SpannedString(text);
    for(int i=0;i<3;i++)PosterHighlight.decorateResponse(source,response,board,null);
    long start=System.nanoTime();Spanned decorated=null;
    for(int i=0;i<25;i++)decorated=PosterHighlight.decorateResponse(source,response,board,null);
    long elapsed=(System.nanoTime()-start)/1000000;report.append(" anchors=").append(count).append("/25callsMs=").append(elapsed);
    URLSpan[] before=source.getSpans(0,source.length(),URLSpan.class),after=decorated.getSpans(0,decorated.length(),URLSpan.class);
    if(before.length!=count||after.length!=count||!source.toString().equals(decorated.toString()))throw new AssertionError("Anchor content/count changed");
    for(URLSpan span:before)if(source.getSpanStart(span)!=decorated.getSpanStart(span)||source.getSpanEnd(span)!=decorated.getSpanEnd(span)||source.getSpanFlags(span)!=decorated.getSpanFlags(span))throw new AssertionError("Anchor span changed");
    Class<?> identity=Class.forName("app.morphe.extension.chmate.PosterHighlight$Identity",true,context.getClassLoader());
    if(source.getSpans(0,source.length(),identity).length!=0)throw new AssertionError("Native source mutated");
    checks++;
    java.lang.reflect.Constructor<?> rule=Class.forName("app.morphe.extension.chmate.PosterHighlightRules$Rule",true,context.getClassLoader()).getDeclaredConstructor(int.class,int.class,String.class,String.class,boolean.class);
    rule.setAccessible(true);rules.set(null,java.util.Collections.singletonList(rule.newInstance(1,2,"","HaiagaruSynthetic",true)));
    enabled.setBoolean(null,true);
    Spanned highlighted=PosterHighlight.decorateResponse(source,response,board,null);
    Class<?> tint=Class.forName("app.morphe.extension.chmate.PosterHighlight$Tint",true,context.getClassLoader());
    if(highlighted.getSpans(0,highlighted.length(),tint).length!=1||highlighted.getSpans(0,highlighted.length(),URLSpan.class).length!=count)throw new AssertionError("Enabled highlight lost links/style");checks++;
    enabled.setBoolean(null,false);Spanned disabled=PosterHighlight.decorateResponse(highlighted,response,board,null);
    if(disabled.getSpans(0,disabled.length(),tint).length!=0||disabled.getSpans(0,disabled.length(),URLSpan.class).length!=count||!source.toString().equals(disabled.toString()))throw new AssertionError("Disabling highlight changed links/text");checks++;
    SpannableString guarded=new SpannableString(source);android.text.NoCopySpan watcher=new android.text.NoCopySpan.Concrete();guarded.setSpan(watcher,0,guarded.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    Spanned separate=PosterHighlight.decorateResponse(guarded,response,board,null);
    if(separate.getSpanStart(watcher)>=0||guarded.getSpanStart(watcher)!=0)throw new AssertionError("Native NoCopySpan crossed rows");checks++;
   }
  }finally{rules.set(null,previousRules);enabled.setBoolean(null,previous);}
  return report+" PASS "+checks+" text/span-preservation cases";
 }
}
