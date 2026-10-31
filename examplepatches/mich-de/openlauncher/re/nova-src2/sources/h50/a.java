package h50;

import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a implements i50.a, c0 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f59142b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f59143c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f59144d = new a(2);

    /* renamed from: e, reason: collision with root package name */
    public static final a f59145e = new a(3);

    /* renamed from: f, reason: collision with root package name */
    public static final a f59146f = new a(4);

    /* renamed from: g, reason: collision with root package name */
    public static final a f59147g = new a(5);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59148a;

    public /* synthetic */ a(int i5) {
        this.f59148a = i5;
    }

    @Override // h50.c0
    public void a(Object obj, c50.e scope) {
        switch (this.f59148a) {
            case 6:
                h plugin = (h) obj;
                Intrinsics.g(plugin, "plugin");
                Intrinsics.g(scope, "scope");
                scope.f19687e.f(k50.f.f71131g, new g(plugin, null));
                break;
            default:
                f1 plugin2 = (f1) obj;
                Intrinsics.g(plugin2, "plugin");
                Intrinsics.g(scope, "scope");
                scope.f19687e.f(k50.f.f71135k, new f50.c(plugin2, scope, null, 1));
                break;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // i50.a
    public void b(c50.e client, SuspendLambda suspendLambda) throws cl.e {
        v30.e eVar;
        w50.g gVar;
        switch (this.f59148a) {
            case 0:
                Intrinsics.g(client, "client");
                client.f19690h.f(l50.a.f74723i, new c50.b((Function2) suspendLambda, null, 2));
                return;
            case 1:
                Function3 function3 = (Function3) suspendLambda;
                Intrinsics.g(client, "client");
                w50.g gVar2 = new w50.g("ObservableContent", 0);
                k50.f fVar = client.f19687e;
                w50.g reference = k50.f.f71134j;
                ArrayList arrayList = fVar.f93779a;
                Intrinsics.g(reference, "reference");
                if (!fVar.e(gVar2)) {
                    int iC = fVar.c(reference);
                    if (iC == -1) {
                        throw new cl.e("Phase " + reference + " was not registered for this pipeline");
                    }
                    int i5 = iC + 1;
                    int iK = ul.b.K(arrayList);
                    if (i5 <= iK) {
                        while (true) {
                            Object obj = arrayList.get(i5);
                            w50.c cVar = obj instanceof w50.c ? (w50.c) obj : null;
                            if (cVar != null && (eVar = cVar.f93776b) != null) {
                                w50.h hVar = eVar instanceof w50.h ? (w50.h) eVar : null;
                                if (hVar != null && (gVar = hVar.f93787a) != null && gVar.equals(reference)) {
                                    iC = i5;
                                }
                                if (i5 != iK) {
                                    i5++;
                                }
                            }
                        }
                    }
                    arrayList.add(iC + 1, new w50.c(gVar2, new w50.h(reference)));
                }
                fVar.f(gVar2, new b(function3, null, 0));
                return;
            case 2:
                Function3 function32 = (Function3) suspendLambda;
                Intrinsics.g(client, "client");
                w50.g gVar3 = new w50.g("BeforeReceive", 0);
                l50.a aVar = client.f19688f;
                w50.g reference2 = l50.a.f74724j;
                aVar.getClass();
                Intrinsics.g(reference2, "reference");
                if (!aVar.e(gVar3)) {
                    int iC2 = aVar.c(reference2);
                    if (iC2 == -1) {
                        throw new cl.e("Phase " + reference2 + " was not registered for this pipeline");
                    }
                    aVar.f93779a.add(iC2, new w50.c(gVar3, new w50.i()));
                }
                aVar.f(gVar3, new m1(function32, null, 0));
                return;
            case 3:
                Intrinsics.g(client, "client");
                client.f19687e.f(k50.f.f71134j, new b((Function3) suspendLambda, null, 1));
                return;
            case 4:
                Intrinsics.g(client, "client");
                client.f19687e.f(k50.f.f71131g, new m1((Function3) suspendLambda, null, 1));
                return;
            default:
                Intrinsics.g(client, "client");
                client.f19687e.f(k50.f.f71131g, new m1((Function3) suspendLambda, null, 2));
                return;
        }
    }

    @Override // h50.c0
    public Object f(Function1 function1) {
        switch (this.f59148a) {
            case 6:
                return new h(function1);
            default:
                function1.invoke(new a(7));
                return new f1();
        }
    }

    @Override // h50.c0
    public s50.a getKey() {
        switch (this.f59148a) {
            case 6:
                return h.f59196c;
            default:
                return f1.f59186c;
        }
    }
}
