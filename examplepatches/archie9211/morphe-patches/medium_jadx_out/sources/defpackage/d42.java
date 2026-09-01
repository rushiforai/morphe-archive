package defpackage;

import android.database.SQLException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class d42 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;

    public /* synthetic */ d42(f42 f42Var, boolean z) {
        this.a = 0;
        this.c = f42Var;
        this.b = z;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        j78 j78VarI;
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.c;
        boolean z = this.b;
        switch (i) {
            case 0:
                f42 f42Var = (f42) obj;
                String str = z ? "reader" : "writer";
                StringBuilder sb = new StringBuilder();
                sb.append("Timed out attempting to acquire a " + str + " connection.");
                sb.append("\n\nWriter pool:\n");
                f42Var.b.d(sb);
                sb.append("Reader pool:");
                sb.append('\n');
                f42Var.a.d(sb);
                try {
                    qk7.z(5, sb.toString());
                    throw null;
                } catch (SQLException e) {
                    e.printStackTrace();
                    return c1eVar;
                }
            case 1:
                m45 m45Var = (m45) obj;
                if (z) {
                    m45Var.invoke();
                }
                return c1eVar;
            case 2:
                cq cqVar = (cq) obj;
                if (z && (j78VarI = cqVar.i()) != null) {
                    ((r6c) j78VarI).h(c1eVar);
                }
                return c1eVar;
            default:
                return new g49(z ? ((m73) obj).Z(182.0f) : 0.0f);
        }
    }

    public /* synthetic */ d42(boolean z, Object obj, int i) {
        this.a = i;
        this.b = z;
        this.c = obj;
    }
}
