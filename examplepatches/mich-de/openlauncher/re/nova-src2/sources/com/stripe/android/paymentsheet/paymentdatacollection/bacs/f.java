package com.stripe.android.paymentsheet.paymentdatacollection.bacs;

import bv.m;
import bv.n;
import com.stripe.android.paymentsheet.paymentdatacollection.bacs.BacsMandateConfirmationContract;
import h6.f1;
import h6.j1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final BacsMandateConfirmationContract.Args f44910a;

    public f(BacsMandateConfirmationContract.Args args) {
        Intrinsics.g(args, "args");
        this.f44910a = args;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        BacsMandateConfirmationContract.Args args = this.f44910a;
        return new n(new m(args.f44902a, args.f44903b, args.f44904c, args.f44905d));
    }
}
