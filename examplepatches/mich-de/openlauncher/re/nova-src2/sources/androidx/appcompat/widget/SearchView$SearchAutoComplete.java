package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import o7.g0;
import r.l;

/* loaded from: classes2.dex */
public class SearchView$SearchAutoComplete extends l {

    /* renamed from: e, reason: collision with root package name */
    public int f13773e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f13774f;

    /* renamed from: g, reason: collision with root package name */
    public final g0 f13775g;

    public SearchView$SearchAutoComplete(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f13775g = new g0(this, 9);
        this.f13773e = getThreshold();
    }

    @Override // android.widget.AutoCompleteTextView
    public final boolean enoughToFilter() {
        return this.f13773e <= 0 || super.enoughToFilter();
    }

    @Override // r.l, android.widget.TextView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        if (this.f13774f) {
            g0 g0Var = this.f13775g;
            removeCallbacks(g0Var);
            post(g0Var);
        }
        return inputConnectionOnCreateInputConnection;
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        Configuration configuration = getResources().getConfiguration();
        int i5 = configuration.screenWidthDp;
        int i11 = configuration.screenHeightDp;
        setMinWidth((int) TypedValue.applyDimension(1, (i5 < 960 || i11 < 720 || configuration.orientation != 2) ? (i5 >= 600 || (i5 >= 640 && i11 >= 480)) ? 192 : 160 : 256, displayMetrics));
    }

    @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
    public final void onFocusChanged(boolean z11, int i5, Rect rect) {
        super.onFocusChanged(z11, i5, rect);
        throw null;
    }

    @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
    public final boolean onKeyPreIme(int i5, KeyEvent keyEvent) {
        if (i5 == 4) {
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                KeyEvent.DispatcherState keyDispatcherState = getKeyDispatcherState();
                if (keyDispatcherState != null) {
                    keyDispatcherState.startTracking(keyEvent, this);
                }
                return true;
            }
            if (keyEvent.getAction() == 1) {
                KeyEvent.DispatcherState keyDispatcherState2 = getKeyDispatcherState();
                if (keyDispatcherState2 != null) {
                    keyDispatcherState2.handleUpEvent(keyEvent);
                }
                if (keyEvent.isTracking() && !keyEvent.isCanceled()) {
                    throw null;
                }
            }
        }
        return super.onKeyPreIme(i5, keyEvent);
    }

    @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            throw null;
        }
    }

    @Override // android.widget.AutoCompleteTextView
    public final void performCompletion() {
    }

    @Override // android.widget.AutoCompleteTextView
    public final void replaceText(CharSequence charSequence) {
    }

    @Override // android.widget.AutoCompleteTextView
    public final void setThreshold(int i5) {
        super.setThreshold(i5);
        this.f13773e = i5;
    }
}
