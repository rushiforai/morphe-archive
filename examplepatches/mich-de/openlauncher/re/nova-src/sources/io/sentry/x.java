package io.sentry;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes4.dex */
public final class x {

    /* renamed from: f, reason: collision with root package name */
    public static final HashMap f67901f;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f67902a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f67903b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public a f67904c = null;

    /* renamed from: d, reason: collision with root package name */
    public a f67905d = null;

    /* renamed from: e, reason: collision with root package name */
    public a f67906e = null;

    static {
        HashMap map = new HashMap();
        f67901f = map;
        map.put("boolean", Boolean.class);
        map.put("char", Character.class);
        map.put("byte", Byte.class);
        map.put("short", Short.class);
        map.put("int", Integer.class);
        map.put("long", Long.class);
        map.put("float", Float.class);
        map.put("double", Double.class);
    }

    public final synchronized void a() {
        try {
            Iterator it = this.f67902a.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                if (entry.getKey() == null || !((String) entry.getKey()).startsWith("sentry:")) {
                    it.remove();
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized Object b(Class cls, String str) {
        Object obj = this.f67902a.get(str);
        if (cls.isInstance(obj)) {
            return obj;
        }
        Class cls2 = (Class) f67901f.get(cls.getCanonicalName());
        if (obj != null && cls.isPrimitive() && cls2 != null) {
            if (cls2.isInstance(obj)) {
                return obj;
            }
        }
        return null;
    }

    public final synchronized void c(String str, Object obj) {
        this.f67902a.put(str, obj);
    }
}
