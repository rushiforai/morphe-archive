package defpackage;

import j$.time.LocalDate;
import j$.time.LocalDateTime;
import j$.time.LocalTime;
import j$.time.OffsetTime;
import j$.time.ZoneOffset;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q96 extends jud {
    public final /* synthetic */ int a;
    public final /* synthetic */ jud b;
    public final /* synthetic */ jud c;

    public /* synthetic */ q96(jud judVar, jud judVar2, int i) {
        this.a = i;
        this.b = judVar;
        this.c = judVar2;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        int i = this.a;
        jud judVar = this.c;
        jud judVar2 = this.b;
        LocalDate localDate = null;
        LocalTime localTime = null;
        switch (i) {
            case 0:
                gd6Var.m();
                LocalTime localTime2 = null;
                while (gd6Var.p0() != jd6.END_OBJECT) {
                    String strX = gd6Var.X();
                    strX.getClass();
                    if (strX.equals("date")) {
                        localDate = (LocalDate) judVar2.b(gd6Var);
                    } else if (strX.equals("time")) {
                        localTime2 = (LocalTime) judVar.b(gd6Var);
                    } else {
                        gd6Var.v();
                    }
                }
                gd6Var.I();
                o96.b(localDate, "date", gd6Var);
                o96.b(localTime2, "time", gd6Var);
                return LocalDateTime.of(localDate, localTime2);
            default:
                gd6Var.m();
                ZoneOffset zoneOffset = null;
                while (gd6Var.p0() != jd6.END_OBJECT) {
                    String strX2 = gd6Var.X();
                    strX2.getClass();
                    if (strX2.equals("offset")) {
                        zoneOffset = (ZoneOffset) judVar.b(gd6Var);
                    } else if (strX2.equals("time")) {
                        localTime = (LocalTime) judVar2.b(gd6Var);
                    } else {
                        gd6Var.v();
                    }
                }
                gd6Var.I();
                o96.b(localTime, "time", gd6Var);
                o96.b(zoneOffset, "offset", gd6Var);
                return OffsetTime.of(localTime, zoneOffset);
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        int i = this.a;
        jud judVar = this.c;
        jud judVar2 = this.b;
        switch (i) {
            case 0:
                LocalDateTime localDateTime = (LocalDateTime) obj;
                yd6Var.p();
                yd6Var.L("date");
                judVar2.c(yd6Var, localDateTime.e());
                yd6Var.L("time");
                judVar.c(yd6Var, localDateTime.toLocalTime());
                yd6Var.I();
                break;
            default:
                OffsetTime offsetTime = (OffsetTime) obj;
                yd6Var.p();
                yd6Var.L("time");
                judVar2.c(yd6Var, offsetTime.toLocalTime());
                yd6Var.L("offset");
                judVar.c(yd6Var, offsetTime.getOffset());
                yd6Var.I();
                break;
        }
    }
}
