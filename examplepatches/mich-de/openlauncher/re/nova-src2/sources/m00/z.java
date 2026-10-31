package m00;

import android.app.Application;
import android.content.ComponentName;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75662a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w70.n f75663b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j0 f75664c;

    public /* synthetic */ z(w70.n nVar, j0 j0Var, int i5) {
        this.f75662a = i5;
        this.f75663b = nVar;
        this.f75664c = j0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x021c  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x0374  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x049f  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0180  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x001c  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        y yVar;
        b0 b0Var;
        Object string;
        c0 c0Var;
        e eVar;
        Object next;
        e0 e0Var;
        f0 f0Var;
        g0 g0Var;
        switch (this.f75662a) {
            case 0:
                if (continuation instanceof y) {
                    yVar = (y) continuation;
                    int i5 = yVar.f75660u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        yVar.f75660u = i5 - Integer.MIN_VALUE;
                    } else {
                        yVar = new y(this, continuation);
                    }
                }
                Object obj2 = yVar.f75659t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = yVar.f75660u;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    ArrayList arrayList = new ArrayList();
                    for (r80.x xVar : (r80.x[]) obj) {
                        if (xVar.f85729k.f85735d == r80.d.f85655b) {
                            arrayList.add(xVar);
                        }
                    }
                    ArrayList arrayList2 = new ArrayList();
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        t tVarE = j0.e(this.f75664c, (r80.x) it.next());
                        if (tVarE != null) {
                            arrayList2.add(tVarE);
                        }
                    }
                    List listD1 = b70.g.D1(new v(0), arrayList2);
                    yVar.f75660u = 1;
                    if (this.f75663b.emit(listD1, yVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            case 1:
                if (continuation instanceof b0) {
                    b0Var = (b0) continuation;
                    int i12 = b0Var.f75524u;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        b0Var.f75524u = i12 - Integer.MIN_VALUE;
                    } else {
                        b0Var = new b0(this, continuation);
                    }
                }
                Object obj3 = b0Var.f75523t;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = b0Var.f75524u;
                if (i13 == 0) {
                    ResultKt.b(obj3);
                    ArrayList arrayList3 = new ArrayList();
                    for (r80.x xVar2 : (r80.x[]) obj) {
                        if (xVar2.f85729k.f85735d == r80.d.f85660g) {
                            arrayList3.add(xVar2);
                        }
                    }
                    ArrayList arrayList4 = new ArrayList(b70.c.u0(arrayList3, 10));
                    Iterator it2 = arrayList3.iterator();
                    while (it2.hasNext()) {
                        r80.x xVar3 = (r80.x) it2.next();
                        j0 j0Var = this.f75664c;
                        t tVarE2 = j0.e(j0Var, xVar3);
                        Intrinsics.d(tVarE2);
                        y20.g gVar = tVarE2.f75638a;
                        List listP = ul.b.P(t.a(tVarE2, new y20.f(), false, false, null, 62));
                        r80.y[] yVarArr = xVar3.f85730l;
                        ArrayList arrayList5 = new ArrayList(yVarArr.length);
                        int length = yVarArr.length;
                        int i14 = 0;
                        while (i14 < length) {
                            r80.y yVar2 = yVarArr[i14];
                            y20.e eVar2 = new y20.e(yVar2.f85736e);
                            Iterator it3 = it2;
                            Uri uri = yVar2.f85737f;
                            if (uri == null) {
                                uri = Uri.EMPTY;
                            }
                            y20.b bVar = new y20.b(uri);
                            boolean zBooleanValue = ((Boolean) j0Var.f75592s.f93973a.getValue()).booleanValue();
                            Application application = j0Var.f75577b;
                            if (gVar instanceof y20.e) {
                                string = ((y20.e) gVar).f96595a;
                            } else {
                                if (!(gVar instanceof y20.f)) {
                                    throw new NoWhenBranchMatchedException();
                                }
                                string = application.getString(2132020323);
                            }
                            arrayList5.add(new t(eVar2, bVar, (String) null, zBooleanValue, jk.b.V(yVar2, string.toString(), null, 2), 4));
                            i14++;
                            it2 = it3;
                            yVarArr = yVarArr;
                        }
                        arrayList4.add(new e(gVar, tVarE2.f75639b, b70.g.t1(arrayList5, listP)));
                        it2 = it2;
                    }
                    List listD12 = b70.g.D1(new v(1), arrayList4);
                    b0Var.f75524u = 1;
                    if (this.f75663b.emit(listD12, b0Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
            case 2:
                if (continuation instanceof c0) {
                    c0Var = (c0) continuation;
                    int i15 = c0Var.f75528u;
                    if ((i15 & Integer.MIN_VALUE) != 0) {
                        c0Var.f75528u = i15 - Integer.MIN_VALUE;
                    } else {
                        c0Var = new c0(this, continuation);
                    }
                }
                Object obj4 = c0Var.f75527t;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i16 = c0Var.f75528u;
                if (i16 == 0) {
                    ResultKt.b(obj4);
                    ArrayList arrayList6 = new ArrayList();
                    for (r80.x xVar4 : (r80.x[]) obj) {
                        r80.d dVar = xVar4.f85729k.f85735d;
                        if (dVar == r80.d.f85656c || dVar == r80.d.f85658e || dVar == r80.d.f85661h) {
                            arrayList6.add(xVar4);
                        }
                    }
                    LinkedHashMap linkedHashMap = new LinkedHashMap();
                    Iterator it4 = arrayList6.iterator();
                    while (it4.hasNext()) {
                        Object next2 = it4.next();
                        String str = ((r80.x) next2).f85729k.f85733b;
                        Object arrayList7 = linkedHashMap.get(str);
                        if (arrayList7 == null) {
                            arrayList7 = new ArrayList();
                            linkedHashMap.put(str, arrayList7);
                        }
                        ((List) arrayList7).add(next2);
                    }
                    ArrayList arrayList8 = new ArrayList();
                    for (Map.Entry entry : linkedHashMap.entrySet()) {
                        j0 j0Var2 = this.f75664c;
                        Iterator it5 = j0Var2.f75579d.iterator();
                        while (true) {
                            eVar = null;
                            if (it5.hasNext()) {
                                next = it5.next();
                                if (Intrinsics.b(((ga.a) next).f57279y.getPackageName(), entry.getKey())) {
                                }
                            } else {
                                next = null;
                            }
                        }
                        ga.a aVar = (ga.a) next;
                        if (aVar != null) {
                            CharSequence charSequence = aVar.f57300l;
                            ComponentName componentName = aVar.f57279y;
                            UserHandle userHandle = aVar.o;
                            Uri.Builder builder = new Uri.Builder();
                            builder.scheme("appIcon");
                            builder.authority(componentName.flattenToShortString());
                            if (!Intrinsics.b(userHandle, Process.myUserHandle())) {
                                builder.fragment(String.valueOf(((ja.h) ja.h.f69294h.f95127b).d(userHandle)));
                            }
                            Uri uriBuild = builder.build();
                            y20.e eVar3 = new y20.e(charSequence);
                            y20.b bVar2 = new y20.b(uriBuild);
                            Iterable iterable = (Iterable) entry.getValue();
                            ArrayList arrayList9 = new ArrayList();
                            Iterator it6 = iterable.iterator();
                            while (it6.hasNext()) {
                                t tVarE3 = j0.e(j0Var2, (r80.x) it6.next());
                                if (tVarE3 != null) {
                                    arrayList9.add(tVarE3);
                                }
                            }
                            eVar = new e(eVar3, bVar2, arrayList9);
                        }
                        if (eVar != null) {
                            arrayList8.add(eVar);
                        }
                    }
                    List listD13 = b70.g.D1(new v(2), arrayList8);
                    c0Var.f75528u = 1;
                    if (this.f75663b.emit(listD13, c0Var) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj4);
                }
                return Unit.f71706a;
            case 3:
                if (continuation instanceof e0) {
                    e0Var = (e0) continuation;
                    int i17 = e0Var.f75539u;
                    if ((i17 & Integer.MIN_VALUE) != 0) {
                        e0Var.f75539u = i17 - Integer.MIN_VALUE;
                    } else {
                        e0Var = new e0(this, continuation);
                    }
                }
                Object obj5 = e0Var.f75538t;
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i18 = e0Var.f75539u;
                if (i18 == 0) {
                    ResultKt.b(obj5);
                    ArrayList arrayList10 = new ArrayList();
                    for (Object obj6 : (List) obj) {
                        com.teslacoilsw.launcher.search.hero.c cVar = (com.teslacoilsw.launcher.search.hero.c) obj6;
                        Iterable iterable2 = (Iterable) this.f75664c.f75586k.f93973a.getValue();
                        if (!(iterable2 instanceof Collection) || !((Collection) iterable2).isEmpty()) {
                            Iterator it7 = iterable2.iterator();
                            while (true) {
                                if (!it7.hasNext()) {
                                    break;
                                }
                                if (Intrinsics.b(cVar, ((t) it7.next()).f75643f)) {
                                    arrayList10.add(obj6);
                                }
                            }
                        }
                    }
                    Integer num = new Integer(arrayList10.size());
                    e0Var.f75539u = 1;
                    if (this.f75663b.emit(num, e0Var) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i18 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj5);
                }
                return Unit.f71706a;
            case 4:
                if (continuation instanceof f0) {
                    f0Var = (f0) continuation;
                    int i19 = f0Var.f75543u;
                    if ((i19 & Integer.MIN_VALUE) != 0) {
                        f0Var.f75543u = i19 - Integer.MIN_VALUE;
                    } else {
                        f0Var = new f0(this, continuation);
                    }
                }
                Object obj7 = f0Var.f75542t;
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i21 = f0Var.f75543u;
                if (i21 == 0) {
                    ResultKt.b(obj7);
                    ArrayList arrayList11 = new ArrayList();
                    for (Object obj8 : (List) obj) {
                        com.teslacoilsw.launcher.search.hero.c cVar2 = (com.teslacoilsw.launcher.search.hero.c) obj8;
                        Iterable iterable3 = (Iterable) this.f75664c.f75588m.f93973a.getValue();
                        ArrayList arrayList12 = new ArrayList();
                        Iterator it8 = iterable3.iterator();
                        while (it8.hasNext()) {
                            b70.d.z0(((e) it8.next()).f75537c, arrayList12);
                        }
                        if (!arrayList12.isEmpty()) {
                            Iterator it9 = arrayList12.iterator();
                            while (true) {
                                if (!it9.hasNext()) {
                                    break;
                                }
                                if (Intrinsics.b(cVar2, ((t) it9.next()).f75643f)) {
                                    arrayList11.add(obj8);
                                }
                            }
                        }
                    }
                    Integer num2 = new Integer(arrayList11.size());
                    f0Var.f75543u = 1;
                    if (this.f75663b.emit(num2, f0Var) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i21 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj7);
                }
                return Unit.f71706a;
            default:
                if (continuation instanceof g0) {
                    g0Var = (g0) continuation;
                    int i22 = g0Var.f75550u;
                    if ((i22 & Integer.MIN_VALUE) != 0) {
                        g0Var.f75550u = i22 - Integer.MIN_VALUE;
                    } else {
                        g0Var = new g0(this, continuation);
                    }
                }
                Object obj9 = g0Var.f75549t;
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i23 = g0Var.f75550u;
                if (i23 == 0) {
                    ResultKt.b(obj9);
                    ArrayList arrayList13 = new ArrayList();
                    for (Object obj10 : (List) obj) {
                        com.teslacoilsw.launcher.search.hero.c cVar3 = (com.teslacoilsw.launcher.search.hero.c) obj10;
                        Iterable iterable4 = (Iterable) this.f75664c.f75587l.f93973a.getValue();
                        ArrayList arrayList14 = new ArrayList();
                        Iterator it10 = iterable4.iterator();
                        while (it10.hasNext()) {
                            b70.d.z0(((e) it10.next()).f75537c, arrayList14);
                        }
                        if (!arrayList14.isEmpty()) {
                            Iterator it11 = arrayList14.iterator();
                            while (true) {
                                if (!it11.hasNext()) {
                                    break;
                                }
                                if (Intrinsics.b(cVar3, ((t) it11.next()).f75643f)) {
                                    arrayList13.add(obj10);
                                }
                            }
                        }
                    }
                    Integer num3 = new Integer(arrayList13.size());
                    g0Var.f75550u = 1;
                    if (this.f75663b.emit(num3, g0Var) == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                } else {
                    if (i23 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj9);
                }
                return Unit.f71706a;
        }
    }
}
