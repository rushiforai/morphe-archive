package com.bykv.vk.openvk.preload.a;

import java.util.List;

/* loaded from: classes2.dex */
final class i implements b {

    /* renamed from: a, reason: collision with root package name */
    protected e f21959a;

    /* renamed from: b, reason: collision with root package name */
    private int f21960b;

    /* renamed from: c, reason: collision with root package name */
    private List<h> f21961c;

    /* renamed from: d, reason: collision with root package name */
    private d f21962d;

    public static final class a extends Exception {
        public a(Throwable th2) {
            super(th2);
        }
    }

    public i(List<h> list, int i5, e eVar, d dVar) {
        this.f21961c = list;
        this.f21960b = i5;
        this.f21959a = eVar;
        this.f21962d = dVar;
    }

    private d c(Class cls) {
        d dVar = this.f21962d;
        while (dVar != null && dVar.getClass() != cls) {
            dVar = dVar.f21941a;
        }
        return dVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bykv.vk.openvk.preload.a.b
    public final Object a(Object obj) throws Exception {
        d dVar = this.f21962d;
        if (dVar != null) {
            dVar.f21943c = obj;
            dVar.e();
        }
        if (this.f21960b >= this.f21961c.size()) {
            return obj;
        }
        h hVar = this.f21961c.get(this.f21960b);
        Class<? extends d> cls = hVar.f21953a;
        d dVar2 = (d) this.f21959a.a(cls);
        if (dVar2 == null) {
            throw new IllegalArgumentException("interceptor == null , index = " + obj + " , class: " + cls);
        }
        com.bykv.vk.openvk.preload.a.b.a aVarA = hVar.a();
        i iVar = new i(this.f21961c, this.f21960b + 1, this.f21959a, dVar2);
        dVar2.a(iVar, this.f21962d, obj, aVarA, hVar.b());
        dVar2.c();
        try {
            Object objA = dVar2.a(iVar, obj);
            dVar2.d();
            return objA;
        } catch (a e3) {
            dVar2.c(e3.getCause());
            throw e3;
        } catch (Throwable th2) {
            dVar2.b(th2);
            throw new a(th2);
        }
    }

    @Override // com.bykv.vk.openvk.preload.a.b
    public final Object b(Class cls) {
        d dVarC = c(cls);
        if (dVarC != null) {
            return dVarC.f21943c;
        }
        throw new IllegalArgumentException("can not find pre Interceptor , class:".concat(String.valueOf(cls)));
    }

    @Override // com.bykv.vk.openvk.preload.a.b
    public final Object a(Class cls) {
        d dVarC = c(cls);
        if (dVarC != null) {
            return dVarC.f21942b;
        }
        throw new IllegalArgumentException("can not find pre Interceptor , class:".concat(String.valueOf(cls)));
    }
}
