package com.moloco.sdk.internal.services;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class A {

    /* renamed from: a, reason: collision with root package name */
    public static final int f37583a = 0;

    public static final class a extends A {

        /* renamed from: c, reason: collision with root package name */
        public static final int f37584c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f37585b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull String carrier) {
            super(null);
            Intrinsics.g(carrier, "carrier");
            this.f37585b = carrier;
        }

        @NotNull
        public final String a() {
            return this.f37585b;
        }
    }

    public static final class b extends A {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f37586b = new b();

        /* renamed from: c, reason: collision with root package name */
        public static final int f37587c = 0;

        public b() {
            super(null);
        }
    }

    public static final class c extends A {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final c f37588b = new c();

        /* renamed from: c, reason: collision with root package name */
        public static final int f37589c = 0;

        public c() {
            super(null);
        }
    }

    public /* synthetic */ A(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public A() {
    }
}
