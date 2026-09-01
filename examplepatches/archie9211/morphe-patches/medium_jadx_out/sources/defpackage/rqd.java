package defpackage;

import com.medium.proto.event.AnalyticsEventCommonFields;
import com.squareup.wire.AndroidMessage;
import java.lang.annotation.Annotation;
import java.util.Iterator;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rqd {
    public final fh5 a;
    public final o08 b;
    public final zk2 c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final sb2 h;

    public rqd(fh5 fh5Var, o08 o08Var, zk2 zk2Var, String str, String str2, String str3, String str4, sb2 sb2Var) {
        o08Var.getClass();
        zk2Var.getClass();
        sb2Var.getClass();
        this.a = fh5Var;
        this.b = o08Var;
        this.c = zk2Var;
        this.d = str;
        this.e = str2;
        this.f = str3;
        this.g = str4;
        this.h = sb2Var;
    }

    public static void a(rqd rqdVar, AndroidMessage androidMessage, String str, String str2, boolean z, String str3, String str4, int i) {
        String str5 = (i & 4) != 0 ? null : str2;
        if ((i & 8) != 0) {
            z = false;
        }
        boolean z2 = z;
        String str6 = (i & 16) != 0 ? null : str3;
        String str7 = (i & 32) != 0 ? null : str4;
        rqdVar.getClass();
        str.getClass();
        vx0.c0(rqdVar.h, null, null, new qqd(rqdVar, androidMessage, str, str5, z2, str6, str7, null), 3);
    }

    public final Object b(AndroidMessage androidMessage, String str, String str2, boolean z, String str3, String str4, p92 p92Var) throws Throwable {
        Object next;
        fh5 fh5Var = this.a;
        LinkedHashMap linkedHashMap = new LinkedHashMap(fh5Var.a(androidMessage));
        s3 s3VarK = this.c.k();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(fh5Var.a(new AnalyticsEventCommonFields("4.5.1784910415", this.d, this.e, str4 == null ? "/app" : str4, str3, s3VarK != null ? s3VarK.b : null, s3VarK != null ? s3VarK.a : null, str, Boolean.TRUE, str2, this.f, this.g, null, null, 12288, null)));
        linkedHashMap2.put("appDevice", "android");
        linkedHashMap2.put("appVersionCode", Double.valueOf(1.784910415E9d));
        linkedHashMap.put("commonFields", linkedHashMap2);
        Iterator it2 = n1b.a.b(androidMessage.getClass()).getAnnotations().iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((Annotation) next) instanceof r34) {
                break;
            }
        }
        r34 r34Var = (r34) next;
        if (r34Var == null) {
            ywb.g(ka1.r("Event name is not defined for ", n1b.a.b(androidMessage.getClass()).j()));
            return null;
        }
        String strValue = r34Var.value();
        strValue.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        kyd.I(36);
        String string = Long.toString(jCurrentTimeMillis, 36);
        string.getClass();
        long jRandom = (long) (Math.random() * 1.0E16d);
        kyd.I(36);
        String string2 = Long.toString(jRandom, 36);
        string2.getClass();
        pqd pqdVar = new pqd(string.concat(string2), "e", strValue, System.currentTimeMillis(), linkedHashMap);
        o08 o08Var = this.b;
        Object objM0 = vx0.m0(o08Var.b, new oz(o08Var, z, pqdVar, (n92) null), p92Var);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objM0 != tb2Var) {
            objM0 = c1eVar;
        }
        return objM0 == tb2Var ? objM0 : c1eVar;
    }
}
