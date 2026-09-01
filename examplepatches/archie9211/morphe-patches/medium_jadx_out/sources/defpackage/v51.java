package defpackage;

import androidx.work.impl.WorkDatabase;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class v51 implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ String b;
    public final /* synthetic */ m7f c;

    public /* synthetic */ v51(m7f m7fVar, String str) {
        this.c = m7fVar;
        this.b = str;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 10;
        m7f m7fVar = this.c;
        String str = this.b;
        switch (i) {
            case 0:
                WorkDatabase workDatabase = m7fVar.c;
                workDatabase.getClass();
                workDatabase.p(new i5b(i2, new u51(workDatabase, str, m7fVar, 1)));
                zqb.b(m7fVar.b, workDatabase, m7fVar.e);
                break;
            default:
                WorkDatabase workDatabase2 = m7fVar.c;
                workDatabase2.getClass();
                workDatabase2.p(new i5b(i2, new u51(workDatabase2, str, m7fVar, 0)));
                zqb.b(m7fVar.b, workDatabase2, m7fVar.e);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ v51(String str, m7f m7fVar) {
        this.b = str;
        this.c = m7fVar;
    }
}
