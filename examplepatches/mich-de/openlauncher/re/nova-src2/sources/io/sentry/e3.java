package io.sentry;

import ads_mobile_sdk.su0;
import ads_mobile_sdk.xu0;
import android.database.Cursor;
import android.os.Bundle;
import android.util.SparseArray;
import android.widget.EditText;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.measurement.internal.zzoh;
import com.google.common.util.concurrent.ListenableFuture;
import com.stripe.android.cards.Bin;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteCursor;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.io.Writer;
import java.lang.ref.ReferenceQueue;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.logging.Logger;
import kotlin.Result;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.properties.ReadWriteProperty;
import kotlin.reflect.KProperty;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import tech.units.indriya.function.DefaultNumberSystem;

/* loaded from: classes4.dex */
public final class e3 implements ReadWriteProperty, cl.t0, cl.c0, eb0.g, o9.z1, g60.b, hq.e, io.branch.requery.android.database.sqlite.n, y1, kk.c, d9.g {

    /* renamed from: d, reason: collision with root package name */
    public static volatile e3 f67206d;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67207a;

    /* renamed from: b, reason: collision with root package name */
    public Object f67208b;

    /* renamed from: c, reason: collision with root package name */
    public Object f67209c;

    public /* synthetic */ e3(int i5, Object obj, Object obj2) {
        this.f67207a = i5;
        this.f67208b = obj;
        this.f67209c = obj2;
    }

    public static e3 m() {
        if (f67206d == null) {
            synchronized (e3.class) {
                try {
                    if (f67206d == null) {
                        f67206d = new e3(0, (byte) 0);
                    }
                } finally {
                }
            }
        }
        return f67206d;
    }

    public static e3 q(Number number) {
        ic0.c cVarA = fc0.i.a();
        e3 e3Var = new e3(cVarA);
        Objects.requireNonNull(number);
        e3Var.f67209c = ((DefaultNumberSystem) cVarA).i(number);
        return e3Var;
    }

    public static e3 r(String... strArr) {
        try {
            m90.j[] jVarArr = new m90.j[strArr.length];
            m90.g gVar = new m90.g();
            for (int i5 = 0; i5 < strArr.length; i5++) {
                aq.w.K(gVar, strArr[i5]);
                gVar.readByte();
                jVarArr[i5] = gVar.H(gVar.f76126b);
            }
            String[] strArr2 = (String[]) strArr.clone();
            int i11 = m90.x.f76171d;
            return new e3(5, strArr2, ab.e0.K(jVarArr));
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    public e3 A(String str) {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        if (str == null) {
            cVar.d();
            return this;
        }
        cVar.h();
        cVar.a();
        cVar.f(str);
        return this;
    }

    public e3 B(boolean z11) {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        cVar.h();
        cVar.a();
        cVar.f67884a.write(z11 ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
        return this;
    }

    public void a(bg.a adError) {
        Intrinsics.g(adError, "adError");
        if (((AtomicBoolean) this.f67208b).getAndSet(true)) {
            return;
        }
        t70.m mVar = (t70.m) this.f67209c;
        int i5 = Result.f71687b;
        mVar.resumeWith(new su0(new ni.w(adError.f17861a, adError.f17862b, adError.f17863c)));
    }

    @Override // hq.e
    public w70.o1 b() {
        return (w70.o1) this.f67209c;
    }

    @Override // o9.z1
    public void c(fa.p pVar) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = (ArrayList) this.f67208b;
        if (!arrayList3.isEmpty()) {
            int i5 = ((ga.e) h6.c1.l(arrayList3, 1)).f57292d;
            Iterator it = arrayList3.iterator();
            while (it.hasNext()) {
                ga.e eVar = (ga.e) it.next();
                if (eVar.f57292d == i5) {
                    arrayList.add(eVar);
                } else {
                    arrayList2.add(eVar);
                }
            }
        }
        pVar.A((ya.p) this.f67209c, arrayList2, arrayList);
    }

    @Override // cl.c0
    public ListenableFuture call() {
        cl.p0 p0Var = (cl.p0) this.f67208b;
        int i5 = cl.p0.f20054e;
        if (p0Var.compareAndSet(cl.o0.f20048a, cl.o0.f20050c)) {
            return ((cl.c0) this.f67209c).call();
        }
        cl.x0 x0Var = cl.x0.f20087h;
        return x0Var != null ? x0Var : new cl.x0();
    }

    @Override // hq.e
    public Object d(hq.f fVar, Continuation continuation) {
        Bin bin = fVar.f59967g;
        if (bin == null) {
            return null;
        }
        Object obj = ((hq.t) this.f67208b).f60021a.get(bin);
        if (obj == null) {
            obj = EmptyList.f71733a;
        }
        return obj == CoroutineSingletons.f71806a ? obj : (List) obj;
    }

    @Override // eb0.g
    public void e(eb0.d dVar, Throwable th2) {
        ((eb0.n) this.f67209c).f52590a.execute(new androidx.fragment.app.d(14, this, (eb0.g) this.f67208b, th2));
    }

    public e3 f() {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        cVar.h();
        cVar.a();
        int i5 = cVar.f67886c;
        int[] iArr = cVar.f67885b;
        if (i5 == iArr.length) {
            cVar.f67885b = Arrays.copyOf(iArr, i5 * 2);
        }
        int[] iArr2 = cVar.f67885b;
        int i11 = cVar.f67886c;
        cVar.f67886c = i11 + 1;
        iArr2[i11] = 3;
        cVar.f67884a.write(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        return this;
    }

    public com.google.protobuf.j g() {
        if (((com.google.protobuf.r) this.f67208b).g0() == 0) {
            return new com.google.protobuf.j((byte[]) this.f67209c);
        }
        throw new IllegalStateException("Did not write as much data as expected.");
    }

    @Override // kotlin.properties.ReadOnlyProperty
    public Object getValue(Object thisRef, KProperty property) {
        Object obj;
        Intrinsics.g(thisRef, "thisRef");
        Intrinsics.g(property, "property");
        synchronized (this) {
            obj = this.f67209c;
        }
        return obj;
    }

    public void h() {
        this.f67208b = null;
        this.f67209c = null;
    }

    public e3 i() {
        ((io.sentry.vendor.gson.stream.c) this.f67208b).b(3, 5, AbstractJsonLexerKt.END_OBJ);
        return this;
    }

    @Override // d9.g
    public void j(d9.j jVar, int i5) {
        cm.f fVar = (cm.f) this.f67209c;
        mx.z zVar = (mx.z) ((mx.a0) this.f67208b).f76998c.get(i5);
        gz.e eVar = zVar.f77284f;
        String str = zVar.f77280b;
        CharSequence charSequence = zVar.f77281c;
        if (eVar == gz.e.f58645c) {
            fVar.D(charSequence, eVar, "com.teslacoilsw.launcher", str);
        } else {
            fVar.D(charSequence, eVar, str, null);
        }
        jVar.dismiss();
    }

    public double k() {
        ag agVar = new ag();
        agVar.f32386b = new double[5];
        agVar.f32385a = -1;
        int i5 = 0;
        while (true) {
            l80.e[] eVarArr = (l80.e[]) this.f67208b;
            if (i5 >= eVarArr.length) {
                if (agVar.f32385a + 1 <= 1) {
                    return agVar.n();
                }
                throw new IllegalArgumentException("Invalid number of items on the output queue. Might be caused by an invalid number of arguments for a function.");
            }
            l80.e eVar = eVarArr[i5];
            int i11 = eVar.f74797a;
            if (i11 == 1) {
                agVar.o(((l80.c) eVar).f74795b);
            } else if (i11 == 6) {
                String str = ((l80.f) eVar).f74798b;
                Double d5 = (Double) ((HashMap) this.f67209c).get(str);
                if (d5 == null) {
                    throw new IllegalArgumentException(b.c0.l("No value has been set for the setVariable '", str, "'."));
                }
                agVar.o(d5.doubleValue());
            } else if (i11 == 2) {
                k80.a aVar = ((l80.d) eVar).f74796b;
                int i12 = agVar.f32385a + 1;
                int i13 = aVar.f71200a;
                if (i12 < i13) {
                    throw new IllegalArgumentException(b.c0.q(new StringBuilder("Invalid number of operands available for '"), aVar.f71202c, "' operator"));
                }
                if (i13 == 2) {
                    agVar.o(aVar.a(agVar.n(), agVar.n()));
                } else if (i13 == 1) {
                    agVar.o(aVar.a(agVar.n()));
                }
            } else if (i11 != 3) {
                continue;
            } else {
                j80.a aVar2 = ((l80.b) eVar).f74794b;
                int i14 = aVar2.f69153b;
                if (agVar.f32385a + 1 < i14) {
                    throw new IllegalArgumentException(b.c0.q(new StringBuilder("Invalid number of arguments available for '"), aVar2.f69152a, "' function"));
                }
                double[] dArr = new double[i14];
                for (int i15 = i14 - 1; i15 >= 0; i15--) {
                    dArr[i15] = agVar.n();
                }
                agVar.o(aVar2.a(dArr));
            }
            i5++;
        }
    }

    public com.google.protobuf.r l() {
        return (com.google.protobuf.r) this.f67208b;
    }

    public void n(Number number) {
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) ((ic0.c) this.f67208b);
        this.f67209c = defaultNumberSystem.g((Number) this.f67209c, defaultNumberSystem.i(number));
    }

    public e3 o(String str) {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        if (str == null) {
            cVar.getClass();
            throw new NullPointerException("name == null");
        }
        if (cVar.f67890g != null) {
            throw new IllegalStateException();
        }
        if (cVar.f67886c == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        cVar.f67890g = str;
        return this;
    }

    @Override // cl.t0
    public void onFailure(Throwable th2) {
        ai.t2 t2Var = (ai.t2) this.f67209c;
        t2Var.D();
        ai.m1 m1Var = (ai.m1) t2Var.f13368a;
        t2Var.f13343i = false;
        t2Var.b0().add((zzoh) this.f67208b);
        if (t2Var.f13344j > ((Integer) ai.x.f13448v0.a(null)).intValue()) {
            t2Var.f13344j = 1;
            ai.o0 o0Var = m1Var.f13138f;
            ai.m1.l(o0Var);
            o0Var.f13193i.c(ai.o0.L(m1Var.q().J()), "registerTriggerAsync failed. May try later. App ID, throwable", ai.o0.L(th2.toString()));
            return;
        }
        ai.o0 o0Var2 = m1Var.f13138f;
        ai.m1.l(o0Var2);
        o0Var2.f13193i.d("registerTriggerAsync failed. App ID, delay in seconds, throwable", ai.o0.L(m1Var.q().J()), ai.o0.L(String.valueOf(t2Var.f13344j)), ai.o0.L(th2.toString()));
        int i5 = t2Var.f13344j;
        if (t2Var.f13345k == null) {
            t2Var.f13345k = new ai.g2(t2Var, m1Var, 1);
        }
        t2Var.f13345k.b(i5 * 1000);
        int i11 = t2Var.f13344j;
        t2Var.f13344j = i11 + i11;
    }

    @Override // cl.t0
    public void onSuccess(Object obj) {
        ai.t2 t2Var = (ai.t2) this.f67209c;
        t2Var.D();
        ai.m1 m1Var = (ai.m1) t2Var.f13368a;
        ai.z0 z0Var = m1Var.f13137e;
        ai.m1.j(z0Var);
        SparseArray sparseArrayJ = z0Var.J();
        zzoh zzohVar = (zzoh) this.f67208b;
        sparseArrayJ.put(zzohVar.f33775h, Long.valueOf(zzohVar.f33774g));
        ai.z0 z0Var2 = m1Var.f13137e;
        ai.m1.j(z0Var2);
        int[] iArr = new int[sparseArrayJ.size()];
        long[] jArr = new long[sparseArrayJ.size()];
        for (int i5 = 0; i5 < sparseArrayJ.size(); i5++) {
            iArr[i5] = sparseArrayJ.keyAt(i5);
            jArr[i5] = ((Long) sparseArrayJ.valueAt(i5)).longValue();
        }
        Bundle bundle = new Bundle();
        bundle.putIntArray("uriSources", iArr);
        bundle.putLongArray("uriTimestamps", jArr);
        z0Var2.n.L0(bundle);
        t2Var.f13343i = false;
        t2Var.f13344j = 1;
        ai.o0 o0Var = m1Var.f13138f;
        ai.m1.l(o0Var);
        o0Var.f13197m.b(zzohVar.f33773f, "Successfully registered trigger URI");
        t2Var.c0();
    }

    public Cursor p(SQLiteDatabase sQLiteDatabase, fl.l lVar, String str, io.branch.requery.android.database.sqlite.u uVar) {
        ((d7.f) this.f67208b).b(uVar);
        SQLiteDatabase sQLiteDatabase2 = (SQLiteDatabase) this.f67209c;
        return sQLiteDatabase2.mCursorFactory == null ? new SQLiteCursor(lVar, str, uVar) : ((e3) sQLiteDatabase2.mCursorFactory).p(sQLiteDatabase, lVar, str, uVar);
    }

    public n4 s() {
        return (n4) ((LinkedBlockingDeque) this.f67208b).peek();
    }

    @Override // kotlin.properties.ReadWriteProperty
    public void setValue(Object thisRef, KProperty property, Object obj) {
        Intrinsics.g(thisRef, "thisRef");
        Intrinsics.g(property, "property");
        synchronized (this) {
            this.f67209c = obj;
            Function1 function1 = (Function1) this.f67208b;
            if (function1 != null) {
                function1.invoke(obj);
                Unit unit = Unit.f71706a;
            }
        }
    }

    public Number t() {
        return ((DefaultNumberSystem) ((ic0.c) this.f67208b)).i((Number) this.f67209c);
    }

    public String toString() {
        switch (this.f67207a) {
            case 7:
                return ((cl.c0) this.f67209c).toString();
            case 10:
                String string = "[ ";
                if (((e4.f) this.f67208b) != null) {
                    for (int i5 = 0; i5 < 9; i5++) {
                        StringBuilder sbQ = a2.c.q(string);
                        sbQ.append(((e4.f) this.f67208b).f52162h[i5]);
                        sbQ.append(" ");
                        string = sbQ.toString();
                    }
                }
                StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(string, "] ");
                sbK.append((e4.f) this.f67208b);
                return sbK.toString();
            case 28:
                Object obj = this.f67209c;
                lx.c cVar = lx.c.f75157a;
                if (obj == cVar) {
                    return "Lazy value not initialized yet.";
                }
                if (obj == cVar) {
                    this.f67209c = ((n0.w) this.f67208b).invoke();
                }
                return String.valueOf(this.f67209c);
            default:
                return super.toString();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0079  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public i80.a u() {
        l80.e[] eVarArr = (l80.e[]) this.f67208b;
        ArrayList arrayList = new ArrayList(0);
        for (l80.e eVar : eVarArr) {
            if (eVar.f74797a == 6) {
                String str = ((l80.f) eVar).f74798b;
                if (!((HashMap) this.f67209c).containsKey(str)) {
                    arrayList.add("The setVariable '" + str + "' has not been set");
                }
            }
        }
        int i5 = 0;
        for (l80.e eVar2 : eVarArr) {
            int i11 = eVar2.f74797a;
            if (i11 == 1) {
                i5++;
            } else if (i11 != 2) {
                if (i11 == 3) {
                    j80.a aVar = ((l80.b) eVar2).f74794b;
                    int i12 = aVar.f69153b;
                    if (i12 > i5) {
                        arrayList.add("Not enough arguments for '" + aVar.f69152a + "'");
                    }
                    if (i12 > 1) {
                        i5 -= i12 - 1;
                    } else if (i12 == 0) {
                    }
                } else if (i11 == 6) {
                }
            } else if (((l80.d) eVar2).f74796b.f71200a == 2) {
                i5--;
            }
            if (i5 < 1) {
                arrayList.add("Too many operators");
                return new i80.a(arrayList, false);
            }
        }
        if (i5 > 1) {
            arrayList.add("Too many operands");
        }
        return arrayList.size() == 0 ? i80.a.f61457b : new i80.a(arrayList, false);
    }

    public e3 v(double d5) throws IOException {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        cVar.h();
        if (cVar.f67889f || !(Double.isNaN(d5) || Double.isInfinite(d5))) {
            cVar.a();
            cVar.f67884a.append((CharSequence) Double.toString(d5));
            return this;
        }
        throw new IllegalArgumentException("Numeric values must be finite, but was " + d5);
    }

    public e3 w(long j11) throws IOException {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        cVar.h();
        cVar.a();
        cVar.f67884a.write(Long.toString(j11));
        return this;
    }

    public e3 x(ILogger iLogger, Object obj) {
        ((gu.j) this.f67209c).p(this, iLogger, obj);
        return this;
    }

    public e3 y(Boolean bool) throws IOException {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        if (bool == null) {
            cVar.d();
            return this;
        }
        cVar.h();
        cVar.a();
        cVar.f67884a.write(bool.booleanValue() ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
        return this;
    }

    public e3 z(Number number) {
        io.sentry.vendor.gson.stream.c cVar = (io.sentry.vendor.gson.stream.c) this.f67208b;
        if (number == null) {
            cVar.d();
            return this;
        }
        cVar.h();
        String string = number.toString();
        if (cVar.f67889f || !(string.equals("-Infinity") || string.equals("Infinity") || string.equals("NaN"))) {
            cVar.a();
            cVar.f67884a.append((CharSequence) string);
            return this;
        }
        throw new IllegalArgumentException("Numeric values must be finite, but was " + number);
    }

    @Override // kk.c
    public Object zza() {
        return new jk.h(((ai.k4) ((je.f) this.f67208b).f69487b).f13083a, (jk.i) ((kk.c) this.f67209c).zza());
    }

    public /* synthetic */ e3(Object obj, int i5) {
        this.f67207a = i5;
        this.f67209c = obj;
    }

    public /* synthetic */ e3(Object obj, Object obj2, boolean z11, int i5) {
        this.f67207a = i5;
        this.f67208b = obj2;
        this.f67209c = obj;
    }

    /* JADX WARN: Type inference failed for: r7v14, types: [java.lang.Object, java.util.Map] */
    public e3(int i5, byte b11) {
        this.f67207a = i5;
        switch (i5) {
            case 13:
                break;
            case 14:
                this.f67208b = new io.sentry.internal.debugmeta.c((g60.a) new b6.e(6));
                this.f67209c = new io.sentry.internal.debugmeta.c((g60.a) new b6.b());
                break;
            case 23:
                this.f67208b = new HashMap();
                this.f67209c = new ReferenceQueue();
                break;
            case 26:
                e3 e3Var = kl.a.f71558c;
                this.f67208b = new fl.l((fl.l) e3Var.f67208b, (byte) 0);
                this.f67209c = Arrays.copyOf((long[]) e3Var.f67209c, 10);
                break;
            case 27:
                Object obj = iw.b.f68125a;
                this.f67208b = iw.r.a("ZZ", ul.b.Q(new iw.f(iw.m.f68137d, true, null), new iw.f(iw.m.f68138e, false, null), new iw.f(iw.m.f68139f, true, new iw.i(false, iw.o.f68152e))));
                ?? r72 = iw.b.f68125a;
                LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(r72.size()));
                for (Map.Entry entry : r72.entrySet()) {
                    linkedHashMap.put(entry.getKey(), iw.r.a((String) entry.getKey(), ((iw.a) entry.getValue()).a()));
                }
                this.f67209c = linkedHashMap;
                break;
            default:
                this.f67208b = new CopyOnWriteArraySet();
                this.f67209c = new CopyOnWriteArraySet();
                break;
        }
    }

    @Override // eb0.g
    public void a(eb0.d dVar, eb0.p0 p0Var) {
        ((eb0.n) this.f67209c).f52590a.execute(new androidx.fragment.app.d(13, this, (eb0.g) this.f67208b, p0Var));
    }

    public void a() {
        if (((AtomicBoolean) this.f67208b).getAndSet(true)) {
            return;
        }
        t70.m mVar = (t70.m) this.f67209c;
        int i5 = Result.f71687b;
        mVar.resumeWith(new xu0(Unit.f71706a));
    }

    public e3(ILogger iLogger, n4 n4Var) {
        this.f67207a = 22;
        LinkedBlockingDeque linkedBlockingDeque = new LinkedBlockingDeque();
        this.f67208b = linkedBlockingDeque;
        i30.j.Q(iLogger, "logger is required");
        this.f67209c = iLogger;
        linkedBlockingDeque.push(n4Var);
    }

    public e3(w2 w2Var, Collection collection) {
        this.f67207a = 21;
        i30.j.Q(w2Var, "SentryEnvelopeHeader is required.");
        this.f67208b = w2Var;
        i30.j.Q(collection, "SentryEnvelope items are required.");
        this.f67209c = collection;
    }

    public e3(Writer writer, int i5) {
        this.f67207a = 20;
        this.f67208b = new io.sentry.vendor.gson.stream.c(writer);
        this.f67209c = new gu.j(i5);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e3(Boolean bool) {
        this(1, (Object) null, bool);
        this.f67207a = 1;
    }

    public e3(hq.t tVar) {
        this.f67207a = 17;
        this.f67208b = tVar;
        this.f67209c = ps.v.y(Boolean.FALSE);
    }

    public e3(io.sentry.protocol.u uVar, io.sentry.protocol.s sVar, z2 z2Var) {
        this.f67207a = 21;
        this.f67208b = new w2(uVar, sVar, null);
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(z2Var);
        this.f67209c = arrayList;
    }

    public e3(ic0.c cVar) {
        this.f67207a = 15;
        this.f67209c = 0;
        this.f67208b = cVar;
    }

    public e3(l80.e[] eVarArr) {
        this.f67207a = 18;
        this.f67208b = eVarArr;
        HashMap map = new HashMap(4);
        Double dValueOf = Double.valueOf(3.141592653589793d);
        map.put("pi", dValueOf);
        map.put("π", dValueOf);
        map.put("φ", Double.valueOf(1.61803398874d));
        map.put("e", Double.valueOf(2.718281828459045d));
        this.f67209c = map;
    }

    public e3(n0.w wVar) {
        this.f67207a = 28;
        this.f67208b = wVar;
        this.f67209c = lx.c.f75157a;
    }

    public e3(EditText editText) {
        this.f67207a = 6;
        this.f67208b = editText;
        b6.i iVar = new b6.i(editText);
        this.f67209c = iVar;
        editText.addTextChangedListener(iVar);
        if (b6.a.f17561b == null) {
            synchronized (b6.a.f17560a) {
                try {
                    if (b6.a.f17561b == null) {
                        b6.a aVar = new b6.a();
                        try {
                            b6.a.f17562c = Class.forName("android.text.DynamicLayout$ChangeWatcher", false, b6.a.class.getClassLoader());
                        } catch (Throwable unused) {
                        }
                        b6.a.f17561b = aVar;
                    }
                } finally {
                }
            }
        }
        editText.setEditableFactory(b6.a.f17561b);
    }

    public e3(int i5) {
        this.f67207a = 9;
        byte[] bArr = new byte[i5];
        this.f67209c = bArr;
        Logger logger = com.google.protobuf.t.f34970b;
        this.f67208b = new com.google.protobuf.r(bArr, i5);
    }
}
