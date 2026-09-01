package defpackage;

import j$.util.DesugarCollections;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class emc {
    public static final boolean a;
    public static final dmc b;
    public static final dmc c;
    public static final List d;

    static {
        boolean z;
        try {
            Class.forName("java.sql.Date");
            z = true;
        } catch (ClassNotFoundException unused) {
            z = false;
        }
        a = z;
        if (z) {
            b = new dmc(0, Date.class);
            c = new dmc(1, Timestamp.class);
            d = DesugarCollections.unmodifiableList(Arrays.asList(amc.b, zlc.b, cmc.b));
        } else {
            b = null;
            c = null;
            d = Collections.EMPTY_LIST;
        }
    }
}
