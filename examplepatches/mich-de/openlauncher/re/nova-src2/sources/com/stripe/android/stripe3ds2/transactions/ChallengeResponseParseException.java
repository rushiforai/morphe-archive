package com.stripe.android.stripe3ds2.transactions;

import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/stripe3ds2/transactions/ChallengeResponseParseException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "ps/v", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ChallengeResponseParseException extends Exception {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f45194d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f45195a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45196b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45197c;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ChallengeResponseParseException(xv.c cVar, String detail) {
        this(cVar.f96426a, cVar.f96427b, detail);
        Intrinsics.g(detail, "detail");
    }

    public ChallengeResponseParseException(int i5, String description, String detail) {
        Intrinsics.g(description, "description");
        Intrinsics.g(detail, "detail");
        StringBuilder sb2 = new StringBuilder();
        sb2.append(i5);
        c0.D(sb2, " - ", description, " (", detail);
        sb2.append(")");
        super(sb2.toString());
        this.f45195a = i5;
        this.f45196b = description;
        this.f45197c = detail;
    }
}
