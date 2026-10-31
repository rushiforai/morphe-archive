package com.stripe.android.view;

import ab.e0;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListPopupWindow;
import androidx.transition.TransitionManager;
import b.c9;
import b.u4;
import b70.g;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import mx.o;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import uf.p;
import w70.i2;
import w70.u1;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/view/CardBrandView;", "Landroid/widget/FrameLayout;", "State", "SavedState", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class CardBrandView extends FrameLayout {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ int f45431e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final ImageView f45432a;

    /* renamed from: b, reason: collision with root package name */
    public final ImageView f45433b;

    /* renamed from: c, reason: collision with root package name */
    public final ListPopupWindow f45434c;

    /* renamed from: d, reason: collision with root package name */
    public final i2 f45435d;

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/view/CardBrandView$SavedState;", "Landroid/view/View$BaseSavedState;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SavedState extends View.BaseSavedState implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final Parcelable f45436a;

        /* renamed from: b, reason: collision with root package name */
        public final State f45437b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SavedState(Parcelable parcelable, State state) {
            super(parcelable);
            Intrinsics.g(state, "state");
            this.f45436a = parcelable;
            this.f45437b = state;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SavedState)) {
                return false;
            }
            SavedState savedState = (SavedState) obj;
            return Intrinsics.b(this.f45436a, savedState.f45436a) && Intrinsics.b(this.f45437b, savedState.f45437b);
        }

        public final int hashCode() {
            Parcelable parcelable = this.f45436a;
            return this.f45437b.hashCode() + ((parcelable == null ? 0 : parcelable.hashCode()) * 31);
        }

        public final String toString() {
            return "SavedState(superSavedState=" + this.f45436a + ", state=" + this.f45437b + ")";
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f45436a, i5);
            this.f45437b.writeToParcel(dest, i5);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public CardBrandView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        Intrinsics.g(context, "context");
        LayoutInflater.from(context).inflate(2131624400, this);
        int i5 = 2131427669;
        ImageView imageView = (ImageView) e0.x(2131427669, this);
        if (imageView != null) {
            i5 = 2131428202;
            ImageView imageView2 = (ImageView) e0.x(2131428202, this);
            if (imageView2 != null) {
                this.f45432a = imageView2;
                this.f45433b = imageView;
                this.f45434c = new ListPopupWindow(context);
                this.f45435d = u1.c(new State());
                setClickable(false);
                setFocusable(false);
                b();
                g(false);
                return;
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(getResources().getResourceName(i5)));
    }

    public static void a(ViewGroup viewGroup) {
        if (viewGroup != null) {
            TransitionManager.endTransitions(viewGroup);
            TransitionManager.beginDelayedTransition(viewGroup);
        }
    }

    public final void b() {
        ft.b bVar;
        if (c().f45442e.size() > 1) {
            bVar = c().f45441d;
            List possibleBrands = c().f45442e;
            List merchantPreferredBrands = c().f45443f;
            Intrinsics.g(possibleBrands, "possibleBrands");
            Intrinsics.g(merchantPreferredBrands, "merchantPreferredBrands");
            Object obj = null;
            if (bVar != ft.b.f55894x && !g.O0(possibleBrands, bVar)) {
                bVar = null;
            }
            Iterator it = merchantPreferredBrands.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Object next = it.next();
                if (possibleBrands.contains((ft.b) next)) {
                    obj = next;
                    break;
                }
            }
            ft.b bVar2 = (ft.b) obj;
            if (bVar == null) {
                bVar = bVar2 == null ? ft.b.f55894x : bVar2;
            }
        } else {
            bVar = c().f45440c;
        }
        if (c().f45440c != bVar) {
            d(bVar);
        }
        e();
    }

    public final State c() {
        return (State) this.f45435d.getValue();
    }

    public final void d(ft.b value) {
        Intrinsics.g(value, "value");
        while (true) {
            i2 i2Var = this.f45435d;
            Object value2 = i2Var.getValue();
            ft.b bVar = value;
            if (i2Var.i(value2, State.a((State) value2, false, bVar, null, null, 251))) {
                b();
                g(true);
                return;
            }
            value = bVar;
        }
    }

    public final void e() {
        this.f45432a.setImageResource(c().f45445h ? c().f45440c.f55901e : c().f45444g ? c().f45440c.f55900d : c().f45440c.f55899c);
    }

    public final void f() {
        i2 i2Var;
        Object value;
        do {
            i2Var = this.f45435d;
            value = i2Var.getValue();
        } while (!i2Var.i(value, State.a((State) value, false, null, null, null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE)));
        e();
    }

    public final void g(boolean z11) {
        boolean z12 = c().f45438a && c().f45442e.size() > 1 && !c().f45444g && !c().f45445h;
        ViewParent parent = getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        ImageView imageView = this.f45433b;
        if (!z12) {
            setOnClickListener(null);
            if (z11) {
                a(viewGroup);
            }
            imageView.setVisibility(8);
            return;
        }
        Context context = getContext();
        Intrinsics.f(context, "getContext(...)");
        ww.g gVar = new ww.g(context, c().f45442e, c().f45440c);
        ListPopupWindow listPopupWindow = this.f45434c;
        listPopupWindow.setAdapter(gVar);
        listPopupWindow.setModal(true);
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(0, 0);
        int count = gVar.getCount();
        int i5 = 0;
        for (int i11 = 0; i11 < count; i11++) {
            View view = gVar.getView(i11, null, this);
            view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
            int measuredWidth = view.getMeasuredWidth();
            if (i5 < measuredWidth) {
                i5 = measuredWidth;
            }
        }
        listPopupWindow.setWidth(i5);
        int i12 = 1;
        listPopupWindow.setOnItemClickListener(new o(this, i12));
        listPopupWindow.setAnchorView(this.f45432a);
        setOnClickListener(new p(this, i12));
        if (z11) {
            a(viewGroup);
        }
        imageView.setVisibility(0);
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        State state;
        Parcelable superState;
        SavedState savedState = parcelable instanceof SavedState ? (SavedState) parcelable : null;
        if (savedState == null || (state = savedState.f45437b) == null) {
            state = new State();
        }
        i2 i2Var = this.f45435d;
        i2Var.getClass();
        i2Var.k(null, state);
        b();
        g(false);
        if (savedState != null && (superState = savedState.getSuperState()) != null) {
            parcelable = superState;
        }
        super.onRestoreInstanceState(parcelable);
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        return new SavedState(super.onSaveInstanceState(), c());
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/view/CardBrandView$State;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class State implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<State> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f45438a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f45439b;

        /* renamed from: c, reason: collision with root package name */
        public final ft.b f45440c;

        /* renamed from: d, reason: collision with root package name */
        public final ft.b f45441d;

        /* renamed from: e, reason: collision with root package name */
        public final List f45442e;

        /* renamed from: f, reason: collision with root package name */
        public final List f45443f;

        /* renamed from: g, reason: collision with root package name */
        public final boolean f45444g;

        /* renamed from: h, reason: collision with root package name */
        public final boolean f45445h;

        public State(boolean z11, boolean z12, ft.b brand, ft.b bVar, List possibleBrands, List merchantPreferredNetworks, boolean z13, boolean z14) {
            Intrinsics.g(brand, "brand");
            Intrinsics.g(possibleBrands, "possibleBrands");
            Intrinsics.g(merchantPreferredNetworks, "merchantPreferredNetworks");
            this.f45438a = z11;
            this.f45439b = z12;
            this.f45440c = brand;
            this.f45441d = bVar;
            this.f45442e = possibleBrands;
            this.f45443f = merchantPreferredNetworks;
            this.f45444g = z13;
            this.f45445h = z14;
        }

        public static State a(State state, boolean z11, ft.b bVar, ft.b bVar2, List list, int i5) {
            if ((i5 & 1) != 0) {
                z11 = state.f45438a;
            }
            boolean z12 = z11;
            boolean z13 = state.f45439b;
            if ((i5 & 4) != 0) {
                bVar = state.f45440c;
            }
            ft.b brand = bVar;
            if ((i5 & 8) != 0) {
                bVar2 = state.f45441d;
            }
            ft.b bVar3 = bVar2;
            if ((i5 & 16) != 0) {
                list = state.f45442e;
            }
            List possibleBrands = list;
            List merchantPreferredNetworks = state.f45443f;
            boolean z14 = state.f45444g;
            boolean z15 = (i5 & 128) != 0 ? state.f45445h : false;
            state.getClass();
            Intrinsics.g(brand, "brand");
            Intrinsics.g(possibleBrands, "possibleBrands");
            Intrinsics.g(merchantPreferredNetworks, "merchantPreferredNetworks");
            return new State(z12, z13, brand, bVar3, possibleBrands, merchantPreferredNetworks, z14, z15);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof State)) {
                return false;
            }
            State state = (State) obj;
            return this.f45438a == state.f45438a && this.f45439b == state.f45439b && this.f45440c == state.f45440c && this.f45441d == state.f45441d && Intrinsics.b(this.f45442e, state.f45442e) && Intrinsics.b(this.f45443f, state.f45443f) && this.f45444g == state.f45444g && this.f45445h == state.f45445h;
        }

        public final int hashCode() {
            int iHashCode = (this.f45440c.hashCode() + c9.f(Boolean.hashCode(this.f45438a) * 31, 31, this.f45439b)) * 31;
            ft.b bVar = this.f45441d;
            return Boolean.hashCode(this.f45445h) + c9.f(u4.c(u4.c((iHashCode + (bVar == null ? 0 : bVar.hashCode())) * 31, 31, this.f45442e), 31, this.f45443f), 31, this.f45444g);
        }

        public final String toString() {
            return "State(isCbcEligible=" + this.f45438a + ", isLoading=" + this.f45439b + ", brand=" + this.f45440c + ", userSelectedBrand=" + this.f45441d + ", possibleBrands=" + this.f45442e + ", merchantPreferredNetworks=" + this.f45443f + ", shouldShowCvc=" + this.f45444g + ", shouldShowErrorIcon=" + this.f45445h + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f45438a ? 1 : 0);
            dest.writeInt(this.f45439b ? 1 : 0);
            dest.writeString(this.f45440c.name());
            ft.b bVar = this.f45441d;
            if (bVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(bVar.name());
            }
            Iterator itK = fq.c.k(this.f45442e, dest);
            while (itK.hasNext()) {
                dest.writeString(((ft.b) itK.next()).name());
            }
            Iterator itK2 = fq.c.k(this.f45443f, dest);
            while (itK2.hasNext()) {
                dest.writeString(((ft.b) itK2.next()).name());
            }
            dest.writeInt(this.f45444g ? 1 : 0);
            dest.writeInt(this.f45445h ? 1 : 0);
        }

        /* JADX WARN: Illegal instructions before constructor call */
        public State() {
            ft.b bVar = ft.b.f55894x;
            EmptyList emptyList = EmptyList.f71733a;
            this(false, false, bVar, null, emptyList, emptyList, false, false);
        }
    }
}
