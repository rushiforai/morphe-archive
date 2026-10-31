package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class hd implements vk.u {

    /* renamed from: a, reason: collision with root package name */
    public final String f32610a;

    /* renamed from: b, reason: collision with root package name */
    public final td f32611b;

    /* renamed from: c, reason: collision with root package name */
    public volatile int f32612c = -1;

    /* renamed from: d, reason: collision with root package name */
    public d2 f32613d;

    public hd(String str, td tdVar) {
        this.f32610a = str;
        this.f32611b = tdVar;
    }

    public abstract Object a();

    public abstract Object b(String str);

    public abstract Object c(Object obj);

    public abstract Object d();

    public abstract void e(Object obj);

    /* JADX WARN: Removed duplicated region for block: B:106:0x015a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x010f A[Catch: all -> 0x00a8, TryCatch #3 {all -> 0x00a8, blocks: (B:30:0x0093, B:32:0x0097, B:36:0x00ac, B:38:0x00b8, B:40:0x00ca, B:42:0x00d8, B:50:0x00f9, B:57:0x010f, B:58:0x0115, B:60:0x0126, B:62:0x012e, B:63:0x0147, B:66:0x015a, B:72:0x016d, B:77:0x0177, B:79:0x017d, B:80:0x0182, B:71:0x0162, B:55:0x0101, B:46:0x00ed, B:43:0x00e5, B:82:0x0184), top: B:101:0x0093 }] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0177 A[Catch: all -> 0x00a8, TryCatch #3 {all -> 0x00a8, blocks: (B:30:0x0093, B:32:0x0097, B:36:0x00ac, B:38:0x00b8, B:40:0x00ca, B:42:0x00d8, B:50:0x00f9, B:57:0x010f, B:58:0x0115, B:60:0x0126, B:62:0x012e, B:63:0x0147, B:66:0x015a, B:72:0x016d, B:77:0x0177, B:79:0x017d, B:80:0x0182, B:71:0x0162, B:55:0x0101, B:46:0x00ed, B:43:0x00e5, B:82:0x0184), top: B:101:0x0093 }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x017d A[Catch: all -> 0x00a8, TryCatch #3 {all -> 0x00a8, blocks: (B:30:0x0093, B:32:0x0097, B:36:0x00ac, B:38:0x00b8, B:40:0x00ca, B:42:0x00d8, B:50:0x00f9, B:57:0x010f, B:58:0x0115, B:60:0x0126, B:62:0x012e, B:63:0x0147, B:66:0x015a, B:72:0x016d, B:77:0x0177, B:79:0x017d, B:80:0x0182, B:71:0x0162, B:55:0x0101, B:46:0x00ed, B:43:0x00e5, B:82:0x0184), top: B:101:0x0093 }] */
    @Override // vk.u
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object get() {
        sd sdVarB;
        Object objA;
        String str;
        int i5;
        Object obj;
        z.c1 c1Var;
        ob obVar;
        if (fb.f32534e == null) {
            Object obj2 = ob.f32917j;
            fb.f32534e = new ub();
        }
        Context context = (Context) ob.f32918k.get();
        if (context == null) {
            synchronized (fb.f32532c) {
            }
            throw new IllegalStateException("Must call PhenotypeContext.setContext() first");
        }
        ob obVar2 = ob.f32919l;
        Object objC = null;
        if (obVar2 == null) {
            Context context2 = context.getApplicationContext();
            try {
                Intrinsics.g(context2, "context");
                Context applicationContext = context2.getApplicationContext();
                Intrinsics.f(applicationContext, "getApplicationContext(...)");
                Class<?> cls = applicationContext.getClass();
                new StringBuilder(String.valueOf(cls).length() + 72);
                cls.toString();
                throw new IllegalStateException("Given application context does not implement GeneratedComponentManager: ".concat(String.valueOf(cls)));
            } catch (IllegalStateException unused) {
                synchronized (ob.f32917j) {
                    try {
                        if (ob.f32919l != null) {
                            obVar = ob.f32919l;
                        } else {
                            obVar = (ob) new pb(context2, 0).get();
                            ob.f32919l = obVar;
                            fb.g(Level.CONFIG, obVar.a(), null, "Application doesn't implement PhenotypeApplication interface, falling back to globally set context. See go/phenotype-flag#process-stable-init for more info.", new Object[0]);
                        }
                        obVar2 = obVar;
                    } finally {
                    }
                }
            }
        }
        int i11 = this.f32612c;
        if (i11 == -1 || i11 < ((AtomicInteger) this.f32613d.f32451b).get()) {
            synchronized (this) {
                try {
                    int i12 = this.f32612c;
                    if (i12 == -1) {
                        ob.b();
                        obVar2.getClass();
                        sdVarB = this.f32611b.b(obVar2);
                        this.f32613d = sdVarB.f33066g;
                    } else {
                        sdVarB = null;
                    }
                    int i13 = ((AtomicInteger) this.f32613d.f32451b).get();
                    if (i12 < i13) {
                        ob.b();
                        obVar2.getClass();
                        vk.k kVarD = lb.d(obVar2.f32922b);
                        if (kVarD.b()) {
                            kb kbVar = (kb) kVarD.a();
                            Uri uriA = mb.a();
                            String str2 = this.f32610a;
                            if (uriA != null) {
                                c1Var = (z.c1) kbVar.f32731a.get(uriA.toString());
                            } else {
                                kbVar.getClass();
                                c1Var = null;
                            }
                            String str3 = c1Var == null ? null : (String) c1Var.get(str2);
                            if (str3 == null) {
                                objA = null;
                                if (sdVarB == null) {
                                    sdVarB = this.f32611b.b(obVar2);
                                }
                                str = sdVarB.f33062c;
                                i5 = 1;
                                if (!obVar2.f32922b.getPackageName().equals("com.android.vending") && !str.startsWith("com.google.android.gms.measurement#")) {
                                    ListenableFuture listenableFutureSubmit = ((cl.t) obVar2.a()).submit(new vd(obVar2, str));
                                    listenableFutureSubmit.b(new zd(listenableFutureSubmit, i5), cl.m0.f20038a);
                                }
                                obj = ((xk.w2) sdVarB.a().f32795d).get(this.f32610a);
                                if (obj != null) {
                                    try {
                                        objC = c(obj);
                                    } catch (IOException | ClassCastException e3) {
                                        Log.e("FilePhenotypeFlags", "Invalid Phenotype flag value for flag ".concat(this.f32610a), e3);
                                    }
                                }
                                if (true == kVarD.b()) {
                                    objA = objC;
                                }
                                if (objA == null) {
                                    objA = a();
                                }
                                if (objA != null) {
                                    e(objA);
                                    this.f32612c = i13;
                                }
                            } else {
                                try {
                                    objA = b(str3);
                                } catch (IOException | IllegalArgumentException e11) {
                                    Log.e("FilePhenotypeFlags", "Invalid Phenotype flag value for flag ".concat(this.f32610a), e11);
                                }
                                if (sdVarB == null) {
                                }
                                str = sdVarB.f33062c;
                                i5 = 1;
                                if (!obVar2.f32922b.getPackageName().equals("com.android.vending")) {
                                    ListenableFuture listenableFutureSubmit2 = ((cl.t) obVar2.a()).submit(new vd(obVar2, str));
                                    listenableFutureSubmit2.b(new zd(listenableFutureSubmit2, i5), cl.m0.f20038a);
                                }
                                obj = ((xk.w2) sdVarB.a().f32795d).get(this.f32610a);
                                if (obj != null) {
                                }
                                if (true == kVarD.b()) {
                                }
                                if (objA == null) {
                                }
                                if (objA != null) {
                                }
                            }
                        }
                    } else {
                        objA = d();
                    }
                } finally {
                }
            }
        } else {
            objA = d();
        }
        objA.getClass();
        return objA;
    }
}
