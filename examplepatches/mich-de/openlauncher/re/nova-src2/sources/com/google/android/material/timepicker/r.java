package com.google.android.material.timepicker;

import android.text.Editable;
import android.text.TextUtils;
import com.google.android.material.chip.Chip;

/* loaded from: classes3.dex */
public final class r extends tj.h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34515a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f34516b;

    public /* synthetic */ r(Object obj, int i5) {
        this.f34515a = i5;
        this.f34516b = obj;
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) throws NumberFormatException {
        int i5 = this.f34515a;
        Object obj = this.f34516b;
        switch (i5) {
            case 0:
                t tVar = (t) obj;
                try {
                    if (TextUtils.isEmpty(editable)) {
                        tVar.f34520b.e(0);
                    } else {
                        tVar.f34520b.e(Integer.parseInt(editable.toString()));
                    }
                    break;
                } catch (NumberFormatException unused) {
                    return;
                }
            case 1:
                t tVar2 = (t) obj;
                try {
                    if (TextUtils.isEmpty(editable)) {
                        tVar2.f34520b.d(0);
                    } else {
                        tVar2.f34520b.d(Integer.parseInt(editable.toString()));
                    }
                    break;
                } catch (NumberFormatException unused2) {
                    return;
                }
            default:
                ChipTextInputComboView chipTextInputComboView = (ChipTextInputComboView) obj;
                Chip chip = chipTextInputComboView.f34416a;
                if (!TextUtils.isEmpty(editable)) {
                    int i11 = ChipTextInputComboView.f34415e;
                    String strA = TimeModel.a(chipTextInputComboView.getResources(), editable, "%02d");
                    if (TextUtils.isEmpty(strA)) {
                        strA = TimeModel.a(chipTextInputComboView.getResources(), "00", "%02d");
                    }
                    chip.setText(strA);
                    break;
                } else {
                    chip.setText(TimeModel.a(chipTextInputComboView.getResources(), "00", "%02d"));
                    break;
                }
        }
    }
}
