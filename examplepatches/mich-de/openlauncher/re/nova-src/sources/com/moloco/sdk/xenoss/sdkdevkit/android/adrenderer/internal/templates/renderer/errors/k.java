package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class k extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39590i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39591h;

    public static final class a extends k {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39592j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39593k = 0;

        public a() {
            super("net::ERR_BLOCKED_BY_ORTB", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return 2086682310;
        }

        @NotNull
        public String toString() {
            return "ERR_BLOCKED_BY_ORTB";
        }
    }

    public static final class b extends k {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final b f39594j = new b();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39595k = 0;

        public b() {
            super("net::ERR_CLEARTEXT_NOT_PERMITTED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof b);
        }

        public int hashCode() {
            return -1499225977;
        }

        @NotNull
        public String toString() {
            return "ERR_CLEARTEXT_NOT_PERMITTED";
        }
    }

    public static final class c extends k {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final c f39596j = new c();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39597k = 0;

        public c() {
            super("net::ERR_FAILED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof c);
        }

        public int hashCode() {
            return 1678282877;
        }

        @NotNull
        public String toString() {
            return "ERR_FAILED";
        }
    }

    public static final class d extends k {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final d f39598j = new d();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39599k = 0;

        public d() {
            super("net::ERR_HTTP2_PING_FAILED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof d);
        }

        public int hashCode() {
            return 505018197;
        }

        @NotNull
        public String toString() {
            return "ERR_HTTP2_PING_FAILED";
        }
    }

    public static final class e extends k {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final e f39600j = new e();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39601k = 0;

        public e() {
            super("net::ERR_HTTP2_PROTOCOL_ERROR", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof e);
        }

        public int hashCode() {
            return 1437709814;
        }

        @NotNull
        public String toString() {
            return "ERR_HTTP2_PROTOCOL_ERROR";
        }
    }

    public static final class f extends k {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final f f39602j = new f();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39603k = 0;

        public f() {
            super("net::ERR_NETWORK_CHANGED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof f);
        }

        public int hashCode() {
            return -1485714141;
        }

        @NotNull
        public String toString() {
            return "ERR_NETWORK_CHANGED";
        }
    }

    public static final class g extends k {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final g f39604j = new g();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39605k = 0;

        public g() {
            super("net::ERR_QUIC_PROTOCOL_ERROR", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof g);
        }

        public int hashCode() {
            return -1472226974;
        }

        @NotNull
        public String toString() {
            return "ERR_QUIC_PROTOCOL_ERROR";
        }
    }

    public /* synthetic */ k(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39591h;
    }

    public k(String str) {
        super(-1, str, true, false, null);
        this.f39591h = str;
    }
}
