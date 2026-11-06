import android.content.Context;
import android.view.Window;

class ProbeWindow extends Window {
    private final android.widget.FrameLayout decor;
    ProbeWindow(Context context) { super(context); decor = new android.widget.FrameLayout(context); }
    private UnsupportedOperationException unsupported() { return new UnsupportedOperationException("Unused window operation"); }
    @Override public void addContentView(android.view.View arg0, android.view.ViewGroup.LayoutParams arg1) { decor.addView(arg0, arg1); }
    @Override public void closeAllPanels() { throw unsupported(); }
    @Override public void closePanel(int arg0) { throw unsupported(); }
    @Override public android.view.View getCurrentFocus() { throw unsupported(); }
    @Override public android.view.View getDecorView() { return decor; }
    @Override public android.view.LayoutInflater getLayoutInflater() { throw unsupported(); }
    @Override public int getNavigationBarColor() { throw unsupported(); }
    @Override public int getStatusBarColor() { throw unsupported(); }
    @Override public int getVolumeControlStream() { throw unsupported(); }
    @Override public void invalidatePanelMenu(int arg0) { throw unsupported(); }
    @Override public boolean isFloating() { throw unsupported(); }
    @Override public boolean isShortcutKey(int arg0, android.view.KeyEvent arg1) { throw unsupported(); }
    @Override protected void onActive() { throw unsupported(); }
    @Override public void onConfigurationChanged(android.content.res.Configuration arg0) { throw unsupported(); }
    @Override public void openPanel(int arg0, android.view.KeyEvent arg1) { throw unsupported(); }
    @Override public android.view.View peekDecorView() { return decor; }
    @Override public boolean performContextMenuIdentifierAction(int arg0, int arg1) { throw unsupported(); }
    @Override public boolean performPanelIdentifierAction(int arg0, int arg1, int arg2) { throw unsupported(); }
    @Override public boolean performPanelShortcut(int arg0, int arg1, android.view.KeyEvent arg2, int arg3) { throw unsupported(); }
    @Override public void restoreHierarchyState(android.os.Bundle arg0) { throw unsupported(); }
    @Override public android.os.Bundle saveHierarchyState() { throw unsupported(); }
    @Override public void setBackgroundDrawable(android.graphics.drawable.Drawable arg0) { decor.setBackground(arg0); }
    @Override public void setChildDrawable(int arg0, android.graphics.drawable.Drawable arg1) { throw unsupported(); }
    @Override public void setChildInt(int arg0, int arg1) { throw unsupported(); }
    @Override public void setContentView(android.view.View arg0) { decor.addView(arg0); }
    @Override public void setContentView(android.view.View arg0, android.view.ViewGroup.LayoutParams arg1) { decor.addView(arg0); }
    @Override public void setContentView(int arg0) { throw unsupported(); }
    @Override public void setDecorCaptionShade(int arg0) { throw unsupported(); }
    @Override public void setFeatureDrawable(int arg0, android.graphics.drawable.Drawable arg1) { throw unsupported(); }
    @Override public void setFeatureDrawableAlpha(int arg0, int arg1) { throw unsupported(); }
    @Override public void setFeatureDrawableResource(int arg0, int arg1) { throw unsupported(); }
    @Override public void setFeatureDrawableUri(int arg0, android.net.Uri arg1) { throw unsupported(); }
    @Override public void setFeatureInt(int arg0, int arg1) { throw unsupported(); }
    @Override public void setNavigationBarColor(int arg0) { throw unsupported(); }
    @Override public void setResizingCaptionDrawable(android.graphics.drawable.Drawable arg0) { throw unsupported(); }
    @Override public void setStatusBarColor(int arg0) { throw unsupported(); }
    @Override public void setTitle(java.lang.CharSequence arg0) { throw unsupported(); }
    @Override public void setTitleColor(int arg0) { throw unsupported(); }
    @Override public void setVolumeControlStream(int arg0) { throw unsupported(); }
    @Override public boolean superDispatchGenericMotionEvent(android.view.MotionEvent arg0) { throw unsupported(); }
    @Override public boolean superDispatchKeyEvent(android.view.KeyEvent arg0) { throw unsupported(); }
    @Override public boolean superDispatchKeyShortcutEvent(android.view.KeyEvent arg0) { throw unsupported(); }
    @Override public boolean superDispatchTouchEvent(android.view.MotionEvent arg0) { throw unsupported(); }
    @Override public boolean superDispatchTrackballEvent(android.view.MotionEvent arg0) { throw unsupported(); }
    @Override public void takeInputQueue(android.view.InputQueue.Callback arg0) { throw unsupported(); }
    @Override public void takeKeyEvents(boolean arg0) { throw unsupported(); }
    @Override public void takeSurface(android.view.SurfaceHolder.Callback2 arg0) { throw unsupported(); }
    @Override public void togglePanel(int arg0, android.view.KeyEvent arg1) { throw unsupported(); }
}
