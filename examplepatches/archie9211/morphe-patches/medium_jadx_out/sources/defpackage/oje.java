package defpackage;

import com.medium.android.profile.ui.view.m;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oje extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public m d;
    public int e;
    public int f;
    public final /* synthetic */ m g;
    public final /* synthetic */ String h;
    public final /* synthetic */ SourceParameter i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oje(m mVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = mVar;
        this.h = str;
        this.i = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new oje(this.g, this.h, this.i, n92Var, 0);
            case 1:
                return new oje(this.g, this.h, this.i, n92Var, 1);
            case 2:
                return new oje(this.g, this.h, this.i, n92Var, 2);
            case 3:
                return new oje(this.g, this.h, this.i, n92Var, 3);
            default:
                return new oje(this.g, this.h, this.i, n92Var, 4);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((oje) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:125:0x02c3  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x02c7 A[PHI: r0
      0x02c7: PHI (r0v24 java.lang.Object) = (r0v22 java.lang.Object), (r0v23 java.lang.Object), (r0v34 java.lang.Object) binds: [B:117:0x0294, B:126:0x02c4, B:110:0x0257] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:130:0x02cd  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0377  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x037b A[PHI: r0
      0x037b: PHI (r0v6 java.lang.Object) = (r0v4 java.lang.Object), (r0v5 java.lang.Object), (r0v16 java.lang.Object) binds: [B:150:0x0348, B:159:0x0378, B:143:0x0307] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0381  */
    /* JADX WARN: Removed duplicated region for block: B:169:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:173:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:177:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:181:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:185:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00a4 A[PHI: r0
      0x00a4: PHI (r0v79 java.lang.Object) = (r0v77 java.lang.Object), (r0v78 java.lang.Object), (r0v88 java.lang.Object) binds: [B:19:0x0071, B:28:0x00a1, B:12:0x0034] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x015f A[PHI: r2 r11
      0x015f: PHI (r2v55 java.lang.Object) = (r2v53 java.lang.Object), (r2v54 java.lang.Object), (r2v63 java.lang.Object) binds: [B:51:0x012c, B:60:0x015c, B:44:0x00e2] A[DONT_GENERATE, DONT_INLINE]
      0x015f: PHI (r11v8 tb2) = (r11v5 tb2), (r11v6 tb2), (r11v11 tb2) binds: [B:51:0x012c, B:60:0x015c, B:44:0x00e2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0217 A[PHI: r0 r1
      0x0217: PHI (r0v42 java.lang.Object) = (r0v40 java.lang.Object), (r0v41 java.lang.Object), (r0v52 java.lang.Object) binds: [B:84:0x01e4, B:93:0x0214, B:77:0x019f] A[DONT_GENERATE, DONT_INLINE]
      0x0217: PHI (r1v5 oje) = (r1v3 oje), (r1v4 oje), (r1v0 oje) binds: [B:84:0x01e4, B:93:0x0214, B:77:0x019f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x021d  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) {
        /*
            Method dump skipped, instruction units count: 936
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.oje.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
