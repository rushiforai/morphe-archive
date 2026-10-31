package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Build;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.function.Function;

/* loaded from: classes3.dex */
public final class td {

    /* renamed from: a, reason: collision with root package name */
    public Object f33083a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f33084b;

    public void a(rg.j jVar) {
        ((Executor) this.f33083a).execute(new mk.w(16, this, jVar));
    }

    public sd b(final ob obVar) {
        final kd kdVar = (kd) this.f33084b;
        kd kdVar2 = sd.f33059j;
        if (kdVar != kdVar2) {
            d2 d2Var = sd.f33058i;
            d2Var.getClass();
            final bg.g gVar = new bg.g();
            gVar.f17888a = false;
            ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) d2Var.f32451b;
            Context context = obVar.f32922b;
            String str = kdVar.f32736d;
            if (str == null) {
                str = (String) kdVar.f32733a.apply(context);
                kdVar.f32736d = str;
            }
            ld ldVar = (ld) concurrentHashMap.computeIfAbsent(str, new Function() { // from class: com.google.android.gms.internal.measurement.rd
                @Override // java.util.function.Function
                public final /* synthetic */ Object apply(Object obj) {
                    ld ldVar2 = new ld(new sd(obVar, kdVar));
                    gVar.f17888a = true;
                    return ldVar2;
                }
            });
            if (gVar.f17888a) {
                Context context2 = obVar.f32922b;
                d2 d2Var2 = new d2(d2Var, 11);
                if (ge.f32574b == null) {
                    synchronized (ge.class) {
                        try {
                            if (ge.f32574b == null) {
                                if (!Objects.equals(context2.getPackageName(), "com.google.android.gms")) {
                                    if (Build.VERSION.SDK_INT >= 33) {
                                        context2.registerReceiver(new ge(0), new IntentFilter("com.google.android.gms.phenotype.UPDATE"), 2);
                                    } else {
                                        context2.registerReceiver(new ge(0), new IntentFilter("com.google.android.gms.phenotype.UPDATE"));
                                    }
                                }
                                ge.f32574b = d2Var2;
                            }
                        } finally {
                        }
                    }
                }
            }
            this.f33083a = ldVar.f32791a;
            this.f33084b = kdVar2;
        }
        return (sd) this.f33083a;
    }
}
