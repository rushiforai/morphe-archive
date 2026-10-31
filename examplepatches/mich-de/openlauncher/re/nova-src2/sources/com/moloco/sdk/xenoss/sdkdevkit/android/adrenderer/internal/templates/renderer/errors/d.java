package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class d extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39555i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39556h;

    public static final class a extends d {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39557j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39558k = 0;

        public a() {
            super("net::ERR_PROXY_CONNECTION_FAILED", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return 120626217;
        }

        @NotNull
        public String toString() {
            return "ERR_PROXY_CONNECTION_FAILED";
        }
    }

    public /* synthetic */ d(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39556h;
    }

    public d(String str) {
        super(-5, str, false, true, null);
        this.f39556h = str;
    }
}
