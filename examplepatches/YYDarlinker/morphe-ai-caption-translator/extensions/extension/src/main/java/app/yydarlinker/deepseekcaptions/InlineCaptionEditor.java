package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import android.graphics.Rect;
import android.view.*;
import android.widget.EditText;
/** Inline Android floating text actions, independent of the preference row's long-click handling. */
public final class InlineCaptionEditor extends EditText {
    private CaptionEditorViewport viewport;
    private boolean pendingKeyboard;
    private boolean dragged;
    private ActionMode actions;private boolean sensitive;private float downX,downY;
    public InlineCaptionEditor(Context c){super(c);setFocusable(true);setFocusableInTouchMode(true);setLongClickable(true);setCursorVisible(true);
        setShowSoftInputOnFocus(true);setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);}
    @Override public android.view.inputmethod.InputConnection onCreateInputConnection(android.view.inputmethod.EditorInfo info){
        android.view.inputmethod.InputConnection connection=super.onCreateInputConnection(info);
        info.imeOptions |= android.view.inputmethod.EditorInfo.IME_FLAG_NO_EXTRACT_UI;
        return connection;
    }
    public void sensitive(boolean value){sensitive=value;}
    @Override public boolean onTouchEvent(android.view.MotionEvent e){
        int action=e.getActionMasked();
        if(action==MotionEvent.ACTION_DOWN){
            downX=e.getX();downY=e.getY();dragged=false;
            if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);
        }
        if(action==MotionEvent.ACTION_MOVE && Math.abs(e.getY()-downY)>ViewConfiguration.get(getContext()).getScaledTouchSlop()
                && Math.abs(e.getY()-downY)>Math.abs(e.getX()-downX)){
            dragged=true;if(actions==null && getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);
        }
        // Let TextView establish the cursor and input connection before requesting the IME.
        boolean handled=super.onTouchEvent(e);
        if(action==MotionEvent.ACTION_UP && !dragged){
            requestFocus();pendingKeyboard=true;post(this::showKeyboardWhenReady);
        }
        if(action==MotionEvent.ACTION_CANCEL)pendingKeyboard=false;
        return handled;
    }
    private void showKeyboardWhenReady(){
        if(!pendingKeyboard || !isAttachedToWindow() || !hasFocus() || !hasWindowFocus())return;
        pendingKeyboard=false;
        android.view.inputmethod.InputMethodManager ime=(android.view.inputmethod.InputMethodManager)getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
        if(ime!=null){
            if(!ime.isActive(this))ime.restartInput(this);
            ime.showSoftInput(this,android.view.inputmethod.InputMethodManager.SHOW_IMPLICIT);
        }
        if(android.os.Build.VERSION.SDK_INT>=30 && getWindowInsetsController()!=null)
            getWindowInsetsController().show(WindowInsets.Type.ime());
        if(viewport!=null){viewport.onGlobalLayout();viewport.reveal();}
    }
    @Override public void onWindowFocusChanged(boolean focused){
        super.onWindowFocusChanged(focused);if(focused && pendingKeyboard)post(this::showKeyboardWhenReady);
    }
    @Override public boolean performLongClick(){
        requestFocus();if(getSelectionStart()<0)setSelection(length());
        if(actions!=null){actions.finish();actions=null;}
        actions=startActionMode(new ActionMode.Callback2(){
            public boolean onCreateActionMode(ActionMode mode,Menu menu){
                menu.add(0,android.R.id.paste,0,android.R.string.paste).setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);
                menu.add(0,android.R.id.selectAll,1,android.R.string.selectAll);
                if(!sensitive)menu.add(0,android.R.id.copy,2,android.R.string.copy);
                return true;
            }
            public boolean onPrepareActionMode(ActionMode mode,Menu menu){return false;}
            public boolean onActionItemClicked(ActionMode mode,MenuItem item){
                boolean handled=onTextContextMenuItem(item.getItemId());if(item.getItemId()!=android.R.id.selectAll)mode.finish();return handled;
            }
            public void onDestroyActionMode(ActionMode mode){actions=null;}
            @Override public void onGetContentRect(ActionMode mode,View view,Rect out){out.set(0,0,getWidth(),getHeight());}
        },ActionMode.TYPE_FLOATING);
        return actions!=null || super.performLongClick();
    }
    @Override protected void onAttachedToWindow(){
        super.onAttachedToWindow();viewport=new CaptionEditorViewport(this);viewport.attach();
    }
    @Override protected void onFocusChanged(boolean focused,int direction,Rect previous){
        super.onFocusChanged(focused,direction,previous);if(viewport!=null)viewport.focus(focused);
    }
    @Override protected void onSelectionChanged(int start,int end){
        super.onSelectionChanged(start,end);if(viewport!=null)viewport.reveal();
    }
    @Override protected void onDetachedFromWindow(){
        pendingKeyboard=false;
        if(viewport!=null){viewport.detach();viewport=null;}
        if(actions!=null)actions.finish();super.onDetachedFromWindow();
    }
}
