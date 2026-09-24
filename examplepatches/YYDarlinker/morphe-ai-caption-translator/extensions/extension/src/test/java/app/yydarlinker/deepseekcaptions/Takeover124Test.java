package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.Context;import android.graphics.Rect;import android.widget.*;
import java.lang.reflect.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @GraphicsMode(GraphicsMode.Mode.NATIVE) @Config(sdk=28,shadows={Takeover124Test.Source.class})
public class Takeover124Test {
 static int starts;
 @Implements(ContextualUnitCaptionController.class) public static class Source {
  @Implementation static void activateSource(Context c,String url){starts++;}
 }
 @Test public void configureRetainsTwoLineLimitEvenForReportedParagraph()throws Exception{
  Activity a=Robolectric.buildActivity(Activity.class).setup().get();FrameLayout anchor=new FrameLayout(a);TextView view=new TextView(a);anchor.addView(view,new FrameLayout.LayoutParams(-2,-2));anchor.setLayoutParams(new FrameLayout.LayoutParams(-2,-2));
  Field p=CaptionOverlay.class.getDeclaredField("pendingText");p.setAccessible(true);p.set(null,"回到2022年，在俄罗斯攻击直升机遭受一系列严重损失之后，我做过一个视频，基本上是在说，现在就对直升机宣判死刑还为时过早，但攻击直升机在保持 relevance 和成本效益方面正面临日益严峻的挑战。");
  Method m=CaptionOverlay.class.getDeclaredMethod("configure",FrameLayout.class,TextView.class,Activity.class,Rect.class);m.setAccessible(true);m.invoke(null,anchor,view,a,new Rect(0,0,360,240));assertEquals(2,view.getMaxLines());
  Method count=CaptionOverlay.class.getDeclaredMethod("lineCount",Activity.class,String.class,float.class,int.class);count.setAccessible(true);
  int width=Math.round(360*.90f)-view.getPaddingLeft()-view.getPaddingRight();
  assertTrue("Displayed fallback must fit without clipping",(Integer)count.invoke(null,a,view.getText().toString(),view.getTextSize()/a.getResources().getDisplayMetrics().scaledDensity,width)<=2);
  assertNotNull(view.getLayout());assertTrue(view.getLayout().getLineCount()<=2);
  assertEquals("The actual TextView must retain the fallback tail",view.getText().length(),view.getLayout().getLineEnd(view.getLayout().getLineCount()-1));
  assertFalse(view.getText().toString().contains("relevance"));
  assertTrue(view.getTextSize()/a.getResources().getDisplayMetrics().scaledDensity>=SubtitleStyleMetrics.scaledSp(DeepSeekConfig.MIN_CAPTION_TEXT_SIZE,240/a.getResources().getDisplayMetrics().density)-.01f);
  p.set(null,"");a.finish();
 }
 @Test public void backgroundSourceFetchCannotTakeOverVisibleShort(){
  Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekCaptionHook.setMainActivity(a);PageCaptionController.onVideoId("aaaaaaaaaaa");CaptionChoice.select("en",false,false);DeepSeekConfig.saveEnabled(a,true);starts=0;
  String url="https://www.youtube.com/api/timedtext?v=bbbbbbbbbbb&lang=en";
  assertEquals(url,DeepSeekCaptionHook.rewriteUrl(null,url));assertEquals(0,starts);a.finish();
 }
 @Test public void longProtocolRecoveryKeepsSourcePhraseSegmentation()throws Exception{
  java.util.List<SourceAtomTimeline.Atom> atoms=new java.util.ArrayList<>();for(int i=0;i<12;i++)atoms.add(new SourceAtomTimeline.Atom(i*1000,(i+1)*1000,"word"+i,i,true));
  TranslationUnitTimeline.Unit unit=AnchoredWindowPlanner.build(new SourceAtomTimeline.Result(atoms,12,12,0,true,false)).units.get(0);
  assertFalse(ProtocolRecovery.wholeText("protocol_json",unit));
  String json=new org.json.JSONObject().put("translations",new org.json.JSONArray().put(new org.json.JSONObject().put("id",unit.id).put("text","这是一个不应该占满屏幕的整段翻译。"))).toString();
  assertEquals(0,ContextualBatchApiClient.parseAnchored(json,java.util.Collections.singletonList(unit),atoms,java.util.Collections.singletonMap(unit.id,"protocol_json")).validCount());
 }
}
