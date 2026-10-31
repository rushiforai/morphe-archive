package kl;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class z {

    /* renamed from: b, reason: collision with root package name */
    public static final z f71654b = new z();

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f71655a = new HashMap();

    public final synchronized void a(String str, el.g gVar) {
        try {
            if (!this.f71655a.containsKey(str)) {
                this.f71655a.put(str, gVar);
                return;
            }
            if (((el.g) this.f71655a.get(str)).equals(gVar)) {
                return;
            }
            throw new GeneralSecurityException("Parameters object with name " + str + " already exists (" + this.f71655a.get(str) + "), cannot insert " + gVar);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void b(Map map) {
        for (Map.Entry entry : map.entrySet()) {
            a((String) entry.getKey(), (el.g) entry.getValue());
        }
    }
}
