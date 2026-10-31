package com.google.android.gms.internal.measurement;

import java.util.function.Consumer;

/* loaded from: classes3.dex */
public final /* synthetic */ class mg implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32824a;

    public /* synthetic */ mg(int i5) {
        this.f32824a = i5;
    }

    @Override // java.util.function.Consumer
    public final /* synthetic */ void accept(Object obj) {
        switch (this.f32824a) {
            case 0:
                if (obj != null) {
                    throw new ClassCastException();
                }
                zzvr zzvrVar = ng.f32857g;
                throw null;
            default:
                throw b.u4.d(obj);
        }
    }
}
