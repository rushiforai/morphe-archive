package com.stripe.android.attestation;

import android.content.Intent;
import android.os.Bundle;
import cv.y;
import d00.t;
import dv.r;
import h6.g1;
import h6.h1;
import kotlin.Metadata;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import m.m;
import t70.m0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/attestation/AttestationActivity;", "Lm/m;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class AttestationActivity extends m {

    /* renamed from: q, reason: collision with root package name */
    public static final /* synthetic */ int f42458q = 0;
    public final r o = c.f42464f;

    /* renamed from: p, reason: collision with root package name */
    public final h1 f42459p = new h1(Reflection.f71864a.getOrCreateKotlinClass(c.class), new fq.a(this, 0), new t(this, 28), new fq.a(this, 1));

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        Bundle extras;
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent == null || (extras = intent.getExtras()) == null || !extras.containsKey("attestation_args")) {
            finish();
        } else {
            m0.t(g1.e(this), null, null, new y(this, null, 10), 3);
        }
    }
}
