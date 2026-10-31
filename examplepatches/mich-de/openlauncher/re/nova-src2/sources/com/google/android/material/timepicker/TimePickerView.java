package com.google.android.material.timepicker;

import android.content.Context;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.View;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.android.material.button.MaterialButtonToggleGroup;
import com.google.android.material.chip.Chip;

/* loaded from: classes3.dex */
class TimePickerView extends ConstraintLayout {

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ int f34475x = 0;

    /* renamed from: p, reason: collision with root package name */
    public final Chip f34476p;

    /* renamed from: q, reason: collision with root package name */
    public final Chip f34477q;

    /* renamed from: r, reason: collision with root package name */
    public final ClockHandView f34478r;

    /* renamed from: s, reason: collision with root package name */
    public final ClockFaceView f34479s;

    /* renamed from: t, reason: collision with root package name */
    public final MaterialButtonToggleGroup f34480t;

    /* renamed from: u, reason: collision with root package name */
    public n f34481u;

    /* renamed from: v, reason: collision with root package name */
    public n f34482v;

    /* renamed from: w, reason: collision with root package name */
    public MaterialTimePicker f34483w;

    public TimePickerView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        u uVar = new u(this, 0);
        LayoutInflater.from(context).inflate(2131624212, this);
        this.f34479s = (ClockFaceView) findViewById(2131428322);
        MaterialButtonToggleGroup materialButtonToggleGroup = (MaterialButtonToggleGroup) findViewById(2131428327);
        this.f34480t = materialButtonToggleGroup;
        materialButtonToggleGroup.f34134c.add(new q(this, 1));
        Chip chip = (Chip) findViewById(2131428332);
        this.f34476p = chip;
        Chip chip2 = (Chip) findViewById(2131428329);
        this.f34477q = chip2;
        this.f34478r = (ClockHandView) findViewById(2131428323);
        w wVar = new w(new GestureDetector(getContext(), new v(this)));
        chip.setOnTouchListener(wVar);
        chip2.setOnTouchListener(wVar);
        chip.setTag(2131428803, 12);
        chip2.setTag(2131428803, 10);
        chip.setOnClickListener(uVar);
        chip2.setOnClickListener(uVar);
        chip.f34183p = "android.view.View";
        chip2.f34183p = "android.view.View";
    }

    @Override // android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        if (view == this && i5 == 0) {
            this.f34477q.sendAccessibilityEvent(8);
        }
    }
}
