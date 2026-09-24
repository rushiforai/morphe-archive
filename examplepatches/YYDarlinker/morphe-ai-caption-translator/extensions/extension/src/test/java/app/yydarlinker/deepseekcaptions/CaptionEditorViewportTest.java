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

@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class CaptionEditorViewportTest {
    Activity a;
    @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().visible().get();}
    @After public void done(){a.finish();}
    private void idle(){Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private int mode(View root){return ((WindowManager.LayoutParams)root.getLayoutParams()).softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST;}

    @Test public void nestedDialogUsesItsOwnWindowAndRestoresAdjustmentAfterLastEditorDetaches(){
        a.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);
        Dialog dialog=new Dialog(a);dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING);
        LinearLayout content=new LinearLayout(a);content.setOrientation(1);
        InlineCaptionEditor one=new InlineCaptionEditor(a),two=new InlineCaptionEditor(a);
        content.addView(one);content.addView(two);dialog.setContentView(content);dialog.show();idle();
        View root=dialog.getWindow().getDecorView();
        assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,mode(root));
        assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN,a.getWindow().getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
        content.removeView(one);assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,mode(root));
        content.removeView(two);assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING,mode(root));dialog.dismiss();
    }
    @Test public void focusAndCaretChangesAskParentToRevealOnlyCurrentLine(){
        class TrackingScroll extends ScrollView {
            int calls;Rect requested;
            TrackingScroll(){super(a);}
            @Override public boolean requestChildRectangleOnScreen(View child,Rect rect,boolean immediate){calls++;requested=new Rect(rect);return super.requestChildRectangleOnScreen(child,rect,immediate);}
        }
        TrackingScroll scroll=new TrackingScroll();InlineCaptionEditor input=new InlineCaptionEditor(a);
        input.setSingleLine(false);input.setMinLines(7);input.setText("one\ntwo\nthree\nfour\nfive\nsix\nseven");scroll.addView(input);
        a.setContentView(scroll);input.requestFocus();input.setSelection(input.length());idle();
        assertTrue(scroll.calls>0);assertNotNull(scroll.requested);
        assertTrue(scroll.requested.height()<=input.getLineHeight()+CaptionSettingsStyle.dp(a,24));
    }
    @Test public void edgeToEdgeListAddsOnlyOverlapAndRestoresPadding(){
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
        assertTrue(editor.requestFocus());CaptionEditorViewport viewport=new CaptionEditorViewport(editor);viewport.attach();
        root.bottom=400;viewport.onGlobalLayout();assertEquals(310,list.getPaddingBottom());
        viewport.onGlobalLayout();assertEquals(310,list.getPaddingBottom()); // no cumulative padding
        list.layout(0,0,320,400);viewport.onGlobalLayout();assertEquals(10,list.getPaddingBottom()); // resize already did the work
        list.layout(0,0,320,700);viewport.onGlobalLayout();assertEquals(310,list.getPaddingBottom());
        viewport.focus(false);assertEquals(10,list.getPaddingBottom());viewport.detach();
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
    @Test public void predrawDetectsOcclusionWithoutLayoutEvent(){
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
        root.bottom=380;assertTrue(viewport.onPreDraw());assertEquals(320,list.getPaddingBottom());
        viewport.detach();assertEquals(0,list.getPaddingBottom());
    }

    @Test public void listActuallyScrollsWhenRectangleRequestClaimsOccludedEditorIsVisible(){
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
        assertTrue("Must move the actual list, not just request a rectangle",list.delta>0);viewport.detach();
    }
}
