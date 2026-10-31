package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class e extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39559i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39560h;

    public static final class a extends e {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final a f39561j = new a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39562k = 0;

        public a() {
            super("net::ERR_TOO_MANY_REDIRECTS", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return -1800342769;
        }

        @NotNull
        public String toString() {
            return "ERR_TOO_MANY_REDIRECTS";
        }
    }

    public /* synthetic */ e(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39560h;
    }

    public e(String str) {
        super(-9, str, true, true, null);
        this.f39560h = str;
    }
}
