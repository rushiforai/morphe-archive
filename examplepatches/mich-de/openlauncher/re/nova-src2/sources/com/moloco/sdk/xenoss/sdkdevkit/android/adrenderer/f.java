package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer;

import android.content.Context;
import android.view.View;
import android.webkit.WebView;
import com.moloco.sdk.internal.ortb.model.C2931a;
import com.moloco.sdk.internal.ortb.model.C2932b;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import kotlin.UInt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function10;
import kotlin.jvm.functions.Function11;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.m1;

/* loaded from: classes4.dex */
public final class f implements InterfaceC2973c {

    /* renamed from: g, reason: collision with root package name */
    public static final int f38357g = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f38358a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function10<Context, WebView, Integer, m1, Function1<? super a.AbstractC0299a.c, Unit>, Function0<Unit>, Function0<Unit>, z, y3.f, Boolean, View> f38359b;

    /* renamed from: c, reason: collision with root package name */
    public final int f38360c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Function2<p1.o, Integer, Function11<k0.t, Boolean, Boolean, Function0<Unit>, Function1<? super a.AbstractC0299a.c, Unit>, Boolean, UInt, UInt, Function0<Unit>, p1.o, Integer, Unit>> f38361d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final C2931a f38362e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final C2932b f38363f;

    public static final class a implements Function2<p1.o, Integer, Function11<? super k0.t, ? super Boolean, ? super Boolean, ? super Function0<? extends Unit>, ? super Function1<? super a.AbstractC0299a.c, ? extends Unit>, ? super Boolean, ? super UInt, ? super UInt, ? super Function0<? extends Unit>, ? super p1.o, ? super Integer, ? extends Unit>> {

        /* renamed from: a, reason: collision with root package name */
        public static final a f38364a = new a();

        public final Function11<k0.t, Boolean, Boolean, Function0<Unit>, Function1<? super a.AbstractC0299a.c, Unit>, Boolean, UInt, UInt, Function0<Unit>, p1.o, Integer, Unit> a(p1.o oVar, int i5) {
            p1.t tVar = (p1.t) oVar;
            tVar.c0(48977993);
            Function11<k0.t, Boolean, Boolean, Function0<Unit>, Function1<? super a.AbstractC0299a.c, Unit>, Boolean, UInt, UInt, Function0<Unit>, p1.o, Integer, Unit> function11A = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.s.a(null, null, 0L, 0L, 0L, null, null, null, tVar, 0, 255);
            tVar.p(false);
            return function11A;
        }

        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
            return a((p1.o) obj, ((Number) obj2).intValue());
        }
    }

    public f() {
        this(0, null, 0, null, null, null, 63, null);
    }

    @NotNull
    public final Function10<Context, WebView, Integer, m1, Function1<? super a.AbstractC0299a.c, Unit>, Function0<Unit>, Function0<Unit>, z, y3.f, Boolean, View> a() {
        return this.f38359b;
    }

    @Nullable
    public final C2931a b() {
        return this.f38362e;
    }

    @Nullable
    public final C2932b c() {
        return this.f38363f;
    }

    public final int d() {
        return this.f38358a;
    }

    @NotNull
    public final Function2<p1.o, Integer, Function11<k0.t, Boolean, Boolean, Function0<Unit>, Function1<? super a.AbstractC0299a.c, Unit>, Boolean, UInt, UInt, Function0<Unit>, p1.o, Integer, Unit>> e() {
        return this.f38361d;
    }

    public final int f() {
        return this.f38360c;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public f(int i5, @NotNull Function10<? super Context, ? super WebView, ? super Integer, ? super m1, ? super Function1<? super a.AbstractC0299a.c, Unit>, ? super Function0<Unit>, ? super Function0<Unit>, ? super z, ? super y3.f, ? super Boolean, ? extends View> adWebViewRenderer, int i11, @NotNull Function2<? super p1.o, ? super Integer, ? extends Function11<? super k0.t, ? super Boolean, ? super Boolean, ? super Function0<Unit>, ? super Function1<? super a.AbstractC0299a.c, Unit>, ? super Boolean, ? super UInt, ? super UInt, ? super Function0<Unit>, ? super p1.o, ? super Integer, Unit>> decClose, @Nullable C2931a c2931a, @Nullable C2932b c2932b) {
        Intrinsics.g(adWebViewRenderer, "adWebViewRenderer");
        Intrinsics.g(decClose, "decClose");
        this.f38358a = i5;
        this.f38359b = adWebViewRenderer;
        this.f38360c = i11;
        this.f38361d = decClose;
        this.f38362e = c2931a;
        this.f38363f = c2932b;
    }

    public /* synthetic */ f(int i5, Function10 function10, int i11, Function2 function2, C2931a c2931a, C2932b c2932b, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this((i12 & 1) != 0 ? 5 : i5, (i12 & 2) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.b.a(0L, null, 3, null) : function10, (i12 & 4) != 0 ? 5 : i11, (i12 & 8) != 0 ? a.f38364a : function2, (i12 & 16) != 0 ? null : c2931a, (i12 & 32) != 0 ? null : c2932b);
    }
}
