package defpackage;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.util.Base64;
import android.util.Log;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jgf extends kif {
    public final /* synthetic */ int b = 0;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public jgf(lgf lgfVar, IBinder iBinder) {
        this.c = iBinder;
        this.d = lgfVar;
    }

    @Override // defpackage.kif
    public final void b() {
        hif difVar;
        String strEncodeToString;
        int i = this.b;
        int i2 = 0;
        Object obj = this.d;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                mgf mgfVar = (mgf) ((lgf) obj).b;
                IBinder iBinder = (IBinder) obj2;
                mgfVar.i.getClass();
                int i3 = fif.f;
                if (iBinder == null) {
                    difVar = null;
                } else {
                    IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.play.core.integrity.protocol.IExpressIntegrityService");
                    difVar = iInterfaceQueryLocalInterface instanceof hif ? (hif) iInterfaceQueryLocalInterface : new dif(iBinder);
                }
                mgfVar.n = difVar;
                jif jifVar = mgfVar.b;
                jifVar.b("linkToDeath", new Object[0]);
                try {
                    ((dif) mgfVar.n).e.linkToDeath(mgfVar.k, 0);
                } catch (RemoteException e) {
                    jifVar.a(e, "linkToDeath failed", new Object[0]);
                }
                mgfVar.g = false;
                Iterator it2 = mgfVar.d.iterator();
                while (it2.hasNext()) {
                    ((Runnable) it2.next()).run();
                }
                mgfVar.d.clear();
                break;
            default:
                Context context = (Context) obj2;
                wfd wfdVar = ((phf) obj).c;
                jif jifVar2 = ngf.a;
                try {
                    PackageInfo packageInfo = context.getPackageManager().getPackageInfo("com.android.vending", 64);
                    ApplicationInfo applicationInfo = packageInfo.applicationInfo;
                    if (applicationInfo != null && applicationInfo.enabled) {
                        Signature[] signatureArr = packageInfo.signatures;
                        jif jifVar3 = ngf.a;
                        if (signatureArr == null || (signatureArr.length) == 0) {
                            Object[] objArr = new Object[0];
                            jifVar3.getClass();
                            if (Log.isLoggable("PlayCore", 5)) {
                                Log.w("PlayCore", jif.c(jifVar3.a, "Play Store package is not signed -- possibly self-built package. Could not verify.", objArr));
                            }
                        } else {
                            ArrayList arrayList = new ArrayList();
                            for (Signature signature : signatureArr) {
                                byte[] byteArray = signature.toByteArray();
                                try {
                                    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                                    messageDigest.update(byteArray);
                                    strEncodeToString = Base64.encodeToString(messageDigest.digest(), 11);
                                } catch (NoSuchAlgorithmException unused) {
                                    strEncodeToString = "";
                                }
                                arrayList.add(strEncodeToString);
                                if (!"8P1sW0EPJcslw7UzRsiXL64w-O50Ed-RBICtay1g24M".equals(strEncodeToString)) {
                                    String str = Build.TAGS;
                                    if ((!str.contains("dev-keys") && !str.contains("test-keys")) || !"GXWy8XF3vIml3_MfnmSmyuKBpT3B0dWbHRR_4cgq-gA".equals(strEncodeToString)) {
                                    }
                                }
                                i2 = packageInfo.versionCode;
                            }
                            StringBuilder sb = new StringBuilder();
                            Iterator it3 = arrayList.iterator();
                            if (it3.hasNext()) {
                                while (true) {
                                    sb.append((CharSequence) it3.next());
                                    if (it3.hasNext()) {
                                        sb.append((CharSequence) ", ");
                                    }
                                }
                            }
                            String strX = ev6.x("Play Store package certs are not valid. Found these sha256 certs: [", sb.toString(), "].");
                            Object[] objArr2 = new Object[0];
                            jifVar3.getClass();
                            if (Log.isLoggable("PlayCore", 5)) {
                                Log.w("PlayCore", jif.c(jifVar3.a, strX, objArr2));
                            }
                        }
                    }
                } catch (PackageManager.NameNotFoundException unused2) {
                }
                wfdVar.d(Integer.valueOf(i2));
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jgf(phf phfVar, wfd wfdVar, Context context) {
        super(wfdVar);
        this.c = context;
        this.d = phfVar;
    }
}
