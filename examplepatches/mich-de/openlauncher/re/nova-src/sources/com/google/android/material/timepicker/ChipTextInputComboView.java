package com.google.android.material.timepicker;

import a5.a1;
import a5.d0;
import android.content.Context;
import android.content.res.Configuration;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Checkable;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.google.android.material.chip.Chip;
import com.google.android.material.textfield.TextInputLayout;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
class ChipTextInputComboView extends FrameLayout implements Checkable {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ int f34415e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Chip f34416a;

    /* renamed from: b, reason: collision with root package name */
    public final TextInputLayout f34417b;

    /* renamed from: c, reason: collision with root package name */
    public final EditText f34418c;

    /* renamed from: d, reason: collision with root package name */
    public final r f34419d;

    public ChipTextInputComboView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        Chip chip = (Chip) layoutInflaterFrom.inflate(2131624210, (ViewGroup) this, false);
        this.f34416a = chip;
        chip.f34183p = "android.view.View";
        TextInputLayout textInputLayout = (TextInputLayout) layoutInflaterFrom.inflate(2131624211, (ViewGroup) this, false);
        this.f34417b = textInputLayout;
        EditText editText = textInputLayout.f34369d;
        this.f34418c = editText;
        editText.setVisibility(4);
        r rVar = new r(this, 2);
        this.f34419d = rVar;
        editText.addTextChangedListener(rVar);
        editText.setImeHintLocales(getContext().getResources().getConfiguration().getLocales());
        addView(chip);
        addView(textInputLayout);
        TextView textView = (TextView) findViewById(2131428330);
        WeakHashMap weakHashMap = a1.f250a;
        editText.setId(View.generateViewId());
        textView.setLabelFor(editText.getId());
        editText.setSaveEnabled(false);
        editText.setLongClickable(false);
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return this.f34416a.isChecked();
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.f34418c.setImeHintLocales(getContext().getResources().getConfiguration().getLocales());
    }

    @Override // android.widget.Checkable
    public final void setChecked(boolean z11) {
        Chip chip = this.f34416a;
        chip.setChecked(z11);
        int i5 = z11 ? 0 : 4;
        EditText editText = this.f34418c;
        editText.setVisibility(i5);
        chip.setVisibility(z11 ? 8 : 0);
        if (chip.isChecked()) {
            editText.requestFocus();
            editText.post(new d0(editText, 3));
        }
    }

    @Override // android.view.View
    public final void setOnClickListener(View.OnClickListener onClickListener) {
        this.f34416a.setOnClickListener(onClickListener);
    }

    @Override // android.view.View
    public final void setTag(int i5, Object obj) {
        this.f34416a.setTag(i5, obj);
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        this.f34416a.toggle();
    }
}
