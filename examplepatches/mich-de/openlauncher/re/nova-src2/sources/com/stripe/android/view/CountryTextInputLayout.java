package com.stripe.android.view;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.LocaleList;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.widget.AutoCompleteTextView;
import android.widget.LinearLayout;
import com.google.android.material.textfield.TextInputLayout;
import com.stripe.android.core.model.Country;
import com.stripe.android.core.model.CountryCode;
import dq.q;
import java.util.Locale;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.properties.Delegates;
import kotlin.reflect.KProperty;
import mx.o;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import pu.f0;
import tx.g4;
import ww.g;
import ww.s;
import ww.x;
import ww.y;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/view/CountryTextInputLayout;", "Lcom/google/android/material/textfield/TextInputLayout;", "SelectedCountryState", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class CountryTextInputLayout extends TextInputLayout {
    public static final /* synthetic */ KProperty[] I0 = {Reflection.f71864a.mutableProperty1(new MutablePropertyReference1Impl(CountryTextInputLayout.class, "selectedCountryCode", "getSelectedCountryCode$payments_core_release()Lcom/stripe/android/core/model/CountryCode;", 0))};
    public static final int J0 = 2131624414;
    public final int C0;
    public final AutoCompleteTextView D0;
    public final s E0;
    public /* synthetic */ Function1 F0;
    public final /* synthetic */ g4 G0;
    public final g H0;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/view/CountryTextInputLayout$SelectedCountryState;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SelectedCountryState implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<SelectedCountryState> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final CountryCode f45472a;

        /* renamed from: b, reason: collision with root package name */
        public final Parcelable f45473b;

        public SelectedCountryState(CountryCode countryCode, Parcelable parcelable) {
            Intrinsics.g(countryCode, "countryCode");
            this.f45472a = countryCode;
            this.f45473b = parcelable;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SelectedCountryState)) {
                return false;
            }
            SelectedCountryState selectedCountryState = (SelectedCountryState) obj;
            return Intrinsics.b(this.f45472a, selectedCountryState.f45472a) && Intrinsics.b(this.f45473b, selectedCountryState.f45473b);
        }

        public final int hashCode() {
            int iHashCode = this.f45472a.f42575a.hashCode() * 31;
            Parcelable parcelable = this.f45473b;
            return iHashCode + (parcelable == null ? 0 : parcelable.hashCode());
        }

        public final String toString() {
            return "SelectedCountryState(countryCode=" + this.f45472a + ", superState=" + this.f45473b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f45472a, i5);
            dest.writeParcelable(this.f45473b, i5);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public CountryTextInputLayout(@NotNull Context context, @Nullable AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        Intrinsics.g(context, "context");
        int i5 = J0;
        this.C0 = i5;
        int i11 = Delegates.f71888a;
        s sVar = new s(this);
        this.E0 = sVar;
        this.F0 = new g4(26);
        this.G0 = new g4(27);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, q.f49362b, 0, 0);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(1, i5);
        this.C0 = resourceId2;
        typedArrayObtainStyledAttributes.recycle();
        AutoCompleteTextView autoCompleteTextView = resourceId == 0 ? new AutoCompleteTextView(getContext(), null, 2130968704) : new AutoCompleteTextView(getContext(), null, 0, resourceId);
        this.D0 = autoCompleteTextView;
        addView(autoCompleteTextView, new LinearLayout.LayoutParams(-1, -2));
        Set set = cr.e.f47799a;
        g gVar = new g(context, cr.e.b(G()), resourceId2, new f0(24, context, this));
        this.H0 = gVar;
        autoCompleteTextView.setThreshold(0);
        autoCompleteTextView.setAdapter(gVar);
        autoCompleteTextView.setOnItemClickListener(new o(this, 2));
        autoCompleteTextView.setOnFocusChangeListener(new fk.a(this, 3));
        CountryCode countryCode = gVar.a(0).f42572a;
        KProperty[] kPropertyArr = I0;
        sVar.setValue(this, kPropertyArr[0], countryCode);
        Country countryA = gVar.a(0);
        autoCompleteTextView.setText(countryA.f42573b);
        sVar.setValue(this, kPropertyArr[0], countryA.f42572a);
        String string = getResources().getString(2132019631);
        Intrinsics.f(string, "getString(...)");
        autoCompleteTextView.setValidator(new x(gVar, new f0(25, this, string)));
    }

    public static Locale G() {
        w4.g gVar = w4.g.f93750b;
        Locale localeB = w4.g.f(LocaleList.getAdjustedDefault()).b(0);
        Intrinsics.d(localeB);
        return localeB;
    }

    public final void H(CountryCode countryCode) {
        Intrinsics.g(countryCode, "countryCode");
        Set set = cr.e.f47799a;
        Country countryA = cr.e.a(countryCode, G());
        if (countryA != null) {
            I(countryCode);
        } else {
            countryA = cr.e.a((CountryCode) this.E0.getValue(this, I0[0]), G());
        }
        this.D0.setText(countryA != null ? countryA.f42573b : null);
    }

    public final void I(CountryCode countryCode) {
        Intrinsics.g(countryCode, "countryCode");
        m(null);
        n(false);
        KProperty[] kPropertyArr = I0;
        KProperty kProperty = kPropertyArr[0];
        s sVar = this.E0;
        if (Intrinsics.b((CountryCode) sVar.getValue(this, kProperty), countryCode)) {
            return;
        }
        sVar.setValue(this, kPropertyArr[0], countryCode);
    }

    @Override // com.google.android.material.textfield.TextInputLayout, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SelectedCountryState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SelectedCountryState selectedCountryState = (SelectedCountryState) parcelable;
        super.onRestoreInstanceState(selectedCountryState.f45473b);
        CountryCode countryCode = selectedCountryState.f45472a;
        I(countryCode);
        H(countryCode);
        requestLayout();
    }

    @Override // com.google.android.material.textfield.TextInputLayout, android.view.View
    public final Parcelable onSaveInstanceState() {
        Country countryA;
        CountryCode countryCode = (CountryCode) this.E0.getValue(this, I0[0]);
        if (countryCode != null) {
            Set set = cr.e.f47799a;
            countryA = cr.e.a(countryCode, G());
        } else {
            countryA = null;
        }
        return countryA != null ? new SelectedCountryState(countryA.f42572a, super.onSaveInstanceState()) : super.onSaveInstanceState();
    }

    @Override // com.google.android.material.textfield.TextInputLayout, android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        addOnLayoutChangeListener(new y(this, z11));
    }
}
