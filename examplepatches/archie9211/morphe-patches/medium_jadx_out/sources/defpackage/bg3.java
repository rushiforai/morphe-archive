package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bg3 {
    public final String a;
    public final long[] b;
    public boolean c;
    public zf3 d;
    public final /* synthetic */ kg3 e;

    public bg3(kg3 kg3Var, String str) {
        this.e = kg3Var;
        this.a = str;
        this.b = new long[kg3Var.g];
    }

    public final File a(int i) {
        return new File(this.e.a, this.a + "." + i);
    }

    public final File b(int i) {
        return new File(this.e.a, this.a + "." + i + ".tmp");
    }

    public final String c() {
        StringBuilder sb = new StringBuilder();
        for (long j : this.b) {
            sb.append(' ');
            sb.append(j);
        }
        return sb.toString();
    }
}
