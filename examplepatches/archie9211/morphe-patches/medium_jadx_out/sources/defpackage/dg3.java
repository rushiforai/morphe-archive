package defpackage;

import java.io.IOException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dg3 {
    public final String a;
    public final long[] b = new long[2];
    public final ArrayList c = new ArrayList(2);
    public final ArrayList d = new ArrayList(2);
    public boolean e;
    public boolean f;
    public zf3 g;
    public int h;
    public final /* synthetic */ mg3 i;

    public dg3(mg3 mg3Var, String str) {
        this.i = mg3Var;
        this.a = str;
        StringBuilder sb = new StringBuilder(str);
        sb.append('.');
        int length = sb.length();
        for (int i = 0; i < 2; i++) {
            sb.append(i);
            this.c.add(this.i.a.e(sb.toString()));
            sb.append(".tmp");
            this.d.add(this.i.a.e(sb.toString()));
            sb.setLength(length);
        }
    }

    public final gg3 a() {
        if (!this.e || this.g != null || this.f) {
            return null;
        }
        ArrayList arrayList = this.c;
        int size = arrayList.size();
        int i = 0;
        while (true) {
            mg3 mg3Var = this.i;
            if (i >= size) {
                this.h++;
                return new gg3(mg3Var, this);
            }
            if (!mg3Var.q.L((g59) arrayList.get(i))) {
                try {
                    mg3Var.Q(this);
                } catch (IOException unused) {
                }
                return null;
            }
            i++;
        }
    }
}
