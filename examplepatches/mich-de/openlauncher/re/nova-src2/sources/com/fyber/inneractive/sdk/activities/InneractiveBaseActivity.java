package com.fyber.inneractive.sdk.activities;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.widget.FrameLayout;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public class InneractiveBaseActivity extends Activity {

    /* renamed from: a, reason: collision with root package name */
    public b f27562a;

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (Build.VERSION.SDK_INT >= 33) {
            this.f27562a = new b(this);
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0, this.f27562a);
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        if (Build.VERSION.SDK_INT >= 33) {
            try {
                if (this.f27562a != null) {
                    getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(this.f27562a);
                    this.f27562a = null;
                }
            } catch (Exception e3) {
                IAlog.f("failed to unregisterOnBackInvokedCallback with error: %s", e3.getMessage());
            }
        }
    }

    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        try {
            FrameLayout frameLayout = (FrameLayout) findViewById(16908290);
            if (frameLayout != null) {
                com.fyber.inneractive.sdk.util.o.a(frameLayout);
            }
        } catch (Exception e3) {
            IAlog.f("handleEdgeToEdge failed: %s", e3.getMessage());
        }
    }
}
