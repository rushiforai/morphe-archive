package com.google.android.material.timepicker;

import a5.a1;
import android.content.res.Resources;
import android.text.InputFilter;
import android.text.TextUtils;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.android.material.button.MaterialButtonToggleGroup;
import com.google.android.material.textfield.TextInputLayout;
import java.util.Arrays;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class t implements o {

    /* renamed from: a, reason: collision with root package name */
    public final LinearLayout f34519a;

    /* renamed from: b, reason: collision with root package name */
    public final TimeModel f34520b;

    /* renamed from: c, reason: collision with root package name */
    public final r f34521c;

    /* renamed from: d, reason: collision with root package name */
    public final r f34522d;

    /* renamed from: e, reason: collision with root package name */
    public final ChipTextInputComboView f34523e;

    /* renamed from: f, reason: collision with root package name */
    public final ChipTextInputComboView f34524f;

    /* renamed from: g, reason: collision with root package name */
    public final EditText f34525g;

    /* renamed from: h, reason: collision with root package name */
    public final EditText f34526h;

    /* renamed from: i, reason: collision with root package name */
    public final MaterialButtonToggleGroup f34527i;

    public t(LinearLayout linearLayout, TimeModel timeModel) {
        r rVar = new r(this, 0);
        this.f34521c = rVar;
        r rVar2 = new r(this, 1);
        this.f34522d = rVar2;
        this.f34519a = linearLayout;
        this.f34520b = timeModel;
        Resources resources = linearLayout.getResources();
        ChipTextInputComboView chipTextInputComboView = (ChipTextInputComboView) linearLayout.findViewById(2131428331);
        this.f34523e = chipTextInputComboView;
        ChipTextInputComboView chipTextInputComboView2 = (ChipTextInputComboView) linearLayout.findViewById(2131428328);
        this.f34524f = chipTextInputComboView2;
        View viewFindViewById = chipTextInputComboView.findViewById(2131428330);
        TextInputLayout textInputLayout = chipTextInputComboView.f34417b;
        View viewFindViewById2 = chipTextInputComboView2.findViewById(2131428330);
        TextInputLayout textInputLayout2 = chipTextInputComboView2.f34417b;
        ((TextView) viewFindViewById).setText(resources.getString(2132018231));
        ((TextView) viewFindViewById2).setText(resources.getString(2132018230));
        chipTextInputComboView.setTag(2131428803, 12);
        chipTextInputComboView2.setTag(2131428803, 10);
        if (timeModel.f34470c == 0) {
            MaterialButtonToggleGroup materialButtonToggleGroup = (MaterialButtonToggleGroup) linearLayout.findViewById(2131428327);
            this.f34527i = materialButtonToggleGroup;
            materialButtonToggleGroup.f34134c.add(new q(this, 0));
            this.f34527i.setVisibility(0);
            e();
        }
        u uVar = new u(this, 1);
        chipTextInputComboView2.setOnClickListener(uVar);
        chipTextInputComboView.setOnClickListener(uVar);
        j jVar = timeModel.f34469b;
        EditText editText = chipTextInputComboView2.f34418c;
        InputFilter[] filters = editText.getFilters();
        InputFilter[] inputFilterArr = (InputFilter[]) Arrays.copyOf(filters, filters.length + 1);
        inputFilterArr[filters.length] = jVar;
        editText.setFilters(inputFilterArr);
        j jVar2 = timeModel.f34468a;
        EditText editText2 = chipTextInputComboView.f34418c;
        InputFilter[] filters2 = editText2.getFilters();
        InputFilter[] inputFilterArr2 = (InputFilter[]) Arrays.copyOf(filters2, filters2.length + 1);
        inputFilterArr2[filters2.length] = jVar2;
        editText2.setFilters(inputFilterArr2);
        EditText editText3 = textInputLayout2.f34369d;
        this.f34525g = editText3;
        EditText editText4 = textInputLayout.f34369d;
        this.f34526h = editText4;
        p pVar = new p(chipTextInputComboView2, chipTextInputComboView, timeModel);
        a1.k(chipTextInputComboView2.f34416a, new s(linearLayout.getContext(), timeModel, 0));
        a1.k(chipTextInputComboView.f34416a, new s(linearLayout.getContext(), timeModel, 1));
        editText3.addTextChangedListener(rVar2);
        editText4.addTextChangedListener(rVar);
        d(timeModel);
        EditText editText5 = textInputLayout2.f34369d;
        EditText editText6 = textInputLayout.f34369d;
        editText5.setImeOptions(268435461);
        editText6.setImeOptions(268435462);
        editText5.setOnEditorActionListener(pVar);
        editText5.setOnKeyListener(pVar);
        editText6.setOnKeyListener(pVar);
    }

    @Override // com.google.android.material.timepicker.o
    public final void a() {
        InputMethodManager inputMethodManager;
        LinearLayout linearLayout = this.f34519a;
        View focusedChild = linearLayout.getFocusedChild();
        if (focusedChild != null && (inputMethodManager = (InputMethodManager) focusedChild.getContext().getSystemService(InputMethodManager.class)) != null) {
            inputMethodManager.hideSoftInputFromWindow(focusedChild.getWindowToken(), 0);
        }
        linearLayout.setVisibility(8);
    }

    public final void b(int i5) {
        this.f34520b.f34473f = i5;
        this.f34523e.setChecked(i5 == 12);
        this.f34524f.setChecked(i5 == 10);
        e();
    }

    public final void c() {
        TimeModel timeModel = this.f34520b;
        this.f34523e.setChecked(timeModel.f34473f == 12);
        this.f34524f.setChecked(timeModel.f34473f == 10);
    }

    public final void d(TimeModel timeModel) {
        EditText editText = this.f34525g;
        r rVar = this.f34522d;
        editText.removeTextChangedListener(rVar);
        EditText editText2 = this.f34526h;
        r rVar2 = this.f34521c;
        editText2.removeTextChangedListener(rVar2);
        Locale locale = this.f34519a.getResources().getConfiguration().locale;
        String str = String.format(locale, "%02d", Integer.valueOf(timeModel.f34472e));
        String str2 = String.format(locale, "%02d", Integer.valueOf(timeModel.b()));
        ChipTextInputComboView chipTextInputComboView = this.f34523e;
        r rVar3 = chipTextInputComboView.f34419d;
        EditText editText3 = chipTextInputComboView.f34418c;
        String strA = TimeModel.a(chipTextInputComboView.getResources(), str, "%02d");
        chipTextInputComboView.f34416a.setText(strA);
        if (!TextUtils.isEmpty(strA)) {
            editText3.removeTextChangedListener(rVar3);
            editText3.setText(strA);
            editText3.addTextChangedListener(rVar3);
        }
        ChipTextInputComboView chipTextInputComboView2 = this.f34524f;
        r rVar4 = chipTextInputComboView2.f34419d;
        EditText editText4 = chipTextInputComboView2.f34418c;
        String strA2 = TimeModel.a(chipTextInputComboView2.getResources(), str2, "%02d");
        chipTextInputComboView2.f34416a.setText(strA2);
        if (!TextUtils.isEmpty(strA2)) {
            editText4.removeTextChangedListener(rVar4);
            editText4.setText(strA2);
            editText4.addTextChangedListener(rVar4);
        }
        editText.addTextChangedListener(rVar);
        editText2.addTextChangedListener(rVar2);
        e();
    }

    public final void e() {
        MaterialButtonToggleGroup materialButtonToggleGroup = this.f34527i;
        if (materialButtonToggleGroup == null) {
            return;
        }
        materialButtonToggleGroup.b(this.f34520b.f34474g == 0 ? 2131428325 : 2131428326, true);
    }

    @Override // com.google.android.material.timepicker.o
    public final void invalidate() {
        d(this.f34520b);
    }

    @Override // com.google.android.material.timepicker.o
    public final void show() {
        this.f34519a.setVisibility(0);
        b(this.f34520b.f34473f);
    }
}
