package defpackage;

import java.sql.Timestamp;
import java.util.Date;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cmc extends jud {
    public static final bmc b = new bmc();
    public final jud a;

    public cmc(jud judVar) {
        this.a = judVar;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) {
        Date date = (Date) this.a.b(gd6Var);
        if (date != null) {
            return new Timestamp(date.getTime());
        }
        return null;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) {
        this.a.c(yd6Var, (Timestamp) obj);
    }
}
