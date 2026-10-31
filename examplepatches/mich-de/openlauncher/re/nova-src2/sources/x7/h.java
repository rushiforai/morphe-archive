package x7;

import android.database.Cursor;
import androidx.work.impl.WorkDatabase_Impl;
import com.android.launcher3.CellLayout;
import com.android.launcher3.Workspace;
import com.google.android.gms.internal.consent_sdk.c3;
import com.google.android.gms.internal.consent_sdk.k7;
import com.google.android.gms.internal.consent_sdk.l7;
import com.google.android.gms.internal.consent_sdk.n7;
import com.google.android.gms.internal.consent_sdk.v0;
import com.teslacoilsw.launcher.CellLayoutPagedView;
import com.teslacoilsw.launcher.NovaLauncher;
import eb0.j0;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import kl.d0;
import kl.f0;
import kl.p0;
import kl.q0;
import kl.t0;
import kl.u0;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Lambda;
import o9.p2;
import x80.e0;
import x80.v;
import x80.w;

/* loaded from: classes.dex */
public final class h implements l7, p2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95136a;

    /* renamed from: b, reason: collision with root package name */
    public Object f95137b;

    /* renamed from: c, reason: collision with root package name */
    public Object f95138c;

    /* renamed from: d, reason: collision with root package name */
    public Object f95139d;

    /* renamed from: e, reason: collision with root package name */
    public Object f95140e;

    public /* synthetic */ h(int i5, boolean z11) {
        this.f95136a = i5;
    }

    public void a(eb0.l lVar) {
        ArrayList arrayList = (ArrayList) this.f95139d;
        Objects.requireNonNull(lVar, "factory == null");
        arrayList.add(lVar);
    }

    public void b(String str) {
        Objects.requireNonNull(str, "baseUrl == null");
        v vVar = new v();
        vVar.e(null, str);
        w wVarB = vVar.b();
        if (com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.equals(wVarB.f95630f.get(r0.size() - 1))) {
            this.f95138c = wVarB;
        } else {
            throw new IllegalArgumentException("baseUrl must end in /: " + wVarB);
        }
    }

    public bm.t c() {
        ArrayList arrayList = (ArrayList) this.f95139d;
        if (((w) this.f95138c) == null) {
            throw new IllegalStateException("Base URL required.");
        }
        e0 e0Var = (e0) this.f95137b;
        if (e0Var == null) {
            e0Var = new e0();
        }
        e0 e0Var2 = e0Var;
        androidx.recyclerview.widget.e eVar = j0.f52570a;
        eb0.a aVar = j0.f52572c;
        ArrayList arrayList2 = new ArrayList((ArrayList) this.f95140e);
        List listA = aVar.a(eVar);
        arrayList2.addAll(listA);
        List listB = aVar.b();
        ArrayList arrayList3 = new ArrayList(arrayList.size() + 1 + listB.size());
        arrayList3.add(new eb0.b(0));
        arrayList3.addAll(arrayList);
        arrayList3.addAll(listB);
        w wVar = (w) this.f95138c;
        List listUnmodifiableList = Collections.unmodifiableList(arrayList3);
        List listUnmodifiableList2 = Collections.unmodifiableList(arrayList2);
        listA.size();
        return new bm.t(e0Var2, wVar, listUnmodifiableList, listUnmodifiableList2, eVar);
    }

    public fl.r d() throws GeneralSecurityException {
        Integer num = (Integer) this.f95137b;
        if (num == null) {
            throw new GeneralSecurityException("Key size is not set");
        }
        if (((fl.j) this.f95140e) == null) {
            throw new GeneralSecurityException("Variant is not set");
        }
        if (((Integer) this.f95138c) == null) {
            throw new GeneralSecurityException("IV size is not set");
        }
        if (((Integer) this.f95139d) != null) {
            return new fl.r(num.intValue(), ((Integer) this.f95138c).intValue(), ((Integer) this.f95139d).intValue(), (fl.j) this.f95140e);
        }
        throw new GeneralSecurityException("Tag size is not set");
    }

    public ll.m e() throws GeneralSecurityException {
        Integer num = (Integer) this.f95137b;
        if (num == null) {
            throw new GeneralSecurityException("key size is not set");
        }
        if (((Integer) this.f95138c) == null) {
            throw new GeneralSecurityException("tag size is not set");
        }
        if (((ll.k) this.f95139d) == null) {
            throw new GeneralSecurityException("hash type is not set");
        }
        if (((ll.l) this.f95140e) == null) {
            throw new GeneralSecurityException("variant is not set");
        }
        if (num.intValue() < 16) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; must be at least 16 bytes", (Integer) this.f95137b));
        }
        Integer num2 = (Integer) this.f95138c;
        int iIntValue = num2.intValue();
        ll.k kVar = (ll.k) this.f95139d;
        if (iIntValue < 10) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; must be at least 10 bytes", num2));
        }
        if (kVar == ll.k.f75016b) {
            if (iIntValue > 20) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 20 bytes for SHA1", num2));
            }
        } else if (kVar == ll.k.f75017c) {
            if (iIntValue > 28) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 28 bytes for SHA224", num2));
            }
        } else if (kVar == ll.k.f75018d) {
            if (iIntValue > 32) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 32 bytes for SHA256", num2));
            }
        } else if (kVar == ll.k.f75019e) {
            if (iIntValue > 48) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 48 bytes for SHA384", num2));
            }
        } else {
            if (kVar != ll.k.f75020f) {
                throw new GeneralSecurityException("unknown hash type; must be SHA256, SHA384 or SHA512");
            }
            if (iIntValue > 64) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 64 bytes for SHA512", num2));
            }
        }
        return new ll.m(((Integer) this.f95137b).intValue(), ((Integer) this.f95138c).intValue(), (ll.l) this.f95140e, (ll.k) this.f95139d);
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0064, code lost:
    
        if (r14 == r0) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x008e, code lost:
    
        if (r14 == r0) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0090, code lost:
    
        return r0;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object f(long j11, long j12, ContinuationImpl continuationImpl) {
        u2.b bVar;
        long j13;
        if (continuationImpl instanceof u2.b) {
            bVar = (u2.b) continuationImpl;
            int i5 = bVar.f90439v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f90439v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new u2.b(this, continuationImpl);
            }
        }
        u2.b bVar2 = bVar;
        Object objB = bVar2.f90437t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar2.f90439v;
        if (i11 == 0) {
            ResultKt.b(objB);
            u2.f fVar = (u2.f) this.f95137b;
            u2.f fVar2 = null;
            j13 = 0;
            if (((fVar == null || !fVar.getIsAttached()) ? null : (u2.f) t2.c.t(fVar)) == null) {
                u2.f fVar3 = (u2.f) this.f95138c;
                if (fVar3 != null) {
                    bVar2.f90439v = 1;
                    objB = fVar3.b(j11, j12, bVar2);
                }
            } else {
                u2.f fVar4 = (u2.f) this.f95137b;
                if (fVar4 != null && fVar4.getIsAttached()) {
                    fVar2 = (u2.f) t2.c.t(fVar4);
                }
                if (fVar2 != null) {
                    bVar2.f90439v = 2;
                    objB = fVar2.b(j11, j12, bVar2);
                } else {
                    j13 = 0;
                }
            }
        } else if (i11 == 1) {
            ResultKt.b(objB);
            j13 = ((y3.r) objB).j();
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            j13 = ((y3.r) objB).j();
        }
        return y3.r.a(j13);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object g(long j11, ContinuationImpl continuationImpl) {
        u2.c cVar;
        long j12;
        if (continuationImpl instanceof u2.c) {
            cVar = (u2.c) continuationImpl;
            int i5 = cVar.f90442v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f90442v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new u2.c(this, continuationImpl);
            }
        }
        Object objT = cVar.f90440t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f90442v;
        if (i11 == 0) {
            ResultKt.b(objT);
            u2.f fVar = (u2.f) this.f95137b;
            u2.f fVar2 = null;
            if (fVar != null && fVar.getIsAttached()) {
                fVar2 = (u2.f) t2.c.t(fVar);
            }
            if (fVar2 == null) {
                j12 = 0;
                return y3.r.a(j12);
            }
            cVar.f90442v = 1;
            objT = fVar2.t(j11, cVar);
            if (objT == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objT);
        }
        j12 = ((y3.r) objT).j();
        return y3.r.a(j12);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    public t70.j0 h() {
        t70.j0 j0Var = (t70.j0) ((Lambda) this.f95139d).invoke();
        if (j0Var != null) {
            return j0Var;
        }
        throw new IllegalStateException("in order to access nested coroutine scope you need to attach dispatcher to the `Modifier.nestedScroll` first.");
    }

    public g i(i iVar) {
        String str = iVar.f95141a;
        int i5 = iVar.f95142b;
        WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f95137b;
        androidx.room.t tVarC = androidx.room.t.c(2, "SELECT * FROM SystemIdInfo WHERE work_spec_id=? AND generation=?");
        if (str == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, str);
        }
        tVarC.bindLong(2, i5);
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = v70.o.f(cursorL, "work_spec_id");
            int iF2 = v70.o.f(cursorL, "generation");
            int iF3 = v70.o.f(cursorL, "system_id");
            g gVar = null;
            String string = null;
            if (cursorL.moveToFirst()) {
                if (!cursorL.isNull(iF)) {
                    string = cursorL.getString(iF);
                }
                gVar = new g(string, cursorL.getInt(iF2), cursorL.getInt(iF3));
            }
            return gVar;
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    public void j(g gVar) {
        WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f95137b;
        workDatabase_Impl.assertNotSuspendingTransaction();
        workDatabase_Impl.beginTransaction();
        try {
            ((b) this.f95138c).insert(gVar);
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
        }
    }

    public void k(kl.l lVar) throws GeneralSecurityException {
        lVar.getClass();
        t0 t0Var = new t0(p0.class, lVar.f71612a);
        HashMap map = (HashMap) this.f95138c;
        if (!map.containsKey(t0Var)) {
            map.put(t0Var, lVar);
            return;
        }
        kl.l lVar2 = (kl.l) map.get(t0Var);
        if (lVar2.equals(lVar) && lVar.equals(lVar2)) {
            return;
        }
        throw new GeneralSecurityException("Attempt to register non-equal parser for already existing object of type: " + t0Var);
    }

    public void l(kl.n nVar) throws GeneralSecurityException {
        u0 u0Var = new u0(nVar.f71616a, p0.class);
        HashMap map = (HashMap) this.f95137b;
        if (!map.containsKey(u0Var)) {
            map.put(u0Var, nVar);
            return;
        }
        kl.n nVar2 = (kl.n) map.get(u0Var);
        if (nVar2.equals(nVar) && nVar.equals(nVar2)) {
            return;
        }
        throw new GeneralSecurityException("Attempt to register non-equal serializer for already existing object of type: " + u0Var);
    }

    public void m(d0 d0Var) throws GeneralSecurityException {
        d0Var.getClass();
        t0 t0Var = new t0(q0.class, d0Var.f71581a);
        HashMap map = (HashMap) this.f95140e;
        if (!map.containsKey(t0Var)) {
            map.put(t0Var, d0Var);
            return;
        }
        d0 d0Var2 = (d0) map.get(t0Var);
        if (d0Var2.equals(d0Var) && d0Var.equals(d0Var2)) {
            return;
        }
        throw new GeneralSecurityException("Attempt to register non-equal parser for already existing object of type: " + t0Var);
    }

    public void n(f0 f0Var) throws GeneralSecurityException {
        u0 u0Var = new u0(f0Var.f71594a, q0.class);
        HashMap map = (HashMap) this.f95139d;
        if (!map.containsKey(u0Var)) {
            map.put(u0Var, f0Var);
            return;
        }
        f0 f0Var2 = (f0) map.get(u0Var);
        if (f0Var2.equals(f0Var) && f0Var.equals(f0Var2)) {
            return;
        }
        throw new GeneralSecurityException("Attempt to register non-equal serializer for already existing object of type: " + u0Var);
    }

    public void o() {
        this.f95138c = 12;
    }

    @Override // o9.p2
    public void onAlarm() {
        NovaLauncher novaLauncher = (NovaLauncher) this.f95140e;
        CellLayout cellLayout = (CellLayout) this.f95139d;
        if (cellLayout == null) {
            novaLauncher.Q.d();
            return;
        }
        CellLayoutPagedView cellLayoutPagedView = (CellLayoutPagedView) this.f95138c;
        Workspace workspace = novaLauncher.O;
        if (cellLayoutPagedView == workspace) {
            if (workspace.D(workspace.indexOfChild(cellLayout)) == workspace.f80106f) {
                return;
            }
            workspace.l0(workspace.indexOfChild((CellLayout) this.f95139d));
        } else {
            int iIndexOfChild = cellLayoutPagedView.indexOfChild(cellLayout);
            CellLayoutPagedView cellLayoutPagedView2 = (CellLayoutPagedView) this.f95138c;
            if (iIndexOfChild != cellLayoutPagedView2.f80106f) {
                cellLayoutPagedView2.l0(iIndexOfChild);
            }
        }
    }

    public void p(int i5) throws InvalidAlgorithmParameterException {
        if (i5 != 16 && i5 != 24 && i5 != 32) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported", Integer.valueOf(i5)));
        }
        this.f95137b = Integer.valueOf(i5);
    }

    public void q() {
        this.f95139d = 16;
    }

    public n r() {
        return new n((v0) ((k7) this.f95137b).zzb(), ((com.google.android.gms.internal.consent_sdk.g) this.f95138c).zzb(), (com.google.android.gms.internal.consent_sdk.h) ((k7) this.f95139d).zzb(), (com.google.android.gms.internal.consent_sdk.d0) ((k7) this.f95140e).zzb());
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public /* bridge */ /* synthetic */ Object zzb() {
        switch (this.f95136a) {
            case 3:
                return r();
            default:
                return new c3((com.google.android.gms.internal.consent_sdk.h) ((k7) this.f95137b).zzb(), ((n7) this.f95138c).zzb(), (com.google.android.gms.internal.consent_sdk.p) ((k7) this.f95139d).zzb(), (com.google.android.gms.internal.consent_sdk.d0) ((k7) this.f95140e).zzb());
        }
    }

    public /* synthetic */ h(Object obj, Object obj2, Object obj3, Object obj4, int i5) {
        this.f95136a = i5;
        this.f95137b = obj;
        this.f95138c = obj2;
        this.f95139d = obj3;
        this.f95140e = obj4;
    }

    public h(WorkDatabase_Impl workDatabase_Impl) {
        this.f95136a = 0;
        this.f95137b = workDatabase_Impl;
        int i5 = 2;
        this.f95138c = new b(workDatabase_Impl, i5);
        this.f95139d = new qp.h(workDatabase_Impl, i5);
        this.f95140e = new qp.h(workDatabase_Impl, 3);
    }

    public h(kl.v0 v0Var) {
        this.f95136a = 7;
        this.f95137b = new HashMap(v0Var.f71644a);
        this.f95138c = new HashMap(v0Var.f71645b);
        this.f95139d = new HashMap(v0Var.f71646c);
        this.f95140e = new HashMap(v0Var.f71647d);
    }

    public h(int i5) {
        this.f95136a = i5;
        switch (i5) {
            case 7:
                this.f95137b = new HashMap();
                this.f95138c = new HashMap();
                this.f95139d = new HashMap();
                this.f95140e = new HashMap();
                break;
            case 8:
            default:
                this.f95139d = new ArrayList();
                this.f95140e = new ArrayList();
                break;
            case 9:
                this.f95139d = new a3.e(this, 26);
                break;
        }
    }
}
