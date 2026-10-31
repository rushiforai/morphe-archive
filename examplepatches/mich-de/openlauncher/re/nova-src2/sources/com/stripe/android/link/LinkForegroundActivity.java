package com.stripe.android.link;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/link/LinkForegroundActivity;", "Lm/m;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class LinkForegroundActivity extends m.m {

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ int f42926p = 0;
    public boolean o;

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.o = bundle != null ? bundle.getBoolean("LinkHasLaunchedPopup") : false;
        Intent intent = getIntent();
        Intrinsics.f(intent, "getIntent(...)");
        if (Intrinsics.b(intent.getAction(), "LinkForegroundActivity.redirect")) {
            setResult(49871, intent);
            finish();
        }
    }

    @Override // g.o, android.app.Activity
    public final void onNewIntent(Intent intent) {
        Intrinsics.g(intent, "intent");
        super.onNewIntent(intent);
        if (Intrinsics.b(intent.getAction(), "LinkForegroundActivity.redirect")) {
            setResult(49871, intent);
            finish();
        }
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onResume() {
        String string;
        super.onResume();
        if (isFinishing()) {
            return;
        }
        if (this.o) {
            setResult(0);
            finish();
            return;
        }
        this.o = true;
        Bundle extras = getIntent().getExtras();
        Uri uri = (extras == null || (string = extras.getString("LinkPopupUrl")) == null) ? null : Uri.parse(string);
        if (uri == null) {
            setResult(0);
            finish();
            return;
        }
        try {
            w.h hVar = new w.h();
            hVar.d();
            hVar.a().a(this, uri);
        } catch (ActivityNotFoundException e3) {
            setResult(91367, new Intent().putExtra("LinkFailure", e3));
            finish();
        }
    }

    @Override // g.o, n4.i, android.app.Activity
    public final void onSaveInstanceState(Bundle outState) {
        Intrinsics.g(outState, "outState");
        super.onSaveInstanceState(outState);
        outState.putBoolean("LinkHasLaunchedPopup", this.o);
    }
}
