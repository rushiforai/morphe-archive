package com.google.android.material.timepicker;

import android.os.Bundle;

/* loaded from: classes3.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public TimeModel f34493a = new TimeModel(0);

    /* renamed from: b, reason: collision with root package name */
    public String f34494b;

    public final MaterialTimePicker a() {
        MaterialTimePicker materialTimePicker = new MaterialTimePicker();
        Bundle bundle = new Bundle();
        bundle.putParcelable("TIME_PICKER_TIME_MODEL", this.f34493a);
        bundle.putInt("TIME_PICKER_TITLE_RES", 0);
        String str = this.f34494b;
        if (str != null) {
            bundle.putCharSequence("TIME_PICKER_TITLE_TEXT", str);
        }
        bundle.putInt("TIME_PICKER_POSITIVE_BUTTON_TEXT_RES", 0);
        bundle.putInt("TIME_PICKER_NEGATIVE_BUTTON_TEXT_RES", 0);
        bundle.putInt("TIME_PICKER_OVERRIDE_THEME_RES_ID", 0);
        materialTimePicker.setArguments(bundle);
        return materialTimePicker;
    }

    public final void b(int i5) {
        TimeModel timeModel = this.f34493a;
        timeModel.getClass();
        timeModel.f34474g = i5 >= 12 ? 1 : 0;
        timeModel.f34471d = i5;
    }

    public final void c(int i5) {
        this.f34493a.e(i5);
    }

    public final void d(int i5) {
        TimeModel timeModel = this.f34493a;
        int i11 = timeModel.f34471d;
        int i12 = timeModel.f34472e;
        TimeModel timeModel2 = new TimeModel(i5);
        this.f34493a = timeModel2;
        timeModel2.e(i12);
        TimeModel timeModel3 = this.f34493a;
        timeModel3.getClass();
        timeModel3.f34474g = i11 >= 12 ? 1 : 0;
        timeModel3.f34471d = i11;
    }
}
