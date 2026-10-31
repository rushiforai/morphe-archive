package com.stripe.android.core.exception;

import b70.g;
import com.stripe.android.core.StripeError;
import java.util.Objects;
import kotlin.Metadata;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b&\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/core/exception/StripeException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "p6/u", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public abstract class StripeException extends Exception {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ int f42562e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final StripeError f42563a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42564b;

    /* renamed from: c, reason: collision with root package name */
    public final int f42565c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f42566d;

    public StripeException() {
        this(0, 31, null, null, null, null);
    }

    public String a() {
        return "stripeException";
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof StripeException) {
            StripeException stripeException = (StripeException) obj;
            if (Intrinsics.b(this.f42563a, stripeException.f42563a) && Intrinsics.b(this.f42564b, stripeException.f42564b) && this.f42565c == stripeException.f42565c && Intrinsics.b(getMessage(), stripeException.getMessage())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(this.f42563a, this.f42564b, Integer.valueOf(this.f42565c), getMessage());
    }

    @Override // java.lang.Throwable
    public String toString() {
        String str = this.f42564b;
        return g.f1(c.v0(new String[]{str != null ? "Request-id: ".concat(str) : null, super.toString()}), "\n", null, null, 0, null, 62);
    }

    public StripeException(StripeError stripeError, String str, int i5, Throwable th2, String str2) {
        super(str2, th2);
        this.f42563a = stripeError;
        this.f42564b = str;
        this.f42565c = i5;
        boolean z11 = false;
        if (400 <= i5 && i5 < 500) {
            z11 = true;
        }
        this.f42566d = z11;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public StripeException(int i5, int i11, StripeError stripeError, String str, String str2, Throwable th2) {
        stripeError = (i11 & 1) != 0 ? null : stripeError;
        this(stripeError, (i11 & 2) != 0 ? null : str, (i11 & 4) != 0 ? 0 : i5, (i11 & 8) != 0 ? null : th2, (i11 & 16) != 0 ? stripeError != null ? stripeError.f42551b : null : str2);
    }
}
