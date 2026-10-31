package com.stripe.android.view;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.view.View;
import b70.g;
import com.stripe.android.model.AccountRange;
import hq.f;
import hq.h;
import hq.l;
import hq.m;
import hq.r;
import hq.s;
import hq.x;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ps.i0;
import t5.d0;
import t70.g2;
import t70.k0;
import t70.m0;
import t70.y0;
import tx.g4;
import ww.q;
import y70.o;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/view/CardNumberEditText;", "Lcom/stripe/android/view/StripeEditText;", "SavedState", "ww/q", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class CardNumberEditText extends StripeEditText {
    public static final /* synthetic */ int L = 0;
    public /* synthetic */ Function1 A;
    public ft.b B;
    public Function1 C;
    public List D;
    public /* synthetic */ Function1 E;
    public /* synthetic */ Function0 F;
    public boolean G;
    public boolean H;
    public final r I;
    public /* synthetic */ Function1 J;
    public g2 K;

    /* renamed from: v, reason: collision with root package name */
    public final CoroutineContext f45465v;

    /* renamed from: w, reason: collision with root package name */
    public final l f45466w;

    /* renamed from: x, reason: collision with root package name */
    public final fr.l f45467x;

    /* renamed from: y, reason: collision with root package name */
    public final jt.a f45468y;

    /* renamed from: z, reason: collision with root package name */
    public ft.b f45469z;

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/view/CardNumberEditText$SavedState;", "Landroid/view/View$BaseSavedState;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SavedState extends View.BaseSavedState implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<SavedState> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final Parcelable f45470a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f45471b;

        public SavedState(Parcelable parcelable, boolean z11) {
            super(parcelable);
            this.f45470a = parcelable;
            this.f45471b = z11;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SavedState)) {
                return false;
            }
            SavedState savedState = (SavedState) obj;
            return Intrinsics.b(this.f45470a, savedState.f45470a) && this.f45471b == savedState.f45471b;
        }

        public final int hashCode() {
            Parcelable parcelable = this.f45470a;
            return Boolean.hashCode(this.f45471b) + ((parcelable == null ? 0 : parcelable.hashCode()) * 31);
        }

        public final String toString() {
            return "SavedState(superSavedState=" + this.f45470a + ", isCbcEligible=" + this.f45471b + ")";
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f45470a, i5);
            dest.writeInt(this.f45471b ? 1 : 0);
        }
    }

    @JvmOverloads
    public CardNumberEditText(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        Intrinsics.g(context, "context");
        a80.e eVar = y0.f88884a;
        u70.d uiContext = o.f96819a;
        a80.d workContext = a80.d.f488c;
        n00.d dVar = new n00.d(context, 21);
        l cardAccountRangeRepository = (l) new m(context, EmptySet.f71734a).f59988e.getValue();
        s sVar = new s();
        fr.l lVar = new fr.l();
        jt.a aVar = new jt.a(context, new wm.b(dVar, 1));
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(cardAccountRangeRepository, "cardAccountRangeRepository");
        super(context, attributeSet, 2130969140);
        this.f45465v = workContext;
        this.f45466w = cardAccountRangeRepository;
        this.f45467x = lVar;
        this.f45468y = aVar;
        ft.b bVar = ft.b.f55894x;
        this.f45469z = bVar;
        this.A = new g4(22);
        this.B = bVar;
        this.C = new g4(23);
        this.D = EmptyList.f71733a;
        int i5 = 24;
        this.E = new g4(i5);
        this.F = new ww.e(1);
        this.I = new r(cardAccountRangeRepository, uiContext, workContext, sVar, null, null, new d0(this, i5), null, 176);
        this.J = new g4(25);
        e();
        this.f45511q = getResources().getString(2132019811);
        addTextChangedListener(new q(this));
        this.f45513s.add(new fk.a(this, 2));
        setAutofillHints("creditCardNumber");
        j(this);
        setLayoutDirection(0);
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.Map] */
    public static void j(CardNumberEditText cardNumberEditText) {
        int iH = cardNumberEditText.h();
        Set set = h.f59970a;
        Set set2 = (Set) h.f59971b.get(Integer.valueOf(cardNumberEditText.h()));
        if (set2 == null) {
            set2 = h.f59970a;
        }
        int size = set2.size() + iH;
        cardNumberEditText.getClass();
        cardNumberEditText.setFilters(new InputFilter[]{new InputFilter.LengthFilter(size)});
    }

    @Override // com.stripe.android.view.StripeEditText
    public final String c() throws Resources.NotFoundException {
        String string = getResources().getString(2132019620, getText());
        Intrinsics.f(string, "getString(...)");
        return string;
    }

    public final int h() {
        r rVar = this.I;
        AccountRange accountRangeA = rVar.a();
        if (accountRangeA != null) {
            return accountRangeA.f43123b;
        }
        x xVar = rVar.f60001d;
        f fVarI = i();
        s sVar = (s) xVar;
        sVar.getClass();
        AccountRange accountRange = (AccountRange) g.Y0(sVar.a(fVarI));
        if (accountRange != null) {
            return accountRange.f43123b;
        }
        return 16;
    }

    public final f i() {
        return new f(d());
    }

    @Override // com.google.android.material.textfield.TextInputEditText, android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.K = m0.t(k0.a(this.f45465v), null, null, new u6.a(this, null, 5), 3);
        i0.j(this, new ux.s(this, 6));
    }

    @Override // r.q, android.view.View
    public final void onDetachedFromWindow() {
        g2 g2Var = this.K;
        if (g2Var != null) {
            g2Var.c(null);
        }
        this.K = null;
        r rVar = this.I;
        g2 g2Var2 = rVar.o;
        if (g2Var2 != null) {
            g2Var2.c(null);
        }
        rVar.o = null;
        super.onDetachedFromWindow();
    }

    @Override // com.stripe.android.view.StripeEditText, android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        Parcelable superState;
        SavedState savedState = parcelable instanceof SavedState ? (SavedState) parcelable : null;
        this.H = savedState != null ? savedState.f45471b : false;
        if (savedState != null && (superState = savedState.getSuperState()) != null) {
            parcelable = superState;
        }
        super.onRestoreInstanceState(parcelable);
    }

    @Override // com.stripe.android.view.StripeEditText, android.widget.TextView, android.view.View
    public final Parcelable onSaveInstanceState() {
        return new SavedState(super.onSaveInstanceState(), this.H);
    }
}
