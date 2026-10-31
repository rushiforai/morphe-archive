package i50;

import ads_mobile_sdk.i6;
import ads_mobile_sdk.p72;
import ae.l;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.os.Build;
import android.os.LocaleList;
import android.os.UserHandle;
import android.os.UserManager;
import android.util.LongSparseArray;
import android.util.SparseBooleanArray;
import android.view.View;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.Owner;
import b.a9;
import b.bd;
import b.i8;
import c9.m;
import coil.request.NullRequestDataException;
import com.google.android.gms.internal.measurement.v6;
import h50.c0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.concurrent.ScheduledExecutorService;
import jx.v;
import k30.d0;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeParameter;
import kotlin.reflect.KTypeProjection;
import kotlin.reflect.KVariance;
import m8.k;
import q3.j;
import q3.n;
import td.q;
import x7.u;
import z.o0;
import z.x;
import z.z0;

/* loaded from: classes.dex */
public final class c implements c0, p1.c, k2.d, vd.b, w8.e {

    /* renamed from: e, reason: collision with root package name */
    public static ea.a f61377e;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61378a;

    /* renamed from: b, reason: collision with root package name */
    public Object f61379b;

    /* renamed from: c, reason: collision with root package name */
    public Object f61380c;

    /* renamed from: d, reason: collision with root package name */
    public Object f61381d;

    public /* synthetic */ c(int i5, Object obj, Object obj2, Object obj3) {
        this.f61378a = i5;
        this.f61379b = obj;
        this.f61380c = obj2;
        this.f61381d = obj3;
    }

    public static final void g(c cVar, Network network, boolean z11) {
        Unit unit;
        boolean z12;
        Network[] allNetworks = ((ConnectivityManager) cVar.f61379b).getAllNetworks();
        int length = allNetworks.length;
        boolean z13 = false;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            Network network2 = allNetworks[i5];
            if (Intrinsics.b(network2, network)) {
                z12 = z11;
            } else {
                NetworkCapabilities networkCapabilities = ((ConnectivityManager) cVar.f61379b).getNetworkCapabilities(network2);
                z12 = networkCapabilities != null && networkCapabilities.hasCapability(12);
            }
            if (z12) {
                z13 = true;
                break;
            }
            i5++;
        }
        m mVar = (m) cVar.f61380c;
        if (((k) mVar.f19877b.get()) != null) {
            mVar.f19879d = z13;
            unit = Unit.f71706a;
        } else {
            unit = null;
        }
        if (unit == null) {
            mVar.a();
        }
    }

    public static x8.e i(x8.k kVar, Throwable th2) {
        Drawable drawableB;
        if (th2 instanceof NullRequestDataException) {
            kVar.getClass();
            x8.b bVar = kVar.f95349z;
            drawableB = bVar.f95291l;
            x8.b bVar2 = c9.e.f19860a;
            if (drawableB == null) {
                drawableB = c9.e.b(kVar, kVar.f95347x, kVar.f95346w, bVar.f95290k);
            }
        } else {
            drawableB = c9.e.b(kVar, kVar.f95347x, kVar.f95346w, kVar.f95349z.f95290k);
        }
        return new x8.e(drawableB, kVar, th2);
    }

    public static boolean s(x8.k kVar, Bitmap.Config config) {
        if (config == Bitmap.Config.HARDWARE) {
            if (!kVar.f95336k) {
                return false;
            }
            z8.b bVar = kVar.f95328c;
            if (bVar instanceof z8.c) {
                View viewC = ((z8.c) bVar).c();
                if (viewC.isAttachedToWindow() && !viewC.isHardwareAccelerated()) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void v(c cVar, n nVar, v vVar, Object obj) {
        cVar.getClass();
        vVar.getClass();
        j jVar = new j(nVar);
        synchronized (((o7.a) cVar.f61381d)) {
            try {
                if (obj == null) {
                    ((o0) cVar.f61380c).m(jVar, new q3.i(null));
                    Unit unit = Unit.f71706a;
                } else {
                    ((x) cVar.f61379b).d(jVar, new q3.i(obj));
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // h50.c0
    public void a(Object obj, c50.e scope) {
        d plugin = (d) obj;
        Intrinsics.g(plugin, "plugin");
        Intrinsics.g(scope, "scope");
        b bVar = new b(plugin.f61382a, scope, plugin.f61383b);
        plugin.f61384c.invoke(bVar);
        plugin.f61385d = bVar.f61376d;
        Iterator it = bVar.f61375c.iterator();
        while (it.hasNext()) {
            e eVar = (e) it.next();
            eVar.getClass();
            eVar.f61386a.b(scope, eVar.f61387b);
        }
    }

    @Override // w8.e
    public boolean b() {
        ConnectivityManager connectivityManager = (ConnectivityManager) this.f61379b;
        for (Network network : connectivityManager.getAllNetworks()) {
            NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(network);
            if (networkCapabilities != null && networkCapabilities.hasCapability(12)) {
                return true;
            }
        }
        return false;
    }

    @Override // p1.c
    public void c(int i5, int i11, int i12) {
        ((LayoutNode) this.f61381d).move$ui_release(i5, i11, i12);
    }

    @Override // p1.c
    public void d(int i5, int i11) {
        ((LayoutNode) this.f61381d).removeAt$ui_release(i5, i11);
    }

    @Override // h50.c0
    public Object f(Function1 function1) {
        Object objInvoke = ((Function0) this.f61379b).invoke();
        function1.invoke(objInvoke);
        return new d((s50.a) this.f61381d, objInvoke, (Function1) this.f61380c);
    }

    @Override // w60.a
    public Object get() {
        switch (this.f61378a) {
            case 12:
                return new q(new i8(19), new lm.e(18), (zd.b) ((qp.i) this.f61379b).get(), (com.google.android.gms.internal.consent_sdk.d) ((l) this.f61380c).get(), (x7.h) ((x7.n) this.f61381d).get());
            default:
                return new u((Context) ((w60.a) this.f61379b).get(), (be.d) ((w60.a) this.f61380c).get(), (ae.a) ((o2.f) this.f61381d).get());
        }
    }

    @Override // k2.d
    public Canvas getCanvas() {
        return ((k2.b) this.f61381d).f70865a.f70863c;
    }

    @Override // k2.d
    public y3.c getDensity() {
        return ((k2.b) this.f61381d).f70865a.f70861a;
    }

    @Override // k2.d
    public l2.b getGraphicsLayer() {
        return (l2.b) this.f61380c;
    }

    @Override // h50.c0
    public s50.a getKey() {
        return (s50.a) this.f61381d;
    }

    @Override // k2.d
    public y3.n getLayoutDirection() {
        return ((k2.b) this.f61381d).f70865a.f70862b;
    }

    @Override // k2.d
    /* renamed from: getSize-NH-jbRc */
    public long mo111getSizeNHjbRc() {
        return ((k2.b) this.f61381d).f70865a.f70864d;
    }

    @Override // k2.d
    public k2.h getTransform() {
        return (vm.c) this.f61379b;
    }

    public void h() {
        ((ArrayList) this.f61380c).clear();
        this.f61381d = this.f61379b;
        ((LayoutNode) this.f61379b).removeAll$ui_release();
    }

    @Override // p1.c
    public /* bridge */ /* synthetic */ void j(int i5, Object obj) {
    }

    @Override // p1.c
    public void k() {
        Owner owner = ((LayoutNode) this.f61379b).getOwner();
        if (owner != null) {
            owner.onEndApplyChanges();
        }
    }

    @Override // p1.c
    public Object l() {
        return this.f61381d;
    }

    @Override // p1.c
    public void m(int i5, Object obj) {
        ((LayoutNode) this.f61381d).insertAt$ui_release(i5, (LayoutNode) obj);
    }

    @Override // p1.c
    public void n(Object obj) {
        ((ArrayList) this.f61380c).add(this.f61381d);
        this.f61381d = obj;
    }

    @Override // p1.c
    public void o() {
        ((LayoutNode) this.f61381d).onReuse();
    }

    public t3.b p() {
        LocaleList localeList = LocaleList.getDefault();
        synchronized (((o7.a) this.f61381d)) {
            try {
                t3.b bVar = (t3.b) this.f61380c;
                if (bVar != null && localeList == ((LocaleList) this.f61379b)) {
                    return bVar;
                }
                int size = localeList.size();
                ArrayList arrayList = new ArrayList(size);
                for (int i5 = 0; i5 < size; i5++) {
                    arrayList.add(new t3.a(localeList.get(i5)));
                }
                t3.b bVar2 = new t3.b(arrayList);
                this.f61379b = localeList;
                this.f61380c = bVar2;
                return bVar2;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // p1.c
    public void q() {
        this.f61381d = ((ArrayList) this.f61380c).remove(r0.size() - 1);
    }

    public void r(ja.h hVar, UserManager userManager) {
        for (UserHandle userHandle : userManager.getUserProfiles()) {
            long jD = hVar.d(userHandle);
            boolean zIsQuietModeEnabled = userManager.isQuietModeEnabled(userHandle);
            ((LongSparseArray) this.f61379b).put(jD, userHandle);
            ((SparseBooleanArray) this.f61381d).put(userHandle.hashCode(), zIsQuietModeEnabled);
            ((LongSparseArray) this.f61380c).put(jD, Boolean.valueOf(zIsQuietModeEnabled));
        }
    }

    @Override // k2.d
    public void setCanvas(Canvas canvas) {
        ((k2.b) this.f61381d).f70865a.f70863c = canvas;
    }

    @Override // k2.d
    public void setDensity(y3.c cVar) {
        ((k2.b) this.f61381d).f70865a.f70861a = cVar;
    }

    @Override // k2.d
    public void setGraphicsLayer(l2.b bVar) {
        this.f61380c = bVar;
    }

    @Override // k2.d
    public void setLayoutDirection(y3.n nVar) {
        ((k2.b) this.f61381d).f70865a.f70862b = nVar;
    }

    @Override // k2.d
    /* renamed from: setSize-uvyYCjk */
    public void mo112setSizeuvyYCjk(long j11) {
        ((k2.b) this.f61381d).f70865a.f70864d = j11;
    }

    @Override // w8.e
    public void shutdown() {
        ((ConnectivityManager) this.f61379b).unregisterNetworkCallback((d0) this.f61381d);
    }

    public boolean t(long j11) {
        return ((Boolean) ((LongSparseArray) this.f61380c).get(j11)).booleanValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public x8.n u(x8.k kVar, y8.f fVar) {
        Bitmap.Config config;
        if (!kVar.f95331f.isEmpty()) {
            if (kotlin.collections.c.o0(kVar.f95330e, c9.g.f19862a)) {
                config = (s(kVar, kVar.f95330e) && ((c9.j) this.f61381d).b(fVar)) ? kVar.f95330e : Bitmap.Config.ARGB_8888;
            }
        }
        Bitmap.Config config2 = config;
        int i5 = ((m) this.f61380c).f19879d ? kVar.D : 4;
        boolean z11 = kVar.f95337l && kVar.f95331f.isEmpty() && config2 != Bitmap.Config.ALPHA_8;
        v4.a aVar = fVar.f96845a;
        y8.b bVar = y8.b.f96840d;
        return new x8.n(kVar.f95326a, config2, fVar, (aVar.equals(bVar) || fVar.f96846b.equals(bVar)) ? 2 : kVar.E, c9.e.a(kVar), z11, kVar.f95338m, kVar.f95333h, kVar.f95334i, kVar.f95343t, kVar.B, kVar.C, i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object w(n nVar, v vVar, a1.c cVar, ContinuationImpl continuationImpl) {
        q3.k kVar;
        j jVar;
        if (continuationImpl instanceof q3.k) {
            kVar = (q3.k) continuationImpl;
            int i5 = kVar.f83576w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f83576w = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new q3.k(this, continuationImpl);
            }
        }
        Object obj = kVar.f83574u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = kVar.f83576w;
        if (i11 == 0) {
            ResultKt.b(obj);
            vVar.getClass();
            j jVar2 = new j(nVar);
            synchronized (((o7.a) this.f61381d)) {
                try {
                    q3.i iVar = (q3.i) ((x) this.f61379b).c(jVar2);
                    if (iVar == null) {
                        iVar = (q3.i) ((o0) this.f61380c).d(jVar2);
                    }
                    if (iVar != null) {
                        return iVar.f83568a;
                    }
                    Unit unit = Unit.f71706a;
                    kVar.f83573t = jVar2;
                    kVar.f83576w = 1;
                    Object objInvoke = cVar.invoke(kVar);
                    if (objInvoke == obj2) {
                        return obj2;
                    }
                    obj = objInvoke;
                    jVar = jVar2;
                } finally {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jVar = kVar.f83573t;
            ResultKt.b(obj);
        }
        synchronized (((o7.a) this.f61381d)) {
            try {
                if (obj == null) {
                    ((o0) this.f61380c).m(jVar, new q3.i(null));
                } else {
                    ((x) this.f61379b).d(jVar, new q3.i(obj));
                }
                Unit unit2 = Unit.f71706a;
            } finally {
            }
        }
        return obj;
    }

    public c(k kVar, m mVar) {
        this.f61378a = 15;
        this.f61379b = kVar;
        this.f61380c = mVar;
        int i5 = Build.VERSION.SDK_INT;
        this.f61381d = c9.a.f19853a ? new c9.k(false) : (i5 == 26 || i5 == 27) ? new c9.l() : new c9.k(true);
    }

    public c(int i5) {
        this.f61378a = i5;
        int i11 = 7;
        switch (i5) {
            case 5:
                this.f61379b = new LongSparseArray();
                this.f61380c = new LongSparseArray();
                this.f61381d = new SparseBooleanArray();
                break;
            case 7:
                long[] jArr = z0.f97875a;
                this.f61379b = new o0();
                break;
            case 9:
                this.f61379b = new x(16);
                long[] jArr2 = z0.f97875a;
                this.f61380c = new o0();
                this.f61381d = new o7.a(i11);
                break;
            case 11:
                this.f61381d = new o7.a(i11);
                break;
        }
    }

    public void a(View view) {
        if (((a9) this.f61380c) == null) {
            this.f61380c = new a9();
            view.getViewTreeObserver().addOnWindowFocusChangeListener((a9) this.f61380c);
            if (view.hasWindowFocus()) {
                p72.a().getClass();
                i6 i6Var = i6.f4638d;
                boolean zA = i6Var.a();
                if (i6Var.f12550b != zA) {
                    i6Var.f12550b = zA;
                    if (i6Var.f12549a) {
                        i6Var.a(zA);
                        bd bdVar = i6Var.f12551c;
                        if (bdVar != null) {
                            bdVar.a(zA);
                        }
                    }
                }
            }
        }
    }

    public c(ul.g gVar, om.e eVar, xm.i iVar, xm.c cVar, Context context, xm.n nVar, ScheduledExecutorService scheduledExecutorService) {
        this.f61378a = 16;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        this.f61379b = linkedHashSet;
        this.f61380c = new xm.l(gVar, eVar, iVar, cVar, context, linkedHashSet, nVar, scheduledExecutorService);
        this.f61381d = context;
    }

    public c(String str, Function0 createConfiguration, Function1 function1) {
        KType kTypeC;
        this.f61378a = 0;
        Intrinsics.g(createConfiguration, "createConfiguration");
        this.f61379b = createConfiguration;
        this.f61380c = function1;
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        KClass orCreateKotlinClass = reflectionFactory.getOrCreateKotlinClass(d.class);
        try {
            KTypeProjection.Companion companion = KTypeProjection.INSTANCE;
            KTypeParameter kTypeParameterTypeParameter = reflectionFactory.typeParameter(reflectionFactory.getOrCreateKotlinClass(c.class), "PluginConfigT", KVariance.INVARIANT, false);
            reflectionFactory.setUpperBounds(kTypeParameterTypeParameter, Collections.singletonList(Reflection.b(Object.class)));
            kTypeC = Reflection.c(d.class, companion.invariant(reflectionFactory.typeOf(kTypeParameterTypeParameter, Collections.EMPTY_LIST, false)));
        } catch (Throwable unused) {
            kTypeC = null;
        }
        this.f61381d = new s50.a(str, new x50.a(orCreateKotlinClass, kTypeC));
    }

    public c(View view) {
        this.f61378a = 10;
        this.f61379b = view;
        this.f61380c = LazyKt.b(LazyThreadSafetyMode.f71681c, new a3.e(this, 24));
        this.f61381d = new v6(view);
    }

    public c(k2.b bVar) {
        this.f61378a = 6;
        this.f61381d = bVar;
        this.f61379b = new vm.c(this, 16);
    }

    public c(ConnectivityManager connectivityManager, m mVar) {
        this.f61378a = 14;
        this.f61379b = connectivityManager;
        this.f61380c = mVar;
        d0 d0Var = new d0(this, 4);
        this.f61381d = d0Var;
        connectivityManager.registerNetworkCallback(new NetworkRequest.Builder().addCapability(12).build(), d0Var);
    }

    public c(LayoutNode layoutNode) {
        this.f61378a = 4;
        this.f61379b = layoutNode;
        this.f61380c = new ArrayList();
        this.f61381d = layoutNode;
    }
}
