package n36;
import android.app.*;import android.content.*;import android.content.pm.ActivityInfo;import android.content.res.Configuration;
import android.graphics.Rect;import android.os.*;import android.view.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.function.Supplier;
import org.json.*;

/** Real API35 layout against byte-identical delivered product DEX. Not the YouTube/OEM UI. */
public final class N36Instrumentation extends Instrumentation {
 Activity host;FrameLayout content;final JSONArray rows=new JSONArray();int number;String app,target,scene;
 final String pkg="app.yydarlinker.deepseekcaptions.";
 Class<?> c(String name)throws Exception{return Class.forName(pkg+name);}
 Object call(String name,String method,Object...args)throws Exception{
  for(Method m:c(name).getDeclaredMethods())if(m.getName().equals(method)&&m.getParameterCount()==args.length){
   Class<?>[] types=m.getParameterTypes();boolean fits=true;
   for(int i=0;i<types.length;i++){Class<?> t=types[i];if(t==long.class)t=Long.class;else if(t==int.class)t=Integer.class;else if(t==boolean.class)t=Boolean.class;
    if(args[i]!=null&&!t.isInstance(args[i]))fits=false;}
   if(fits){m.setAccessible(true);return m.invoke(null,args);}
  }throw new NoSuchMethodException(name+"."+method+"/"+args.length);
 }
 Object field(String name,String field)throws Exception{Field f=c(name).getDeclaredField(field);f.setAccessible(true);Object v=f.get(null);return v instanceof java.lang.ref.WeakReference?((java.lang.ref.WeakReference<?>)v).get():v;}
 void check(boolean b,String why){if(!b)throw new AssertionError(why);}
 void main(Action action){runOnMainSync(()->{try{action.run();}catch(Exception e){throw new IllegalStateException(e);}});}
 interface Action{void run()throws Exception;}
 void settle(){waitForIdleSync();SystemClock.sleep(80);waitForIdleSync();}
 @Override public void onCreate(Bundle args){start();}
 @Override public void onStart(){Bundle result=new Bundle();try{
  host=startActivitySync(new Intent(getTargetContext(),N36Host.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  main(()->{call("CaptionPlayerAuthority","resetForTests");call("CaptionPlayerTransitionGuard","resetForTests");call("CaptionOverlay","setActivity",host);});
  for(String language:new String[]{"en","ar"})for(String caption:new String[]{"en","es","ar","ja"}){
   if(language.equals("en")&&!caption.equals("en"))continue;app=language;target=caption;
   for(String type:new String[]{"detail","fullscreen","shorts"}){if(caption.equals("ja")&&type.equals("detail"))continue;scene=type;configure();
    String[] samples=samples();for(int shape=0;shape<samples.length;shape++)show(samples[shape],shape,"matrix");
    if(type.equals("shorts")){main(()->{ViewGroup player=(ViewGroup)content.findViewById(playerId(true));View old=player.getChildAt(0);player.removeView(old);TextureView next=new TextureView(host);FrameLayout.LayoutParams p=new FrameLayout.LayoutParams(old.getWidth()-31,old.getHeight()-27,Gravity.TOP|Gravity.LEFT);p.leftMargin=51;p.topMargin=43;player.addView(next,p);call("CaptionSurface","invalidateGeometry");});settle();for(int shape=0;shape<samples.length;shape++)show(samples[shape],shape,"shorts-next");}
   }
   // Genuine Activity orientation layout: exit full-screen and enter it again on the same owner.
   scene="detail";configure();show(samples()[0],0,"exit-fullscreen");scene="fullscreen";configure();show(samples()[1],1,"enter-fullscreen");
  }
  String[] history={null};main(()->{history[0]=(String)call("CaptionDiagnostics","fullText",host);});
  check(history[0].contains("CAPTION_HORIZONTAL_PLACEMENT"),"real after-layout diagnostics absent");
  write("diagnostics.txt",history[0]);JSONObject report=new JSONObject();report.put("sdk",Build.VERSION.SDK_INT);report.put("rows",rows);report.put("observations",rows.length());report.put("instrumentation_pass",true);report.put("real_framework_layout",true);report.put("youtube_oem_ui",false);write("matrix.json",report.toString(2));
  result.putString("result","PASS");result.putInt("observations",rows.length());finish(Activity.RESULT_OK,result);
 }catch(Throwable e){try{write("failure.txt",android.util.Log.getStackTraceString(e));write("partial.json",rows.toString(2));}catch(Exception ignored){}result.putString("result","FAIL");result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}}
 int playerId(boolean shorts){String[] names=shorts?new String[]{"reel_player_overlay_root","reel_watch_player","shorts_player_view_container"}:new String[]{"player_overlays","inset_overlay_view_layout","watch_player"};for(String n:names){int id=host.getResources().getIdentifier(n,"id",host.getPackageName());if(id!=0)return id;}throw new AssertionError("real player resource id missing");}
 @SuppressWarnings("deprecation") void configure()throws Exception{
  main(()->{call("CaptionOverlay","clear");Configuration cfg=new Configuration(host.getResources().getConfiguration());cfg.setLocale(Locale.forLanguageTag(app));cfg.setLayoutDirection(Locale.forLanguageTag(app));host.getResources().updateConfiguration(cfg,host.getResources().getDisplayMetrics());host.setRequestedOrientation(scene.equals("fullscreen")?ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE:ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);});
  SystemClock.sleep(250);settle();main(()->{
   content=(FrameLayout)host.findViewById(android.R.id.content);for(int i=content.getChildCount()-1;i>=0;i--)if(!"yydarlinker.deepseek.caption.anchor".equals(content.getChildAt(i).getTag()))content.removeViewAt(i);int direction=app.equals("ar")?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR;host.getWindow().getDecorView().setLayoutDirection(direction);content.setLayoutDirection(direction);
   int w=content.getWidth(),h=content.getHeight();check(w>300&&h>300,"unmeasured content");FrameLayout player=new FrameLayout(host);player.setId(playerId(scene.equals("shorts")));
   int pw=w-113,ph=scene.equals("detail")?Math.min(h-150,450):h-151;FrameLayout.LayoutParams pp=new FrameLayout.LayoutParams(pw,ph,Gravity.TOP|Gravity.LEFT);pp.leftMargin=43;pp.topMargin=39;content.addView(player,pp);
   TextureView surface=new TextureView(host);FrameLayout.LayoutParams vp=new FrameLayout.LayoutParams(pw-83,ph-67,Gravity.TOP|Gravity.LEFT);vp.leftMargin=27;vp.topMargin=21;player.addView(surface,vp);
   call("CaptionOverlay","setActivity",host);call("CaptionSurface","invalidateGeometry");call("CaptionPlayerAuthority","onNotification",scene.equals("fullscreen")?"WATCH_WHILE_FULLSCREEN":"WATCH_WHILE_MAXIMIZED",true);
  });settle();main(()->{check(content.getLayoutDirection()==(app.equals("ar")?1:0),"app direction not applied");check(call("CaptionSurface","videoBounds",content)!=null,"visible actual video missing");});
 }
 String[] samples(){if(target.equals("ar"))return new String[]{"النص القصير","السطر الأول\nالسطر الثاني".replace("\n","\n"),String.join(" ",Collections.nCopies(20,"تظل الترجمة في وسط الفيديو")),"في 2026 العدد 42 و API 3.5!"};if(target.equals("ja"))return new String[]{"字幕です","最初の行\n二番目の行",String.join("",Collections.nCopies(20,"字幕は動画の中央です。")),"2026年、API 3.5は42件です。"};if(target.equals("es"))return new String[]{"Texto breve","Primera línea\nSegunda línea",String.join(" ",Collections.nCopies(20,"Los subtítulos permanecen centrados.")),"En 2026: API 3.5, 42 vídeos — مرحبا!"};return new String[]{"Short caption","First line\nSecond line",String.join(" ",Collections.nCopies(20,"Captions remain centered on the video.")),"In 2026: API 3.5, 42 videos — مرحبا!"};}
 void show(String text,int shape,String phase)throws Exception{
  String id="native-"+(++number);Object[] data={null};
  main(()->{Object context=call("CaptionLanguageContext","explicit","fr",target);Field sf=context.getClass().getDeclaredField("renderSpec");sf.setAccessible(true);Object spec=sf.get(context);
   Class<?> guardClass=c("CaptionOverlay$RenderGuard");Object guard=Proxy.newProxyInstance(guardClass.getClassLoader(),new Class<?>[]{guardClass},(p,m,a)->{switch(m.getName()){case "isValid":return true;case "session":return id;case "identity":return id;case "displayPosition":return a[0];case "windowStart":return 1000L;case "windowEnd":return 61000L;case "blankReason":return "";case "onApplied":return null;case "credential":Field f=c("CaptionCredentialRef").getDeclaredField("NONE");f.setAccessible(true);return f.get(null);default:return null;}});
   call("CaptionOverlay","showEvent",text,guard,(Supplier<String>)()->"",id,1000L,61000L,2000L,spec);
  });settle();main(()->{
   FrameLayout outer=(FrameLayout)field("CaptionOverlay","anchorRef");TextView label=(TextView)field("CaptionOverlay","textRef");Rect video=(Rect)call("CaptionSurface","videoBounds",content);
   int[] xy=new int[2],hxy=new int[2];outer.getLocationOnScreen(xy);content.getLocationOnScreen(hxy);Rect actual=new Rect(xy[0]-hxy[0],xy[1]-hxy[1],xy[0]-hxy[0]+outer.getWidth(),xy[1]-hxy[1]+outer.getHeight());float error=actual.exactCenterX()-video.exactCenterX();
   JSONObject row=new JSONObject();row.put("app",app);row.put("target",target);row.put("player_type",scene);row.put("shape",shape);row.put("phase",phase);row.put("app_layout_direction",content.getLayoutDirection());row.put("player_layout_direction",content.findViewById(playerId(scene.equals("shorts"))).getLayoutDirection());row.put("caption_text_direction",label.getTextDirection());row.put("caption_outer_layout_direction",outer.getLayoutDirection());row.put("video_rect",video.flattenToString());row.put("caption_outer_rect",actual.flattenToString());row.put("expected_center_x",video.exactCenterX());row.put("actual_center_x",actual.exactCenterX());row.put("center_error_px",error);row.put("session",id);row.put("owner_epoch",call("CaptionPlayerAuthority","ownerEpoch"));row.put("render_epoch",call("CaptionOverlay","playerDispatchIdentity"));row.put("translation_x",outer.getTranslationX());row.put("visible",outer.getVisibility()==View.VISIBLE);row.put("text",label.getText().toString());row.put("lines",label.getLineCount());row.put("text_size",label.getTextSize());rows.put(row);
   check(outer.getVisibility()==View.VISIBLE,"caption vanished "+row);check(Math.abs(error)<=1f,"center error "+row);check(outer.getLayoutDirection()==0,"outer inherited UI RTL");check(label.getTextDirection()==(target.equals("ar")?View.TEXT_DIRECTION_RTL:View.TEXT_DIRECTION_LTR),"text direction changed");check(outer.getTranslationX()==0,"old translation residue");
  });
 }
 void write(String name,String value)throws Exception{File d=new File(host.getFilesDir(),"n37r2-evidence");d.mkdirs();try(FileOutputStream f=new FileOutputStream(new File(d,name))){f.write(value.getBytes("UTF-8"));}}
}
