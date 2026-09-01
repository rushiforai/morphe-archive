package com.medium.android.donkey.launcher;

import android.os.Build;
import android.os.Bundle;
import com.drew.imaging.tiff.DJ.QntrFMZg;
import com.google.android.gms.common.mEh.uMZiUNjgh;
import com.medium.android.core.navigation.s;
import com.medium.android.graphql.type.FV.uRBzICqRGKZiw;
import com.medium.reader.R;
import defpackage.g76;
import defpackage.h1c;
import defpackage.ho6;
import defpackage.iq1;
import defpackage.n1b;
import defpackage.p13;
import defpackage.py2;
import defpackage.to6;
import defpackage.xm5;
import java.lang.reflect.InvocationTargetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class LauncherActivity extends xm5 {
    public static final /* synthetic */ int t = 0;
    public h1c p;
    public p13 q;
    public py2 r;
    public final iq1 s;

    public LauncherActivity() {
        super(1);
        this.s = new iq1(n1b.a.b(to6.class), new ho6(this, 1), new ho6(this, 0), new ho6(this, 2));
    }

    @Override // defpackage.xm5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) throws IllegalAccessException, InvocationTargetException {
        QntrFMZg.IGEBWitkVXP.invoke(null, this, bundle);
    }

    @Override // defpackage.n1, defpackage.i10, defpackage.m15, android.app.Activity
    public final void onStart() throws IllegalAccessException, InvocationTargetException {
        uRBzICqRGKZiw.zqnRV.invoke(null, this);
    }

    @Override // defpackage.n1, defpackage.i10, defpackage.m15, android.app.Activity
    public final void onStop() throws IllegalAccessException, InvocationTargetException {
        uMZiUNjgh.mGQfSaHb.invoke(null, this);
    }

    public final void v() {
        finish();
        if (Build.VERSION.SDK_INT >= 34) {
            overrideActivityTransition(1, R.anim.launcher_target_fade_in, R.anim.launcher_do_nothing);
        } else {
            overridePendingTransition(R.anim.launcher_target_fade_in, R.anim.launcher_do_nothing);
        }
    }

    public final s w() {
        p13 p13Var = this.q;
        if (p13Var != null) {
            return p13Var;
        }
        g76.g0("router");
        throw null;
    }
}
