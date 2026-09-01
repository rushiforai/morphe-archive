package defpackage;

import android.content.res.Resources;
import android.os.Bundle;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import com.medium.android.donkey.DonkeyApplication;
import com.medium.android.donkey.launcher.LauncherActivity;
import com.medium.reader.R;
import gen.model.User;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class n1 extends i10 {
    public pz2 g;
    public boolean h;
    public pu7 i;
    public i03 j;
    public int k;

    @Override // defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public void onCreate(Bundle bundle) {
        if (!(getApplicationContext() instanceof DonkeyApplication)) {
            wld.a.c(km4.y(n1b.a.b(getClass()).j(), " is unhealthy: applicationContext isn't a MediumApplication!"), new Object[0]);
            finish();
            return;
        }
        super.onCreate(bundle);
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onCreate"), new Object[0]);
        if (this.h) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onCreate");
        }
        this.k = getResources().getConfiguration().uiMode & 48;
        Resources.Theme theme = getTheme();
        pu7 pu7Var = this.i;
        if (pu7Var == null) {
            g76.g0("mediumUserSharedPreferences");
            throw null;
        }
        theme.applyStyle(mk7.x(pu7Var.O()), true);
        setRequestedOrientation(getResources().getBoolean(R.bool.portrait_only) ? 12 : -1);
    }

    @Override // defpackage.i10, defpackage.m15, android.app.Activity
    public void onDestroy() {
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onDestroy"), new Object[0]);
        if (this.h) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onDestroy");
        }
        super.onDestroy();
    }

    @Override // defpackage.m15, android.app.Activity
    public void onPause() {
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onPause"), new Object[0]);
        if (this.h) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onPause");
        }
        super.onPause();
    }

    @Override // defpackage.m15, android.app.Activity
    public void onResume() {
        super.onResume();
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onResume"), new Object[0]);
        if (this.h) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onResume");
        }
        if (this.h) {
            String dataString = getIntent().getDataString();
            if (dataString == null) {
                dataString = "";
            }
            ak4.a().c("intent_data", dataString);
        }
        int i = getResources().getConfiguration().uiMode & 48;
        int i2 = this.k;
        if (i != i2) {
            uldVar.g(Integer.valueOf(i2), Integer.valueOf(i));
            ((f20) o()).m(true, true);
            recreate();
        }
    }

    @Override // defpackage.i10, defpackage.m15, android.app.Activity
    public void onStop() {
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onStop"), new Object[0]);
        if (this.h) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onStop");
        }
        super.onStop();
    }

    public boolean q() {
        return !(this instanceof LauncherActivity);
    }

    @Override // defpackage.i10, defpackage.m15, android.app.Activity
    public void onStart() throws IllegalAccessException {
        String str;
        User userB;
        super.onStart();
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        int i = 0;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onStart"), new Object[0]);
        if (this.h) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onStart");
        }
        if (q()) {
            pz2 pz2Var = this.g;
            n92 n92Var = null;
            if (pz2Var != null) {
                String strM = pz2Var.m.m();
                if (muc.b0(strM)) {
                    strM = null;
                }
                if (strM != null && strM.length() != 0) {
                    e18 e18VarB = pz2Var.d.b();
                    if (e18VarB != null && (userB = e18VarB.getCurrentUser()) != null) {
                        str = userB.user_id;
                    } else {
                        str = null;
                    }
                    if (str != null && str.length() != 0 && !str.equals(strM)) {
                        uldVar.a(nuc.B("\n                    not authenticated: config/credential userId mismatch -- \n                    client config userId(" + str + ") != access credential userId(" + strM + ")\n                "), new Object[0]);
                    } else {
                        return;
                    }
                } else {
                    uldVar.a("not authenticated: no credentialed userId", new Object[0]);
                }
                uldVar.a(JWcjNoweKCnTr.kOYcVmz, getClass().getSimpleName());
                vx0.c0(o7f.x(this), null, null, new m1(this, n92Var, i), 3);
                return;
            }
            g76.g0("identityManager");
            throw null;
        }
    }
}
