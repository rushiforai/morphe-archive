package c3;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/* loaded from: classes.dex */
public final class j1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f19349a;

    public j1(Context context) {
        this.f19349a = context;
    }

    public final void a(String str) {
        try {
            this.f19349a.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(str)));
        } catch (ActivityNotFoundException e3) {
            throw new IllegalArgumentException(h6.c1.m('.', "Can't open ", str), e3);
        }
    }
}
