package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class c extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39547i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39548h;

    public static final class a extends c {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39549j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39550k = 0;

        public a() {
            super("net::ERR_ADDRESS_UNREACHABLE", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return -557181147;
        }

        @NotNull
        public String toString() {
            return "ERR_ADDRESS_UNREACHABLE";
        }
    }

    public static final class b extends c {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final b f39551j = new b();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39552k = 0;

        public b() {
            super("net::ERR_INTERNET_DISCONNECTED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof b);
        }

        public int hashCode() {
            return 909214677;
        }

        @NotNull
        public String toString() {
            return "ERR_INTERNET_DISCONNECTED";
        }
    }

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.c$c, reason: collision with other inner class name */
    public static final class C0234c extends c {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final C0234c f39553j = new C0234c();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39554k = 0;

        public C0234c() {
            super("net::ERR_NAME_NOT_RESOLVED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof C0234c);
        }

        public int hashCode() {
            return -1297026924;
        }

        @NotNull
        public String toString() {
            return "ERR_NAME_NOT_RESOLVED";
        }
    }

    public /* synthetic */ c(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39548h;
    }

    public c(String str) {
        super(-2, str, true, false, null);
        this.f39548h = str;
    }
}
