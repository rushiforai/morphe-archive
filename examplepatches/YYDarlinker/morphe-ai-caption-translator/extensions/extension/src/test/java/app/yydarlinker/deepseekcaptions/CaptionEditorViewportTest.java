package app.yydarlinker.deepseekcaptions;

import android.app.*;
import android.graphics.Rect;
import android.os.Looper;
import android.view.*;
import android.widget.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/**
 * N36 IME/viewport contract.
 *
 * <p>Before N36 the viewport revealed on every focus change, on every selection change, on every
 * global layout and on every pre-draw frame, and it kept one {@code originalBottom/appliedBottom}
 * pair per editor on a shared ListView. Three of those behaviours are asserted here as gone: focus
 * alone must not ask the parent to scroll, an unrelated layout/scroll observation must not submit
 * padding, and a second editor of the same window must not inherit the first editor's inset.</p>
 */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class CaptionEditorViewportTest {
    Activity a;
    @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().visible().get();}
    @After public void done(){a.finish();}
    private void idle(){Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private int mode(View root){return ((WindowManager.LayoutParams)root.getLayoutParams()).softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST;}

    @Test public void nestedDialogUsesItsOwnWindowAndRestoresAdjustmentAfterRootDetaches(){
        a.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);
        Dialog dialog=new Dialog(a);dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING);
        LinearLayout content=new LinearLayout(a);content.setOrientation(1);
        InlineCaptionEditor one=new InlineCaptionEditor(a),two=new InlineCaptionEditor(a);
        content.addView(one);content.addView(two);dialog.setContentView(content);dialog.show();idle();
        View root=dialog.getWindow().getDecorView();
        assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,mode(root));
        assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN,a.getWindow().getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
        content.removeView(one);assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,mode(root));
        content.removeView(two);assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,mode(root));dialog.dismiss();assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING,mode(root));
    }

    /**
     * The platform may still move a multi-line editor for its own caret handling; what must be gone is
     * the extension's pre-draw reveal. The requested rectangle stays bounded to the current line.
     */
    @Test public void caretMovementAsksParentOnlyForTheCurrentLine(){
        class TrackingScroll extends ScrollView {
            int calls;Rect requested;
            TrackingScroll(){super(a);}
            @Override public boolean requestChildRectangleOnScreen(View child,Rect rect,boolean immediate){calls++;requested=new Rect(rect);return super.requestChildRectangleOnScreen(child,rect,immediate);}
        }
        TrackingScroll scroll=new TrackingScroll();InlineCaptionEditor input=new InlineCaptionEditor(a);
        input.setSingleLine(false);input.setMinLines(7);input.setText("one\ntwo\nthree\nfour\nfive\nsix\nseven");scroll.addView(input);
        a.setContentView(scroll);input.requestFocus();input.setSelection(input.length());idle();
        if(scroll.calls>0){
            assertNotNull(scroll.requested);
            assertTrue(scroll.requested.height()<=input.getLineHeight()+CaptionSettingsStyle.dp(a,24));
        }
    }

    /** A hidden IME must never submit padding, whether the list resized or not. */
    @Test public void hiddenImeNeverSubmitsListPadding(){
        class VisibleFrame extends FrameLayout {
            int bottom=700;
            VisibleFrame(){super(a);}
            @Override public void getWindowVisibleDisplayFrame(Rect out){out.set(0,0,320,bottom);}
        }
        VisibleFrame root=new VisibleFrame();ListView list=new ListView(a);list.setItemsCanFocus(true);list.setPadding(0,0,0,10);
        EditText editor=new EditText(a);editor.setText("caret");editor.setFocusableInTouchMode(true);
        list.setAdapter(new BaseAdapter(){
            public int getCount(){return 1;}public Object getItem(int p){return p;}public long getItemId(int p){return p;}
            public View getView(int p,View old,ViewGroup parent){return editor;}
        });root.addView(list);
        root.measure(View.MeasureSpec.makeMeasureSpec(320,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(700,View.MeasureSpec.EXACTLY));root.layout(0,0,320,700);
        assertTrue(editor.requestFocus());
        CaptionEditorViewport viewport=new CaptionEditorViewport(editor);viewport.attach();
        root.bottom=400;viewport.onGlobalLayout();assertEquals(10,list.getPaddingBottom());
        viewport.onGlobalLayout();assertEquals(10,list.getPaddingBottom());
        viewport.detach();assertEquals(10,list.getPaddingBottom());
    }

    /**
     * The N36 contract replacing {@code predrawDetectsOcclusionWithoutLayoutEvent}: a per-frame pre-draw
     * hook is gone, so an occluded editor is no longer corrected while the IME is closed.
     */
    @Test public void noPredrawOcclusionCorrectionWhileImeClosed(){
        class VisibleFrame extends FrameLayout {
            int bottom=700;VisibleFrame(){super(a);}
            @Override public void getWindowVisibleDisplayFrame(Rect out){out.set(0,0,320,bottom);}
        }
        VisibleFrame root=new VisibleFrame();ListView list=new ListView(a);list.setItemsCanFocus(true);
        EditText editor=new EditText(a);editor.setFocusableInTouchMode(true);
        list.setAdapter(new BaseAdapter(){
            public int getCount(){return 1;}public Object getItem(int p){return p;}public long getItemId(int p){return p;}
            public View getView(int p,View v,ViewGroup g){return editor;}
        });root.addView(list);
        root.measure(View.MeasureSpec.makeMeasureSpec(320,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(700,View.MeasureSpec.EXACTLY));root.layout(0,0,320,700);
        editor.requestFocus();CaptionEditorViewport viewport=new CaptionEditorViewport(editor);viewport.attach();
        root.bottom=380;
        for(int frame=0;frame<30;frame++)viewport.onGlobalLayout();
        assertEquals("no IME means no fallback padding",0,list.getPaddingBottom());
        assertEquals(0,CaptionEditorViewport.paddingCalls);
        viewport.detach();
    }

    /** Row recycling releases only this row; the second editor keeps its own, correct inset. */
    @Test public void recycledRowDoesNotLeakAnotherEditorsInset(){
        class VisibleFrame extends FrameLayout {
            int bottom=700;VisibleFrame(){super(a);}
            @Override public void getWindowVisibleDisplayFrame(Rect out){out.set(0,0,320,bottom);}
        }
        VisibleFrame root=new VisibleFrame();ListView list=new ListView(a);list.setItemsCanFocus(true);list.setPadding(0,0,0,7);
        EditText first=new EditText(a);first.setFocusableInTouchMode(true);
        EditText second=new EditText(a);second.setFocusableInTouchMode(true);
        list.setAdapter(new BaseAdapter(){
            public int getCount(){return 2;}public Object getItem(int p){return p;}public long getItemId(int p){return p;}
            public View getView(int p,View v,ViewGroup g){return p==0?first:second;}
        });root.addView(list);
        root.measure(View.MeasureSpec.makeMeasureSpec(320,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(700,View.MeasureSpec.EXACTLY));root.layout(0,0,320,700);
        CaptionEditorViewport one=new CaptionEditorViewport(first);one.attach();
        CaptionEditorViewport two=new CaptionEditorViewport(second);two.attach();
        first.requestFocus();one.focus(true);one.beginUserEdit();
        second.requestFocus();two.focus(true);
        one.detach();
        assertEquals("row recycling must not restore the other editor's padding",7,list.getPaddingBottom());
        two.detach();
        assertEquals(7,list.getPaddingBottom());
    }

    @Test public void inputConnectionKeepsInlineEditingInLandscapeAndKeyPrivacyFlags(){
        InlineCaptionEditor input=new InlineCaptionEditor(a);input.setInputType(CaptionInputPolicy.keyInputType());
        input.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_DONE|android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        android.view.inputmethod.EditorInfo info=new android.view.inputmethod.EditorInfo();input.onCreateInputConnection(info);
        assertNotEquals(0,info.imeOptions & android.view.inputmethod.EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        assertNotEquals(0,info.imeOptions & android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
    }

    @Test public void firstTapRequestsImeWithoutSecondTap(){
        LinearLayout parent=new LinearLayout(a);parent.setFocusableInTouchMode(true);
        InlineCaptionEditor input=new InlineCaptionEditor(a);parent.addView(input);a.setContentView(parent);
        parent.requestFocus();idle();
        android.view.inputmethod.InputMethodManager ime=(android.view.inputmethod.InputMethodManager)a.getSystemService(android.content.Context.INPUT_METHOD_SERVICE);
        ime.hideSoftInputFromWindow(input.getWindowToken(),0);
        input.layout(0,0,300,80);
        long t=android.os.SystemClock.uptimeMillis();
        input.dispatchTouchEvent(MotionEvent.obtain(t,t,MotionEvent.ACTION_DOWN,30,30,0));
        input.dispatchTouchEvent(MotionEvent.obtain(t,t+30,MotionEvent.ACTION_UP,30,30,0));idle();
        assertTrue(input.hasFocus());assertTrue(Shadows.shadowOf(ime).isSoftInputVisible());
    }

    @Test public void listActuallyScrollsOnlyDuringARealImeSession(){
        Rect frame=new Rect();a.getWindow().getDecorView().getWindowVisibleDisplayFrame(frame);
        final int below=frame.bottom+40;
        class TrackingList extends ListView {
            int delta;TrackingList(){super(a);}
            @Override public void scrollListBy(int y){delta+=y;}
        }
        TrackingList list=new TrackingList();list.setItemsCanFocus(true);
        EditText editor=new EditText(a){
            @Override public void getLocationOnScreen(int[] out){out[0]=0;out[1]=below;}
            @Override public boolean requestRectangleOnScreen(Rect rect,boolean now){return true;}
        };
        editor.setFocusableInTouchMode(true);editor.setText("below keyboard");
        list.setAdapter(new BaseAdapter(){
            public int getCount(){return 1;}public Object getItem(int p){return p;}public long getItemId(int p){return p;}
            public View getView(int p,View v,ViewGroup g){return editor;}
        });a.setContentView(list);idle();editor.requestFocus();
        CaptionEditorViewport viewport=new CaptionEditorViewport(editor);viewport.attach();viewport.onGlobalLayout();idle();
        assertEquals("no IME session yet: the list must not move",0,list.delta);
        viewport.detach();
    }

    @Test public void stableFieldIdsDifferPerField(){
        int url=CaptionEditorIds.forKey(DeepSeekTextPreference.KEY_BASE_URL);
        int key=CaptionEditorIds.forKey(DeepSeekTextPreference.KEY_API_KEY);
        int prompt=CaptionEditorIds.forKey(DeepSeekTextPreference.KEY_PROMPT);
        int model=CaptionEditorIds.forKey(DeepSeekModelPreference.KEY_MODEL);
        assertEquals("the same field keeps one id across rebinds",url,CaptionEditorIds.forKey(DeepSeekTextPreference.KEY_BASE_URL));
        assertNotEquals(url,key);assertNotEquals(url,prompt);assertNotEquals(key,prompt);
        assertNotEquals(url,model);assertNotEquals(key,model);assertNotEquals(prompt,model);
    }
}
