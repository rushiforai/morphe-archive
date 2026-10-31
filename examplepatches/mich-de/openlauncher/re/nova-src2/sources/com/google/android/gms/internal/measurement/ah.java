package com.google.android.gms.internal.measurement;

import kotlin.Unit;
import kotlin.jvm.internal.Ref;

/* loaded from: classes3.dex */
public final class ah implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f32387a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ zg f32388b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ eb f32389c;

    public ah(Ref.ObjectRef objectRef, zg zgVar, eb ebVar) {
        this.f32387a = objectRef;
        this.f32388b = zgVar;
        this.f32389c = ebVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f32387a.f71863a != null) {
            throw new ClassCastException();
        }
        eb ebVar = this.f32389c;
        zg zgVarB = jg.b(jg.c(), this.f32388b);
        try {
            ebVar.run();
            Unit unit = Unit.f71706a;
        } finally {
        }
    }

    public final String toString() {
        eb ebVar = this.f32389c;
        StringBuilder sb2 = new StringBuilder(ebVar.toString().length() + 14);
        sb2.append("propagating=[");
        sb2.append(ebVar);
        sb2.append("]");
        return sb2.toString();
    }
}
