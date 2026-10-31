package com.facebook.ads.internal.api;

import android.content.Context;
import android.util.AttributeSet;
import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public class AdViewConstructorParams {
    public static final int CONTEXT = 0;
    public static final int CONTEXT_ATTRS = 1;
    public static final int CONTEXT_ATTRS_STYLE_ATTR = 2;
    public static final int CONTEXT_ATTRS_STYLE_ATTR_STYLE_RES = 3;
    private final AttributeSet mAttributeSet;
    private final Context mContext;
    private final int mDefStyleAttr;
    private final int mDefStyleRes;
    private final int mInitializationType;

    public AdViewConstructorParams(Context context) {
        this.mInitializationType = 0;
        this.mContext = context;
        this.mAttributeSet = null;
        this.mDefStyleAttr = 0;
        this.mDefStyleRes = 0;
    }

    public AttributeSet getAttributeSet() {
        return this.mAttributeSet;
    }

    public Context getContext() {
        return this.mContext;
    }

    public int getDefStyleAttr() {
        return this.mDefStyleAttr;
    }

    public int getDefStyleRes() {
        return this.mDefStyleRes;
    }

    public int getInitializationType() {
        return this.mInitializationType;
    }

    public AdViewConstructorParams(Context context, AttributeSet attributeSet) {
        this.mInitializationType = 1;
        this.mContext = context;
        this.mAttributeSet = attributeSet;
        this.mDefStyleAttr = 0;
        this.mDefStyleRes = 0;
    }

    public AdViewConstructorParams(Context context, AttributeSet attributeSet, int i5) {
        this.mInitializationType = 2;
        this.mContext = context;
        this.mAttributeSet = attributeSet;
        this.mDefStyleAttr = i5;
        this.mDefStyleRes = 0;
    }

    public AdViewConstructorParams(Context context, AttributeSet attributeSet, int i5, int i11) {
        this.mInitializationType = 3;
        this.mContext = context;
        this.mAttributeSet = attributeSet;
        this.mDefStyleAttr = i5;
        this.mDefStyleRes = i11;
    }
}
