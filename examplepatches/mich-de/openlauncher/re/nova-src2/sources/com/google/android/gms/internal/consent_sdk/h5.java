package com.google.android.gms.internal.consent_sdk;

import android.graphics.Typeface;
import android.telephony.euicc.EuiccManager;
import android.text.style.TypefaceSpan;
import android.view.textclassifier.TextClassification;
import android.view.textclassifier.TextClassificationContext;
import android.view.textclassifier.TextSelection;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class h5 {
    public static /* synthetic */ void C() {
    }

    public static /* synthetic */ void D() {
    }

    public static /* bridge */ /* synthetic */ EuiccManager e(Object obj) {
        return (EuiccManager) obj;
    }

    public static /* synthetic */ TypefaceSpan f(Typeface typeface) {
        return new TypefaceSpan(typeface);
    }

    public static /* synthetic */ TextClassification.Request.Builder h(CharSequence charSequence, int i5, int i11) {
        return new TextClassification.Request.Builder(charSequence, i5, i11);
    }

    public static /* synthetic */ TextClassificationContext.Builder k(String str, String str2) {
        return new TextClassificationContext.Builder(str, str2);
    }

    public static /* synthetic */ TextSelection.Request.Builder o(CharSequence charSequence, int i5, int i11) {
        return new TextSelection.Request.Builder(charSequence, i5, i11);
    }

    public static /* bridge */ /* synthetic */ Class r() {
        return EuiccManager.class;
    }

    public static /* synthetic */ void t() {
    }
}
