package app.yydarlinker.deepseekcaptions;
import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import android.app.Activity;
import android.content.*;
import android.view.*;
import android.os.Looper;
import java.lang.reflect.Field;
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=28)
@GraphicsMode(GraphicsMode.Mode.LEGACY)
public class InlineEditorFrameworkTest {
    @Test public void androidFloatingPasteActionPastesIntoInlineKey() throws Exception {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        InlineCaptionEditor editor=new InlineCaptionEditor(activity);editor.setInputType(CaptionInputPolicy.keyInputType());editor.sensitive(true);
        activity.setContentView(editor);editor.layout(0,0,600,100);editor.requestFocus();
        ((ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("test","fake-local-key"));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(editor.performLongClick());
        Field field=InlineCaptionEditor.class.getDeclaredField("actions");field.setAccessible(true);
        ActionMode mode=(ActionMode)field.get(editor);assertNotNull(mode);
        assertNotNull(mode.getMenu().findItem(android.R.id.paste));
        assertNull(mode.getMenu().findItem(android.R.id.copy));
        mode.getMenu().performIdentifierAction(android.R.id.paste,0);
        assertEquals("fake-local-key",editor.getText().toString());
        assertEquals(0,editor.getInputType() & android.text.InputType.TYPE_MASK_VARIATION);
        activity.finish();
    }
    @Test public void heldTouchOpensPlatformPasteForAddress() throws Exception {
        Activity activity=Robolectric.buildActivity(Activity.class).setup().visible().get();
        InlineCaptionEditor editor=new InlineCaptionEditor(activity);editor.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_URI);
        activity.setContentView(editor);editor.layout(0,0,600,100);editor.requestFocus();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        long now=android.os.SystemClock.uptimeMillis();
        editor.dispatchTouchEvent(MotionEvent.obtain(now,now,MotionEvent.ACTION_DOWN,50,50,0));
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(ViewConfiguration.getLongPressTimeout()+100));
        Field field=InlineCaptionEditor.class.getDeclaredField("actions");field.setAccessible(true);
        ActionMode mode=(ActionMode)field.get(editor);assertNotNull(mode);
        ((ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("test","https://example.test/v1"));
        mode.getMenu().performIdentifierAction(android.R.id.paste,0);
        assertEquals("https://example.test/v1",editor.getText().toString());activity.finish();
    }

    @Test public void previewHasInsetsAndLiveStyleUpdates(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        SubtitleStylePreview preference=new SubtitleStylePreview(activity);
        android.widget.LinearLayout root=(android.widget.LinearLayout)preference.onCreateView(new android.widget.FrameLayout(activity));
        root.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.AT_MOST));
        root.layout(0,0,root.getMeasuredWidth(),root.getMeasuredHeight());
        assertEquals(3,root.getChildCount());
        SubtitleStylePreview.Preview preview=(SubtitleStylePreview.Preview)root.findViewWithTag("ai_style_preview_canvas");
        assertTrue(preview.getLeft()>0);assertTrue(preview.getRight()<root.getWidth());
        assertEquals(Math.round(SubtitleStylePreview.stageHeight(preview.getWidth(),activity.getResources().getDisplayMetrics().heightPixels,activity.getResources().getDisplayMetrics().density,false)),preview.getHeight());
        SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_TEXT_SIZE,24);
        SubtitleStylePreview.update(DeepSeekSliderPreference.KEY_OPACITY,35);
        assertEquals(24,preview.size);assertEquals(35,preview.opacity);
        int height=preview.getMeasuredHeight();assertFalse(preview.portrait);
        assertTrue(preview.performClick());assertTrue(preview.portrait);
        assertTrue(preview.getContentDescription().toString().contains(CaptionStrings.localize(activity,"竖屏")));
        preview.measure(View.MeasureSpec.makeMeasureSpec(preview.getWidth(),View.MeasureSpec.EXACTLY),0);
        assertTrue(preview.getMeasuredHeight()>height);assertTrue(preview.getMeasuredHeight()-height<=65*activity.getResources().getDisplayMetrics().density);assertEquals(24,preview.size);assertEquals(35,preview.opacity);
        preview.performClick();assertFalse(preview.portrait);activity.finish();
    }

}
