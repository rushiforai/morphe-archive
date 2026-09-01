package defpackage;

import java.io.IOException;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cb2 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ db2 b;

    public /* synthetic */ cb2(db2 db2Var, jyb jybVar) {
        this.a = 3;
        this.b = db2Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws IOException {
        int i = this.a;
        boolean z = true;
        db2 db2Var = this.b;
        switch (i) {
            case 0:
                k49 k49Var = db2Var.s.t;
                Boolean bool = Boolean.TRUE;
                k49Var.setValue(bool);
                db2Var.s.s.setValue(bool);
                kx6 kx6Var = db2Var.s;
                CharSequence charSequenceB = ((jp) ((th4) obj)).b();
                charSequenceB.getClass();
                db2.L0(kx6Var, (String) charSequenceB, db2Var.t);
                return bool;
            case 1:
                List list = (List) obj;
                if (db2Var.s.d() != null) {
                    rjd rjdVarD = db2Var.s.d();
                    rjdVarD.getClass();
                    list.add(rjdVarD.a);
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
            case 2:
                db2.L0(db2Var.s, ((mx) obj).b, db2Var.t);
                return Boolean.TRUE;
            default:
                mx mxVar = (mx) obj;
                if (db2Var.t) {
                    ejd ejdVar = db2Var.s.e;
                    StringBuilder sb = null;
                    if (ejdVar != null) {
                        List listR = d46.R(new sj4(), new ax1(mxVar, 1));
                        kx6 kx6Var2 = db2Var.s;
                        lig ligVar = kx6Var2.d;
                        qa2 qa2Var = kx6Var2.v;
                        uid uidVarN = ligVar.n(listR);
                        ejdVar.a(null, uidVarN);
                        qa2Var.invoke(uidVarN);
                    } else {
                        uid uidVar = db2Var.r;
                        String str = uidVar.a.b;
                        long j = uidVar.b;
                        int i2 = bkd.c;
                        int i3 = (int) (j >> 32);
                        int i4 = (int) (j & 4294967295L);
                        str.getClass();
                        mxVar.getClass();
                        if (i4 >= i3) {
                            sb = new StringBuilder();
                            sb.append((CharSequence) str, 0, i3);
                            sb.append((CharSequence) mxVar);
                            sb.append((CharSequence) str, i4, str.length());
                        } else {
                            z10.i(ev6.s(i4, i3, "End index (", ") is less than start index (", ")."));
                        }
                        String string = sb.toString();
                        int length = mxVar.b.length() + ((int) (db2Var.r.b >> 32));
                        db2Var.s.v.invoke(new uid(string, 4, lk7.q(length, length)));
                    }
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
        }
    }

    public /* synthetic */ cb2(db2 db2Var, int i) {
        this.a = i;
        this.b = db2Var;
    }
}
