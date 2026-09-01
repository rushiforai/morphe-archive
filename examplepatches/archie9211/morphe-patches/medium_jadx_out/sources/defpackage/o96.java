package defpackage;

import com.google.gson.JsonSyntaxException;
import j$.time.Duration;
import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.LocalDateTime;
import j$.time.LocalTime;
import j$.time.MonthDay;
import j$.time.OffsetDateTime;
import j$.time.OffsetTime;
import j$.time.Period;
import j$.time.Year;
import j$.time.YearMonth;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.ZonedDateTime;
import java.io.IOException;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o96 implements pvd {
    public static final n96 a = new n96(2, new String[]{"seconds", "nanos"});
    public static final n96 b = new n96(3, new String[]{"seconds", "nanos"});
    public static final n96 c = new n96(4, new String[]{"year", "month", "day"});
    public static final n96 d = new n96(5, new String[]{"hour", "minute", "second", "nano"});
    public static final n96 e = new n96(6, new String[]{"month", "day"});
    public static final n96 f = new n96(7, new String[]{"years", "months", "days"});
    public static final n96 g = new n96(0, new String[]{"year"});
    public static final n96 h = new n96(1, new String[]{"year", "month"});
    public static final iud i = new a().a();
    public static final b j = new b();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public class a extends jud {
        @Override // defpackage.jud
        public final Object b(gd6 gd6Var) throws IOException {
            gd6Var.m();
            String strQ = null;
            Integer numValueOf = null;
            while (gd6Var.p0() != jd6.END_OBJECT) {
                String strX = gd6Var.X();
                strX.getClass();
                if (strX.equals("totalSeconds")) {
                    numValueOf = Integer.valueOf(gd6Var.nextInt());
                } else if (strX.equals("id")) {
                    strQ = gd6Var.q();
                } else {
                    gd6Var.v();
                }
            }
            gd6Var.I();
            if (strQ != null) {
                return ZoneId.of(strQ);
            }
            if (numValueOf != null) {
                return ZoneOffset.ofTotalSeconds(numValueOf.intValue());
            }
            throw new JsonSyntaxException("Missing id or totalSeconds field; at path ".concat(gd6Var.R()));
        }

        @Override // defpackage.jud
        public final void c(yd6 yd6Var, Object obj) throws IOException {
            ZoneId zoneId = (ZoneId) obj;
            if (zoneId instanceof ZoneOffset) {
                yd6Var.p();
                yd6Var.L("totalSeconds");
                yd6Var.o0(((ZoneOffset) zoneId).getTotalSeconds());
                yd6Var.I();
                return;
            }
            yd6Var.p();
            yd6Var.L("id");
            yd6Var.A0(zoneId.getId());
            yd6Var.I();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public class b implements kud {
        @Override // defpackage.kud
        public final jud a(ch5 ch5Var, kxd kxdVar) {
            Class clsC = kxdVar.c();
            if (!clsC.getName().startsWith("java.time.")) {
                return null;
            }
            if (clsC == Duration.class) {
                return o96.a;
            }
            if (clsC == Instant.class) {
                return o96.b;
            }
            if (clsC == LocalDate.class) {
                return o96.c;
            }
            if (clsC == LocalTime.class) {
                return o96.d;
            }
            if (clsC == LocalDateTime.class) {
                return o96.a(ch5Var);
            }
            if (clsC == MonthDay.class) {
                return o96.e;
            }
            if (clsC == OffsetDateTime.class) {
                return new ht1(o96.a(ch5Var), 2, ch5Var.e(ZoneOffset.class)).a();
            }
            if (clsC == OffsetTime.class) {
                n96 n96Var = o96.a;
                return new q96(ch5Var.e(LocalTime.class), ch5Var.e(ZoneOffset.class), 1).a();
            }
            if (clsC == Period.class) {
                return o96.f;
            }
            if (clsC == Year.class) {
                return o96.g;
            }
            if (clsC == YearMonth.class) {
                return o96.h;
            }
            if (clsC == ZoneId.class || clsC == ZoneOffset.class) {
                return o96.i;
            }
            if (clsC == ZonedDateTime.class) {
                return new p96(o96.a(ch5Var), ch5Var.e(ZoneOffset.class), ch5Var.e(ZoneId.class)).a();
            }
            return null;
        }
    }

    public static iud a(ch5 ch5Var) {
        return new q96(ch5Var.e(LocalDate.class), ch5Var.e(LocalTime.class), 0).a();
    }

    public static void b(Serializable serializable, String str, gd6 gd6Var) {
        if (serializable != null) {
            return;
        }
        StringBuilder sbU = lv8.u("Missing ", str, " field; at path ");
        sbU.append(gd6Var.R());
        throw new JsonSyntaxException(sbU.toString());
    }
}
