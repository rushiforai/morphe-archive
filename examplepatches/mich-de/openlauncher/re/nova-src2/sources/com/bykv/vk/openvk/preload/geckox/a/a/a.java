package com.bykv.vk.openvk.preload.geckox.a.a;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    final int f21993a;

    /* renamed from: b, reason: collision with root package name */
    final c f21994b;

    /* renamed from: c, reason: collision with root package name */
    private final b f21995c;

    /* renamed from: com.bykv.vk.openvk.preload.geckox.a.a.a$a, reason: collision with other inner class name */
    public static final class C0011a {

        /* renamed from: a, reason: collision with root package name */
        private int f21996a;

        /* renamed from: b, reason: collision with root package name */
        private b f21997b = b.f21999a;

        /* renamed from: c, reason: collision with root package name */
        private c f21998c;

        public final C0011a a() {
            this.f21996a = 20;
            return this;
        }

        public final a b() {
            return new a(this, (byte) 0);
        }

        public final C0011a a(b bVar) {
            if (bVar == null) {
                bVar = b.f21999a;
            }
            this.f21997b = bVar;
            return this;
        }
    }

    public /* synthetic */ a(C0011a c0011a, byte b11) {
        this(c0011a);
    }

    public final b a() {
        return this.f21995c;
    }

    private a(C0011a c0011a) {
        this.f21993a = c0011a.f21996a;
        this.f21995c = c0011a.f21997b;
        this.f21994b = c0011a.f21998c;
    }
}
