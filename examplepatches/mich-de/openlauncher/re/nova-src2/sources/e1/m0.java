package e1;

import android.content.Context;
import android.os.Handler;
import android.view.MotionEvent;
import b.u4;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.google.android.libraries.places.api.Places;
import com.nimbusds.jose.shaded.gson.JsonIOException;
import io.sentry.ILogger;
import io.sentry.b3;
import io.sentry.f4;
import io.sentry.j4;
import io.sentry.q4;
import io.sentry.w3;
import java.lang.reflect.Constructor;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;
import java.util.function.Supplier;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.g2;

/* loaded from: classes2.dex */
public final class m0 implements fc.f, ib0.f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51336a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f51337b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f51338c;

    /* renamed from: d, reason: collision with root package name */
    public Object f51339d;

    public /* synthetic */ m0(int i5, Object obj, Object obj2) {
        this.f51336a = i5;
        this.f51338c = obj;
        this.f51339d = obj2;
    }

    public static String c(Class cls) {
        int modifiers = cls.getModifiers();
        if (Modifier.isInterface(modifiers)) {
            return "Interfaces can't be instantiated! Register an InstanceCreator or a TypeAdapter for this type. Interface name: ".concat(cls.getName());
        }
        if (!Modifier.isAbstract(modifiers)) {
            return null;
        }
        return "Abstract classes can't be instantiated! Adjust the R8 configuration or register an InstanceCreator or a TypeAdapter for this type. Class name: " + cls.getName() + "\nSee " + "https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("r8-abstract-class");
    }

    public static m0 d(b3 b3Var, w3 w3Var) {
        m0 m0Var = new m0(w3Var.getLogger());
        io.sentry.protocol.c cVar = b3Var.f67683b;
        j4 j4VarA = cVar.a();
        m0Var.m("sentry-trace_id", j4VarA != null ? j4VarA.f67352a.toString() : null);
        m0Var.m("sentry-public_key", w3Var.retrieveParsedDsn().f67663b);
        m0Var.m("sentry-release", b3Var.f67687f);
        m0Var.m("sentry-environment", b3Var.f67688g);
        io.sentry.protocol.f0 f0Var = b3Var.f67690i;
        m0Var.m("sentry-user_segment", f0Var != null ? k(f0Var) : null);
        m0Var.m("sentry-transaction", b3Var.f67121v);
        m0Var.m("sentry-sample_rate", null);
        m0Var.m("sentry-sampled", null);
        V v11 = cVar.get("replay_id");
        if (v11 != 0 && !v11.toString().equals(io.sentry.protocol.u.f67620b.toString())) {
            m0Var.m("sentry-replay_id", v11.toString());
            cVar.remove("replay_id");
        }
        m0Var.f51337b = false;
        return m0Var;
    }

    public static String k(io.sentry.protocol.f0 f0Var) {
        String str = f0Var.f67499d;
        if (str != null) {
            return str;
        }
        ConcurrentHashMap concurrentHashMap = f0Var.f67503h;
        if (concurrentHashMap != null) {
            return (String) concurrentHashMap.get("segment");
        }
        return null;
    }

    public boolean a(long j11) {
        Object obj;
        List list = (List) ((og.i) this.f51339d).f80412b;
        int size = list.size();
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                obj = null;
                break;
            }
            obj = list.get(i5);
            if (v2.g0.g(((v2.v) obj).f92006a, j11)) {
                break;
            }
            i5++;
        }
        v2.v vVar = (v2.v) obj;
        if (vVar != null) {
            return vVar.f92013h;
        }
        return false;
    }

    public void b() {
        ((v70.i) this.f51338c).g(true, new CancellationException("onBack cancelled"));
        ((g2) this.f51339d).c(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x0107  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ep.p e(jp.a aVar, boolean z11) throws NoSuchMethodException, SecurityException {
        String str;
        ep.p aVar2;
        final Type type = aVar.f69630b;
        Class cls = aVar.f69629a;
        HashMap map = (HashMap) this.f51338c;
        if (map.get(type) != null) {
            throw new ClassCastException();
        }
        if (map.get(cls) != null) {
            throw new ClassCastException();
        }
        final int i5 = 1;
        final int i11 = 0;
        ep.p iVar = null;
        ep.p pVar = EnumSet.class.isAssignableFrom(cls) ? new ep.p() { // from class: ep.b
            @Override // ep.p
            public final Object a() {
                switch (i11) {
                    case 0:
                        Type type2 = type;
                        if (!(type2 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                        }
                        Type type3 = ((ParameterizedType) type2).getActualTypeArguments()[0];
                        if (type3 instanceof Class) {
                            return EnumSet.noneOf((Class) type3);
                        }
                        throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                    default:
                        Type type4 = type;
                        if (!(type4 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                        }
                        Type type5 = ((ParameterizedType) type4).getActualTypeArguments()[0];
                        if (type5 instanceof Class) {
                            return new EnumMap((Class) type5);
                        }
                        throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                }
            }
        } : cls == EnumMap.class ? new ep.p() { // from class: ep.b
            @Override // ep.p
            public final Object a() {
                switch (i5) {
                    case 0:
                        Type type2 = type;
                        if (!(type2 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                        }
                        Type type3 = ((ParameterizedType) type2).getActualTypeArguments()[0];
                        if (type3 instanceof Class) {
                            return EnumSet.noneOf((Class) type3);
                        }
                        throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                    default:
                        Type type4 = type;
                        if (!(type4 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                        }
                        Type type5 = ((ParameterizedType) type4).getActualTypeArguments()[0];
                        if (type5 instanceof Class) {
                            return new EnumMap((Class) type5);
                        }
                        throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                }
            }
        } : null;
        if (pVar != null) {
            return pVar;
        }
        ep.i.f((ArrayList) this.f51339d);
        int i12 = 27;
        if (Modifier.isAbstract(cls.getModifiers())) {
            aVar2 = null;
        } else {
            try {
                Constructor declaredConstructor = cls.getDeclaredConstructor(null);
                g90.k kVar = hp.c.f59955a;
                try {
                    declaredConstructor.setAccessible(true);
                    str = null;
                } catch (Exception e3) {
                    str = "Failed making constructor '" + hp.c.b(declaredConstructor) + "' accessible; either increase its visibility or write a custom InstanceCreator or TypeAdapter for its declaring type: " + e3.getMessage() + hp.c.e(e3);
                }
                aVar2 = str != null ? new ep.a(str, i5) : new ae.i(declaredConstructor, i12);
            } catch (NoSuchMethodException unused) {
            }
        }
        if (aVar2 != null) {
            return aVar2;
        }
        int i13 = 26;
        if (Collection.class.isAssignableFrom(cls)) {
            if (cls.isAssignableFrom(ArrayList.class)) {
                iVar = new a5.i(28);
            } else if (cls.isAssignableFrom(LinkedHashSet.class)) {
                iVar = new a5.i(29);
            } else if (cls.isAssignableFrom(TreeSet.class)) {
                iVar = new ep.c(i11);
            } else if (cls.isAssignableFrom(ArrayDeque.class)) {
                iVar = new a5.i(23);
            }
        } else if (Map.class.isAssignableFrom(cls)) {
            if (cls.isAssignableFrom(ep.o.class)) {
                if (type instanceof ParameterizedType) {
                    Type[] actualTypeArguments = ((ParameterizedType) type).getActualTypeArguments();
                    if (actualTypeArguments.length != 0 && ep.i.h(actualTypeArguments[0]) == String.class) {
                    }
                }
                iVar = new a5.i(22);
            } else if (cls.isAssignableFrom(LinkedHashMap.class)) {
                iVar = new a5.i(24);
            } else if (cls.isAssignableFrom(TreeMap.class)) {
                iVar = new a5.i(25);
            } else if (cls.isAssignableFrom(ConcurrentHashMap.class)) {
                iVar = new a5.i(i13);
            } else if (cls.isAssignableFrom(ConcurrentSkipListMap.class)) {
                iVar = new a5.i(i12);
            }
        }
        if (iVar != null) {
            return iVar;
        }
        String strC = c(cls);
        if (strC != null) {
            return new ep.a(strC, 2);
        }
        if (!z11) {
            return new ep.a("Unable to create instance of " + cls + "; Register an InstanceCreator or a TypeAdapter for this type.", 3);
        }
        if (this.f51337b) {
            return new ae.i(cls, i13);
        }
        String strE = "Unable to create instance of " + cls + "; usage of JDK Unsafe is disabled. Registering an InstanceCreator or a TypeAdapter for this type, adding a no-args constructor, or enabling usage of JDK Unsafe may fix this problem.";
        if (cls.getDeclaredConstructors().length == 0) {
            strE = b.c0.E(strE, " Or adjust your R8 configuration to keep the no-args constructor of the class.");
        }
        return new ep.a(strE, i11);
    }

    public String f(String str) {
        return (String) ((Map) this.f51338c).get(str);
    }

    public z.v g() {
        return (z.v) this.f51338c;
    }

    public i h() {
        aq.y yVar = (aq.y) this.f51339d;
        int i5 = yVar.f15537b;
        int i11 = yVar.f15538c;
        return i5 < i11 ? i.f51309b : i5 > i11 ? i.f51308a : i.f51310c;
    }

    public MotionEvent i() {
        return (MotionEvent) ((og.i) this.f51339d).f80413c;
    }

    @Override // ib0.f
    public void j(long j11) {
        switch (this.f51336a) {
            case 8:
                if (this.f51337b || j11 <= 0) {
                    return;
                }
                this.f51337b = true;
                nb0.f fVar = (nb0.f) this.f51339d;
                fVar.f78115e.c(this.f51338c);
                fVar.j(1L);
                return;
            default:
                if (this.f51337b) {
                    return;
                }
                if (j11 < 0) {
                    throw new IllegalStateException(u4.g(j11, "n >= required but it was "));
                }
                if (j11 == 0) {
                    return;
                }
                this.f51337b = true;
                ib0.h hVar = (ib0.h) this.f51338c;
                if (hVar.f61509a.f85789b) {
                    return;
                }
                Object obj = this.f51339d;
                try {
                    hVar.c(obj);
                    if (hVar.f61509a.f85789b) {
                        return;
                    }
                    hVar.onCompleted();
                    return;
                } catch (Throwable th2) {
                    g90.k.h0(th2, hVar, obj);
                    return;
                }
        }
    }

    public boolean l() {
        return this.f51337b;
    }

    public void m(String str, String str2) {
        if (this.f51337b) {
            ((Map) this.f51338c).put(str, str2);
        }
    }

    public void n() {
        fe.a aVar = (fe.a) this.f51339d;
        Context context = (Context) this.f51338c;
        if (this.f51337b) {
            context.unregisterReceiver(aVar);
            this.f51337b = false;
        }
    }

    @Override // fc.f
    public void o(ArrayList arrayList, boolean z11) {
        dy.d dVar;
        ((gc.b) this.f51339d).n = z11;
        int size = arrayList.size();
        boolean z12 = this.f51337b || ((gc.b) this.f51339d).f57340m > ((gc.b) this.f51339d).f57339l;
        if (z11) {
            boolean z13 = ((gc.b) this.f51339d).f57336i.get() > 0;
            ((gc.b) this.f51339d).f57336i.set(0);
            gc.b bVar = (gc.b) this.f51339d;
            if (!arrayList.isEmpty()) {
                synchronized (bVar.f57333f) {
                    for (int i5 = 0; i5 < arrayList.size(); i5++) {
                        try {
                            bVar.f57333f.add(((fc.h) arrayList.get(i5)).lt());
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                }
                gc.e eVar = bVar.f57329b;
                if (!eVar.f57350e.hasMessages(BackupConstant.SCENE_CLOSED_WITHOUT_SHOW, bVar)) {
                    eVar.f57350e.sendMessageDelayed(eVar.f57350e.obtainMessage(BackupConstant.SCENE_CLOSED_WITHOUT_SHOW, bVar), eVar.f57347b.ul());
                }
            }
            gc.b bVar2 = (gc.b) this.f51339d;
            bVar2.f57329b.e(bVar2, z12, true, z13);
        } else {
            ((gc.b) this.f51339d).f57336i.getAndAdd(1);
            gc.b bVar3 = (gc.b) this.f51339d;
            if (!arrayList.isEmpty()) {
                synchronized (bVar3.f57334g) {
                    for (int i11 = 0; i11 < arrayList.size(); i11++) {
                        try {
                            bVar3.f57334g.add(((fc.h) arrayList.get(i11)).lt());
                        } catch (Throwable th3) {
                            throw th3;
                        }
                    }
                }
                gc.e eVar2 = bVar3.f57329b;
                if (!eVar2.f57350e.hasMessages(1004, bVar3)) {
                    eVar2.f57350e.sendMessageDelayed(eVar2.f57350e.obtainMessage(1004, bVar3), eVar2.f57347b.ul());
                }
            }
            gc.b bVar4 = (gc.b) this.f51339d;
            bVar4.f57329b.e(bVar4, z12, false, false);
        }
        fc.f fVar = (fc.f) this.f51338c;
        if (fVar != null) {
            fVar.o(arrayList, z11);
        }
        if (!z11 || (dVar = ((gc.b) this.f51339d).f57337j) == null) {
            return;
        }
        dVar.f(2, size);
    }

    public void p(boolean z11) {
        this.f51337b = z11;
    }

    public void q(f4 f4Var, io.sentry.protocol.f0 f0Var, io.sentry.protocol.u uVar, w3 w3Var, tm.o oVar) {
        m("sentry-trace_id", f4Var.f67225b.f67316c.f67352a.toString());
        m("sentry-public_key", w3Var.retrieveParsedDsn().f67663b);
        m("sentry-release", w3Var.getRelease());
        m("sentry-environment", w3Var.getEnvironment());
        m("sentry-user_segment", f0Var != null ? k(f0Var) : null);
        io.sentry.protocol.d0 d0Var = f4Var.n;
        m("sentry-transaction", (d0Var == null || io.sentry.protocol.d0.URL.equals(d0Var)) ? null : f4Var.f67228e);
        if (uVar != null && !io.sentry.protocol.u.f67620b.equals(uVar)) {
            m("sentry-replay_id", uVar.toString());
        }
        Double d5 = oVar == null ? null : (Double) oVar.f89493b;
        m("sentry-sample_rate", !ic.b.N(d5, false) ? null : new DecimalFormat("#.################", DecimalFormatSymbols.getInstance(Locale.ROOT)).format(d5));
        Boolean bool = oVar == null ? null : (Boolean) oVar.f89494c;
        m("sentry-sampled", bool != null ? bool.toString() : null);
    }

    public boolean r(m0 m0Var) {
        if (((s) this.f51338c) == null || m0Var == null || this.f51337b != m0Var.f51337b) {
            return true;
        }
        aq.y yVar = (aq.y) this.f51339d;
        aq.y yVar2 = (aq.y) m0Var.f51339d;
        return (yVar.f15537b == yVar2.f15537b && yVar.f15538c == yVar2.f15538c) ? false : true;
    }

    public q4 s() {
        String strF = f("sentry-trace_id");
        String strF2 = f("sentry-replay_id");
        String strF3 = f("sentry-public_key");
        if (strF == null || strF3 == null) {
            return null;
        }
        q4 q4Var = new q4(new io.sentry.protocol.u(strF), strF3, f("sentry-release"), f("sentry-environment"), f("sentry-user_id"), f("sentry-user_segment"), f("sentry-transaction"), f("sentry-sample_rate"), f("sentry-sampled"), strF2 != null ? new io.sentry.protocol.u(strF2) : null);
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        for (Map.Entry entry : ((Map) this.f51338c).entrySet()) {
            String str = (String) entry.getKey();
            String str2 = (String) entry.getValue();
            if (!io.sentry.c.f67127a.contains(str) && str2 != null) {
                concurrentHashMap.put(str.replaceFirst("sentry-", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), str2);
            }
        }
        q4Var.f67677k = concurrentHashMap;
        return q4Var;
    }

    public String toString() {
        switch (this.f51336a) {
            case 0:
                return "SingleSelectionLayout(isStartHandle=" + this.f51337b + ", crossed=" + h() + ", info=\n\t" + ((aq.y) this.f51339d) + ')';
            case 1:
                return ((HashMap) this.f51338c).toString();
            default:
                return super.toString();
        }
    }

    public /* synthetic */ m0(Map map, boolean z11, Object obj, int i5) {
        this.f51336a = i5;
        this.f51338c = map;
        this.f51337b = z11;
        this.f51339d = obj;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public m0(ILogger iLogger) {
        this((Map) new HashMap(), true, (Object) iLogger, 6);
        this.f51336a = 6;
    }

    public m0(String str, Set autocompleteCountries) {
        boolean z11;
        this.f51336a = 7;
        try {
            int i5 = Places.f33999a;
            z11 = true;
        } catch (Exception unused) {
            z11 = false;
        }
        Intrinsics.g(autocompleteCountries, "autocompleteCountries");
        this.f51338c = str;
        this.f51339d = autocompleteCountries;
        this.f51337b = z11;
    }

    public m0(Context context, Handler handler, fe.x xVar) {
        this.f51336a = 2;
        this.f51338c = context.getApplicationContext();
        this.f51339d = new fe.a(this, handler, xVar);
    }

    public m0(Supplier supplier) {
        this.f51336a = 4;
        this.f51338c = supplier;
    }

    public m0(t70.j0 j0Var, boolean z11, Function2 function2, h.n nVar) {
        this.f51336a = 5;
        this.f51337b = z11;
        this.f51338c = v70.o.b(-2, 4, v70.a.f92141a);
        this.f51339d = t70.m0.t(j0Var, null, null, new h.m(nVar, function2, this, null), 3);
    }

    public m0(boolean z11, s sVar, aq.y yVar) {
        this.f51336a = 0;
        this.f51337b = z11;
        this.f51338c = sVar;
        this.f51339d = yVar;
    }

    public m0(gc.b bVar, boolean z11, fc.f fVar) {
        this.f51336a = 3;
        this.f51339d = bVar;
        this.f51337b = z11;
        this.f51338c = fVar;
    }
}
