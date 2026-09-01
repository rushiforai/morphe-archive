package defpackage;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cg3 {
    public final String a;
    public final long[] b;
    public final ArrayList c;
    public final ArrayList d;
    public boolean e;
    public boolean f;
    public zf3 g;
    public int h;
    public long i;
    public final /* synthetic */ lg3 j;

    public cg3(lg3 lg3Var, String str) {
        str.getClass();
        this.j = lg3Var;
        this.a = str;
        lg3Var.getClass();
        this.b = new long[2];
        this.c = new ArrayList();
        this.d = new ArrayList();
        StringBuilder sb = new StringBuilder(str);
        sb.append('.');
        int length = sb.length();
        for (int i = 0; i < 2; i++) {
            sb.append(i);
            this.c.add(this.j.a.e(sb.toString()));
            sb.append(".tmp");
            this.d.add(this.j.a.e(sb.toString()));
            sb.setLength(length);
        }
    }

    public final fg3 a() {
        TimeZone timeZone = ggf.a;
        if (!this.e) {
            return null;
        }
        lg3 lg3Var = this.j;
        if (!lg3Var.l && (this.g != null || this.f)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        long[] jArr = (long[]) this.b.clone();
        for (int i = 0; i < 2; i++) {
            try {
                ikc ikcVarG0 = lg3Var.b.g0((g59) this.c.get(i));
                if (!lg3Var.l) {
                    this.h++;
                    ikcVarG0 = new ag3(ikcVarG0, lg3Var, this);
                }
                arrayList.add(ikcVarG0);
            } catch (FileNotFoundException unused) {
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    egf.b((ikc) it2.next());
                }
                try {
                    lg3Var.T(this);
                    return null;
                } catch (IOException unused2) {
                    return null;
                }
            }
        }
        return new fg3(this.j, this.a, this.i, arrayList, jArr);
    }
}
