package com.google.android.material.textfield;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Locale;
import r.q;
import tj.i;

/* loaded from: classes3.dex */
public class TextInputEditText extends q {

    /* renamed from: g, reason: collision with root package name */
    public final Rect f34361g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f34362h;

    public TextInputEditText(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 2130969140);
    }

    public final TextInputLayout b() {
        for (ViewParent parent = getParent(); parent instanceof View; parent = parent.getParent()) {
            if (parent instanceof TextInputLayout) {
                return (TextInputLayout) parent;
            }
        }
        return null;
    }

    @Override // android.widget.TextView, android.view.View
    public final void getFocusedRect(Rect rect) {
        super.getFocusedRect(rect);
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB == null || !this.f34362h || rect == null) {
            return;
        }
        Rect rect2 = this.f34361g;
        textInputLayoutB.getFocusedRect(rect2);
        rect.bottom = rect2.bottom;
    }

    @Override // android.view.View
    public final boolean getGlobalVisibleRect(Rect rect, Point point) {
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB == null || !this.f34362h) {
            return super.getGlobalVisibleRect(rect, point);
        }
        boolean globalVisibleRect = textInputLayoutB.getGlobalVisibleRect(rect, point);
        if (globalVisibleRect && point != null) {
            point.offset(-getScrollX(), -getScrollY());
        }
        return globalVisibleRect;
    }

    @Override // android.widget.TextView
    public final CharSequence getHint() {
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB == null || !textInputLayoutB.E) {
            return super.getHint();
        }
        if (textInputLayoutB.C) {
            return textInputLayoutB.D;
        }
        return null;
    }

    @Override // android.widget.TextView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB != null && textInputLayoutB.E && super.getHint() == null) {
            String str = Build.MANUFACTURER;
            if ((str != null ? str.toLowerCase(Locale.ENGLISH) : b.f42142b).equals("meizu")) {
                setHint(b.f42142b);
            }
        }
    }

    @Override // r.q, android.widget.TextView, android.view.View
    public InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        if (inputConnectionOnCreateInputConnection != null && editorInfo.hintText == null) {
            TextInputLayout textInputLayoutB = b();
            CharSequence charSequence = null;
            if (textInputLayoutB != null && textInputLayoutB.C) {
                charSequence = textInputLayoutB.D;
            }
            editorInfo.hintText = charSequence;
        }
        return inputConnectionOnCreateInputConnection;
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        b();
    }

    @Override // android.view.View
    public final boolean requestRectangleOnScreen(Rect rect) {
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB == null || !this.f34362h || rect == null) {
            return super.requestRectangleOnScreen(rect);
        }
        int height = textInputLayoutB.getHeight() - getHeight();
        int i5 = rect.left;
        int i11 = rect.top;
        int i12 = rect.right;
        int i13 = rect.bottom + height;
        Rect rect2 = this.f34361g;
        rect2.set(i5, i11, i12, i13);
        return super.requestRectangleOnScreen(rect2);
    }

    public TextInputEditText(Context context, AttributeSet attributeSet, int i5) {
        super(hk.a.a(context, attributeSet, i5, 0), attributeSet, i5);
        this.f34361g = new Rect();
        i.a(context, attributeSet, i5, 2132083764);
        int[] iArr = bj.a.L;
        i.b(context, attributeSet, iArr, i5, 2132083764, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, i5, 2132083764);
        this.f34362h = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
    }
}
