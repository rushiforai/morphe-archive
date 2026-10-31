package e10;

import android.view.MotionEvent;
import android.view.ViewConfiguration;
import com.android.launcher3.allapps.AllAppsContainerView;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.KotlinNothingValueException;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class j2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51607a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f51608b;

    public /* synthetic */ j2(Object obj, int i5) {
        this.f51607a = i5;
        this.f51608b = obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:141:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0395  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00c3  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        float fMin;
        int i5;
        int i11;
        Collection collectionT1;
        float fMin2 = 0.0f;
        Object objW = null;
        int i12 = 7;
        int i13 = 0;
        switch (this.f51607a) {
            case 0:
                Function1 function1 = (Function1) this.f51608b;
                y2.f51877a.getClass();
                return ((Boolean) function1.invoke(obj)).booleanValue() ? obj : obj2;
            case 1:
                g50.d dVar = (g50.d) this.f51608b;
                String key = (String) obj;
                List values = (List) obj2;
                Intrinsics.g(key, "key");
                Intrinsics.g(values, "values");
                List list = o50.p.f79582a;
                if (!"Content-Length".equals(key) && !"Content-Type".equals(key)) {
                    if (f50.l.f54332a.contains(key)) {
                        Iterator it = values.iterator();
                        while (it.hasNext()) {
                            dVar.invoke(key, (String) it.next());
                        }
                    } else {
                        dVar.invoke(key, b70.g.f1(values, "Cookie".equals(key) ? "; " : ",", null, null, 0, null, 62));
                    }
                    return Unit.f71706a;
                }
                return Unit.f71706a;
            case 2:
                g0.a2 a2Var = (g0.a2) this.f51608b;
                t70.m0.t(a2Var.getCoroutineScope(), null, null, new g0.y1(a2Var, ((Float) obj).floatValue(), ((Float) obj2).floatValue(), null), 3);
                return Boolean.TRUE;
            case 3:
                p1.e1 e1Var = (p1.e1) this.f51608b;
                y3.l lVar = (y3.l) obj;
                y3.l lVar2 = (y3.l) obj2;
                if (lVar2.d() < lVar.e()) {
                    fMin = lVar2.e() <= lVar.d() ? 1.0f : lVar2.h() == 0 ? 0.0f : (((Math.min(lVar.e(), lVar2.e()) + Math.max(lVar.d(), lVar2.d())) / 2) - lVar2.d()) / lVar2.h();
                }
                if (lVar2.f() < lVar.a()) {
                    if (lVar2.a() <= lVar.f()) {
                        fMin2 = 1.0f;
                    } else if (lVar2.c() != 0) {
                        fMin2 = (((Math.min(lVar.a(), lVar2.a()) + Math.max(lVar.f(), lVar2.f())) / 2) - lVar2.f()) / lVar2.c();
                    }
                }
                e1Var.setValue(new i2.y0(i2.r0.f(fMin, fMin2)));
                return Unit.f71706a;
            case 4:
                return new y3.k((0 << 32) | (((b2.j) this.f51608b).a(0, (int) (((y3.m) obj).f96611a & 4294967295L)) & 4294967295L));
            case 5:
                return new y3.k(((b2.f) this.f51608b).a(0L, ((y3.m) obj).f96611a, (y3.n) obj2));
            case 6:
                ((Integer) obj2).getClass();
                n0.z.c((x1.e) this.f51608b, (p1.o) obj, p1.a0.l(7));
                return Unit.f71706a;
            case 7:
                o50.a0 a0Var = (o50.a0) this.f51608b;
                String key2 = (String) obj;
                List values2 = (List) obj2;
                Intrinsics.g(key2, "key");
                Intrinsics.g(values2, "values");
                a0Var.f79538i.c(key2, values2);
                return Unit.f71706a;
            case 8:
                x1.l lVar3 = (x1.l) this.f51608b;
                ((Integer) obj).getClass();
                if (obj2 instanceof p1.k) {
                    p1.k kVar = (p1.k) obj2;
                    z.p0 p0Var = lVar3.f94969h;
                    if (p0Var == null) {
                        z.p0 p0Var2 = z.b1.f97745a;
                        p0Var = new z.p0();
                        lVar3.f94969h = p0Var;
                    }
                    p0Var.j(kVar);
                    lVar3.f94967f.b(kVar);
                }
                if (obj2 instanceof p1.a2) {
                    lVar3.e((p1.a2) obj2);
                }
                if (obj2 instanceof p1.t1) {
                    ((p1.t1) obj2).e();
                }
                return Unit.f71706a;
            case 9:
                p1.y1 y1Var = (p1.y1) this.f51608b;
                Set set = (Set) obj;
                synchronized (y1Var.f81647b) {
                    try {
                        if (((p1.w1) y1Var.f81663t.getValue()).compareTo(p1.w1.f81617e) >= 0) {
                            z.p0 p0Var3 = y1Var.f81652g;
                            if (set instanceof r1.h) {
                                z.a1 a1Var = ((r1.h) set).f85087a;
                                Object[] objArr = a1Var.f97741b;
                                long[] jArr = a1Var.f97740a;
                                int length = jArr.length - 2;
                                if (length >= 0) {
                                    int i14 = 0;
                                    while (true) {
                                        long j11 = jArr[i14];
                                        if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                            int i15 = 8 - ((~(i14 - length)) >>> 31);
                                            for (int i16 = i13; i16 < i15; i16++) {
                                                if ((j11 & 255) < 128) {
                                                    Object obj3 = objArr[(i14 << 3) + i16];
                                                    if (!(obj3 instanceof z1.a0) || ((z1.a0) obj3).a(1)) {
                                                        p0Var3.d(obj3);
                                                    }
                                                }
                                                j11 >>= 8;
                                            }
                                            if (i15 == 8) {
                                                if (i14 != length) {
                                                    i14++;
                                                    i13 = 0;
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                for (Object obj4 : set) {
                                    if (!(obj4 instanceof z1.a0) || ((z1.a0) obj4).a(1)) {
                                        p0Var3.d(obj4);
                                    }
                                }
                            }
                            objW = y1Var.w();
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                if (objW != null) {
                    int i17 = Result.f71687b;
                    ((t70.m) objW).resumeWith(Unit.f71706a);
                }
                return Unit.f71706a;
            case 10:
                v70.i iVar = (v70.i) this.f51608b;
                Set set2 = (Set) obj;
                if (set2 instanceof r1.h) {
                    z.a1 a1Var2 = ((r1.h) set2).f85087a;
                    Object[] objArr2 = a1Var2.f97741b;
                    long[] jArr2 = a1Var2.f97740a;
                    int length2 = jArr2.length - 2;
                    if (length2 >= 0) {
                        int i18 = 0;
                        while (true) {
                            long j12 = jArr2[i18];
                            if ((((~j12) << i12) & j12 & (-9187201950435737472L)) != -9187201950435737472L) {
                                int i19 = 8 - ((~(i18 - length2)) >>> 31);
                                int i21 = 0;
                                while (i21 < i19) {
                                    if ((j12 & 255) < 128) {
                                        Object obj5 = objArr2[(i18 << 3) + i21];
                                        i11 = i12;
                                        if (!(obj5 instanceof z1.a0) || ((z1.a0) obj5).a(4)) {
                                        }
                                    } else {
                                        i11 = i12;
                                    }
                                    j12 >>= 8;
                                    i21++;
                                    i12 = i11;
                                }
                                i5 = i12;
                                if (i19 == 8) {
                                }
                            } else {
                                i5 = i12;
                            }
                            if (i18 != length2) {
                                i18++;
                                i12 = i5;
                            }
                        }
                        iVar.j(set2);
                    }
                } else {
                    Set set3 = set2;
                    if (!(set3 instanceof Collection) || !set3.isEmpty()) {
                        for (Object obj6 : set3) {
                            if (!(obj6 instanceof z1.a0) || ((z1.a0) obj6).a(4)) {
                                iVar.j(set2);
                            }
                        }
                    }
                }
                return Unit.f71706a;
            case 11:
                AllAppsContainerView allAppsContainerView = (AllAppsContainerView) this.f51608b;
                MotionEvent motionEvent = (MotionEvent) obj;
                Boolean bool = (Boolean) obj2;
                ca.c cVar = AllAppsContainerView.U;
                kz.a aVarA = allAppsContainerView.a();
                if (aVarA == null) {
                    return Unit.f71706a;
                }
                aVarA.getLocationOnScreen(new int[2]);
                MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
                motionEventObtain.setLocation(motionEvent.getRawX() - r7[0], motionEvent.getRawY() - r7[1]);
                if (motionEventObtain.getAction() == 2) {
                    if (aVarA.getScrollState() == 0) {
                        int scaledTouchSlop = ViewConfiguration.get(allAppsContainerView.getContext()).getScaledTouchSlop() + 1;
                        MotionEvent motionEventObtain2 = MotionEvent.obtain(motionEventObtain);
                        motionEventObtain2.setAction(0);
                        if (!bool.booleanValue()) {
                            scaledTouchSlop = -scaledTouchSlop;
                        }
                        motionEventObtain2.offsetLocation(0.0f, scaledTouchSlop);
                        aVarA.onTouchEvent(motionEventObtain2);
                        motionEventObtain2.recycle();
                    }
                    aVarA.onTouchEvent(motionEventObtain);
                } else if (motionEventObtain.getAction() == 1 || motionEventObtain.getAction() == 3) {
                    aVarA.onTouchEvent(motionEventObtain);
                }
                motionEventObtain.recycle();
                return Unit.f71706a;
            case 12:
                s50.l lVar4 = (s50.l) this.f51608b;
                String name = (String) obj;
                List values3 = (List) obj2;
                Intrinsics.g(name, "name");
                Intrinsics.g(values3, "values");
                lVar4.c(name, values3);
                return Unit.f71706a;
            case 13:
                x70.v vVar = (x70.v) this.f51608b;
                int iIntValue = ((Integer) obj).intValue();
                CoroutineContext.Element element = (CoroutineContext.Element) obj2;
                CoroutineContext.Key key3 = element.getKey();
                Object obj7 = vVar.f95269u.get(key3);
                if (key3 != t70.q1.f88853a) {
                    iIntValue = element != obj7 ? Integer.MIN_VALUE : iIntValue + 1;
                } else {
                    Object obj8 = (t70.r1) obj7;
                    Object parent = (t70.r1) element;
                    while (parent != null) {
                        if (parent != obj8 && (parent instanceof y70.s)) {
                            t70.p pVar = (t70.p) t70.x1.f88883b.get((y70.s) parent);
                            parent = pVar != null ? pVar.getParent() : null;
                        } else {
                            objW = parent;
                            if (objW == obj8) {
                                throw new IllegalStateException(("Flow invariant is violated:\n\t\tEmission from another coroutine is detected.\n\t\tChild of " + objW + ", expected child of " + obj8 + ".\n\t\tFlowCollector is not thread-safe and concurrent emissions are prohibited.\n\t\tTo mitigate this restriction please use 'channelFlow' builder instead of 'flow'").toString());
                            }
                            if (obj8 != null) {
                            }
                        }
                    }
                    if (objW == obj8) {
                    }
                }
                return Integer.valueOf(iIntValue);
            case 14:
                return Boolean.valueOf(((y9.i) this.f51608b).compare(obj, obj2) <= 0);
            default:
                z1.v vVar2 = (z1.v) this.f51608b;
                Collection collection = (Set) obj;
                AtomicReference atomicReference = vVar2.f97976b;
                while (true) {
                    Object obj9 = atomicReference.get();
                    if (obj9 == null) {
                        collectionT1 = collection;
                    } else if (obj9 instanceof Set) {
                        collectionT1 = ul.b.Q(obj9, collection);
                    } else {
                        if (!(obj9 instanceof List)) {
                            p1.u.d("Unexpected notification");
                            throw new KotlinNothingValueException();
                        }
                        collectionT1 = b70.g.t1(ul.b.P(collection), (Collection) obj9);
                    }
                    while (!atomicReference.compareAndSet(obj9, collectionT1)) {
                        if (atomicReference.get() != obj9) {
                            break;
                        }
                    }
                    if (vVar2.c()) {
                        vVar2.f97975a.invoke(new s10.r(vVar2, i12));
                    }
                    return Unit.f71706a;
                    break;
                }
        }
    }

    public /* synthetic */ j2(x1.e eVar, int i5) {
        this.f51607a = 6;
        this.f51608b = eVar;
    }
}
