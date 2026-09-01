package com.facebook;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import com.google.android.recaptcha.tqn.zghxFB;
import defpackage.iq1;
import defpackage.ys0;
import java.lang.reflect.InvocationTargetException;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/facebook/CustomTabActivity;", "Landroid/app/Activity;", "<init>", "()V", "facebook-common_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class CustomTabActivity extends Activity {
    public ys0 a;

    @Override // android.app.Activity
    public final void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i2 == 0) {
            Intent intent2 = new Intent("CustomTabActivity.action_customTabRedirect");
            intent2.putExtra("CustomTabMainActivity.extra_url", getIntent().getDataString());
            iq1.C(this).O(intent2);
            ys0 ys0Var = new ys0(3, this);
            iq1.C(this).L(ys0Var, new IntentFilter("CustomTabActivity.action_destroy"));
            this.a = ys0Var;
        }
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) throws IllegalAccessException, InvocationTargetException {
        zghxFB.VitwPO.invoke(null, this, bundle);
    }

    @Override // android.app.Activity
    public final void onDestroy() throws IllegalAccessException, InvocationTargetException {
        zghxFB.DCDvk.invoke(null, this);
    }
}
