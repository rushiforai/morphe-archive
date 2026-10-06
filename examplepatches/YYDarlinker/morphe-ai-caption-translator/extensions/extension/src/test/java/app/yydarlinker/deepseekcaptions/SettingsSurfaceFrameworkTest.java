package app.yydarlinker.deepseekcaptions;
import org.junit.*;import org.junit.runner.RunWith;import static org.junit.Assert.*;
import org.robolectric.*;import org.robolectric.annotation.*;import android.app.*;import android.content.*;import android.view.*;import android.widget.*;import android.os.Looper;import java.util.*;import java.lang.reflect.Field;
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28) @GraphicsMode(GraphicsMode.Mode.LEGACY)
public class SettingsSurfaceFrameworkTest {
 private final java.util.List<org.robolectric.android.controller.ActivityController<Activity>> activities=new java.util.ArrayList<>();
 private Activity activity(boolean visible){org.robolectric.android.controller.ActivityController<Activity> c=Robolectric.buildActivity(Activity.class).setup();if(visible)c.visible();activities.add(c);return c.get();}
 @After public void destroyFixtureWindows(){
   for(org.robolectric.android.controller.ActivityController<Activity> c:activities)c.pause().stop().destroy();
   activities.clear();Shadows.shadowOf(Looper.getMainLooper()).idle();
 }
 @Test @GraphicsMode(GraphicsMode.Mode.NATIVE) @Config(qualifiers="w600dp-h1000dp")
 public void boundKeyPreferenceRemainsEditableWithStoredCredential()throws Exception{
    Activity a=activity(true);
    a.getSharedPreferences("deepseek_caption_secret",0).edit().putString("api_key_ciphertext","not-read-by-ui").commit();
    a.getWindow().setLayout(600,1000);
    ApiKeyPreference pref=new ApiKeyPreference(a);pref.setKey("deepseek_caption_api_key");pref.setTitle("API Key");
    FrameLayout host=new FrameLayout(a);a.setContentView(host);View row=pref.getView(null,new ListView(a));host.addView(row);
    host.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.EXACTLY));host.layout(0,0,600,1000);
    EditText edit=CaptionEditorIds.editorIn(row);assertNotNull(edit);assertTrue(edit.isEnabled());assertTrue(edit.isFocusable());assertEquals("",edit.getText().toString());
    edit.requestFocus();long now=android.os.SystemClock.uptimeMillis();edit.dispatchTouchEvent(MotionEvent.obtain(now,now,0,20,20,0));edit.dispatchTouchEvent(MotionEvent.obtain(now,now+30,1,20,20,0));
    Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertTrue("fixture must retain a real nonzero editor after root traversal",edit.getWidth()>0&&edit.getHeight()>0);
    assertTrue(edit.hasFocus());
    assertTrue(edit.performLongClick());Field field=InlineCaptionEditor.class.getDeclaredField("actions");field.setAccessible(true);ActionMode mode=(ActionMode)field.get(edit);assertNotNull(mode);
    ((ClipboardManager)a.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("test","fake-key"));
    mode.getMenu().performIdentifierAction(android.R.id.paste,0);assertEquals("fake-key",edit.getText().toString());
    a.finish();
 }
 @Test public void visibleShortsNotHiddenRegularPlayerIsSelected(){
    Activity a=activity(true);FrameLayout host=new FrameLayout(a);a.setContentView(host);
    FrameLayout hidden=new FrameLayout(a);hidden.setId(40);hidden.setVisibility(View.GONE);host.addView(hidden,new FrameLayout.LayoutParams(600,1000));
    FrameLayout shorts=new FrameLayout(a);shorts.setId(41);host.addView(shorts,new FrameLayout.LayoutParams(600,1000));
    host.measure(View.MeasureSpec.makeMeasureSpec(600,1073741824),View.MeasureSpec.makeMeasureSpec(1000,1073741824));host.layout(0,0,600,1000);
    CaptionSurface.activity(a);assertSame(shorts,CaptionSurface.discover(host,new HashSet<>(Arrays.asList(40,41))));assertTrue(CaptionSurface.isShorts());assertNotNull(CaptionSurface.bounds(host));
    shorts.setVisibility(View.GONE);CaptionSurface.discover(host,new HashSet<>(Arrays.asList(40,41)));assertFalse(CaptionSurface.isShorts());a.finish();
 }
 @Test public void diagnosticsHasScrollableFullTextAndExplicitButtons(){Activity a=activity(false);DeepSeekDiagnosticsPreference p=new DeepSeekDiagnosticsPreference(a);LinearLayout root=(LinearLayout)p.onCreateView(new FrameLayout(a));ScrollView scroll=(ScrollView)root.findViewWithTag("ai_diagnostics_scroll");assertNotNull(scroll);assertTrue(scroll.getChildAt(0) instanceof TextView);assertEquals(View.GONE,((View)scroll.getParent()).getVisibility());root.findViewWithTag("ai_diagnostics_toggle").performClick();assertEquals(View.VISIBLE,((View)scroll.getParent()).getVisibility());assertTrue(scroll.getLayoutParams().height>0);a.finish();}
 @Test public void singleLandscapePreviewHasNoOrientationControlAndUpdatesSharedStyle(){
    Activity a=activity(false);
    SubtitleStylePreview p=new SubtitleStylePreview(a);
    LinearLayout root=(LinearLayout)p.onCreateView(new FrameLayout(a));
    // N25: the section heading already names this block, so the row no longer repeats it as a caption
    // title; the canvas comes first and the hint line follows it.
    assertEquals(2,root.getChildCount());
    SubtitleStylePreview.Preview preview=(SubtitleStylePreview.Preview)root.findViewWithTag("ai_style_preview_canvas");
    assertSame(preview,root.getChildAt(0));
    assertTrue(root.getChildAt(1) instanceof TextView);assertFalse(root.getChildAt(1) instanceof Button);
    for(int i=0;i<root.getChildCount();i++){
      String text=root.getChildAt(i) instanceof TextView?((TextView)root.getChildAt(i)).getText().toString():"";
      assertFalse("no extra caption title may be rendered",text.equals(CaptionStrings.settings(a,"preview")));
    }
    assertFalse(preview.isClickable());assertFalse(preview.hasOnClickListeners());
    assertEquals(CaptionStrings.settings(a,"preview"),preview.getContentDescription().toString());
    SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_TEXT_SIZE,1);
    SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_OPACITY,35);
    assertEquals(1,preview.sizeTier);assertEquals(35,preview.opacity);
    a.finish();
 }
 @Test public void protocolEvidenceSurvivesDisplayNoiseAndCanBeCleared(){
    Activity a=activity(false);CaptionDiagnostics.clear(a);
    CaptionDiagnostics.mark(a,"ANCHOR_RESPONSE_REJECTED","unit=12;reason=protocol_json");
    for(int n=0;n<100;n++)CaptionDiagnostics.mark(a,"CONTEXTUAL_DISPLAY_SELECTED",String.join("",Collections.nCopies(180,"x")));
    // The saved export keeps its raw, unlocalized report; the panel body is the localized summary.
    String report=CaptionDiagnostics.uiText(a,false);assertTrue(report.contains("Timing decisions and errors"));assertTrue(report.contains("unit=12;reason=protocol_json"));
    CaptionDiagnostics.clear(a);assertFalse(CaptionDiagnostics.uiText(a,false).contains("protocol_json"));a.finish();
 }
}
