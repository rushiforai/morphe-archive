package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.i6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3196i6<NO, YES> {

    /* renamed from: io.branch.search.internal.i6$a */
    public static final class a<NO> extends AbstractC3196i6 {

        /* renamed from: a, reason: collision with root package name */
        public final NO f64738a;

        public a(NO no2) {
            super(0);
            this.f64738a = no2;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && Intrinsics.b(this.f64738a, ((a) obj).f64738a);
        }

        public final int hashCode() {
            NO no2 = this.f64738a;
            if (no2 == null) {
                return 0;
            }
            return no2.hashCode();
        }

        @NotNull
        public final String toString() {
            return com.google.android.gms.internal.measurement.k2.j(new StringBuilder("No(value="), this.f64738a, ')');
        }
    }

    /* renamed from: io.branch.search.internal.i6$b */
    public static final class b<YES> extends AbstractC3196i6 {

        /* renamed from: a, reason: collision with root package name */
        public final YES f64739a;

        public b(YES yes) {
            super(0);
            this.f64739a = yes;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof b) && Intrinsics.b(this.f64739a, ((b) obj).f64739a);
        }

        public final int hashCode() {
            YES yes = this.f64739a;
            if (yes == null) {
                return 0;
            }
            return yes.hashCode();
        }

        @NotNull
        public final String toString() {
            return com.google.android.gms.internal.measurement.k2.j(new StringBuilder("Yes(value="), this.f64739a, ')');
        }
    }

    public AbstractC3196i6() {
    }

    public /* synthetic */ AbstractC3196i6(int i5) {
        this();
    }
}
