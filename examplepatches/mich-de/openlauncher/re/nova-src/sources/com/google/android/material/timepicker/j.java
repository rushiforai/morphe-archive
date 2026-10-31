package com.google.android.material.timepicker;

import android.text.InputFilter;
import android.text.Spanned;

/* loaded from: classes3.dex */
public final class j implements InputFilter {

    /* renamed from: a, reason: collision with root package name */
    public final int f34495a;

    public j(int i5) {
        this.f34495a = i5;
    }

    @Override // android.text.InputFilter
    public final CharSequence filter(CharSequence charSequence, int i5, int i11, Spanned spanned, int i12, int i13) {
        try {
            StringBuilder sb2 = new StringBuilder(spanned);
            sb2.replace(i12, i13, charSequence.subSequence(i5, i11).toString());
            if (Integer.parseInt(sb2.toString()) <= this.f34495a) {
                return null;
            }
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } catch (NumberFormatException unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }
}
