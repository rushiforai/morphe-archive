package com.stripe.android.paymentsheet.addresselement;

import android.app.Application;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final Application f44760a;

    /* renamed from: b, reason: collision with root package name */
    public final j.c f44761b;

    public m(g.o oVar, a5.i iVar) {
        Application application = oVar.getApplication();
        Intrinsics.f(application, "getApplication(...)");
        j.c activityResultLauncher = oVar.registerForActivityResult(AddressElementActivityContract.f44685a, new io.a(iVar));
        Intrinsics.g(activityResultLauncher, "activityResultLauncher");
        this.f44760a = application;
        this.f44761b = activityResultLauncher;
    }
}
