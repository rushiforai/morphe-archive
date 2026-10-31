package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import kotlin.UInt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.g2;

/* loaded from: classes4.dex */
public interface d {

    public static abstract class a {

        /* renamed from: a, reason: collision with root package name */
        public static final int f41608a = 0;

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.d$a$a, reason: collision with other inner class name */
        public static final class C0283a extends a {

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public static final C0283a f41609b = new C0283a();

            /* renamed from: c, reason: collision with root package name */
            public static final int f41610c = 0;

            public C0283a() {
                super(null);
            }
        }

        public static final class b extends a {

            /* renamed from: c, reason: collision with root package name */
            public static final int f41611c = 0;

            /* renamed from: b, reason: collision with root package name */
            public final int f41612b;

            public /* synthetic */ b(int i5, DefaultConstructorMarker defaultConstructorMarker) {
                this(i5);
            }

            public final int a() {
                return this.f41612b;
            }

            public final int b() {
                return this.f41612b;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof b) && this.f41612b == ((b) obj).f41612b;
            }

            public int hashCode() {
                int i5 = this.f41612b;
                UInt.Companion companion = UInt.f71696b;
                return Integer.hashCode(i5);
            }

            @NotNull
            public String toString() {
                return "Countdown(seconds=" + ((Object) UInt.a(this.f41612b)) + ')';
            }

            public b(int i5) {
                super(null);
                this.f41612b = i5;
            }

            @NotNull
            public final b a(int i5) {
                return new b(i5, null);
            }

            public static /* synthetic */ b a(b bVar, int i5, int i11, Object obj) {
                if ((i11 & 1) != 0) {
                    i5 = bVar.f41612b;
                }
                return bVar.a(i5);
            }
        }

        public static final class c extends a {

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public static final c f41613b = new c();

            /* renamed from: c, reason: collision with root package name */
            public static final int f41614c = 0;

            public c() {
                super(null);
            }
        }

        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @NotNull
    g2 l();
}
