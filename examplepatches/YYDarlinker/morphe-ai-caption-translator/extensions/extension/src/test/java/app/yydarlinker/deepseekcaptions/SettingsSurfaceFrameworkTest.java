package app.yydarlinker.deepseekcaptions;
import org.junit.*;import org.junit.runner.RunWith;import static org.junit.Assert.*;
import org.robolectric.*;import org.robolectric.annotation.*;import android.app.*;import android.content.*;import android.view.*;import android.widget.*;import android.os.Looper;import java.util.*;import java.lang.reflect.Field;
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28) @GraphicsMode(GraphicsMode.Mode.LEGACY)
public class SettingsSurfaceFrameworkTest {
 @Test public void boundKeyPreferenceRemainsEditableWithStoredCredential()throws Exception{
    Activity a=Robolectric.buildActivity(Activity.class).setup().visible().get();
    a.getSharedPreferences("deepseek_caption_secret",0).edit().putString("api_key_ciphertext","not-read-by-ui").commit();
    ApiKeyPreference pref=new ApiKeyPreference(a);pref.setKey("deepseek_caption_api_key");pref.setTitle("API Key");
    FrameLayout host=new FrameLayout(a);a.setContentView(host);View row=pref.getView(null,new ListView(a));host.addView(row);
    host.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.EXACTLY));host.layout(0,0,600,1000);
    InlineCaptionEditor edit=row.findViewById(android.R.id.edit);assertNotNull(edit);assertTrue(edit.isEnabled());assertTrue(edit.isFocusable());assertEquals("",edit.getText().toString());
    edit.requestFocus();long now=android.os.SystemClock.uptimeMillis();edit.dispatchTouchEvent(MotionEvent.obtain(now,now,0,20,20,0));edit.dispatchTouchEvent(MotionEvent.obtain(now,now+30,1,20,20,0));
    Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(edit.hasFocus());
    assertTrue(edit.performLongClick());Field field=InlineCaptionEditor.class.getDeclaredField("actions");field.setAccessible(true);ActionMode mode=(ActionMode)field.get(edit);assertNotNull(mode);
    ((ClipboardManager)a.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("test","fake-key"));
    mode.getMenu().performIdentifierAction(android.R.id.paste,0);assertEquals("fake-key",edit.getText().toString());
    a.finish();
 }
 @Test public void visibleShortsNotHiddenRegularPlayerIsSelected(){
    Activity a=Robolectric.buildActivity(Activity.class).setup().visible().get();FrameLayout host=new FrameLayout(a);a.setContentView(host);
    FrameLayout hidden=new FrameLayout(a);hidden.setId(40);hidden.setVisibility(View.GONE);host.addView(hidden,new FrameLayout.LayoutParams(600,1000));
    FrameLayout shorts=new FrameLayout(a);shorts.setId(41);host.addView(shorts,new FrameLayout.LayoutParams(600,1000));
    host.measure(View.MeasureSpec.makeMeasureSpec(600,1073741824),View.MeasureSpec.makeMeasureSpec(1000,1073741824));host.layout(0,0,600,1000);
    CaptionSurface.activity(a);assertSame(shorts,CaptionSurface.discover(host,new HashSet<>(Arrays.asList(40,41))));assertTrue(CaptionSurface.isShorts());assertNotNull(CaptionSurface.bounds(host));
    shorts.setVisibility(View.GONE);CaptionSurface.discover(host,new HashSet<>(Arrays.asList(40,41)));assertFalse(CaptionSurface.isShorts());a.finish();
 }
 @Test public void diagnosticsHasScrollableFullTextAndExplicitButtons(){Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekDiagnosticsPreference p=new DeepSeekDiagnosticsPreference(a);LinearLayout root=(LinearLayout)p.onCreateView(new FrameLayout(a));ScrollView scroll=(ScrollView)root.findViewWithTag("ai_diagnostics_scroll");assertNotNull(scroll);assertTrue(scroll.getChildAt(0) instanceof TextView);assertEquals(View.GONE,((View)scroll.getParent()).getVisibility());root.findViewWithTag("ai_diagnostics_toggle").performClick();assertEquals(View.VISIBLE,((View)scroll.getParent()).getVisibility());assertTrue(scroll.getLayoutParams().height>0);a.finish();}
 @Test public void singlePreviewSwitchesWithoutChangingSharedStyle(){Activity a=Robolectric.buildActivity(Activity.class).setup().get();SubtitleStylePreview p=new SubtitleStylePreview(a);LinearLayout root=(LinearLayout)p.onCreateView(new FrameLayout(a));assertEquals(3,root.getChildCount());SubtitleStylePreview.Preview preview=(SubtitleStylePreview.Preview)root.findViewWithTag("ai_style_preview_canvas");assertFalse(preview.portrait);SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_TEXT_SIZE,20);SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_OPACITY,35);preview.performClick();assertTrue(preview.portrait);assertEquals(20,preview.size);assertEquals(35,preview.opacity);preview.performClick();assertFalse(preview.portrait);a.finish();}
 @Test public void protocolEvidenceSurvivesDisplayNoiseAndCanBeCleared(){
    Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionDiagnostics.clear(a);
    CaptionDiagnostics.mark(a,"ANCHOR_RESPONSE_REJECTED","unit=12;reason=protocol_json");
    for(int n=0;n<100;n++)CaptionDiagnostics.mark(a,"CONTEXTUAL_DISPLAY_SELECTED",String.join("",Collections.nCopies(180,"x")));
    String report=CaptionDiagnostics.uiText(a);assertTrue(report.contains("Timing references"));assertTrue(report.contains("unit=12;reason=protocol_json"));
    CaptionDiagnostics.clear(a);assertFalse(CaptionDiagnostics.uiText(a).contains("protocol_json"));a.finish();
 }
}
