package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fo8 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ go8 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fo8(go8 go8Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = go8Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new fo8(this.c, n92Var, 0);
            default:
                return new fo8(this.c, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((fo8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                return c1eVar;
            default:
                return ((fo8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        File file;
        int i = this.b;
        go8 go8Var = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                go8Var.a().a();
                return c1e.a;
            default:
                br7.v(obj);
                long j = 0;
                try {
                    file = go8Var.a().a.toFile();
                } catch (Exception unused) {
                }
                if (!file.exists()) {
                    return new Long(0L);
                }
                if (!file.isDirectory()) {
                    return new Long(0L);
                }
                File[] fileArrListFiles = file.listFiles();
                if (fileArrListFiles != null) {
                    long length = 0;
                    for (File file2 : fileArrListFiles) {
                        length += file2.length();
                    }
                    j = length;
                }
                return new Long(j);
        }
    }
}
