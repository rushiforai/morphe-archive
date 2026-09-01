package defpackage;

import com.google.gson.JsonSyntaxException;
import com.squareup.wire.internal.JsonFormatter;
import j$.time.LocalDateTime;
import j$.time.OffsetDateTime;
import j$.time.ZoneOffset;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ht1 extends jud {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public ht1(fvd fvdVar, Class cls) {
        this.a = 3;
        this.c = fvdVar;
        this.b = cls;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        int i = this.a;
        Collection collection = null;
        LocalDateTime localDateTime = null;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                if (gd6Var.p0() == jd6.NULL) {
                    gd6Var.a0();
                } else {
                    collection = (Collection) ((km8) obj).g();
                    gd6Var.f();
                    while (gd6Var.hasNext()) {
                        collection.add(((lud) obj2).c.b(gd6Var));
                    }
                    gd6Var.D();
                }
                return collection;
            case 1:
                gd6Var.getClass();
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                gd6Var.m();
                while (gd6Var.hasNext()) {
                    String strX = gd6Var.X();
                    strX.getClass();
                    Object objFromString = ((JsonFormatter) obj2).fromString(strX);
                    objFromString.getClass();
                    Object objB = ((jud) obj).b(gd6Var);
                    objB.getClass();
                    linkedHashMap.put(objFromString, objB);
                }
                gd6Var.I();
                return linkedHashMap;
            case 2:
                gd6Var.m();
                ZoneOffset zoneOffset = null;
                while (gd6Var.p0() != jd6.END_OBJECT) {
                    String strX2 = gd6Var.X();
                    strX2.getClass();
                    if (strX2.equals("offset")) {
                        zoneOffset = (ZoneOffset) ((jud) obj).b(gd6Var);
                    } else if (strX2.equals("dateTime")) {
                        localDateTime = (LocalDateTime) ((iud) obj2).b(gd6Var);
                    } else {
                        gd6Var.v();
                    }
                }
                gd6Var.I();
                o96.b(localDateTime, "dateTime", gd6Var);
                o96.b(zoneOffset, "offset", gd6Var);
                return OffsetDateTime.of(localDateTime, zoneOffset);
            default:
                Class cls = (Class) obj2;
                Object objB2 = ((fvd) obj).c.b(gd6Var);
                if (objB2 == null || cls.isInstance(objB2)) {
                    return objB2;
                }
                throw new JsonSyntaxException("Expected a " + cls.getName() + " but was " + objB2.getClass().getName() + "; at path " + gd6Var.R());
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        int i = this.a;
        Object obj2 = this.b;
        Object obj3 = this.c;
        switch (i) {
            case 0:
                Collection collection = (Collection) obj;
                if (collection == null) {
                    yd6Var.Q();
                } else {
                    yd6Var.m();
                    Iterator it2 = collection.iterator();
                    while (it2.hasNext()) {
                        ((lud) obj2).c(yd6Var, it2.next());
                    }
                    yd6Var.D();
                }
                break;
            case 1:
                Map map = (Map) obj;
                yd6Var.getClass();
                yd6Var.p();
                if (map != null) {
                    for (Map.Entry entry : map.entrySet()) {
                        Object key = entry.getKey();
                        Object value = entry.getValue();
                        yd6Var.L(((JsonFormatter) obj2).toStringOrNumber(key).toString());
                        ((jud) obj3).c(yd6Var, value);
                    }
                }
                yd6Var.I();
                break;
            case 2:
                OffsetDateTime offsetDateTime = (OffsetDateTime) obj;
                yd6Var.p();
                yd6Var.L("dateTime");
                ((iud) obj2).c(yd6Var, offsetDateTime.toLocalDateTime());
                yd6Var.L("offset");
                ((jud) obj3).c(yd6Var, offsetDateTime.getOffset());
                yd6Var.I();
                break;
            default:
                ((fvd) obj3).c.c(yd6Var, obj);
                break;
        }
    }

    public /* synthetic */ ht1(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
