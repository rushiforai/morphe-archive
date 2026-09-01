package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.text.TextUtils;
import android.view.View;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pc5 implements ServiceConnection {
    public final Context a;
    public final xc b;
    public lt c;
    public boolean d;
    public Messenger e;
    public final int f;
    public final int g;
    public final String h;
    public final String i;
    public final int j;
    public final String k;

    public pc5(Context context, m87 m87Var) {
        m87Var.getClass();
        String str = m87Var.d;
        String strValueOf = String.valueOf(m87Var.e);
        String str2 = m87Var.q;
        str.getClass();
        Context applicationContext = context.getApplicationContext();
        this.a = applicationContext != null ? applicationContext : context;
        this.f = ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        this.g = 65537;
        this.h = str;
        this.i = strValueOf;
        this.j = 20121101;
        this.k = str2;
        this.b = new xc(this);
    }

    public final void a(Bundle bundle) {
        if (this.d) {
            this.d = false;
            lt ltVar = this.c;
            if (ltVar != null) {
                qc5 qc5Var = (qc5) ltVar.b;
                m87 m87Var = (m87) ltVar.c;
                m87Var.getClass();
                pc5 pc5Var = qc5Var.c;
                if (pc5Var != null) {
                    pc5Var.c = null;
                }
                qc5Var.c = null;
                my6 my6Var = qc5Var.d().e;
                if (my6Var != null) {
                    View view = ((v97) my6Var.a).q0;
                    if (view == null) {
                        g76.g0("progressBar");
                        throw null;
                    }
                    view.setVisibility(8);
                }
                if (bundle != null) {
                    List stringArrayList = bundle.getStringArrayList("com.facebook.platform.extra.PERMISSIONS");
                    if (stringArrayList == null) {
                        stringArrayList = ey3.a;
                    }
                    Set<String> set = m87Var.b;
                    if (set == null) {
                        set = ny3.a;
                    }
                    String string = bundle.getString("com.facebook.platform.extra.ID_TOKEN");
                    if (set.contains("openid") && (string == null || string.length() == 0)) {
                        qc5Var.d().j();
                        return;
                    }
                    if (stringArrayList.containsAll(set)) {
                        String string2 = bundle.getString("com.facebook.platform.extra.USER_ID");
                        if (string2 != null && string2.length() != 0) {
                            qc5Var.l(m87Var, bundle);
                            return;
                        }
                        my6 my6Var2 = qc5Var.d().e;
                        if (my6Var2 != null) {
                            View view2 = ((v97) my6Var2.a).q0;
                            if (view2 == null) {
                                g76.g0("progressBar");
                                throw null;
                            }
                            view2.setVisibility(0);
                        }
                        String string3 = bundle.getString("com.facebook.platform.extra.ACCESS_TOKEN");
                        if (string3 != null) {
                            epe.y(new ku3(bundle, qc5Var, m87Var, 7), string3);
                            return;
                        } else {
                            ygf.f("Required value was null.");
                            return;
                        }
                    }
                    HashSet hashSet = new HashSet();
                    for (String str : set) {
                        if (!stringArrayList.contains(str)) {
                            hashSet.add(str);
                        }
                    }
                    if (!hashSet.isEmpty()) {
                        qc5Var.a("new_permissions", TextUtils.join(",", hashSet));
                    }
                    m87Var.b = hashSet;
                }
                qc5Var.d().j();
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        componentName.getClass();
        iBinder.getClass();
        this.e = new Messenger(iBinder);
        Bundle bundle = new Bundle();
        bundle.putString("com.facebook.platform.extra.APPLICATION_ID", this.h);
        String str = this.k;
        if (str != null) {
            bundle.putString("com.facebook.platform.extra.NONCE", str);
        }
        String str2 = this.i;
        if (str2 != null) {
            bundle.putString("com.facebook.platform.extra.REDIRECT_URI", str2);
        }
        Message messageObtain = Message.obtain((Handler) null, this.f);
        messageObtain.arg1 = this.j;
        messageObtain.setData(bundle);
        messageObtain.replyTo = new Messenger(this.b);
        try {
            Messenger messenger = this.e;
            if (messenger != null) {
                messenger.send(messageObtain);
            }
        } catch (RemoteException unused) {
            a(null);
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        componentName.getClass();
        this.e = null;
        try {
            this.a.unbindService(this);
        } catch (IllegalArgumentException unused) {
        }
        a(null);
    }
}
