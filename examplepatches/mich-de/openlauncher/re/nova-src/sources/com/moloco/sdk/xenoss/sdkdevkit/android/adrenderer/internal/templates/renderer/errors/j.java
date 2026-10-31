package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class j extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39586i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39587h;

    public static final class a extends j {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39588j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39589k = 0;

        public a() {
            super("net::ERR_UNKNOWN_URL_SCHEME", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return 284504500;
        }

        @NotNull
        public String toString() {
            return "ERR_UNKNOWN_URL_SCHEME";
        }
    }

    public /* synthetic */ j(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39587h;
    }

    public j(String str) {
        super(-10, str, false, true, null);
        this.f39587h = str;
    }
}
