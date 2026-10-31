package com.bykv.vk.openvk.preload.a;

import com.bykv.vk.openvk.preload.a.h;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class l<IN, OUT> extends d<IN, OUT> {

    /* renamed from: d, reason: collision with root package name */
    private Map<String, a> f21965d;

    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        List<h> f21966a = new ArrayList();

        public final a a(h hVar) {
            this.f21966a.add(hVar);
            return this;
        }

        public final a a(List<h> list) {
            this.f21966a.addAll(list);
            return this;
        }
    }

    public final Map<String, a> a() {
        return this.f21965d;
    }

    public static boolean a(List<h> list) {
        return !list.isEmpty() && ((h) a2.c.e(1, list)).f21953a == f.class;
    }

    public static final class b {

        /* renamed from: a, reason: collision with root package name */
        private Map<String, a> f21967a = new HashMap();

        /* renamed from: b, reason: collision with root package name */
        private com.bykv.vk.openvk.preload.a.b.a f21968b;

        public final a a(String str) {
            if (this.f21967a.containsKey(str)) {
                throw new IllegalArgumentException("duplicated branch name");
            }
            a aVar = new a();
            this.f21967a.put(str, aVar);
            return aVar;
        }

        public final h a(Class<? extends l> cls) {
            return h.a.a().a(cls).a(this.f21967a).a(this.f21968b).b();
        }
    }

    @Override // com.bykv.vk.openvk.preload.a.d
    public final void a(Object... objArr) {
        Object obj;
        super.a(objArr);
        if (objArr != null && objArr.length == 1 && (obj = objArr[0]) != null) {
            try {
                this.f21965d = (Map) obj;
                return;
            } catch (ClassCastException e3) {
                throw new IllegalArgumentException(e3);
            }
        }
        throw new IllegalStateException("args error");
    }
}
