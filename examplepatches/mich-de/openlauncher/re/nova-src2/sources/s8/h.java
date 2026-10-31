package s8;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import b.u4;
import c3.a4;
import coil.memory.MemoryCache$Key;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import r8.n;
import t70.c0;
import t70.m0;

/* loaded from: classes.dex */
public final class h implements i {

    /* renamed from: a, reason: collision with root package name */
    public final m8.k f86750a;

    /* renamed from: b, reason: collision with root package name */
    public final i50.c f86751b;

    /* renamed from: c, reason: collision with root package name */
    public final vm.c f86752c;

    public h(m8.k kVar, i50.c cVar) {
        this.f86750a = kVar;
        this.f86751b = cVar;
        this.f86752c = new vm.c(24, kVar, cVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x00a2 -> B:23:0x00a5). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(h hVar, n nVar, m8.b bVar, x8.k kVar, Object obj, x8.n nVar2, m8.c cVar, ContinuationImpl continuationImpl) throws Throwable {
        b bVar2;
        int i5;
        List list;
        Pair pair;
        hVar.getClass();
        if (continuationImpl instanceof b) {
            bVar2 = (b) continuationImpl;
            int i11 = bVar2.D;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                bVar2.D = i11 - Integer.MIN_VALUE;
            } else {
                bVar2 = new b(hVar, continuationImpl);
            }
        }
        Object objA = bVar2.B;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = bVar2.D;
        if (i12 == 0) {
            ResultKt.b(objA);
            i5 = 0;
            m8.k kVar2 = hVar.f86750a;
            list = bVar.f76051e;
            if (i5 >= list.size()) {
            }
            if (pair != null) {
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i13 = bVar2.A;
            m8.c cVar2 = bVar2.f86716z;
            x8.n nVar3 = bVar2.f86715y;
            Object obj2 = bVar2.f86714x;
            x8.k kVar3 = bVar2.f86713w;
            m8.b bVar3 = bVar2.f86712v;
            n nVar4 = bVar2.f86711u;
            h hVar2 = bVar2.f86710t;
            ResultKt.b(objA);
            int iIntValue = i13;
            hVar = hVar2;
            cVar = cVar2;
            nVar = nVar4;
            nVar2 = nVar3;
            bVar = bVar3;
            obj = obj2;
            kVar = kVar3;
            o8.e eVar = (o8.e) objA;
            cVar.getClass();
            if (eVar == null) {
                Drawable drawableA = eVar.a();
                boolean zB = eVar.b();
                int i14 = nVar.f85647c;
                o8.k kVar4 = nVar.f85645a;
                o8.j jVar = kVar4 instanceof o8.j ? (o8.j) kVar4 : null;
                return new a(drawableA, zB, i14, jVar != null ? jVar.c() : null);
            }
            i5 = iIntValue;
            m8.k kVar22 = hVar.f86750a;
            list = bVar.f76051e;
            if (i5 >= list.size()) {
                o8.b bVar4 = (o8.b) list.get(i5);
                bVar4.getClass();
                pair = new Pair(new o8.d(nVar.f85645a, nVar2, bVar4.f79686a), Integer.valueOf(i5));
            } else {
                pair = null;
            }
            if (pair != null) {
                throw new IllegalStateException(u4.h(obj, "Unable to create a decoder that supports: ").toString());
            }
            o8.d dVar = (o8.d) pair.f71683a;
            iIntValue = ((Number) pair.f71684b).intValue() + 1;
            cVar.getClass();
            bVar2.f86710t = hVar;
            bVar2.f86711u = nVar;
            bVar2.f86712v = bVar;
            bVar2.f86713w = kVar;
            bVar2.f86714x = obj;
            bVar2.f86715y = nVar2;
            bVar2.f86716z = cVar;
            bVar2.A = iIntValue;
            bVar2.D = 1;
            objA = dVar.a(bVar2);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            o8.e eVar2 = (o8.e) objA;
            cVar.getClass();
            if (eVar2 == null) {
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:74:0x01b1, code lost:
    
        if (r1 == r7) goto L75;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0190  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01dc  */
    /* JADX WARN: Type inference failed for: r2v18 */
    /* JADX WARN: Type inference failed for: r2v3, types: [int] */
    /* JADX WARN: Type inference failed for: r2v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(h hVar, x8.k kVar, Object obj, x8.n nVar, m8.c cVar, ContinuationImpl continuationImpl) {
        c cVar2;
        n nVar2;
        h hVar2;
        Object obj2;
        m8.c cVar3;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        x8.k kVar2;
        Object obj3;
        x8.k kVar3;
        Ref.ObjectRef objectRef5;
        m8.c cVar4;
        h hVar3;
        Ref.ObjectRef objectRef6;
        h hVar4;
        a aVar;
        n nVar3;
        List list;
        Object obj4;
        Bitmap bitmap;
        if (continuationImpl instanceof c) {
            cVar2 = (c) continuationImpl;
            int i5 = cVar2.D;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar2.D = i5 - Integer.MIN_VALUE;
            } else {
                cVar2 = new c(hVar, continuationImpl);
            }
        }
        c cVar5 = cVar2;
        Object objY = cVar5.B;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        Ref.ObjectRef objectRef7 = cVar5.D;
        try {
            if (objectRef7 == 0) {
                Ref.ObjectRef objectRefL = u4.l(objY);
                objectRefL.f71863a = nVar;
                Ref.ObjectRef objectRef8 = new Ref.ObjectRef();
                objectRef8.f71863a = hVar.f86750a.f76080f;
                Ref.ObjectRef objectRef9 = new Ref.ObjectRef();
                try {
                    i50.c cVar6 = hVar.f86751b;
                    if ((((x8.n) objectRefL.f71863a).f95353b == Bitmap.Config.HARDWARE) && !((c9.j) cVar6.f61381d).a()) {
                        x8.n nVar4 = (x8.n) objectRefL.f71863a;
                        Bitmap.Config config = Bitmap.Config.ARGB_8888;
                        objectRefL.f71863a = x8.n.a(nVar4);
                    }
                    kVar.getClass();
                    m8.b bVar = (m8.b) objectRef8.f71863a;
                    x8.n nVar5 = (x8.n) objectRefL.f71863a;
                    cVar5.f86717t = hVar;
                    cVar5.f86718u = kVar;
                    cVar5.f86719v = obj;
                    cVar5.f86720w = cVar;
                    cVar5.f86721x = objectRefL;
                    cVar5.f86722y = objectRef8;
                    cVar5.f86723z = objectRef9;
                    cVar5.A = objectRef9;
                    cVar5.D = 1;
                    Object objC = hVar.c(bVar, kVar, obj, nVar5, cVar, cVar5);
                    if (objC != coroutineSingletons) {
                        hVar2 = hVar;
                        obj2 = obj;
                        cVar3 = cVar;
                        objectRef = objectRefL;
                        objectRef2 = objectRef8;
                        objectRef3 = objectRef9;
                        objectRef4 = objectRef3;
                        kVar2 = kVar;
                        obj3 = objC;
                    }
                    return coroutineSingletons;
                } catch (Throwable th2) {
                    th = th2;
                    objectRef7 = objectRef9;
                    Object obj5 = objectRef7.f71863a;
                    nVar2 = obj5 instanceof n ? (n) obj5 : null;
                    if (nVar2 != null) {
                        c9.g.a(nVar2.f85645a);
                    }
                    throw th;
                }
            }
            if (objectRef7 == 1) {
                objectRef3 = cVar5.A;
                objectRef4 = cVar5.f86723z;
                Ref.ObjectRef objectRef10 = cVar5.f86722y;
                Ref.ObjectRef objectRef11 = cVar5.f86721x;
                m8.c cVar7 = (m8.c) cVar5.f86720w;
                Object obj6 = cVar5.f86719v;
                kVar2 = cVar5.f86718u;
                h hVar5 = cVar5.f86717t;
                ResultKt.b(objY);
                objectRef2 = objectRef10;
                objectRef = objectRef11;
                cVar3 = cVar7;
                obj2 = obj6;
                hVar2 = hVar5;
                obj3 = objY;
            } else {
                if (objectRef7 != 2) {
                    if (objectRef7 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objY);
                    a aVar2 = (a) objY;
                    Drawable drawable = aVar2.f86706a;
                    BitmapDrawable bitmapDrawable = drawable instanceof BitmapDrawable ? (BitmapDrawable) drawable : null;
                    if (bitmapDrawable != null && (bitmap = bitmapDrawable.getBitmap()) != null) {
                        bitmap.prepareToDraw();
                    }
                    return aVar2;
                }
                objectRef4 = cVar5.f86721x;
                objectRef6 = (Ref.ObjectRef) cVar5.f86720w;
                cVar4 = (m8.c) cVar5.f86719v;
                kVar3 = cVar5.f86718u;
                hVar4 = cVar5.f86717t;
                ResultKt.b(objY);
                obj4 = objY;
                objectRef5 = objectRef6;
                hVar3 = hVar4;
                aVar = (a) obj4;
                m8.c cVar8 = cVar4;
                x8.k kVar4 = kVar3;
                Object obj7 = objectRef4.f71863a;
                nVar3 = obj7 instanceof n ? (n) obj7 : null;
                if (nVar3 != null) {
                    c9.g.a(nVar3.f85645a);
                }
                x8.n nVar6 = (x8.n) objectRef5.f71863a;
                cVar5.f86717t = null;
                cVar5.f86718u = null;
                cVar5.f86719v = null;
                cVar5.f86720w = null;
                cVar5.f86721x = null;
                cVar5.f86722y = null;
                cVar5.f86723z = null;
                cVar5.A = null;
                cVar5.D = 3;
                hVar3.getClass();
                list = kVar4.f95331f;
                objY = aVar;
                if (!list.isEmpty()) {
                    if (!(aVar.f86706a instanceof BitmapDrawable)) {
                        objY = aVar;
                        if (kVar4.f95335j) {
                        }
                    }
                    objY = m0.y(kVar4.f95340q, new g(hVar3, aVar, nVar6, list, cVar8, kVar4, null), cVar5);
                }
            }
            objectRef3.f71863a = obj3;
            Object obj8 = objectRef4.f71863a;
            r8.f fVar = (r8.f) obj8;
            if (fVar instanceof n) {
                c0 c0Var = kVar2.f95339p;
                Ref.ObjectRef objectRef12 = objectRef4;
                x8.k kVar5 = kVar2;
                try {
                    d dVar = new d(hVar2, objectRef12, objectRef2, kVar5, obj2, objectRef, cVar3, null);
                    kVar3 = kVar5;
                    Ref.ObjectRef objectRef13 = objectRef;
                    cVar4 = cVar3;
                    cVar5.f86717t = hVar2;
                    cVar5.f86718u = kVar3;
                    cVar5.f86719v = cVar4;
                    cVar5.f86720w = objectRef13;
                    cVar5.f86721x = objectRef4;
                    cVar5.f86722y = null;
                    cVar5.f86723z = null;
                    cVar5.A = null;
                    cVar5.D = 2;
                    Object objY2 = m0.y(c0Var, dVar, cVar5);
                    if (objY2 == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    objectRef6 = objectRef13;
                    hVar4 = hVar2;
                    obj4 = objY2;
                    objectRef5 = objectRef6;
                    hVar3 = hVar4;
                    aVar = (a) obj4;
                    m8.c cVar82 = cVar4;
                    x8.k kVar42 = kVar3;
                    Object obj72 = objectRef4.f71863a;
                    if (obj72 instanceof n) {
                    }
                    if (nVar3 != null) {
                    }
                    x8.n nVar62 = (x8.n) objectRef5.f71863a;
                    cVar5.f86717t = null;
                    cVar5.f86718u = null;
                    cVar5.f86719v = null;
                    cVar5.f86720w = null;
                    cVar5.f86721x = null;
                    cVar5.f86722y = null;
                    cVar5.f86723z = null;
                    cVar5.A = null;
                    cVar5.D = 3;
                    hVar3.getClass();
                    list = kVar42.f95331f;
                    objY = aVar;
                    if (!list.isEmpty()) {
                    }
                } catch (Throwable th3) {
                    th = th3;
                    objectRef7 = objectRef12;
                    Object obj52 = objectRef7.f71863a;
                    if (obj52 instanceof n) {
                    }
                    if (nVar2 != null) {
                    }
                    throw th;
                }
            } else {
                kVar3 = kVar2;
                objectRef5 = objectRef;
                cVar4 = cVar3;
                if (!(fVar instanceof r8.e)) {
                    throw new NoWhenBranchMatchedException();
                }
                hVar3 = hVar2;
                aVar = new a(((r8.e) obj8).f85623a, ((r8.e) obj8).f85624b, ((r8.e) obj8).f85625c, null);
                m8.c cVar822 = cVar4;
                x8.k kVar422 = kVar3;
                Object obj722 = objectRef4.f71863a;
                if (obj722 instanceof n) {
                }
                if (nVar3 != null) {
                }
                x8.n nVar622 = (x8.n) objectRef5.f71863a;
                cVar5.f86717t = null;
                cVar5.f86718u = null;
                cVar5.f86719v = null;
                cVar5.f86720w = null;
                cVar5.f86721x = null;
                cVar5.f86722y = null;
                cVar5.f86723z = null;
                cVar5.A = null;
                cVar5.D = 3;
                hVar3.getClass();
                list = kVar422.f95331f;
                objY = aVar;
                if (!list.isEmpty()) {
                }
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00d2 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x009e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x00c8 -> B:29:0x00ca). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(m8.b bVar, x8.k kVar, Object obj, x8.n nVar, m8.c cVar, ContinuationImpl continuationImpl) throws IOException {
        e eVar;
        h hVar;
        Object obj2;
        x8.n nVar2;
        m8.c cVar2;
        int iIntValue;
        e eVar2;
        h hVar2;
        m8.b bVar2;
        x8.k kVar2;
        int size;
        Pair pair;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.C;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.C = i5 - Integer.MIN_VALUE;
                hVar = this;
            } else {
                hVar = this;
                eVar = new e(hVar, continuationImpl);
            }
        }
        Object obj3 = eVar.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.C;
        if (i11 == 0) {
            ResultKt.b(obj3);
            obj2 = obj;
            nVar2 = nVar;
            cVar2 = cVar;
            iIntValue = 0;
            eVar2 = eVar;
            hVar2 = hVar;
            bVar2 = bVar;
            kVar2 = kVar;
            m8.k kVar3 = hVar2.f86750a;
            List list = bVar2.f76050d;
            size = list.size();
            while (true) {
                if (iIntValue < size) {
                }
                iIntValue++;
            }
            if (pair != null) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i12 = eVar.f86737z;
            m8.c cVar3 = eVar.f86736y;
            x8.n nVar3 = eVar.f86735x;
            Object obj4 = eVar.f86734w;
            x8.k kVar4 = eVar.f86733v;
            m8.b bVar3 = eVar.f86732u;
            hVar2 = eVar.f86731t;
            ResultKt.b(obj3);
            eVar2 = eVar;
            kVar2 = kVar4;
            iIntValue = i12;
            obj2 = obj4;
            cVar2 = cVar3;
            nVar2 = nVar3;
            r8.f fVar = (r8.f) obj3;
            try {
                cVar2.getClass();
                if (fVar == null) {
                    return fVar;
                }
                bVar2 = bVar3;
                m8.k kVar32 = hVar2.f86750a;
                List list2 = bVar2.f76050d;
                size = list2.size();
                while (true) {
                    if (iIntValue < size) {
                        pair = null;
                        break;
                    }
                    Pair pair2 = (Pair) list2.get(iIntValue);
                    r8.g gVar = (r8.g) pair2.f71683a;
                    if (((Class) pair2.f71684b).isAssignableFrom(obj2.getClass())) {
                        Intrinsics.e(gVar, "null cannot be cast to non-null type coil.fetch.Fetcher.Factory<kotlin.Any>");
                        r8.h hVarA = gVar.a(obj2, nVar2);
                        if (hVarA != null) {
                            pair = new Pair(hVarA, Integer.valueOf(iIntValue));
                            break;
                        }
                    }
                    iIntValue++;
                }
                if (pair != null) {
                    throw new IllegalStateException(u4.h(obj2, "Unable to create a fetcher that supports: ").toString());
                }
                r8.h hVar3 = (r8.h) pair.f71683a;
                iIntValue = ((Number) pair.f71684b).intValue() + 1;
                cVar2.getClass();
                eVar2.f86731t = hVar2;
                eVar2.f86732u = bVar2;
                eVar2.f86733v = kVar2;
                eVar2.f86734w = obj2;
                eVar2.f86735x = nVar2;
                eVar2.f86736y = cVar2;
                eVar2.f86737z = iIntValue;
                eVar2.C = 1;
                Object objA = hVar3.a(eVar2);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
                bVar3 = bVar2;
                obj3 = objA;
                r8.f fVar2 = (r8.f) obj3;
                cVar2.getClass();
                if (fVar2 == null) {
                }
            } catch (Throwable th2) {
                n nVar4 = fVar2 instanceof n ? (n) fVar2 : null;
                if (nVar4 != null) {
                    c9.g.a(nVar4.f85645a);
                }
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(k kVar, ContinuationImpl continuationImpl) throws Throwable {
        f fVar;
        h hVar;
        x8.k kVar2;
        Object obj;
        y8.f fVar2;
        m8.c cVar;
        x8.n nVarU;
        int i5;
        h hVar2 = this;
        k kVar3 = kVar;
        vm.c cVar2 = hVar2.f86752c;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i11 = fVar.f86742x;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                fVar.f86742x = i11 - Integer.MIN_VALUE;
            } else {
                fVar = new f(hVar2, continuationImpl);
            }
        }
        f fVar3 = fVar;
        Object obj2 = fVar3.f86740v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = fVar3.f86742x;
        if (i12 == 0) {
            ResultKt.b(obj2);
            try {
                kVar2 = kVar3.f86761d;
                obj = kVar2.f95327b;
                fVar2 = kVar3.f86762e;
                Bitmap.Config[] configArr = c9.g.f19862a;
                cVar = kVar3.f86763f;
                nVarU = hVar2.f86751b.u(kVar2, fVar2);
                i5 = nVarU.f95355d;
                List list = hVar2.f86750a.f76080f.f76048b;
                int size = list.size();
                for (int i13 = 0; i13 < size; i13++) {
                    try {
                        Pair pair = (Pair) list.get(i13);
                        u8.b bVar = (u8.b) pair.f71683a;
                        if (((Class) pair.f71684b).isAssignableFrom(obj.getClass())) {
                            Intrinsics.e(bVar, "null cannot be cast to non-null type coil.map.Mapper<kotlin.Any, *>");
                            Object objA = bVar.a(obj, nVarU);
                            if (objA != null) {
                                obj = objA;
                            }
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        hVar2 = this;
                        hVar = hVar2;
                        if (th instanceof CancellationException) {
                        }
                    }
                }
            } catch (Throwable th3) {
                th = th3;
            }
            try {
                MemoryCache$Key memoryCache$KeyP = cVar2.p(kVar2, obj, nVarU, cVar);
                v8.a aVarI = memoryCache$KeyP != null ? cVar2.i(kVar2, memoryCache$KeyP, fVar2, i5) : null;
                if (aVarI != null) {
                    return vm.c.q(kVar3, kVar2, memoryCache$KeyP, aVarI);
                }
                c0 c0Var = kVar2.o;
                hVar2 = this;
                a4 a4Var = new a4(hVar2, kVar2, obj, nVarU, cVar, memoryCache$KeyP, kVar3, null);
                fVar3.f86738t = hVar2;
                fVar3.f86739u = kVar3;
                fVar3.f86742x = 1;
                Object objY = m0.y(c0Var, a4Var, fVar3);
                return objY == coroutineSingletons ? coroutineSingletons : objY;
            } catch (Throwable th4) {
                th = th4;
                hVar2 = this;
                hVar = hVar2;
                if (th instanceof CancellationException) {
                }
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            k kVar4 = fVar3.f86739u;
            hVar = fVar3.f86738t;
            try {
                ResultKt.b(obj2);
                return obj2;
            } catch (Throwable th5) {
                th = th5;
                kVar3 = kVar4;
            }
        }
        if (th instanceof CancellationException) {
            throw th;
        }
        i50.c cVar3 = hVar.f86751b;
        return i50.c.i(kVar3.f86761d, th);
    }
}
