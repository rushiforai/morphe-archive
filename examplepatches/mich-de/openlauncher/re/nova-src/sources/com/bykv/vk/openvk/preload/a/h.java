package com.bykv.vk.openvk.preload.a;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    Class<? extends d> f21953a;

    /* renamed from: b, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.a.b.a f21954b;

    /* renamed from: c, reason: collision with root package name */
    private Object[] f21955c;

    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        private Class<? extends d> f21956a;

        /* renamed from: b, reason: collision with root package name */
        private com.bykv.vk.openvk.preload.a.b.a f21957b;

        /* renamed from: c, reason: collision with root package name */
        private Object[] f21958c;

        private a() {
        }

        public static a a() {
            return new a();
        }

        public final h b() {
            return new h(this, (byte) 0);
        }

        public final a a(Class<? extends d> cls) {
            if (cls != null) {
                this.f21956a = cls;
                return this;
            }
            throw new IllegalArgumentException("interceptor class == null");
        }

        public final a a(com.bykv.vk.openvk.preload.a.b.a aVar) {
            this.f21957b = aVar;
            return this;
        }

        public final a a(Object... objArr) {
            this.f21958c = objArr;
            return this;
        }
    }

    public /* synthetic */ h(a aVar, byte b11) {
        this(aVar);
    }

    public final com.bykv.vk.openvk.preload.a.b.a a() {
        return this.f21954b;
    }

    public final Object[] b() {
        return this.f21955c;
    }

    private h(a aVar) {
        this.f21953a = aVar.f21956a;
        this.f21954b = aVar.f21957b;
        this.f21955c = aVar.f21958c;
        if (this.f21953a == null) {
            throw new IllegalArgumentException("Interceptor class == null");
        }
    }
}
