package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class i extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39580i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39581h;

    public static final class a extends i {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39582j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39583k = 0;

        public a() {
            super("net::ERR_CONNECTION_TIMED_OUT", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return -56384004;
        }

        @NotNull
        public String toString() {
            return "ERR_CONNECTION_TIMED_OUT";
        }
    }

    public static final class b extends i {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final b f39584j = new b();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39585k = 0;

        public b() {
            super("net::ERR_TIMED_OUT", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof b);
        }

        public int hashCode() {
            return 389383759;
        }

        @NotNull
        public String toString() {
            return "ERR_TIMED_OUT";
        }
    }

    public /* synthetic */ i(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39581h;
    }

    public i(String str) {
        super(-8, str, true, false, null);
        this.f39581h = str;
    }
}
