package com.google.android.material.timepicker;

import a5.a1;
import android.content.res.Resources;
import android.text.TextUtils;
import com.google.android.material.chip.Chip;
import java.util.Locale;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class n implements f, o {

    /* renamed from: f, reason: collision with root package name */
    public static final String[] f34501f = {"12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"};

    /* renamed from: g, reason: collision with root package name */
    public static final String[] f34502g = {"00", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"};

    /* renamed from: h, reason: collision with root package name */
    public static final String[] f34503h = {"00", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"};

    /* renamed from: a, reason: collision with root package name */
    public final TimePickerView f34504a;

    /* renamed from: b, reason: collision with root package name */
    public final TimeModel f34505b;

    /* renamed from: c, reason: collision with root package name */
    public float f34506c;

    /* renamed from: d, reason: collision with root package name */
    public float f34507d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f34508e = false;

    public n(TimePickerView timePickerView, TimeModel timeModel) {
        this.f34504a = timePickerView;
        this.f34505b = timeModel;
        if (timeModel.f34470c == 0) {
            timePickerView.f34480t.setVisibility(0);
        }
        timePickerView.f34478r.f34438j.add(this);
        timePickerView.f34482v = this;
        timePickerView.f34481u = this;
        timePickerView.f34478r.f34444r = this;
        for (int i5 = 0; i5 < 12; i5++) {
            Resources resources = this.f34504a.getResources();
            String[] strArr = f34501f;
            strArr[i5] = TimeModel.a(resources, strArr[i5], "%d");
        }
        for (int i11 = 0; i11 < 12; i11++) {
            Resources resources2 = this.f34504a.getResources();
            String[] strArr2 = f34503h;
            strArr2[i11] = TimeModel.a(resources2, strArr2[i11], "%02d");
        }
        invalidate();
    }

    @Override // com.google.android.material.timepicker.o
    public final void a() {
        this.f34504a.setVisibility(8);
    }

    public final void b(int i5, boolean z11) {
        boolean z12 = i5 == 12;
        TimePickerView timePickerView = this.f34504a;
        ClockHandView clockHandView = timePickerView.f34478r;
        Chip chip = timePickerView.f34477q;
        Chip chip2 = timePickerView.f34476p;
        ClockFaceView clockFaceView = timePickerView.f34479s;
        clockHandView.f34432d = z12;
        TimeModel timeModel = this.f34505b;
        timeModel.f34473f = i5;
        int i11 = timeModel.f34470c;
        clockFaceView.p(z12 ? 2132018219 : i11 == 1 ? 2132018215 : 2132018217, z12 ? f34503h : i11 == 1 ? f34502g : f34501f);
        int i12 = (timeModel.f34473f == 10 && i11 == 1 && timeModel.f34471d >= 12) ? 2 : 1;
        ClockHandView clockHandView2 = clockFaceView.f34420s;
        clockHandView2.f34447u = i12;
        clockHandView2.invalidate();
        timePickerView.f34478r.c(z12 ? this.f34506c : this.f34507d, z11);
        boolean z13 = i5 == 12;
        chip2.setChecked(z13);
        int i13 = z13 ? 2 : 0;
        WeakHashMap weakHashMap = a1.f250a;
        chip2.setAccessibilityLiveRegion(i13);
        boolean z14 = i5 == 10;
        chip.setChecked(z14);
        chip.setAccessibilityLiveRegion(z14 ? 2 : 0);
        a1.k(chip, new m(this, timePickerView.getContext(), 0));
        a1.k(chip2, new m(this, timePickerView.getContext(), 1));
    }

    public final void c() {
        TimeModel timeModel = this.f34505b;
        int i5 = timeModel.f34474g;
        int iB = timeModel.b();
        int i11 = timeModel.f34472e;
        TimePickerView timePickerView = this.f34504a;
        Chip chip = timePickerView.f34477q;
        Chip chip2 = timePickerView.f34476p;
        timePickerView.f34480t.b(i5 == 1 ? 2131428326 : 2131428325, true);
        Locale locale = timePickerView.getResources().getConfiguration().locale;
        String str = String.format(locale, "%02d", Integer.valueOf(i11));
        String str2 = String.format(locale, "%02d", Integer.valueOf(iB));
        if (!TextUtils.equals(chip2.getText(), str)) {
            chip2.setText(str);
        }
        if (TextUtils.equals(chip.getText(), str2)) {
            return;
        }
        chip.setText(str2);
    }

    @Override // com.google.android.material.timepicker.f
    public final void d(float f11, boolean z11) {
        if (this.f34508e) {
            return;
        }
        TimeModel timeModel = this.f34505b;
        int i5 = timeModel.f34471d;
        int i11 = timeModel.f34472e;
        int iRound = Math.round(f11);
        int i12 = timeModel.f34473f;
        TimePickerView timePickerView = this.f34504a;
        if (i12 == 12) {
            timeModel.e((iRound + 3) / 6);
            this.f34506c = (float) Math.floor(timeModel.f34472e * 6);
        } else {
            int i13 = (iRound + 15) / 30;
            if (timeModel.f34470c == 1) {
                i13 %= 12;
                if (timePickerView.f34479s.f34420s.f34447u == 2) {
                    i13 += 12;
                }
            }
            timeModel.d(i13);
            this.f34507d = (timeModel.b() * 30) % 360;
        }
        if (z11) {
            return;
        }
        c();
        if (timeModel.f34472e == i11 && timeModel.f34471d == i5) {
            return;
        }
        timePickerView.performHapticFeedback(4);
    }

    @Override // com.google.android.material.timepicker.o
    public final void invalidate() {
        TimeModel timeModel = this.f34505b;
        this.f34507d = (timeModel.b() * 30) % 360;
        this.f34506c = timeModel.f34472e * 6;
        b(timeModel.f34473f, false);
        c();
    }

    @Override // com.google.android.material.timepicker.o
    public final void show() {
        this.f34504a.setVisibility(0);
    }
}
