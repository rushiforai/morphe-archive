package com.bytedance.sdk.component.ycx;

import com.bytedance.sdk.component.ycx.sya;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import org.json.JSONException;

/* loaded from: classes2.dex */
class lt {
    private final com.bytedance.sdk.component.ycx.ycx fby;

    /* renamed from: ul, reason: collision with root package name */
    private final ea f24133ul;
    private final ul ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Map<String, zb> f24134zb = new HashMap();
    private final wie<String, pmi> sya = new wie<>();

    /* renamed from: dj, reason: collision with root package name */
    private final Map<String, sya.zb> f24131dj = new HashMap();
    private final List<xkz> lud = new ArrayList();

    /* renamed from: lt, reason: collision with root package name */
    private final Set<sya> f24132lt = new HashSet();

    public static final class ycx {
        boolean ycx;

        /* renamed from: zb, reason: collision with root package name */
        String f24136zb;

        private ycx(boolean z11, String str) {
            this.ycx = z11;
            this.f24136zb = str;
        }
    }

    public lt(jw jwVar, com.bytedance.sdk.component.ycx.ycx ycxVar) {
        this.fby = ycxVar;
        this.ycx = jwVar.f24122dj;
        this.f24133ul = jwVar.fby;
    }

    public ycx ycx(xkz xkzVar, lud ludVar) throws Exception {
        zb zbVar = this.f24134zb.get(xkzVar.f24142dj);
        if (zbVar != null) {
            try {
                if (zbVar instanceof dj) {
                    xkzVar.toString();
                    return ycx(xkzVar, (dj) zbVar, ludVar);
                }
            } catch (IllegalStateException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "eO8hmSu9Z8OMT8U=", "U+8jkQ+5Q9SjS9tRphC2KQ==", 60);
                xkzVar.toString();
                this.lud.add(xkzVar);
                return new ycx(false, uh.ycx());
            }
        }
        pmi pmiVarYcx = this.sya.ycx(xkzVar.f24142dj);
        if (pmiVarYcx != null) {
            xkzVar.toString();
            return ycx(xkzVar, pmiVarYcx, ludVar);
        }
        sya.zb zbVar2 = this.f24131dj.get(xkzVar.f24142dj);
        if (zbVar2 == null) {
            xkzVar.toString();
            return null;
        }
        sya syaVarYcx = zbVar2.ycx();
        syaVarYcx.ycx(xkzVar.f24142dj);
        xkzVar.toString();
        return ycx(xkzVar, syaVarYcx, ludVar);
    }

    public void ycx(String str, dj<?, ?> djVar) {
        djVar.ycx(str);
        this.f24134zb.put(str, djVar);
    }

    public void ycx(Set<String> set, pmi<?, ?> pmiVar) {
        pmiVar.ycx(set);
        this.sya.ycx(set, pmiVar);
        Objects.toString(set);
    }

    public void ycx(String str, sya.zb zbVar) {
        this.f24131dj.put(str, zbVar);
    }

    public void ycx() {
        Iterator<sya> it = this.f24132lt.iterator();
        while (it.hasNext()) {
            it.next().lud();
        }
        this.f24132lt.clear();
        this.f24134zb.clear();
        this.f24131dj.clear();
        this.sya.ycx();
    }

    private ycx ycx(xkz xkzVar, dj djVar, lud ludVar) throws Exception {
        return new ycx(true, uh.ycx(this.ycx.ycx((ul) djVar.ycx(xkzVar.f24142dj, ycx(xkzVar.lud, (zb) djVar), ludVar)), djVar.zb()));
    }

    private ycx ycx(final xkz xkzVar, final sya syaVar, lud ludVar) throws Exception {
        this.f24132lt.add(syaVar);
        syaVar.ycx(ycx(xkzVar.lud, syaVar), ludVar, new sya.ycx() { // from class: com.bytedance.sdk.component.ycx.lt.1
            @Override // com.bytedance.sdk.component.ycx.sya.ycx
            public void ycx(Object obj) {
                if (lt.this.fby == null) {
                    return;
                }
                lt.this.fby.zb(uh.ycx(lt.this.ycx.ycx((ul) obj), syaVar.zb()), xkzVar);
                lt.this.f24132lt.remove(syaVar);
            }

            @Override // com.bytedance.sdk.component.ycx.sya.ycx
            public void ycx(Throwable th2) {
                if (lt.this.fby == null) {
                    return;
                }
                lt.this.fby.zb(uh.ycx(th2), xkzVar);
                lt.this.f24132lt.remove(syaVar);
            }
        });
        return new ycx(false, uh.ycx());
    }

    private Object ycx(String str, zb zbVar) throws JSONException {
        return this.ycx.ycx(str, ycx(zbVar)[0]);
    }

    private static Type[] ycx(Object obj) {
        Type genericSuperclass = obj.getClass().getGenericSuperclass();
        if (genericSuperclass != null) {
            return ((ParameterizedType) genericSuperclass).getActualTypeArguments();
        }
        throw new IllegalStateException("Method is not parameterized?!");
    }
}
