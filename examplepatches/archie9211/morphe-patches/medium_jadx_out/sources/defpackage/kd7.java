package defpackage;

import android.net.Uri;
import android.view.textclassifier.TextClassifier;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.graphql.fragment.PostMetaData;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kd7 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kd7(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new kd7((zd7) this.d, (hd7) obj2, n92Var, 0);
            case 1:
                kd7 kd7Var = new kd7((me7) obj2, n92Var, 1);
                kd7Var.d = obj;
                return kd7Var;
            case 2:
                return new kd7((va6) this.d, (yi7) obj2, n92Var, 2);
            case 3:
                return new kd7((v7c) this.d, (m45) obj2, n92Var, 3);
            case 4:
                kd7 kd7Var2 = new kd7((o08) obj2, n92Var, 4);
                kd7Var2.d = obj;
                return kd7Var2;
            case 5:
                return new kd7((vpc) this.d, (b48) obj2, n92Var, 5);
            case 6:
                kd7 kd7Var3 = new kd7((q48) obj2, n92Var, 6);
                kd7Var3.d = obj;
                return kd7Var3;
            case 7:
                return new kd7((kv6) this.d, (m98) obj2, n92Var, 7);
            case 8:
                kd7 kd7Var4 = new kd7((be8) obj2, n92Var, 8);
                kd7Var4.d = obj;
                return kd7Var4;
            case 9:
                return new kd7((me8) this.d, (l2a) obj2, n92Var, 9);
            case 10:
                return new kd7((rh8) this.d, (b55) obj2, n92Var, 10);
            case 11:
                kd7 kd7Var5 = new kd7((uz0) obj2, n92Var, 11);
                kd7Var5.d = obj;
                return kd7Var5;
            case 12:
                return new kd7((gz8) this.d, (vk8) obj2, n92Var, 12);
            case 13:
                return new kd7((kv6) this.d, (vk8) obj2, n92Var, 13);
            case 14:
                return new kd7((yo8) this.d, (String) obj2, n92Var, 14);
            case 15:
                return new kd7((b55) this.d, (b59) obj2, n92Var, 15);
            case 16:
                return new kd7((TextClassifier) this.d, (b55) obj2, n92Var, 16);
            case 17:
                return new kd7((kv6) this.d, (fj9) obj2, n92Var, 17);
            case 18:
                return new kd7((sw9) this.d, (h49) obj2, n92Var, 18);
            case 19:
                kd7 kd7Var6 = new kd7((String) obj2, n92Var, 19);
                kd7Var6.d = obj;
                return kd7Var6;
            case 20:
                return new kd7((bo4) this.d, (lo9) obj2, n92Var, 20);
            case 21:
                return new kd7((ko9) this.d, (String) obj2, n92Var, 21);
            case 22:
                return new kd7((wp9) this.d, (yd4) obj2, n92Var, 22);
            case 23:
                return new kd7((sw9) this.d, (PostMetaData) obj2, n92Var, 23);
            case 24:
                return new kd7((sw9) this.d, (Highlight) obj2, n92Var, 24);
            case 25:
                return new kd7((Uri) this.d, (sw9) obj2, n92Var, 25);
            case 26:
                return new kd7((sw9) this.d, (SourceParameter) obj2, n92Var, 26);
            case 27:
                return new kd7((sw9) obj2, n92Var, 27);
            case 28:
                return new kd7((sw9) obj2, n92Var, 28);
            default:
                return new kd7((kv6) this.d, (ex9) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((kd7) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:410:0x08d7, code lost:
    
        if (defpackage.r6c.m(r2, r3, r64) == r1) goto L411;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:113:0x027d  */
    /* JADX WARN: Removed duplicated region for block: B:337:0x07b0  */
    /* JADX WARN: Removed duplicated region for block: B:360:0x0803  */
    /* JADX WARN: Removed duplicated region for block: B:362:0x0809  */
    /* JADX WARN: Removed duplicated region for block: B:439:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:509:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01a2 A[PHI: r2
      0x01a2: PHI (r2v68 java.lang.Object) = (r2v67 java.lang.Object), (r2v67 java.lang.Object), (r2v72 java.lang.Object) binds: [B:70:0x0190, B:72:0x019f, B:64:0x016a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x01a8  */
    /* JADX WARN: Type inference failed for: r11v0, types: [enc, n92] */
    /* JADX WARN: Type inference failed for: r11v5, types: [java.util.concurrent.CancellationException] */
    /* JADX WARN: Type inference failed for: r11v7, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v117 */
    /* JADX WARN: Type inference failed for: r1v118 */
    /* JADX WARN: Type inference failed for: r1v40, types: [int] */
    /* JADX WARN: Type inference failed for: r1v41, types: [va6] */
    /* JADX WARN: Type inference failed for: r1v45, types: [va6] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:337:0x07b0 -> B:329:0x0779). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:366:0x0829 -> B:360:0x0803). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r65) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2380
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kd7.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kd7(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
    }
}
