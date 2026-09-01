package defpackage;

import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pif {
    public final Map a;
    public final Map b;

    public pif() {
        this.a = DesugarCollections.synchronizedMap(new WeakHashMap());
        this.b = DesugarCollections.synchronizedMap(new WeakHashMap());
    }

    public static d2f b() {
        d2f d2fVar = new d2f(22);
        d2fVar.b = new HashMap();
        d2fVar.c = new HashMap();
        return d2fVar;
    }

    public void a(boolean z, Status status) {
        HashMap map;
        HashMap map2;
        Map map3 = this.a;
        synchronized (map3) {
            map = new HashMap(map3);
        }
        Map map4 = this.b;
        synchronized (map4) {
            map2 = new HashMap(map4);
        }
        for (Map.Entry entry : map.entrySet()) {
            if (z || ((Boolean) entry.getValue()).booleanValue()) {
                ((BasePendingResult) entry.getKey()).forceFailureUnlessReady(status);
            }
        }
        for (Map.Entry entry2 : map2.entrySet()) {
            if (z || ((Boolean) entry2.getValue()).booleanValue()) {
                ((wfd) entry2.getKey()).c(new ApiException(status));
            }
        }
    }

    public Enum c(Object obj) throws GeneralSecurityException {
        Enum r1 = (Enum) this.b.get(obj);
        if (r1 != null) {
            return r1;
        }
        throw new GeneralSecurityException("Unable to convert object enum: ".concat(String.valueOf(obj)));
    }

    public Object d(Enum r2) throws GeneralSecurityException {
        Object obj = this.a.get(r2);
        if (obj != null) {
            return obj;
        }
        throw new GeneralSecurityException("Unable to convert proto enum: ".concat(String.valueOf(r2)));
    }

    public Enum e(Object obj) throws GeneralSecurityException {
        Enum r1 = (Enum) this.b.get(obj);
        if (r1 != null) {
            return r1;
        }
        throw new GeneralSecurityException("Unable to convert object enum: ".concat(String.valueOf(obj)));
    }

    public Object f(apg apgVar) throws GeneralSecurityException {
        Object obj = this.a.get(apgVar);
        if (obj != null) {
            return obj;
        }
        throw new GeneralSecurityException("Unable to convert proto enum: ".concat(String.valueOf(apgVar)));
    }

    public /* synthetic */ pif(Map map, Map map2) {
        this.a = map;
        this.b = map2;
    }
}
