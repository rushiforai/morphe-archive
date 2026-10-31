package com.moloco.sdk.internal;

import kotlin.jvm.internal.DefaultConstructorMarker;

/* loaded from: classes4.dex */
public abstract class x<R, E> {

    /* renamed from: a, reason: collision with root package name */
    public static final int f38260a = 0;

    public static final class a<R, E> extends x<R, E> {

        /* renamed from: c, reason: collision with root package name */
        public static final int f38261c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final E f38262b;

        public a(E e3) {
            super(null);
            this.f38262b = e3;
        }

        public final E a() {
            return this.f38262b;
        }
    }

    public static final class b<R, E> extends x<R, E> {

        /* renamed from: c, reason: collision with root package name */
        public static final int f38263c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final R f38264b;

        public b(R r11) {
            super(null);
            this.f38264b = r11;
        }

        public final R a() {
            return this.f38264b;
        }
    }

    public /* synthetic */ x(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public x() {
    }
}
