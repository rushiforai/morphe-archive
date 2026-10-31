package com.bykv.vk.openvk.preload.a;

import com.bykv.vk.openvk.preload.a.i;

/* loaded from: classes2.dex */
public abstract class k<IN, OUT> extends d<IN, OUT> {

    /* renamed from: d, reason: collision with root package name */
    private IN f21964d;

    @Override // com.bykv.vk.openvk.preload.a.d
    public final Object a(b<OUT> bVar, IN in2) throws Throwable {
        this.f21964d = in2;
        try {
            return bVar.a((b<OUT>) a());
        } catch (i.a e3) {
            return a((b) bVar, e3.getCause());
        } catch (Throwable th2) {
            return a((b) bVar, th2);
        }
    }

    public abstract boolean a(Throwable th2);

    public final IN g() {
        return this.f21964d;
    }

    private Object a(b<OUT> bVar, Throwable th2) throws Throwable {
        while (a(th2)) {
            try {
                return bVar.a((b<OUT>) a());
            } catch (i.a e3) {
                th2 = e3.getCause();
            } catch (Throwable th3) {
                th2 = th3;
            }
        }
        throw th2;
    }

    public OUT a() {
        return this.f21964d;
    }
}
