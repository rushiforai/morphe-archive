package defpackage;

import com.medium.android.core.navigation.PublicationStatsReference;
import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w8a extends p4d implements b55 {
    public rya b;
    public nya c;
    public Calendar d;
    public Object e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ x8a h;
    public final /* synthetic */ PublicationStatsReference i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w8a(x8a x8aVar, PublicationStatsReference publicationStatsReference, n92 n92Var) {
        super(2, n92Var);
        this.h = x8aVar;
        this.i = publicationStatsReference;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        w8a w8aVar = new w8a(this.h, this.i, n92Var);
        w8aVar.g = obj;
        return w8aVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((w8a) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x011c, code lost:
    
        if (r6.a(r12, r17) == r1) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0161, code lost:
    
        if (defpackage.r6c.m(r9, r2, r17) == r1) goto L58;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0143  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) {
        /*
            Method dump skipped, instruction units count: 360
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w8a.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
