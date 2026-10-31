package com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection;

import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionContract;
import cv.v;
import h6.f1;
import h6.j1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final CvcRecollectionContract.Args f44927a;

    public e(CvcRecollectionContract.Args args) {
        Intrinsics.g(args, "args");
        this.f44927a = args;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        CvcRecollectionContract.Args args = this.f44927a;
        return new v(new cv.a(args.f44921a, args.f44922b, args.f44924d));
    }
}
