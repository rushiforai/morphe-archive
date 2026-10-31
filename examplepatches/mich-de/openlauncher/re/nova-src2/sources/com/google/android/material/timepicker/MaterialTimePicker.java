package com.google.android.material.timepicker;

import a5.a1;
import a5.s0;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Pair;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.fragment.app.DialogFragment;
import b.c0;
import com.google.android.material.button.MaterialButton;
import e10.z2;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.WeakHashMap;
import ps.e0;

/* loaded from: classes3.dex */
public final class MaterialTimePicker extends DialogFragment {

    /* renamed from: e, reason: collision with root package name */
    public TimePickerView f34452e;

    /* renamed from: f, reason: collision with root package name */
    public ViewStub f34453f;

    /* renamed from: g, reason: collision with root package name */
    public n f34454g;

    /* renamed from: h, reason: collision with root package name */
    public t f34455h;

    /* renamed from: i, reason: collision with root package name */
    public Object f34456i;

    /* renamed from: j, reason: collision with root package name */
    public int f34457j;

    /* renamed from: k, reason: collision with root package name */
    public int f34458k;

    /* renamed from: m, reason: collision with root package name */
    public CharSequence f34460m;
    public CharSequence o;

    /* renamed from: q, reason: collision with root package name */
    public CharSequence f34462q;

    /* renamed from: r, reason: collision with root package name */
    public MaterialButton f34463r;

    /* renamed from: s, reason: collision with root package name */
    public Button f34464s;

    /* renamed from: u, reason: collision with root package name */
    public TimeModel f34466u;

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashSet f34448a = new LinkedHashSet();

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashSet f34449b = new LinkedHashSet();

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashSet f34450c = new LinkedHashSet();

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashSet f34451d = new LinkedHashSet();

    /* renamed from: l, reason: collision with root package name */
    public int f34459l = 0;
    public int n = 0;

    /* renamed from: p, reason: collision with root package name */
    public int f34461p = 0;

    /* renamed from: t, reason: collision with root package name */
    public int f34465t = 0;

    /* renamed from: v, reason: collision with root package name */
    public int f34467v = 0;

    public final int o() {
        return this.f34466u.f34471d % 24;
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        Iterator it = this.f34450c.iterator();
        while (it.hasNext()) {
            ((DialogInterface.OnCancelListener) it.next()).onCancel(dialogInterface);
        }
        super.onCancel(dialogInterface);
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            bundle = getArguments();
        }
        if (bundle == null) {
            return;
        }
        TimeModel timeModel = (TimeModel) bundle.getParcelable("TIME_PICKER_TIME_MODEL");
        this.f34466u = timeModel;
        if (timeModel == null) {
            this.f34466u = new TimeModel(0);
        }
        this.f34465t = bundle.getInt("TIME_PICKER_INPUT_MODE", this.f34466u.f34470c != 1 ? 0 : 1);
        this.f34459l = bundle.getInt("TIME_PICKER_TITLE_RES", 0);
        this.f34460m = bundle.getCharSequence("TIME_PICKER_TITLE_TEXT");
        this.n = bundle.getInt("TIME_PICKER_POSITIVE_BUTTON_TEXT_RES", 0);
        this.o = bundle.getCharSequence("TIME_PICKER_POSITIVE_BUTTON_TEXT");
        this.f34461p = bundle.getInt("TIME_PICKER_NEGATIVE_BUTTON_TEXT_RES", 0);
        this.f34462q = bundle.getCharSequence("TIME_PICKER_NEGATIVE_BUTTON_TEXT");
        this.f34467v = bundle.getInt("TIME_PICKER_OVERRIDE_THEME_RES_ID", 0);
    }

    @Override // androidx.fragment.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        Context contextRequireContext = requireContext();
        int i5 = this.f34467v;
        if (i5 == 0) {
            TypedValue typedValueU = e0.u(requireContext(), 2130969617);
            i5 = typedValueU == null ? 0 : typedValueU.data;
        }
        Dialog dialog = new Dialog(contextRequireContext, i5);
        Context context = dialog.getContext();
        bk.g gVar = new bk.g(context, null, 2130969616, 2132084048);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(null, bj.a.C, 2130969616, 2132084048);
        this.f34458k = typedArrayObtainStyledAttributes.getResourceId(1, 0);
        this.f34457j = typedArrayObtainStyledAttributes.getResourceId(2, 0);
        int color = typedArrayObtainStyledAttributes.getColor(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        gVar.j(context);
        gVar.l(ColorStateList.valueOf(color));
        Window window = dialog.getWindow();
        window.setBackgroundDrawable(gVar);
        window.requestFeature(1);
        window.setLayout(-2, -2);
        View decorView = window.getDecorView();
        WeakHashMap weakHashMap = a1.f250a;
        gVar.k(s0.e(decorView));
        return dialog;
    }

    @Override // androidx.fragment.app.h0
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ViewGroup viewGroup2 = (ViewGroup) layoutInflater.inflate(2131624213, viewGroup);
        TimePickerView timePickerView = (TimePickerView) viewGroup2.findViewById(2131428338);
        this.f34452e = timePickerView;
        timePickerView.f34483w = this;
        this.f34453f = (ViewStub) viewGroup2.findViewById(2131428333);
        this.f34463r = (MaterialButton) viewGroup2.findViewById(2131428336);
        TextView textView = (TextView) viewGroup2.findViewById(2131428136);
        int i5 = this.f34459l;
        if (i5 != 0) {
            textView.setText(i5);
        } else if (!TextUtils.isEmpty(this.f34460m)) {
            textView.setText(this.f34460m);
        }
        q(this.f34463r);
        Button button = (Button) viewGroup2.findViewById(2131428337);
        button.setOnClickListener(new h(this, 0));
        int i11 = this.n;
        if (i11 != 0) {
            button.setText(i11);
        } else if (!TextUtils.isEmpty(this.o)) {
            button.setText(this.o);
        }
        Button button2 = (Button) viewGroup2.findViewById(2131428334);
        this.f34464s = button2;
        button2.setOnClickListener(new h(this, 1));
        int i12 = this.f34461p;
        if (i12 != 0) {
            this.f34464s.setText(i12);
        } else if (!TextUtils.isEmpty(this.f34462q)) {
            this.f34464s.setText(this.f34462q);
        }
        Button button3 = this.f34464s;
        if (button3 != null) {
            button3.setVisibility(isCancelable() ? 0 : 8);
        }
        this.f34463r.setOnClickListener(new h(this, 2));
        return viewGroup2;
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onDestroyView() {
        super.onDestroyView();
        this.f34456i = null;
        this.f34454g = null;
        this.f34455h = null;
        TimePickerView timePickerView = this.f34452e;
        if (timePickerView != null) {
            timePickerView.f34483w = null;
            this.f34452e = null;
        }
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        Iterator it = this.f34451d.iterator();
        while (it.hasNext()) {
            ((DialogInterface.OnDismissListener) it.next()).onDismiss(dialogInterface);
        }
        super.onDismiss(dialogInterface);
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable("TIME_PICKER_TIME_MODEL", this.f34466u);
        bundle.putInt("TIME_PICKER_INPUT_MODE", this.f34465t);
        bundle.putInt("TIME_PICKER_TITLE_RES", this.f34459l);
        bundle.putCharSequence("TIME_PICKER_TITLE_TEXT", this.f34460m);
        bundle.putInt("TIME_PICKER_POSITIVE_BUTTON_TEXT_RES", this.n);
        bundle.putCharSequence("TIME_PICKER_POSITIVE_BUTTON_TEXT", this.o);
        bundle.putInt("TIME_PICKER_NEGATIVE_BUTTON_TEXT_RES", this.f34461p);
        bundle.putCharSequence("TIME_PICKER_NEGATIVE_BUTTON_TEXT", this.f34462q);
        bundle.putInt("TIME_PICKER_OVERRIDE_THEME_RES_ID", this.f34467v);
    }

    @Override // androidx.fragment.app.h0
    public final void onViewCreated(View view, Bundle bundle) {
        if (this.f34456i instanceof t) {
            view.postDelayed(new g(this, 0), 100L);
        }
    }

    public final int p() {
        return this.f34466u.f34472e;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11, types: [com.google.android.material.timepicker.o, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v2, types: [com.google.android.material.timepicker.o, java.lang.Object] */
    public final void q(MaterialButton materialButton) {
        t tVar;
        Pair pair;
        if (materialButton == null || this.f34452e == null || this.f34453f == null) {
            return;
        }
        ?? r02 = this.f34456i;
        if (r02 != 0) {
            r02.a();
        }
        int i5 = this.f34465t;
        TimePickerView timePickerView = this.f34452e;
        ViewStub viewStub = this.f34453f;
        if (i5 == 0) {
            n nVar = this.f34454g;
            n nVar2 = nVar;
            if (nVar == null) {
                nVar2 = new n(timePickerView, this.f34466u);
            }
            this.f34454g = nVar2;
            tVar = nVar2;
        } else {
            if (this.f34455h == null) {
                this.f34455h = new t((LinearLayout) viewStub.inflate(), this.f34466u);
            }
            t tVar2 = this.f34455h;
            tVar2.f34523e.setChecked(false);
            tVar2.f34524f.setChecked(false);
            tVar = this.f34455h;
        }
        this.f34456i = tVar;
        tVar.show();
        this.f34456i.invalidate();
        int i11 = this.f34465t;
        if (i11 == 0) {
            pair = new Pair(Integer.valueOf(this.f34457j), 2132018234);
        } else {
            if (i11 != 1) {
                throw new IllegalArgumentException(c0.h(i11, "no icon for mode: "));
            }
            pair = new Pair(Integer.valueOf(this.f34458k), 2132018229);
        }
        int iIntValue = ((Integer) pair.first).intValue();
        Drawable drawableB0 = iIntValue != 0 ? z2.b0(materialButton.getContext(), iIntValue) : null;
        if (materialButton.f34123i != drawableB0) {
            materialButton.f34123i = drawableB0;
            materialButton.f(true);
            materialButton.g(materialButton.getMeasuredWidth(), materialButton.getMeasuredHeight());
        }
        materialButton.setContentDescription(getResources().getString(((Integer) pair.second).intValue()));
        materialButton.sendAccessibilityEvent(4);
    }

    @Override // androidx.fragment.app.DialogFragment
    public final void setCancelable(boolean z11) {
        super.setCancelable(z11);
        Button button = this.f34464s;
        if (button != null) {
            button.setVisibility(isCancelable() ? 0 : 8);
        }
    }
}
