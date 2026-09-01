package defpackage;

import com.google.gson.JsonSyntaxException;
import j$.time.LocalDateTime;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.ZonedDateTime;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p96 extends jud {
    public final /* synthetic */ int a = 1;
    public final jud b;
    public final jud c;
    public final Object d;

    public p96(it1 it1Var, lud ludVar, lud ludVar2, km8 km8Var) {
        this.b = ludVar;
        this.c = ludVar2;
        this.d = km8Var;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        LocalDateTime localDateTime = null;
        Map map = null;
        switch (this.a) {
            case 0:
                gd6Var.m();
                ZoneOffset zoneOffset = null;
                ZoneId zoneId = null;
                while (gd6Var.p0() != jd6.END_OBJECT) {
                    String strX = gd6Var.X();
                    strX.getClass();
                    switch (strX) {
                        case "offset":
                            zoneOffset = (ZoneOffset) this.c.b(gd6Var);
                            break;
                        case "zone":
                            zoneId = (ZoneId) ((jud) this.d).b(gd6Var);
                            break;
                        case "dateTime":
                            localDateTime = (LocalDateTime) ((iud) this.b).b(gd6Var);
                            break;
                        default:
                            gd6Var.v();
                            break;
                    }
                }
                gd6Var.I();
                o96.b(localDateTime, "dateTime", gd6Var);
                o96.b(zoneOffset, "offset", gd6Var);
                o96.b(zoneId, "zone", gd6Var);
                return ZonedDateTime.ofInstant(localDateTime, zoneOffset, zoneId);
            default:
                jd6 jd6VarP0 = gd6Var.p0();
                if (jd6VarP0 == jd6.NULL) {
                    gd6Var.a0();
                } else {
                    map = (Map) ((km8) this.d).g();
                    if (jd6VarP0 == jd6.BEGIN_ARRAY) {
                        gd6Var.f();
                        while (gd6Var.hasNext()) {
                            gd6Var.f();
                            Object objB = ((lud) this.b).c.b(gd6Var);
                            Object objB2 = ((lud) this.c).c.b(gd6Var);
                            if (map.containsKey(objB)) {
                                throw new JsonSyntaxException(ka1.q("duplicate key: ", objB));
                            }
                            map.put(objB, objB2);
                            gd6Var.D();
                        }
                        gd6Var.D();
                    } else {
                        gd6Var.m();
                        while (gd6Var.hasNext()) {
                            u3b.o.getClass();
                            if (gd6Var instanceof od6) {
                                od6 od6Var = (od6) gd6Var;
                                od6Var.L0(jd6.NAME);
                                Map.Entry entry = (Map.Entry) ((Iterator) od6Var.P0()).next();
                                od6Var.R0(entry.getValue());
                                od6Var.R0(new zc6((String) entry.getKey()));
                            } else {
                                int iB = gd6Var.h;
                                if (iB == 0) {
                                    iB = gd6Var.B();
                                }
                                if (iB == 13) {
                                    gd6Var.h = 9;
                                } else if (iB == 12) {
                                    gd6Var.h = 8;
                                } else {
                                    if (iB != 14) {
                                        throw gd6Var.J0("a name");
                                    }
                                    gd6Var.h = 10;
                                }
                            }
                            Object objB3 = ((lud) this.b).c.b(gd6Var);
                            Object objB4 = ((lud) this.c).c.b(gd6Var);
                            if (map.containsKey(objB3)) {
                                throw new JsonSyntaxException(ka1.q("duplicate key: ", objB3));
                            }
                            map.put(objB3, objB4);
                        }
                        gd6Var.I();
                    }
                }
                return map;
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        int i = this.a;
        jud judVar = this.c;
        switch (i) {
            case 0:
                ZonedDateTime zonedDateTime = (ZonedDateTime) obj;
                if (zonedDateTime == null) {
                    yd6Var.Q();
                } else {
                    yd6Var.p();
                    yd6Var.L("dateTime");
                    ((iud) this.b).c(yd6Var, zonedDateTime.l());
                    yd6Var.L("offset");
                    judVar.c(yd6Var, zonedDateTime.getOffset());
                    yd6Var.L("zone");
                    ((jud) this.d).c(yd6Var, zonedDateTime.getZone());
                    yd6Var.I();
                }
                break;
            default:
                Map map = (Map) obj;
                lud ludVar = (lud) judVar;
                if (map == null) {
                    yd6Var.Q();
                } else {
                    yd6Var.p();
                    for (Map.Entry entry : map.entrySet()) {
                        yd6Var.L(String.valueOf(entry.getKey()));
                        ludVar.c(yd6Var, entry.getValue());
                    }
                    yd6Var.I();
                }
                break;
        }
    }

    public p96(iud iudVar, jud judVar, jud judVar2) {
        this.b = iudVar;
        this.c = judVar;
        this.d = judVar2;
    }
}
