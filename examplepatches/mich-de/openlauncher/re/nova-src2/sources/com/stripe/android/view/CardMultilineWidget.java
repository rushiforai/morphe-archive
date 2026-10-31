package com.stripe.android.view;

import ab.e0;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.google.android.material.textfield.TextInputLayout;
import com.stripe.android.view.CardBrandView;
import com.stripe.android.view.CardMultilineWidget;
import com.stripe.android.view.CardNumberEditText;
import com.stripe.android.view.CardNumberTextInputLayout;
import dq.q;
import e00.x2;
import h6.c1;
import h6.s;
import h6.y0;
import hq.j;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.properties.Delegates;
import kotlin.reflect.KProperty;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ps.i0;
import t5.d0;
import w70.i2;
import ww.a0;
import ww.c0;
import ww.m;
import ww.m0;
import ww.o;
import ww.p;
import ww.z;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/view/CardMultilineWidget;", "Landroid/widget/LinearLayout;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class CardMultilineWidget extends LinearLayout {

    /* renamed from: u, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f45446u;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f45447a;

    /* renamed from: b, reason: collision with root package name */
    public final CardNumberEditText f45448b;

    /* renamed from: c, reason: collision with root package name */
    public final CardBrandView f45449c;

    /* renamed from: d, reason: collision with root package name */
    public final ExpiryDateEditText f45450d;

    /* renamed from: e, reason: collision with root package name */
    public final CvcEditText f45451e;

    /* renamed from: f, reason: collision with root package name */
    public final PostalCodeEditText f45452f;

    /* renamed from: g, reason: collision with root package name */
    public final CardNumberTextInputLayout f45453g;

    /* renamed from: h, reason: collision with root package name */
    public final TextInputLayout f45454h;

    /* renamed from: i, reason: collision with root package name */
    public final TextInputLayout f45455i;

    /* renamed from: j, reason: collision with root package name */
    public final TextInputLayout f45456j;

    /* renamed from: k, reason: collision with root package name */
    public final c0 f45457k;

    /* renamed from: l, reason: collision with root package name */
    public final List f45458l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f45459m;
    public final boolean n;
    public final p o;

    /* renamed from: p, reason: collision with root package name */
    public String f45460p;

    /* renamed from: q, reason: collision with root package name */
    public final p f45461q;

    /* renamed from: r, reason: collision with root package name */
    public final p f45462r;

    /* renamed from: s, reason: collision with root package name */
    public final p f45463s;

    /* renamed from: t, reason: collision with root package name */
    public final p f45464t;

    static {
        MutablePropertyReference1Impl mutablePropertyReference1Impl = new MutablePropertyReference1Impl(CardMultilineWidget.class, "usZipCodeRequired", "getUsZipCodeRequired()Z", 0);
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        f45446u = new KProperty[]{reflectionFactory.mutableProperty1(mutablePropertyReference1Impl), c1.v(CardMultilineWidget.class, "expirationDatePlaceholderRes", "getExpirationDatePlaceholderRes$payments_core_release()Ljava/lang/Integer;", 0, reflectionFactory), c1.v(CardMultilineWidget.class, "cardNumberErrorListener", "getCardNumberErrorListener$payments_core_release()Lcom/stripe/android/view/StripeEditText$ErrorMessageListener;", 0, reflectionFactory), c1.v(CardMultilineWidget.class, "expirationDateErrorListener", "getExpirationDateErrorListener$payments_core_release()Lcom/stripe/android/view/StripeEditText$ErrorMessageListener;", 0, reflectionFactory), c1.v(CardMultilineWidget.class, "cvcErrorListener", "getCvcErrorListener$payments_core_release()Lcom/stripe/android/view/StripeEditText$ErrorMessageListener;", 0, reflectionFactory), c1.v(CardMultilineWidget.class, "postalCodeErrorListener", "getPostalCodeErrorListener$payments_core_release()Lcom/stripe/android/view/StripeEditText$ErrorMessageListener;", 0, reflectionFactory)};
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public CardMultilineWidget(@NotNull Context context, @Nullable AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        Intrinsics.g(context, "context");
        final int i5 = 0;
        final int i11 = 1;
        this.f45447a = true;
        LayoutInflater.from(context).inflate(2131624403, this);
        int i12 = 2131427631;
        CardBrandView cardBrandView = (CardBrandView) e0.x(2131427631, this);
        if (cardBrandView != null) {
            i12 = 2131427637;
            if (((FrameLayout) e0.x(2131427637, this)) != null) {
                i12 = 2131427971;
                CardNumberEditText cardNumberEditText = (CardNumberEditText) e0.x(2131427971, this);
                if (cardNumberEditText != null) {
                    i12 = 2131427973;
                    CvcEditText cvcEditText = (CvcEditText) e0.x(2131427973, this);
                    if (cvcEditText != null) {
                        i12 = 2131427974;
                        ExpiryDateEditText expiryDateEditText = (ExpiryDateEditText) e0.x(2131427974, this);
                        if (expiryDateEditText != null) {
                            PostalCodeEditText postalCodeEditText = (PostalCodeEditText) e0.x(2131427977, this);
                            if (postalCodeEditText != null) {
                                int i13 = 2131428787;
                                if (((LinearLayout) e0.x(2131428787, this)) != null) {
                                    i13 = 2131429040;
                                    CardNumberTextInputLayout cardNumberTextInputLayout = (CardNumberTextInputLayout) e0.x(2131429040, this);
                                    if (cardNumberTextInputLayout != null) {
                                        i13 = 2131429042;
                                        TextInputLayout textInputLayout = (TextInputLayout) e0.x(2131429042, this);
                                        if (textInputLayout != null) {
                                            i13 = 2131429043;
                                            TextInputLayout textInputLayout2 = (TextInputLayout) e0.x(2131429043, this);
                                            if (textInputLayout2 != null) {
                                                i13 = 2131429046;
                                                TextInputLayout textInputLayout3 = (TextInputLayout) e0.x(2131429046, this);
                                                if (textInputLayout3 != null) {
                                                    this.f45448b = cardNumberEditText;
                                                    this.f45449c = cardBrandView;
                                                    this.f45450d = expiryDateEditText;
                                                    this.f45451e = cvcEditText;
                                                    this.f45452f = postalCodeEditText;
                                                    this.f45453g = cardNumberTextInputLayout;
                                                    this.f45454h = textInputLayout2;
                                                    this.f45455i = textInputLayout;
                                                    this.f45456j = textInputLayout3;
                                                    this.f45457k = new c0();
                                                    final int i14 = 2;
                                                    final int i15 = 3;
                                                    List<TextInputLayout> listQ = ul.b.Q(cardNumberTextInputLayout, textInputLayout2, textInputLayout, textInputLayout3);
                                                    this.f45458l = listQ;
                                                    int i16 = Delegates.f71888a;
                                                    this.o = new p(this);
                                                    this.f45461q = new p(new a0(cardNumberTextInputLayout), this, i11);
                                                    this.f45462r = new p(new a0(textInputLayout2), this, i14);
                                                    this.f45463s = new p(new a0(textInputLayout), this, i15);
                                                    this.f45464t = new p(new a0(textInputLayout3), this, 4);
                                                    setOrientation(1);
                                                    for (TextInputLayout textInputLayout4 : listQ) {
                                                        EditText editText = textInputLayout4.f34369d;
                                                        textInputLayout4.r(editText != null ? editText.getHintTextColors() : null);
                                                    }
                                                    Context context2 = getContext();
                                                    Intrinsics.f(context2, "getContext(...)");
                                                    TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, q.f49361a, 0, 0);
                                                    this.f45447a = typedArrayObtainStyledAttributes.getBoolean(2, this.f45447a);
                                                    this.n = typedArrayObtainStyledAttributes.getBoolean(0, this.n);
                                                    p pVar = this.o;
                                                    KProperty[] kPropertyArr = f45446u;
                                                    this.o.setValue(this, kPropertyArr[0], Boolean.valueOf(typedArrayObtainStyledAttributes.getBoolean(1, ((Boolean) pVar.getValue(this, kPropertyArr[0])).booleanValue())));
                                                    typedArrayObtainStyledAttributes.recycle();
                                                    this.f45448b.f45512r = (a0) this.f45461q.getValue(this, kPropertyArr[2]);
                                                    this.f45450d.f45512r = (a0) this.f45462r.getValue(this, kPropertyArr[3]);
                                                    this.f45451e.f45512r = (a0) this.f45463s.getValue(this, kPropertyArr[4]);
                                                    this.f45452f.f45512r = (a0) this.f45464t.getValue(this, kPropertyArr[5]);
                                                    this.f45448b.f45513s.add(new View.OnFocusChangeListener() { // from class: ww.k
                                                        @Override // android.view.View.OnFocusChangeListener
                                                        public final void onFocusChange(View view, boolean z11) {
                                                            int i17 = i5;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 1:
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 2:
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    if (!z11) {
                                                                        cardBrandView2.f();
                                                                        break;
                                                                    } else {
                                                                        KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                        if (!cardBrandView2.c().f45440c.c(cardMultilineWidget.f45451e.d())) {
                                                                            cardBrandView2.f();
                                                                            break;
                                                                        }
                                                                    }
                                                                    break;
                                                                default:
                                                                    boolean z12 = cardMultilineWidget.f45447a;
                                                                    break;
                                                            }
                                                        }
                                                    });
                                                    this.f45450d.f45513s.add(new View.OnFocusChangeListener() { // from class: ww.k
                                                        @Override // android.view.View.OnFocusChangeListener
                                                        public final void onFocusChange(View view, boolean z11) {
                                                            int i17 = i11;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 1:
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 2:
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    if (!z11) {
                                                                        cardBrandView2.f();
                                                                        break;
                                                                    } else {
                                                                        KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                        if (!cardBrandView2.c().f45440c.c(cardMultilineWidget.f45451e.d())) {
                                                                            cardBrandView2.f();
                                                                            break;
                                                                        }
                                                                    }
                                                                    break;
                                                                default:
                                                                    boolean z12 = cardMultilineWidget.f45447a;
                                                                    break;
                                                            }
                                                        }
                                                    });
                                                    this.f45451e.f45513s.add(new View.OnFocusChangeListener() { // from class: ww.k
                                                        @Override // android.view.View.OnFocusChangeListener
                                                        public final void onFocusChange(View view, boolean z11) {
                                                            int i17 = i14;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 1:
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 2:
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    if (!z11) {
                                                                        cardBrandView2.f();
                                                                        break;
                                                                    } else {
                                                                        KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                        if (!cardBrandView2.c().f45440c.c(cardMultilineWidget.f45451e.d())) {
                                                                            cardBrandView2.f();
                                                                            break;
                                                                        }
                                                                    }
                                                                    break;
                                                                default:
                                                                    boolean z12 = cardMultilineWidget.f45447a;
                                                                    break;
                                                            }
                                                        }
                                                    });
                                                    this.f45452f.f45513s.add(new View.OnFocusChangeListener() { // from class: ww.k
                                                        @Override // android.view.View.OnFocusChangeListener
                                                        public final void onFocusChange(View view, boolean z11) {
                                                            int i17 = i15;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 1:
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    if (z11) {
                                                                        cardMultilineWidget.getClass();
                                                                        break;
                                                                    }
                                                                    break;
                                                                case 2:
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    if (!z11) {
                                                                        cardBrandView2.f();
                                                                        break;
                                                                    } else {
                                                                        KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                        if (!cardBrandView2.c().f45440c.c(cardMultilineWidget.f45451e.d())) {
                                                                            cardBrandView2.f();
                                                                            break;
                                                                        }
                                                                    }
                                                                    break;
                                                                default:
                                                                    boolean z12 = cardMultilineWidget.f45447a;
                                                                    break;
                                                            }
                                                        }
                                                    });
                                                    ExpiryDateEditText expiryDateEditText2 = this.f45450d;
                                                    expiryDateEditText2.f45507k = new d0(this.f45448b);
                                                    CvcEditText cvcEditText2 = this.f45451e;
                                                    cvcEditText2.f45507k = new d0(expiryDateEditText2);
                                                    this.f45452f.f45507k = new d0(cvcEditText2);
                                                    CardNumberEditText cardNumberEditText2 = this.f45448b;
                                                    Function0 function0 = new Function0() { // from class: ww.i
                                                        @Override // kotlin.jvm.functions.Function0
                                                        public final Object invoke() {
                                                            int i17 = i5;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    cardMultilineWidget.post(new j(2, cardMultilineWidget));
                                                                    break;
                                                                default:
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    cardMultilineWidget.post(new j(0, cardMultilineWidget));
                                                                    break;
                                                            }
                                                            return Unit.f71706a;
                                                        }
                                                    };
                                                    cardNumberEditText2.getClass();
                                                    cardNumberEditText2.F = function0;
                                                    CardNumberEditText cardNumberEditText3 = this.f45448b;
                                                    Function1 function1 = new Function1() { // from class: ww.l
                                                        @Override // kotlin.jvm.functions.Function1
                                                        public final Object invoke(Object obj) {
                                                            Object value;
                                                            int i17 = i5;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    ft.b brand = (ft.b) obj;
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand, "brand");
                                                                    cardMultilineWidget.f45449c.d(brand);
                                                                    cardMultilineWidget.a();
                                                                    break;
                                                                case 1:
                                                                    ft.b brand2 = (ft.b) obj;
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand2, "brand");
                                                                    cardMultilineWidget.b(brand2);
                                                                    break;
                                                                case 2:
                                                                    List brands = (List) obj;
                                                                    KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brands, "brands");
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    ft.b bVar = cardBrandView2.c().f45440c;
                                                                    cardBrandView2.getClass();
                                                                    i2 i2Var = cardBrandView2.f45435d;
                                                                    do {
                                                                        value = i2Var.getValue();
                                                                    } while (!i2Var.i(value, CardBrandView.State.a((CardBrandView.State) value, false, null, null, brands, 239)));
                                                                    cardBrandView2.b();
                                                                    cardBrandView2.g(true);
                                                                    if (!brands.contains(bVar)) {
                                                                        cardBrandView2.d(ft.b.f55894x);
                                                                    }
                                                                    ft.b bVar2 = (ft.b) b70.g.Y0(brands);
                                                                    if (bVar2 == null) {
                                                                        bVar2 = ft.b.f55894x;
                                                                    }
                                                                    cardMultilineWidget.b(bVar2);
                                                                    break;
                                                                default:
                                                                    Boolean bool = (Boolean) obj;
                                                                    bool.getClass();
                                                                    CardNumberTextInputLayout cardNumberTextInputLayout2 = cardMultilineWidget.f45453g;
                                                                    cardNumberTextInputLayout2.D0.setValue(cardNumberTextInputLayout2, CardNumberTextInputLayout.E0[0], bool);
                                                                    break;
                                                            }
                                                            return Unit.f71706a;
                                                        }
                                                    };
                                                    cardNumberEditText3.getClass();
                                                    cardNumberEditText3.A = function1;
                                                    function1.invoke(cardNumberEditText3.f45469z);
                                                    CardNumberEditText cardNumberEditText4 = this.f45448b;
                                                    Function1 function12 = new Function1() { // from class: ww.l
                                                        @Override // kotlin.jvm.functions.Function1
                                                        public final Object invoke(Object obj) {
                                                            Object value;
                                                            int i17 = i11;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    ft.b brand = (ft.b) obj;
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand, "brand");
                                                                    cardMultilineWidget.f45449c.d(brand);
                                                                    cardMultilineWidget.a();
                                                                    break;
                                                                case 1:
                                                                    ft.b brand2 = (ft.b) obj;
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand2, "brand");
                                                                    cardMultilineWidget.b(brand2);
                                                                    break;
                                                                case 2:
                                                                    List brands = (List) obj;
                                                                    KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brands, "brands");
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    ft.b bVar = cardBrandView2.c().f45440c;
                                                                    cardBrandView2.getClass();
                                                                    i2 i2Var = cardBrandView2.f45435d;
                                                                    do {
                                                                        value = i2Var.getValue();
                                                                    } while (!i2Var.i(value, CardBrandView.State.a((CardBrandView.State) value, false, null, null, brands, 239)));
                                                                    cardBrandView2.b();
                                                                    cardBrandView2.g(true);
                                                                    if (!brands.contains(bVar)) {
                                                                        cardBrandView2.d(ft.b.f55894x);
                                                                    }
                                                                    ft.b bVar2 = (ft.b) b70.g.Y0(brands);
                                                                    if (bVar2 == null) {
                                                                        bVar2 = ft.b.f55894x;
                                                                    }
                                                                    cardMultilineWidget.b(bVar2);
                                                                    break;
                                                                default:
                                                                    Boolean bool = (Boolean) obj;
                                                                    bool.getClass();
                                                                    CardNumberTextInputLayout cardNumberTextInputLayout2 = cardMultilineWidget.f45453g;
                                                                    cardNumberTextInputLayout2.D0.setValue(cardNumberTextInputLayout2, CardNumberTextInputLayout.E0[0], bool);
                                                                    break;
                                                            }
                                                            return Unit.f71706a;
                                                        }
                                                    };
                                                    cardNumberEditText4.getClass();
                                                    cardNumberEditText4.C = function12;
                                                    function12.invoke(cardNumberEditText4.B);
                                                    CardNumberEditText cardNumberEditText5 = this.f45448b;
                                                    Function1 function13 = new Function1() { // from class: ww.l
                                                        @Override // kotlin.jvm.functions.Function1
                                                        public final Object invoke(Object obj) {
                                                            Object value;
                                                            int i17 = i14;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    ft.b brand = (ft.b) obj;
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand, "brand");
                                                                    cardMultilineWidget.f45449c.d(brand);
                                                                    cardMultilineWidget.a();
                                                                    break;
                                                                case 1:
                                                                    ft.b brand2 = (ft.b) obj;
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand2, "brand");
                                                                    cardMultilineWidget.b(brand2);
                                                                    break;
                                                                case 2:
                                                                    List brands = (List) obj;
                                                                    KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brands, "brands");
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    ft.b bVar = cardBrandView2.c().f45440c;
                                                                    cardBrandView2.getClass();
                                                                    i2 i2Var = cardBrandView2.f45435d;
                                                                    do {
                                                                        value = i2Var.getValue();
                                                                    } while (!i2Var.i(value, CardBrandView.State.a((CardBrandView.State) value, false, null, null, brands, 239)));
                                                                    cardBrandView2.b();
                                                                    cardBrandView2.g(true);
                                                                    if (!brands.contains(bVar)) {
                                                                        cardBrandView2.d(ft.b.f55894x);
                                                                    }
                                                                    ft.b bVar2 = (ft.b) b70.g.Y0(brands);
                                                                    if (bVar2 == null) {
                                                                        bVar2 = ft.b.f55894x;
                                                                    }
                                                                    cardMultilineWidget.b(bVar2);
                                                                    break;
                                                                default:
                                                                    Boolean bool = (Boolean) obj;
                                                                    bool.getClass();
                                                                    CardNumberTextInputLayout cardNumberTextInputLayout2 = cardMultilineWidget.f45453g;
                                                                    cardNumberTextInputLayout2.D0.setValue(cardNumberTextInputLayout2, CardNumberTextInputLayout.E0[0], bool);
                                                                    break;
                                                            }
                                                            return Unit.f71706a;
                                                        }
                                                    };
                                                    cardNumberEditText5.getClass();
                                                    cardNumberEditText5.E = function13;
                                                    function13.invoke(cardNumberEditText5.D);
                                                    ExpiryDateEditText expiryDateEditText3 = this.f45450d;
                                                    Function0 function02 = new Function0() { // from class: ww.i
                                                        @Override // kotlin.jvm.functions.Function0
                                                        public final Object invoke() {
                                                            int i17 = i11;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i17) {
                                                                case 0:
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    cardMultilineWidget.post(new j(2, cardMultilineWidget));
                                                                    break;
                                                                default:
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    cardMultilineWidget.post(new j(0, cardMultilineWidget));
                                                                    break;
                                                            }
                                                            return Unit.f71706a;
                                                        }
                                                    };
                                                    expiryDateEditText3.getClass();
                                                    expiryDateEditText3.f45478v = function02;
                                                    CvcEditText cvcEditText3 = this.f45451e;
                                                    cvcEditText3.f45506j = new m(0, this);
                                                    this.f45452f.f45506j = new m(1, this);
                                                    boolean z11 = this.f45447a;
                                                    this.f45454h.p(getResources().getString(z11 ? 2132019780 : 2132019622));
                                                    i12 = z11 ? 2131427977 : -1;
                                                    cvcEditText3.setNextFocusForwardId(i12);
                                                    cvcEditText3.setNextFocusDownId(i12);
                                                    int i17 = z11 ? 0 : 8;
                                                    this.f45456j.setVisibility(i17);
                                                    cvcEditText3.setImeOptions(i17 == 8 ? 6 : 5);
                                                    TextInputLayout textInputLayout5 = this.f45455i;
                                                    ViewGroup.LayoutParams layoutParams = textInputLayout5.getLayoutParams();
                                                    if (layoutParams == null) {
                                                        throw new NullPointerException("null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams");
                                                    }
                                                    LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) layoutParams;
                                                    layoutParams2.setMarginEnd(z11 ? getResources().getDimensionPixelSize(2131166422) : 0);
                                                    textInputLayout5.setLayoutParams(layoutParams2);
                                                    CardNumberEditText.j(this.f45448b);
                                                    a();
                                                    Iterator it = kotlin.collections.c.f1(new StripeEditText[]{this.f45448b, this.f45450d, this.f45451e, this.f45452f}).iterator();
                                                    while (it.hasNext()) {
                                                        ((StripeEditText) it.next()).addTextChangedListener(new o());
                                                    }
                                                    CardNumberEditText cardNumberEditText6 = this.f45448b;
                                                    Function1 function14 = new Function1() { // from class: ww.l
                                                        @Override // kotlin.jvm.functions.Function1
                                                        public final Object invoke(Object obj) {
                                                            Object value;
                                                            int i172 = i15;
                                                            CardMultilineWidget cardMultilineWidget = this;
                                                            switch (i172) {
                                                                case 0:
                                                                    ft.b brand = (ft.b) obj;
                                                                    KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand, "brand");
                                                                    cardMultilineWidget.f45449c.d(brand);
                                                                    cardMultilineWidget.a();
                                                                    break;
                                                                case 1:
                                                                    ft.b brand2 = (ft.b) obj;
                                                                    KProperty[] kPropertyArr3 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brand2, "brand");
                                                                    cardMultilineWidget.b(brand2);
                                                                    break;
                                                                case 2:
                                                                    List brands = (List) obj;
                                                                    KProperty[] kPropertyArr4 = CardMultilineWidget.f45446u;
                                                                    Intrinsics.g(brands, "brands");
                                                                    CardBrandView cardBrandView2 = cardMultilineWidget.f45449c;
                                                                    ft.b bVar = cardBrandView2.c().f45440c;
                                                                    cardBrandView2.getClass();
                                                                    i2 i2Var = cardBrandView2.f45435d;
                                                                    do {
                                                                        value = i2Var.getValue();
                                                                    } while (!i2Var.i(value, CardBrandView.State.a((CardBrandView.State) value, false, null, null, brands, 239)));
                                                                    cardBrandView2.b();
                                                                    cardBrandView2.g(true);
                                                                    if (!brands.contains(bVar)) {
                                                                        cardBrandView2.d(ft.b.f55894x);
                                                                    }
                                                                    ft.b bVar2 = (ft.b) b70.g.Y0(brands);
                                                                    if (bVar2 == null) {
                                                                        bVar2 = ft.b.f55894x;
                                                                    }
                                                                    cardMultilineWidget.b(bVar2);
                                                                    break;
                                                                default:
                                                                    Boolean bool = (Boolean) obj;
                                                                    bool.getClass();
                                                                    CardNumberTextInputLayout cardNumberTextInputLayout2 = cardMultilineWidget.f45453g;
                                                                    cardNumberTextInputLayout2.D0.setValue(cardNumberTextInputLayout2, CardNumberTextInputLayout.E0[0], bool);
                                                                    break;
                                                            }
                                                            return Unit.f71706a;
                                                        }
                                                    };
                                                    cardNumberEditText6.getClass();
                                                    cardNumberEditText6.J = function14;
                                                    PostalCodeEditText postalCodeEditText2 = this.f45452f;
                                                    postalCodeEditText2.f45493v.setValue(postalCodeEditText2, PostalCodeEditText.f45491w[0], m0.f94813a);
                                                    this.f45459m = true;
                                                    final int dimensionPixelSize = getResources().getDimensionPixelSize(2131166439);
                                                    this.f45449c.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: ww.n
                                                        @Override // android.view.View.OnLayoutChangeListener
                                                        public final void onLayoutChange(View view, int i18, int i19, int i21, int i22, int i23, int i24, int i25, int i26) {
                                                            KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                                                            int width = view.getWidth() + dimensionPixelSize;
                                                            CardNumberEditText cardNumberEditText7 = this.f45448b;
                                                            cardNumberEditText7.setPadding(cardNumberEditText7.getPaddingLeft(), cardNumberEditText7.getPaddingTop(), width, cardNumberEditText7.getPaddingBottom());
                                                        }
                                                    });
                                                    return;
                                                }
                                            }
                                        }
                                    }
                                }
                                i12 = i13;
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(getResources().getResourceName(i12)));
    }

    public final void a() {
        CardBrandView cardBrandView = this.f45449c;
        b(cardBrandView.c().f45440c);
        cardBrandView.f();
    }

    public final void b(ft.b cardBrand) throws Resources.NotFoundException {
        CvcEditText cvcEditText = this.f45451e;
        cvcEditText.getClass();
        Intrinsics.g(cardBrand, "cardBrand");
        cvcEditText.f45475v = cardBrand;
        cvcEditText.setFilters(new InputFilter[]{new InputFilter.LengthFilter(cardBrand.a())});
        String string = cardBrand == ft.b.f55887q ? cvcEditText.getResources().getString(2132019760) : cvcEditText.getResources().getString(2132019763);
        Intrinsics.d(string);
        String strD = cvcEditText.d();
        StringBuilder sb2 = new StringBuilder();
        int length = strD.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = strD.charAt(i5);
            if (Character.isDigit(cCharAt)) {
                sb2.append(cCharAt);
            }
        }
        if (sb2.toString().length() > 0) {
            String strD2 = cvcEditText.d();
            StringBuilder sb3 = new StringBuilder();
            int length2 = strD2.length();
            for (int i11 = 0; i11 < length2; i11++) {
                char cCharAt2 = strD2.charAt(i11);
                if (Character.isDigit(cCharAt2)) {
                    sb3.append(cCharAt2);
                }
            }
            String string2 = sb3.toString();
            cvcEditText.f((kotlin.collections.c.f1(new Integer[]{3, Integer.valueOf(cardBrand.a())}).contains(Integer.valueOf(string2.length())) ? new j(string2) : null) == null);
        }
        TextInputLayout textInputLayout = this.f45455i;
        if (textInputLayout == null) {
            cvcEditText.setHint(string);
            return;
        }
        textInputLayout.p(string);
        String string3 = cvcEditText.getResources().getString(z.f94863a[cardBrand.ordinal()] == 1 ? 2132019762 : 2132019761);
        Intrinsics.f(string3, "getString(...)");
        textInputLayout.q(string3);
    }

    @Override // android.view.View
    public final boolean isEnabled() {
        return this.f45459m;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f45451e.setHint((CharSequence) null);
        c0 c0Var = this.f45457k;
        h6.c0 c0Var2 = c0Var.f94757a;
        if (y0.c(this) == null) {
            c0Var.f94759c.a(null);
            c0Var2.f(s.ON_CREATE);
            y0.b(c0Var);
            y0.f(this, c0Var);
            y0.g(this, c0Var);
            u90.b.a0(this, c0Var);
            c0Var2.f(s.ON_RESUME);
            Unit unit = Unit.f71706a;
        }
        i0.j(this, new ux.s(this, 5));
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        c0 c0Var = this.f45457k;
        h6.c0 c0Var2 = c0Var.f94757a;
        if (y0.c(this) == null) {
            c0Var2.f(s.ON_PAUSE);
            c0Var2.f(s.ON_DESTROY);
            c0Var.f94758b.a();
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable state) {
        Intrinsics.g(state, "state");
        if (!(state instanceof Bundle)) {
            super.onRestoreInstanceState(state);
            return;
        }
        Bundle bundle = (Bundle) state;
        String string = bundle.getString("state_on_behalf_of");
        if (!Intrinsics.b(this.f45460p, string)) {
            if (isAttachedToWindow()) {
                i0.j(this, new x2(string, 17, (byte) 0));
            }
            this.f45460p = string;
        }
        super.onRestoreInstanceState(bundle.getParcelable("state_remaining_state"));
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        super.onSaveInstanceState();
        return w.b.a(new Pair("state_remaining_state", super.onSaveInstanceState()), new Pair("state_on_behalf_of", this.f45460p));
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            a();
        }
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        Iterator it = this.f45458l.iterator();
        while (it.hasNext()) {
            ((TextInputLayout) it.next()).setEnabled(z11);
        }
        this.f45459m = z11;
    }
}
