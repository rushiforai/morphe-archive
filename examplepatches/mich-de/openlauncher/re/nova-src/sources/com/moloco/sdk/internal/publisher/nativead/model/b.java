package com.moloco.sdk.internal.publisher.nativead.model;

import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: g, reason: collision with root package name */
    public static final int f37309g = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f37310a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<a> f37311b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final c f37312c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final List<String> f37313d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<C0168b> f37314e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final String f37315f;

    public static abstract class a {

        /* renamed from: c, reason: collision with root package name */
        public static final int f37316c = 0;

        /* renamed from: a, reason: collision with root package name */
        public final int f37317a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f37318b;

        /* renamed from: com.moloco.sdk.internal.publisher.nativead.model.b$a$a, reason: collision with other inner class name */
        public static final class C0166a extends a {

            /* renamed from: g, reason: collision with root package name */
            public static final int f37319g = 0;

            /* renamed from: d, reason: collision with root package name */
            @Nullable
            public final Integer f37320d;

            /* renamed from: e, reason: collision with root package name */
            @Nullable
            public final Integer f37321e;

            /* renamed from: f, reason: collision with root package name */
            @NotNull
            public final String f37322f;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0166a(int i5, boolean z11, @Nullable Integer num, @Nullable Integer num2, @NotNull String value) {
                super(i5, z11, null);
                Intrinsics.g(value, "value");
                this.f37320d = num;
                this.f37321e = num2;
                this.f37322f = value;
            }

            @Nullable
            public final Integer c() {
                return this.f37321e;
            }

            @Nullable
            public final Integer d() {
                return this.f37320d;
            }

            @NotNull
            public final String e() {
                return this.f37322f;
            }
        }

        /* renamed from: com.moloco.sdk.internal.publisher.nativead.model.b$a$b, reason: collision with other inner class name */
        public static final class C0167b extends a {

            /* renamed from: h, reason: collision with root package name */
            public static final int f37323h = 0;

            /* renamed from: d, reason: collision with root package name */
            @Nullable
            public final Integer f37324d;

            /* renamed from: e, reason: collision with root package name */
            @NotNull
            public final String f37325e;

            /* renamed from: f, reason: collision with root package name */
            @Nullable
            public final Integer f37326f;

            /* renamed from: g, reason: collision with root package name */
            @Nullable
            public final Integer f37327g;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0167b(int i5, boolean z11, @Nullable Integer num, @NotNull String url, @Nullable Integer num2, @Nullable Integer num3) {
                super(i5, z11, null);
                Intrinsics.g(url, "url");
                this.f37324d = num;
                this.f37325e = url;
                this.f37326f = num2;
                this.f37327g = num3;
            }

            @Nullable
            public final Integer c() {
                return this.f37327g;
            }

            @Nullable
            public final Integer d() {
                return this.f37324d;
            }

            @NotNull
            public final String e() {
                return this.f37325e;
            }

            @Nullable
            public final Integer f() {
                return this.f37326f;
            }
        }

        public static final class c extends a {

            /* renamed from: f, reason: collision with root package name */
            public static final int f37328f = 0;

            /* renamed from: d, reason: collision with root package name */
            @NotNull
            public final String f37329d;

            /* renamed from: e, reason: collision with root package name */
            @Nullable
            public final Integer f37330e;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public c(int i5, boolean z11, @NotNull String text, @Nullable Integer num) {
                super(i5, z11, null);
                Intrinsics.g(text, "text");
                this.f37329d = text;
                this.f37330e = num;
            }

            @Nullable
            public final Integer c() {
                return this.f37330e;
            }

            @NotNull
            public final String d() {
                return this.f37329d;
            }
        }

        public static final class d extends a {

            /* renamed from: e, reason: collision with root package name */
            public static final int f37331e = 0;

            /* renamed from: d, reason: collision with root package name */
            @NotNull
            public final String f37332d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public d(int i5, boolean z11, @NotNull String vastTag) {
                super(i5, z11, null);
                Intrinsics.g(vastTag, "vastTag");
                this.f37332d = vastTag;
            }

            @NotNull
            public final String c() {
                return this.f37332d;
            }
        }

        public /* synthetic */ a(int i5, boolean z11, DefaultConstructorMarker defaultConstructorMarker) {
            this(i5, z11);
        }

        public final int a() {
            return this.f37317a;
        }

        public final boolean b() {
            return this.f37318b;
        }

        public a(int i5, boolean z11) {
            this.f37317a = i5;
            this.f37318b = z11;
        }
    }

    /* renamed from: com.moloco.sdk.internal.publisher.nativead.model.b$b, reason: collision with other inner class name */
    public static final class C0168b {

        /* renamed from: d, reason: collision with root package name */
        public static final int f37333d = 0;

        /* renamed from: a, reason: collision with root package name */
        public final int f37334a;

        /* renamed from: b, reason: collision with root package name */
        public final int f37335b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public final String f37336c;

        public C0168b(int i5, int i11, @Nullable String str) {
            this.f37334a = i5;
            this.f37335b = i11;
            this.f37336c = str;
        }

        public final int a() {
            return this.f37334a;
        }

        public final int b() {
            return this.f37335b;
        }

        @Nullable
        public final String c() {
            return this.f37336c;
        }
    }

    public static final class c {

        /* renamed from: d, reason: collision with root package name */
        public static final int f37337d = 8;

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f37338a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final List<String> f37339b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public final String f37340c;

        public c(@NotNull String url, @NotNull List<String> clickTrackerUrls, @Nullable String str) {
            Intrinsics.g(url, "url");
            Intrinsics.g(clickTrackerUrls, "clickTrackerUrls");
            this.f37338a = url;
            this.f37339b = clickTrackerUrls;
            this.f37340c = str;
        }

        @NotNull
        public final List<String> a() {
            return this.f37339b;
        }

        @Nullable
        public final String b() {
            return this.f37340c;
        }

        @NotNull
        public final String c() {
            return this.f37338a;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public b(@Nullable String str, @NotNull List<? extends a> assets, @Nullable c cVar, @NotNull List<String> impressionTrackerUrls, @NotNull List<C0168b> eventTrackers, @Nullable String str2) {
        Intrinsics.g(assets, "assets");
        Intrinsics.g(impressionTrackerUrls, "impressionTrackerUrls");
        Intrinsics.g(eventTrackers, "eventTrackers");
        this.f37310a = str;
        this.f37311b = assets;
        this.f37312c = cVar;
        this.f37313d = impressionTrackerUrls;
        this.f37314e = eventTrackers;
        this.f37315f = str2;
    }

    @NotNull
    public final List<a> a() {
        return this.f37311b;
    }

    @NotNull
    public final List<C0168b> b() {
        return this.f37314e;
    }

    @NotNull
    public final List<String> c() {
        return this.f37313d;
    }

    @Nullable
    public final c d() {
        return this.f37312c;
    }

    @Nullable
    public final String e() {
        return this.f37315f;
    }

    @Nullable
    public final String f() {
        return this.f37310a;
    }
}
