package o30;

import ai.k4;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import com.teslacoilsw.licensing_misc.util.Base64DecoderException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Random;
import mx.g0;

/* loaded from: classes4.dex */
public final class f implements ServiceConnection, b {

    /* renamed from: i, reason: collision with root package name */
    public static final Random f79482i = new Random();

    /* renamed from: a, reason: collision with root package name */
    public p30.e f79483a;

    /* renamed from: b, reason: collision with root package name */
    public final PublicKey f79484b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f79485c;

    /* renamed from: d, reason: collision with root package name */
    public final a f79486d;

    /* renamed from: e, reason: collision with root package name */
    public final lh.i f79487e;

    /* renamed from: f, reason: collision with root package name */
    public final String f79488f;

    /* renamed from: g, reason: collision with root package name */
    public final HashSet f79489g = new HashSet();

    /* renamed from: h, reason: collision with root package name */
    public final LinkedList f79490h = new LinkedList();

    public f(Context context, a aVar) {
        this.f79485c = context;
        this.f79486d = aVar;
        try {
            this.f79484b = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(q30.a.a("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiVLIkeXipfVm7lqOUwDfXmdYLY5Indgt4c+3kqPsilNafc5/guYplX1p7cFTr+kEHKmA+4RZ/3iHAFf3smY7VZYUFzZWz5BdC7he1XUZ3Ml/sOoSlglNuhYvIN7AGW0psW5LQL8NTaNywqLzCaX2hslEWEytp1OuLGqSYEcpIE55wFB8V92nYP2hFw7d3TzQF1xlmERyI+wQ4XoelywBZhtQSNpUbCKv7C+gJI+S6WLqUe1utRKsOfK9FUjmah8q+Bz9HSCL+cdSx7vbD65Ef6etftxM6Yv6Hbb5m+tS63T/6dNKL91glHaa1IlQ+CIl0Xndlaatb+WJXuNPq6kv9QIDAQAB")));
            this.f79488f = "com.teslacoilsw.launcher.prime";
            try {
                int i5 = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
            } catch (PackageManager.NameNotFoundException e3) {
                Log.e("TeslaUtils", "Package name not found", e3);
            }
            this.f79487e = g0.f77095h;
            new ArrayList(Arrays.asList(2083006701343222295L, 682805526488575355L, 4025624270634527783L, 6762506862395859801L));
        } catch (Base64DecoderException e11) {
            throw new IllegalArgumentException(e11);
        } catch (NoSuchAlgorithmException e12) {
            throw new RuntimeException(e12);
        } catch (InvalidKeySpecException e13) {
            throw new IllegalArgumentException(e13);
        }
    }

    public static void d(f fVar, c cVar) {
        synchronized (fVar) {
            fVar.f79489g.remove(cVar);
            if (fVar.f79489g.isEmpty() && fVar.f79483a != null) {
                try {
                    fVar.f79485c.unbindService(fVar);
                } catch (IllegalArgumentException unused) {
                }
                fVar.f79483a = null;
            }
        }
    }

    public final synchronized void e(c cVar) {
        try {
            this.f79486d.d(2, null);
            if (this.f79486d.a(false) != null) {
                cVar.f79475b.b();
            } else if (this.f79486d.f79468f == 1) {
                cVar.f79475b.d(112);
            } else {
                cVar.f79475b.getClass();
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // o30.b
    public final d l() {
        return this.f79486d;
    }

    @Override // o30.b
    public final synchronized void m(k4 k4Var) {
        try {
            ArrayList arrayListA = this.f79486d.a(false);
            if (arrayListA == null || arrayListA.isEmpty() || this.f79486d.f79467e == 2) {
                c cVar = new c(this.f79486d, k4Var, f79482i.nextInt(), this.f79488f);
                if (this.f79483a == null) {
                    try {
                        Intent intent = new Intent();
                        intent.setClassName("com.teslacoilsw.launcher.prime", "com.teslacoilsw.launcher.prime.NovaLauncherPrimeService");
                        if (this.f79485c.bindService(intent, this, 1)) {
                            this.f79490h.offer(cVar);
                        } else {
                            e(cVar);
                        }
                    } catch (SecurityException unused) {
                        k4Var.d(105);
                    }
                } else {
                    this.f79490h.offer(cVar);
                    n();
                }
            } else {
                k4Var.b();
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final void n() {
        while (true) {
            c cVar = (c) this.f79490h.poll();
            if (cVar == null) {
                return;
            }
            try {
                p30.e eVar = this.f79483a;
                long j11 = cVar.f79476c;
                String str = cVar.f79477d;
                e eVar2 = new e(this, cVar);
                p30.c cVar2 = (p30.c) eVar;
                cVar2.getClass();
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.android.vending.licensing.ILicensingService");
                    parcelObtain.writeLong(j11);
                    parcelObtain.writeString(str);
                    parcelObtain.writeStrongBinder(eVar2);
                    cVar2.f82073a.transact(1, parcelObtain, null, 1);
                    parcelObtain.recycle();
                    this.f79489g.add(cVar);
                } catch (Throwable th2) {
                    parcelObtain.recycle();
                    throw th2;
                }
            } catch (RemoteException unused) {
                e(cVar);
            }
        }
    }

    @Override // o30.b
    public final synchronized void onDestroy() {
        if (this.f79483a != null) {
            try {
                this.f79485c.unbindService(this);
            } catch (IllegalArgumentException unused) {
            }
            this.f79483a = null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v6, types: [p30.e] */
    @Override // android.content.ServiceConnection
    public final synchronized void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        p30.c cVar;
        int i5 = p30.d.f82074a;
        if (iBinder == null) {
            cVar = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.android.vending.licensing.ILicensingService");
            if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof p30.e)) {
                p30.c cVar2 = new p30.c();
                cVar2.f82073a = iBinder;
                cVar = cVar2;
            } else {
                cVar = (p30.e) iInterfaceQueryLocalInterface;
            }
        }
        this.f79483a = cVar;
        n();
    }

    @Override // android.content.ServiceConnection
    public final synchronized void onServiceDisconnected(ComponentName componentName) {
        this.f79483a = null;
    }
}
