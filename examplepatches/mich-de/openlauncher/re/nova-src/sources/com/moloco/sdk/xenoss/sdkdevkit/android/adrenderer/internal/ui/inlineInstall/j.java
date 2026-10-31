package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final int f39860a = 0;

    public static final class a extends j {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final a f39861b = new a();

        /* renamed from: c, reason: collision with root package name */
        public static final int f39862c = 0;

        public a() {
            super(null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof a);
        }

        public int hashCode() {
            return 1425206400;
        }

        @NotNull
        public String toString() {
            return "Backgrounded";
        }
    }

    public static final class b extends j {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f39863b = new b();

        /* renamed from: c, reason: collision with root package name */
        public static final int f39864c = 0;

        public b() {
            super(null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof b);
        }

        public int hashCode() {
            return -296757611;
        }

        @NotNull
        public String toString() {
            return "Fallback";
        }
    }

    public static final class c extends j {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final c f39865b = new c();

        /* renamed from: c, reason: collision with root package name */
        public static final int f39866c = 0;

        public c() {
            super(null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof c);
        }

        public int hashCode() {
            return -1208562192;
        }

        @NotNull
        public String toString() {
            return "Success";
        }
    }

    public /* synthetic */ j(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public j() {
    }
}
