package com.facebook;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.reader.R;
import defpackage.ec2;
import defpackage.f94;
import defpackage.g25;
import defpackage.j15;
import defpackage.km0;
import defpackage.m15;
import defpackage.v97;
import defpackage.x98;
import defpackage.y84;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/facebook/FacebookActivity;", "Lm15;", "<init>", "()V", "facebook-common_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public class FacebookActivity extends m15 {
    public static final /* synthetic */ int g = 0;
    public j15 f;

    @Override // defpackage.m15, android.app.Activity
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            str.getClass();
            printWriter.getClass();
            super.dump(str, fileDescriptor, printWriter, strArr);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    @Override // defpackage.xy1, android.app.Activity, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        configuration.getClass();
        super.onConfigurationChanged(configuration);
        j15 j15Var = this.f;
        if (j15Var != null) {
            j15Var.onConfigurationChanged(configuration);
        }
    }

    @Override // defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        FacebookException facebookException;
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (!f94.q.get()) {
            Context applicationContext = getApplicationContext();
            applicationContext.getClass();
            synchronized (f94.class) {
                f94.j(applicationContext);
            }
        }
        setContentView(R.layout.com_facebook_activity_layout);
        if ("PassThrough".equals(intent.getAction())) {
            Intent intent2 = getIntent();
            intent2.getClass();
            Bundle bundleI = x98.i(intent2);
            if (ec2.a.contains(x98.class) || bundleI == null) {
                facebookException = null;
            } else {
                try {
                    String string = bundleI.getString("error_type");
                    if (string == null) {
                        string = bundleI.getString(PqkdNGCEoxOKZk.GQJrZyLz);
                    }
                    String string2 = bundleI.getString("error_description");
                    if (string2 == null) {
                        string2 = bundleI.getString("com.facebook.platform.status.ERROR_DESCRIPTION");
                    }
                    if (string != null && string.equalsIgnoreCase("UserCanceled")) {
                        facebookException = new FacebookOperationCanceledException(string2);
                    } else {
                        facebookException = new FacebookException(string2);
                    }
                } catch (Throwable th) {
                    ec2.a(x98.class, th);
                    facebookException = null;
                }
            }
            Intent intent3 = getIntent();
            intent3.getClass();
            setResult(0, x98.e(intent3, null, facebookException));
            finish();
            return;
        }
        Intent intent4 = getIntent();
        g25 g25VarM = m();
        j15 j15VarD = g25VarM.D("SingleFragment");
        j15 j15Var = j15VarD;
        if (j15VarD == null) {
            if ("FacebookDialogFragment".equals(intent4.getAction())) {
                y84 y84Var = new y84();
                y84Var.W();
                y84Var.c0(g25VarM, "SingleFragment");
                j15Var = y84Var;
            } else {
                v97 v97Var = new v97();
                v97Var.W();
                km0 km0Var = new km0(g25VarM);
                km0Var.e(R.id.com_facebook_fragment_container, v97Var, "SingleFragment", 1);
                km0Var.d(false);
                j15Var = v97Var;
            }
        }
        this.f = j15Var;
    }
}
