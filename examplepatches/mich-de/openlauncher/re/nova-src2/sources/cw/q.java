package cw;

import android.content.Context;
import com.google.android.gms.common.zzp;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public boolean f48266a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f48267b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f48268c;

    public /* synthetic */ q(String str, boolean z11, boolean z12) {
        this.f48268c = str;
        this.f48266a = z11;
        this.f48267b = z12;
    }

    public boolean a() {
        return this.f48267b;
    }

    public zzp b(Context context) {
        return new zzp((String) this.f48268c, this.f48266a, false, new ah.d(context), false, true, false);
    }

    public q(boolean z11, Float f11, boolean z12) {
        this.f48266a = z11;
        this.f48268c = f11;
        this.f48267b = z12;
    }

    public q(boolean z11, boolean z12, h6.u0 savedStateHandle) {
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        this.f48266a = z11;
        this.f48267b = z12;
        this.f48268c = savedStateHandle;
        savedStateHandle.d("KEY_HAS_AUTOMATICALLY_LAUNCHED_CARD_SCAN", Boolean.valueOf(z11));
    }

    public q(l10.z zVar) {
        this.f48268c = zVar;
    }
}
