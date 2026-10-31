package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import a5.a1;
import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import com.amplitude.android.TrackingOptions;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.service_locator.a;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import p1.t1;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final AtomicBoolean f39898a = new AtomicBoolean(false);

    @SourceDebugExtension
    public static final class a implements View.OnAttachStateChangeListener {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ View f39899a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ ImageView f39900b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f39901c;

        public a(View view, ImageView imageView, String str) {
            this.f39899a = view;
            this.f39900b = imageView;
            this.f39901c = str;
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewAttachedToWindow(@NotNull View view) {
            Intrinsics.g(view, "view");
            this.f39899a.removeOnAttachStateChangeListener(this);
            boolean zIsHardwareAccelerated = this.f39900b.isHardwareAccelerated();
            if (!zIsHardwareAccelerated) {
                k.b();
            }
            ImageView imageView = this.f39900b;
            m8.k kVarA = m8.a.a(imageView.getContext());
            x8.i iVar = new x8.i(imageView.getContext());
            iVar.f95306c = this.f39901c;
            iVar.e(imageView);
            iVar.f95314k = Boolean.valueOf(zIsHardwareAccelerated);
            kVarA.b(iVar.a());
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewDetachedFromWindow(@NotNull View view) {
            Intrinsics.g(view, "view");
        }
    }

    public static final Unit a(String str, z2.l lVar, b2.t tVar, int i5, p1.o oVar, int i11) {
        a(str, lVar, tVar, oVar, i5 | 1);
        return Unit.f71706a;
    }

    public static final void b() {
        if (f39898a.compareAndSet(false, true)) {
            com.moloco.sdk.internal.services.x xVarB = a.e.f38290a.l().b();
            MetricsRecorder.INSTANCE.withNoMediation().recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36258b0.c()).withTag("manufacturer", xVarB.t()).withTag("model", xVarB.v()).withTag(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, xVarB.x()).withTag(TrackingOptions.AMP_TRACKING_OPTION_API_LEVEL, String.valueOf(xVarB.n())));
        }
    }

    public static final void a(@Nullable String str, @NotNull z2.l contentScale, @NotNull b2.t modifier, @Nullable p1.o oVar, int i5) {
        int i11;
        Intrinsics.g(contentScale, "contentScale");
        Intrinsics.g(modifier, "modifier");
        p1.t tVar = (p1.t) oVar;
        tVar.d0(481470006);
        if ((i5 & 6) == 0) {
            i11 = (tVar.f(str) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar.f(contentScale) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar.f(modifier) ? 256 : 128;
        }
        if ((i11 & 147) == 146 && tVar.E()) {
            tVar.V();
        } else {
            final boolean zIsHardwareAccelerated = ((View) tVar.j(AndroidCompositionLocals_androidKt.f14170f)).isHardwareAccelerated();
            tVar.c0(313993790);
            boolean zG = tVar.g(zIsHardwareAccelerated);
            Object objP = tVar.P();
            if (zG || objP == p1.n.f81514a) {
                objP = new Function0() { // from class: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.i0
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return k.a(zIsHardwareAccelerated);
                    }
                };
                tVar.m0(objP);
            }
            tVar.p(false);
            p1.o0.h((Function0) objP, tVar);
            x8.i iVar = new x8.i((Context) tVar.j(AndroidCompositionLocals_androidKt.f14166b));
            iVar.f95306c = str;
            iVar.f95314k = Boolean.valueOf(zIsHardwareAccelerated);
            n8.n.a(iVar.a(), null, modifier, contentScale, null, tVar, (i11 & 896) | 48 | ((i11 << 15) & 3670016), 952);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a1.f(str, contentScale, modifier, i5, 9);
        }
    }

    public static final Unit a(boolean z11) {
        if (!z11) {
            b();
        }
        return Unit.f71706a;
    }

    public static final void a(@NotNull ImageView imageView, @Nullable String str) {
        Intrinsics.g(imageView, "<this>");
        if (str != null) {
            Context context = imageView.getContext();
            Intrinsics.f(context, "getContext(...)");
            m8.k kVarA = m8.a.a(context);
            Context context2 = imageView.getContext();
            Intrinsics.f(context2, "getContext(...)");
            x8.i iVar = new x8.i(context2);
            iVar.f95306c = str;
            kVarA.b(iVar.a());
        }
        WeakHashMap weakHashMap = a1.f250a;
        if (imageView.isAttachedToWindow()) {
            boolean zIsHardwareAccelerated = imageView.isHardwareAccelerated();
            if (!zIsHardwareAccelerated) {
                b();
            }
            m8.k kVarA2 = m8.a.a(imageView.getContext());
            x8.i iVar2 = new x8.i(imageView.getContext());
            iVar2.f95306c = str;
            iVar2.e(imageView);
            iVar2.f95314k = Boolean.valueOf(zIsHardwareAccelerated);
            kVarA2.b(iVar2.a());
            return;
        }
        imageView.addOnAttachStateChangeListener(new a(imageView, imageView, str));
    }
}
