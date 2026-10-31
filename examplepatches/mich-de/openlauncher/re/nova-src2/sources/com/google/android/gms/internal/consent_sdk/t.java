package com.google.android.gms.internal.consent_sdk;

import android.app.Activity;
import android.content.ContextWrapper;
import android.content.Intent;

/* loaded from: classes3.dex */
public final class t extends ContextWrapper {

    /* renamed from: a, reason: collision with root package name */
    public Activity f32241a;

    @Override // android.content.ContextWrapper, android.content.Context
    public final Object getSystemService(String str) {
        Activity activity = this.f32241a;
        return activity != null ? activity.getSystemService(str) : super.getSystemService(str);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final void startActivity(Intent intent) {
        Activity activity = this.f32241a;
        if (activity != null) {
            activity.startActivity(intent);
        } else {
            intent.setFlags(268435456);
            super.startActivity(intent);
        }
    }
}
