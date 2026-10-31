package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer;

import a5.r;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l;
import h6.a0;
import h6.s;
import h6.t;
import h6.u;
import h6.y;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class f implements l {

    /* renamed from: d, reason: collision with root package name */
    public static final int f41951d = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final u f41952a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function0<Unit> f41953b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final y f41954c;

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f41955a;

        static {
            int[] iArr = new int[s.values().length];
            try {
                iArr[s.ON_START.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[s.ON_RESUME.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[s.ON_PAUSE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[s.ON_STOP.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            f41955a = iArr;
        }
    }

    public f(@NotNull u lifecycle, @NotNull Function0<Unit> onExoResume, @NotNull Function0<Unit> onExoPause) {
        Intrinsics.g(lifecycle, "lifecycle");
        Intrinsics.g(onExoResume, "onExoResume");
        Intrinsics.g(onExoPause, "onExoPause");
        this.f41952a = lifecycle;
        this.f41953b = onExoResume;
        r rVar = new r(1, this, onExoPause);
        this.f41954c = rVar;
        lifecycle.a(rVar);
        t tVarB = lifecycle.b();
        if (tVarB == t.f59440a || tVarB.compareTo(t.f59443d) >= 0) {
            return;
        }
        onExoResume.invoke();
    }

    public static final void a(f fVar, Function0 function0, a0 a0Var, s event) {
        Intrinsics.g(a0Var, "<unused var>");
        Intrinsics.g(event, "event");
        int i5 = a.f41955a[event.ordinal()];
        if (i5 == 1) {
            fVar.f41953b.invoke();
        } else {
            if (i5 == 2 || i5 == 3 || i5 != 4) {
                return;
            }
            function0.invoke();
        }
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l
    public void destroy() {
        this.f41952a.c(this.f41954c);
    }
}
