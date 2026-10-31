package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class b extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39535i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39536h;

    public static final class a extends b {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39537j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39538k = 0;

        public a() {
            super("net::ERR_CONNECTION_ABORTED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return -262105110;
        }

        @NotNull
        public String toString() {
            return "ERR_CONNECTION_ABORTED";
        }
    }

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.b$b, reason: collision with other inner class name */
    public static final class C0233b extends b {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final C0233b f39539j = new C0233b();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39540k = 0;

        public C0233b() {
            super("net::ERR_CONNECTION_CLOSED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof C0233b);
        }

        public int hashCode() {
            return -219055663;
        }

        @NotNull
        public String toString() {
            return "ERR_CONNECTION_CLOSED";
        }
    }

    public static final class c extends b {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final c f39541j = new c();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39542k = 0;

        public c() {
            super("net::ERR_CONNECTION_REFUSED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof c);
        }

        public int hashCode() {
            return 2018219755;
        }

        @NotNull
        public String toString() {
            return "ERR_CONNECTION_REFUSED";
        }
    }

    public static final class d extends b {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final d f39543j = new d();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39544k = 0;

        public d() {
            super("net::ERR_CONNECTION_RESET", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof d);
        }

        public int hashCode() {
            return 976412714;
        }

        @NotNull
        public String toString() {
            return "ERR_CONNECTION_RESET";
        }
    }

    public static final class e extends b {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final e f39545j = new e();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39546k = 0;

        public e() {
            super("net::ERR_SOCKET_NOT_CONNECTED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof e);
        }

        public int hashCode() {
            return 1961158189;
        }

        @NotNull
        public String toString() {
            return "ERR_SOCKET_NOT_CONNECTED";
        }
    }

    public /* synthetic */ b(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39536h;
    }

    public b(String str) {
        super(-6, str, true, false, null);
        this.f39536h = str;
    }
}
