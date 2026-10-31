package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class a extends g {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39531i = 0;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f39532h;

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.a$a, reason: collision with other inner class name */
    public static final class C0232a extends a {

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public static final C0232a f39533j = new C0232a();

        /* renamed from: k, reason: collision with root package name */
        public static final int f39534k = 0;

        public C0232a() {
            super("net::ERR_CERT_AUTHORITY_INVALID", null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof C0232a);
        }

        public int hashCode() {
            return -932810174;
        }

        @NotNull
        public String toString() {
            return "ERR_CERT_AUTHORITY_INVALID";
        }
    }

    public /* synthetic */ a(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g
    @NotNull
    public String c() {
        return this.f39532h;
    }

    public a(String str) {
        super(0, str, false, true, null);
        this.f39532h = str;
    }
}
