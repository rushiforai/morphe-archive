package com.stripe.android.paymentsheet.repositories;

import b.c0;
import b70.c;
import fv.l;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0001\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/paymentsheet/repositories/DuplicatePaymentMethodDetachFailureException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "fv/l", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class DuplicatePaymentMethodDetachFailureException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final List f44953a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44954b;

    public DuplicatePaymentMethodDetachFailureException(List failures) {
        Intrinsics.g(failures, "failures");
        this.f44953a = failures;
        List<l> list = failures;
        ArrayList arrayList = new ArrayList(c.u0(list, 10));
        for (l lVar : list) {
            String str = lVar.f56129a;
            String message = lVar.f56130b.getMessage();
            if (message == null) {
                message = "Unknown reason";
            }
            arrayList.add(c0.n("\n - (paymentMethodId: ", str, ", reason: ", message, ")"));
        }
        this.f44954b = "Failed to detach the following duplicates:" + arrayList;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f44954b;
    }
}
