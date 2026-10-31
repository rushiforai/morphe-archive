package com.moloco.sdk.internal;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.stripe.android.paymentsheet.ui.PrimaryButton;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class b0 implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f36226a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f36227b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f36228c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f36229d;

    public /* synthetic */ b0(int i5, Object obj, Object obj2, Object obj3) {
        this.f36226a = i5;
        this.f36227b = obj;
        this.f36228c = obj2;
        this.f36229d = obj3;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) throws Resources.NotFoundException {
        switch (this.f36226a) {
            case 0:
                return C2930d.a((Integer) this.f36227b, (Integer) this.f36228c, (Integer) this.f36229d, (Context) obj, (w70.m) obj2, (w70.m) obj3);
            case 1:
                Context context = (Context) this.f36227b;
                kv.c cVar = (kv.c) this.f36228c;
                e1 e1Var = (e1) this.f36229d;
                LayoutInflater inflater = (LayoutInflater) obj;
                ViewGroup parent = (ViewGroup) obj2;
                boolean zBooleanValue = ((Boolean) obj3).booleanValue();
                Intrinsics.g(inflater, "inflater");
                Intrinsics.g(parent, "parent");
                View viewInflate = inflater.inflate(2131624415, parent, false);
                if (zBooleanValue) {
                    parent.addView(viewInflate);
                }
                PrimaryButton primaryButton = (PrimaryButton) ab.e0.x(2131428641, viewInflate);
                if (primaryButton == null) {
                    throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428641)));
                }
                tu.a aVar = new tu.a((FrameLayout) viewInflate, primaryButton);
                e1Var.setValue(primaryButton);
                hw.k primaryButtonStyle = hw.p.f60769e;
                Integer num = hw.r.o(context) ? cVar.f72266a.f44551h.f44457e.f44613b.f44618a : cVar.f72266a.f44551h.f44457e.f44612a.f44618a;
                ColorStateList colorStateListValueOf = ColorStateList.valueOf(num != null ? num.intValue() : hw.r.c(hw.p.f60769e, context));
                Intrinsics.g(primaryButtonStyle, "primaryButtonStyle");
                Context context2 = primaryButton.getContext();
                Intrinsics.f(context2, "getContext(...)");
                hw.j jVar = primaryButtonStyle.f60746c;
                primaryButton.f44994h = hw.r.b(context2, jVar.f60741a);
                Context context3 = primaryButton.getContext();
                Intrinsics.f(context3, "getContext(...)");
                primaryButton.f44995i = hw.r.b(context3, jVar.f60742b);
                Context context4 = primaryButton.getContext();
                Intrinsics.f(context4, "getContext(...)");
                primaryButton.f44996j = hw.r.e(primaryButtonStyle, context4);
                ImageView imageView = (ImageView) primaryButton.f44991e.f82827e;
                Context context5 = primaryButton.getContext();
                Intrinsics.f(context5, "getContext(...)");
                imageView.setImageTintList(ColorStateList.valueOf(hw.r.h(primaryButtonStyle, context5)));
                primaryButton.f44987a = colorStateListValueOf;
                primaryButton.setBackgroundTintList(colorStateListValueOf);
                Context context6 = primaryButton.getContext();
                Intrinsics.f(context6, "getContext(...)");
                primaryButton.f44997k = hw.r.n(primaryButtonStyle, context6);
                Context context7 = primaryButton.getContext();
                Intrinsics.f(context7, "getContext(...)");
                primaryButton.f44998l = hw.r.i(primaryButtonStyle, context7);
                ViewGroup.LayoutParams layoutParams = primaryButton.getLayoutParams();
                if (layoutParams != null) {
                    Context context8 = primaryButton.getContext();
                    Intrinsics.f(context8, "getContext(...)");
                    layoutParams.height = (int) hw.r.b(context8, jVar.f60743c);
                }
                return aVar;
            default:
                v70.i iVar = (v70.i) this.f36228c;
                b80.g gVar = (b80.g) this.f36229d;
                w50.g gVar2 = v70.k.f92183l;
                Object obj4 = this.f36227b;
                if (obj4 != gVar2) {
                    ps.c.j(iVar.f92169b, obj4, ((b80.f) gVar).f17625a);
                }
                return Unit.f71706a;
        }
    }
}
