package com.google.android.gms.internal.measurement;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public abstract class wb {

    /* renamed from: a, reason: collision with root package name */
    public static final d2 f33188a;

    static {
        c3 qVar;
        ((i) d.f32446a).getClass();
        AtomicReference atomicReference = m.f32804f;
        String strReplace = "Phlogger";
        if (atomicReference.get() != null) {
            o oVar = (o) atomicReference.get();
            qVar = new q(strReplace, oVar.f32865a, oVar.f32866b, oVar.f32867c);
        } else {
            int i5 = 7;
            while (true) {
                if (i5 >= 0) {
                    char cCharAt = "Phlogger".charAt(i5);
                    if (cCharAt != '$') {
                        if (cCharAt == '.') {
                            break;
                        } else {
                            i5--;
                        }
                    } else {
                        strReplace = "Phlogger".replace('$', '.');
                        break;
                    }
                } else {
                    break;
                }
            }
            m mVar = new m(strReplace);
            if (m.f32801c || m.f32802d) {
                mVar.f32807b = new p(strReplace);
            } else if (m.f32803e) {
                o oVar2 = q.f32972h;
                mVar.f32807b = new q(strReplace, Level.OFF, oVar2.f32866b, oVar2.f32867c);
            } else {
                mVar.f32807b = null;
            }
            ConcurrentLinkedQueue concurrentLinkedQueue = k.f32706a;
            concurrentLinkedQueue.offer(mVar);
            qVar = mVar;
            if (atomicReference.get() != null) {
                while (true) {
                    m mVar2 = (m) concurrentLinkedQueue.poll();
                    if (mVar2 == null) {
                        break;
                    }
                    o oVar3 = (o) atomicReference.get();
                    mVar2.f32807b = new q((String) mVar2.f32423a, oVar3.f32865a, oVar3.f32866b, oVar3.f32867c);
                }
                m.m();
                qVar = mVar;
            }
        }
        f33188a = new d2(qVar, 1);
    }
}
