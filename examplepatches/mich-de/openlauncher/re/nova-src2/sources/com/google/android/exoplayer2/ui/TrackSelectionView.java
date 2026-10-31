package com.google.android.exoplayer2.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.CheckedTextView;
import android.widget.LinearLayout;
import com.google.android.material.datepicker.n;
import java.util.ArrayList;
import java.util.HashMap;

/* loaded from: classes3.dex */
public class TrackSelectionView extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public final CheckedTextView f31589a;

    /* renamed from: b, reason: collision with root package name */
    public final CheckedTextView f31590b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f31591c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f31592d;

    public TrackSelectionView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        setOrientation(1);
        setSaveFromParentEnabled(false);
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(new int[]{16843534});
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        n nVar = new n(this, 11);
        getResources().getClass();
        new ArrayList();
        this.f31591c = new HashMap();
        CheckedTextView checkedTextView = (CheckedTextView) layoutInflaterFrom.inflate(17367055, (ViewGroup) this, false);
        this.f31589a = checkedTextView;
        checkedTextView.setBackgroundResource(resourceId);
        checkedTextView.setText(2132017853);
        checkedTextView.setEnabled(false);
        checkedTextView.setFocusable(true);
        checkedTextView.setOnClickListener(nVar);
        checkedTextView.setVisibility(8);
        addView(checkedTextView);
        addView(layoutInflaterFrom.inflate(2131624110, (ViewGroup) this, false));
        CheckedTextView checkedTextView2 = (CheckedTextView) layoutInflaterFrom.inflate(17367055, (ViewGroup) this, false);
        this.f31590b = checkedTextView2;
        checkedTextView2.setBackgroundResource(resourceId);
        checkedTextView2.setText(2132017852);
        checkedTextView2.setEnabled(false);
        checkedTextView2.setFocusable(true);
        checkedTextView2.setOnClickListener(nVar);
        addView(checkedTextView2);
    }
}
