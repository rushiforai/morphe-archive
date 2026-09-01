package defpackage;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rwa extends p4d implements c55 {
    public List b;
    public List c;
    public List d;
    public g78 e;
    public g78 f;
    public g78 g;
    public Set h;
    public g78 i;
    public int j;
    public /* synthetic */ ft k;
    public final /* synthetic */ swa l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rwa(swa swaVar, n92 n92Var) {
        super(3, n92Var);
        this.l = swaVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00fd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void i(defpackage.swa r22, java.util.List r23, java.util.List r24, java.util.List r25, defpackage.g78 r26, defpackage.g78 r27, defpackage.g78 r28, defpackage.g78 r29) {
        /*
            Method dump skipped, instruction units count: 265
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rwa.i(swa, java.util.List, java.util.List, java.util.List, g78, g78, g78, g78):void");
    }

    public static final void n(List list, swa swaVar) {
        list.clear();
        synchronized (swaVar.c) {
            try {
                ArrayList arrayList = swaVar.k;
                int size = arrayList.size();
                for (int i = 0; i < size; i++) {
                    list.add((s48) arrayList.get(i));
                }
                swaVar.k.clear();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        rwa rwaVar = new rwa(this.l, (n92) obj3);
        rwaVar.k = (ft) obj2;
        return rwaVar.invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x009a A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x011a  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x00f0 -> B:25:0x00f8). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x011a -> B:12:0x0093). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) {
        /*
            Method dump skipped, instruction units count: 292
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rwa.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
