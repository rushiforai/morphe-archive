package com.google.android.gms.internal.measurement;

import java.util.concurrent.Callable;

/* loaded from: classes3.dex */
public final /* synthetic */ class y7 implements Callable {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ y7 f33252b = new y7(0);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ y7 f33253c = new y7(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33254a;

    public /* synthetic */ y7(int i5) {
        this.f33254a = i5;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.f33254a) {
            case 0:
                oc ocVar = new oc("internal.platform", 4);
                ocVar.f33077b.put("getVersion", new oc("getVersion", 3));
                return ocVar;
            default:
                return null;
        }
    }
}
