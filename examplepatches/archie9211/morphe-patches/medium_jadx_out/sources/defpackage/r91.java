package defpackage;

import android.os.Bundle;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.data.settings.Frequency;
import com.medium.android.donkey.write.EditPostFragment;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r91 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;
    public Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r91(id1 id1Var, u4b u4bVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.d = id1Var;
        this.e = u4bVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                return new r91((kv6) this.e, (id1) obj2, n92Var, 0);
            case 1:
                return new r91((id1) obj2, (u4b) this.e, n92Var);
            case 2:
                return new r91((kv6) this.e, (si1) obj2, n92Var, 2);
            case 3:
                return new r91((mj1) this.e, (String) obj2, n92Var, 3);
            case 4:
                r91 r91Var = new r91((yj1) obj2, n92Var, 4);
                r91Var.e = obj;
                return r91Var;
            case 5:
                r91 r91Var2 = new r91((dk1) obj2, n92Var, 5);
                r91Var2.e = obj;
                return r91Var2;
            case 6:
                return new r91((bo4) this.e, (hzb) obj2, n92Var, 6);
            case 7:
                r91 r91Var3 = new r91((xyb) obj2, n92Var, 7);
                r91Var3.e = obj;
                return r91Var3;
            case 8:
                return new r91((kv6) this.e, (hu1) obj2, n92Var, 8);
            case 9:
                return new r91((ru1) this.e, (String) obj2, n92Var, 9);
            case 10:
                return new r91((j12) obj2, n92Var, 10);
            case 11:
                return new r91((l12) this.e, (Runnable) obj2, n92Var, 11);
            case 12:
                return new r91((b55) this.e, (uc9) obj2, n92Var, 12);
            case 13:
                return new r91((b55) this.e, (rya) obj2, n92Var, 13);
            case 14:
                return new r91((vb9) this.e, (lid) obj2, n92Var, 14);
            case 15:
                return new r91((we2) obj2, n92Var, 15);
            case 16:
                r91 r91Var4 = new r91((we2) obj2, n92Var, 16);
                r91Var4.e = obj;
                return r91Var4;
            case 17:
                return new r91((va6) this.e, (il2) obj2, n92Var, 17);
            case 18:
                r91 r91Var5 = new r91((List) obj2, n92Var, 18);
                r91Var5.e = obj;
                return r91Var5;
            case 19:
                return new r91((b55) this.e, (et2) obj2, n92Var, 19);
            case 20:
                r91 r91Var6 = new r91((mu2) obj2, n92Var, 20);
                r91Var6.e = obj;
                return r91Var6;
            case 21:
                return new r91((xx2) obj2, n92Var, 21);
            case 22:
                return new r91((py2) this.e, (rya) obj2, n92Var, 22);
            case 23:
                return new r91((y23) this.e, (String) obj2, n92Var, 23);
            case 24:
                return new r91((j53) obj2, n92Var, 24);
            case 25:
                return new r91((ce3) this.e, (Frequency) obj2, n92Var, 25);
            case 26:
                return new r91((bo4) this.e, (ah3) obj2, n92Var, 26);
            case 27:
                return new r91((DarkMode) this.e, (ph3) obj2, n92Var, 27);
            case 28:
                return new r91((zy4) this.e, (ph3) obj2, n92Var, 28);
            default:
                return new r91((EditPostFragment) this.e, (Bundle) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((r91) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:166:0x03ad, code lost:
    
        if (r8.h(r5) == r10) goto L167;
     */
    /* JADX WARN: Code restructure failed: missing block: B:234:0x04b8, code lost:
    
        if (defpackage.gsa.X(500, r5) != r0) goto L237;
     */
    /* JADX WARN: Code restructure failed: missing block: B:257:0x0520, code lost:
    
        if (defpackage.r6c.m(r2, r3, r5) == r1) goto L258;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x021d  */
    /* JADX WARN: Removed duplicated region for block: B:170:0x03b7  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x04ac  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x04ad A[Catch: all -> 0x0468, TryCatch #1 {all -> 0x0468, blocks: (B:209:0x0464, B:237:0x04bc, B:230:0x04a4, B:233:0x04ad, B:214:0x046e, B:215:0x0472, B:228:0x049e, B:229:0x04a3, B:223:0x048c, B:225:0x0495), top: B:502:0x045a }] */
    /* JADX WARN: Removed duplicated region for block: B:282:0x05ab A[PHI: r0 r5 r10
      0x05ab: PHI (r0v62 java.lang.Object) = (r0v61 java.lang.Object), (r0v73 java.lang.Object) binds: [B:280:0x05a7, B:269:0x0556] A[DONT_GENERATE, DONT_INLINE]
      0x05ab: PHI (r5v3 r91) = (r5v2 r91), (r5v0 r91) binds: [B:280:0x05a7, B:269:0x0556] A[DONT_GENERATE, DONT_INLINE]
      0x05ab: PHI (r10v5 tb2) = (r10v4 tb2), (r10v6 tb2) binds: [B:280:0x05a7, B:269:0x0556] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:284:0x05b2  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x05e0  */
    /* JADX WARN: Removed duplicated region for block: B:537:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:553:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:554:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:555:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01f6 A[PHI: r0
      0x01f6: PHI (r0v121 java.lang.Object) = (r0v120 java.lang.Object), (r0v123 java.lang.Object) binds: [B:91:0x01f3, B:85:0x01c5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x020a A[PHI: r0
      0x020a: PHI (r0v124 a53) = (r0v122 a53), (r0v135 a53) binds: [B:94:0x0207, B:84:0x01bd] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x020e  */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:234:0x04b8 -> B:237:0x04bc). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r25) {
        /*
            Method dump skipped, instruction units count: 2620
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r91.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r91(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r91(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.d = obj2;
    }
}
