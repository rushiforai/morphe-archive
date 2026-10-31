package com.moloco.sdk.internal.publisher.nativead.ui;

import b2.r;
import com.moloco.sdk.R;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.u;
import i2.s;
import j3.b0;
import j3.y;
import k0.t;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import p1.n;
import p1.o;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f37397a = new a();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static Function5<t, Boolean, Function0<Unit>, o, Integer, Unit> f37398b = new x1.e(C0171a.f37399a, false, 1019496058);

    @NotNull
    public final Function5<t, Boolean, Function0<Unit>, o, Integer, Unit> a() {
        return f37398b;
    }

    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.internal.publisher.nativead.ui.a$a, reason: collision with other inner class name */
    public static final class C0171a implements Function5<t, Boolean, Function0<? extends Unit>, o, Integer, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public static final C0171a f37399a = new C0171a();

        /* renamed from: com.moloco.sdk.internal.publisher.nativead.ui.a$a$a, reason: collision with other inner class name */
        public static final class C0172a implements Function3<Boolean, o, Integer, Unit> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ Function0<Unit> f37400a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ String f37401b;

            public C0172a(Function0<Unit> function0, String str) {
                this.f37400a = function0;
                this.f37401b = str;
            }

            public final void a(boolean z11, o oVar, int i5) {
                int i11;
                if ((i5 & 6) == 0) {
                    i11 = i5 | (((p1.t) oVar).g(z11) ? 4 : 2);
                } else {
                    i11 = i5;
                }
                if ((i11 & 19) == 18) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                        return;
                    }
                }
                n2.c cVarV = ul.b.V(z11 ? R.drawable.moloco_twotone_pause_24 : R.drawable.moloco_twotone_play_arrow_24, oVar, 0);
                Function0<Unit> function0 = this.f37400a;
                String str = this.f37401b;
                int i12 = s.n;
                u.a(cVarV, function0, null, false, str, s.f61140f, 0L, 0L, null, 0L, oVar, 196608, 972);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3) {
                a(((Boolean) obj).booleanValue(), (o) obj2, ((Number) obj3).intValue());
                return Unit.f71706a;
            }
        }

        public final void a(t tVar, boolean z11, Function0<Unit> onClick, o oVar, int i5) {
            int i11;
            Intrinsics.g(tVar, "<this>");
            Intrinsics.g(onClick, "onClick");
            if ((i5 & 6) == 0) {
                i11 = (((p1.t) oVar).f(tVar) ? 4 : 2) | i5;
            } else {
                i11 = i5;
            }
            if ((i5 & 48) == 0) {
                i11 |= ((p1.t) oVar).g(z11) ? 32 : 16;
            }
            if ((i5 & 384) == 0) {
                i11 |= ((p1.t) oVar).f(onClick) ? 256 : 128;
            }
            if ((i11 & 1171) == 1170) {
                p1.t tVar2 = (p1.t) oVar;
                if (tVar2.E()) {
                    tVar2.V();
                    return;
                }
            }
            String strY = x7.f.Y(oVar, R.string.moloco_playback_control_parent_content_description);
            String strY2 = x7.f.Y(oVar, R.string.moloco_playback_control_icon_content_description);
            b2.t tVarJ = androidx.compose.foundation.layout.d.j(tVar.a(r.f17024a, b2.d.f17004h), 4);
            p1.t tVar3 = (p1.t) oVar;
            tVar3.c0(277456883);
            boolean zF = tVar3.f(strY);
            Object objP = tVar3.P();
            if (zF || objP == n.f81514a) {
                objP = new h(strY, 0);
                tVar3.m0(objP);
            }
            tVar3.p(false);
            a.a.k(Boolean.valueOf(z11), j3.n.b(tVarJ, false, (Function1) objP), null, x1.f.b(1776469658, new C0172a(onClick, strY2), tVar3), tVar3, ((i11 >> 3) & 14) | 3072, 4);
        }

        @Override // kotlin.jvm.functions.Function5
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
            a((t) obj, ((Boolean) obj2).booleanValue(), (Function0) obj3, (o) obj4, ((Number) obj5).intValue());
            return Unit.f71706a;
        }

        public static final Unit a(String str, b0 semantics) {
            Intrinsics.g(semantics, "$this$semantics");
            y.e(str, semantics);
            y.k(str, semantics);
            return Unit.f71706a;
        }
    }
}
