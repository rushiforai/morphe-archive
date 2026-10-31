package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class f extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39563i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39564h;

    public static final class a extends f {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39565j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39566k = 0;

        public a() {
            super("net::ERR_SSL_BAD_RECORD_MAC_ALERT", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return 1157822157;
        }

        @NotNull
        public String toString() {
            return "ERR_SSL_BAD_RECORD_MAC_ALERT";
        }
    }

    public static final class b extends f {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final b f39567j = new b();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39568k = 0;

        public b() {
            super("net::ERR_SSL_PROTOCOL_ERROR", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof b);
        }

        public int hashCode() {
            return -715617482;
        }

        @NotNull
        public String toString() {
            return "ERR_SSL_PROTOCOL_ERROR";
        }
    }

    public static final class c extends f {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final c f39569j = new c();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39570k = 0;

        public c() {
            super("net::ERR_SSL_VERSION_OR_CIPHER_MISMATCH", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof c);
        }

        public int hashCode() {
            return 516103234;
        }

        @NotNull
        public String toString() {
            return "ERR_SSL_VERSION_OR_CIPHER_MISMATCH";
        }
    }

    public /* synthetic */ f(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39564h;
    }

    public f(String str) {
        super(-11, str, false, true, null);
        this.f39564h = str;
    }
}
