package com.google.android.gms.ads.identifier;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import com.amplitude.common.android.AndroidContextProvider;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import dg.b;
import gh.c;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import sg.w;

/* loaded from: classes.dex */
public class AdvertisingIdClient {

    /* renamed from: h, reason: collision with root package name */
    public static final Object f31682h = new Object();

    /* renamed from: i, reason: collision with root package name */
    public static volatile AdvertisingIdClient f31683i;

    /* renamed from: a, reason: collision with root package name */
    public pg.a f31684a;

    /* renamed from: b, reason: collision with root package name */
    public c f31685b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f31686c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f31687d = new Object();

    /* renamed from: e, reason: collision with root package name */
    public dg.a f31688e;

    /* renamed from: f, reason: collision with root package name */
    public final Context f31689f;

    /* renamed from: g, reason: collision with root package name */
    public final long f31690g;

    public static final class Info {
        private final String zza;
        private final boolean zzb;

        @Deprecated
        public Info(String str, boolean z11) {
            this.zza = str;
            this.zzb = z11;
        }

        public String getId() {
            return this.zza;
        }

        public boolean isLimitAdTrackingEnabled() {
            return this.zzb;
        }

        public String toString() {
            String str = this.zza;
            int length = String.valueOf(str).length();
            boolean z11 = this.zzb;
            StringBuilder sb2 = new StringBuilder(length + 2 + String.valueOf(z11).length());
            sb2.append("{");
            sb2.append(str);
            sb2.append("}");
            sb2.append(z11);
            return sb2.toString();
        }
    }

    public AdvertisingIdClient(Context context) {
        w.h(context);
        this.f31689f = context.getApplicationContext();
        this.f31686c = false;
        this.f31690g = 30000L;
    }

    public static Info getAdvertisingIdInfo(Context context) throws GooglePlayServicesRepairableException, IllegalStateException, GooglePlayServicesNotAvailableException, IOException {
        AdvertisingIdClient advertisingIdClient = f31683i;
        if (advertisingIdClient == null) {
            synchronized (f31682h) {
                try {
                    advertisingIdClient = f31683i;
                    if (advertisingIdClient == null) {
                        advertisingIdClient = new AdvertisingIdClient(context);
                        f31683i = advertisingIdClient;
                    }
                } finally {
                }
            }
        }
        b bVarA = b.a(context);
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        try {
            Info infoE = advertisingIdClient.e();
            long jElapsedRealtime2 = SystemClock.elapsedRealtime() - jElapsedRealtime;
            advertisingIdClient.c(infoE, jElapsedRealtime2, null);
            bVarA.b(jElapsedRealtime, SystemClock.elapsedRealtime(), 0, (int) (SystemClock.elapsedRealtime() - jElapsedRealtime));
            StringBuilder sb2 = new StringBuilder(String.valueOf(jElapsedRealtime2).length() + 25);
            sb2.append("GetInfoInternal elapse ");
            sb2.append(jElapsedRealtime2);
            sb2.append("ms");
            Log.i("AdvertisingIdClient", sb2.toString());
            return infoE;
        } catch (Throwable th2) {
            advertisingIdClient.c(null, -1L, th2);
            bVarA.b(jElapsedRealtime, SystemClock.elapsedRealtime(), !(th2 instanceof IOException) ? !(th2 instanceof GooglePlayServicesNotAvailableException) ? !(th2 instanceof GooglePlayServicesRepairableException) ? th2 instanceof IllegalStateException ? 8 : -1 : 16 : 9 : 1, (int) (SystemClock.elapsedRealtime() - jElapsedRealtime));
            throw th2;
        }
    }

    public final void a() {
        w.g("Calling this from your main thread can lead to deadlock");
        synchronized (this) {
            try {
                if (this.f31686c) {
                    return;
                }
                Context context = this.f31689f;
                try {
                    context.getPackageManager().getPackageInfo("com.android.vending", 0);
                    int iB = pg.c.f82562b.b(context, 12451000);
                    if (iB != 0 && iB != 2) {
                        throw new IOException("Google Play services not available");
                    }
                    pg.a aVar = new pg.a();
                    Intent intent = new Intent("com.google.android.gms.ads.identifier.service.START");
                    intent.setPackage("com.google.android.gms");
                    try {
                        if (!wg.a.b().a(context, intent, aVar, 1)) {
                            throw new IOException("Connection failure");
                        }
                        this.f31684a = aVar;
                        try {
                            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
                            IBinder iBinderL = aVar.l();
                            int i5 = gh.b.f57677a;
                            IInterface iInterfaceQueryLocalInterface = iBinderL.queryLocalInterface("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
                            this.f31685b = iInterfaceQueryLocalInterface instanceof c ? (c) iInterfaceQueryLocalInterface : new gh.a(iBinderL);
                            this.f31686c = true;
                        } catch (InterruptedException unused) {
                            throw new IOException("Interrupted exception");
                        } catch (Throwable th2) {
                            throw new IOException(th2);
                        }
                    } finally {
                        IOException iOException = new IOException(th2);
                    }
                } catch (PackageManager.NameNotFoundException unused2) {
                    throw new GooglePlayServicesNotAvailableException(9);
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public final void b() {
        w.g("Calling this from your main thread can lead to deadlock");
        synchronized (this) {
            try {
                Context context = this.f31689f;
                if (context == null || this.f31684a == null) {
                    return;
                }
                try {
                    if (this.f31686c) {
                        wg.a.b().c(context, this.f31684a);
                    }
                } catch (Throwable th2) {
                    Log.i("AdvertisingIdClient", "AdvertisingIdClient unbindService failed.", th2);
                }
                this.f31686c = false;
                this.f31685b = null;
                this.f31684a = null;
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public final void c(Info info, long j11, Throwable th2) {
        if (Math.random() <= 0.0d) {
            HashMap map = new HashMap();
            map.put("app_context", "1");
            if (info != null) {
                map.put(AndroidContextProvider.SETTING_LIMIT_AD_TRACKING, true != info.isLimitAdTrackingEnabled() ? "0" : "1");
                String id2 = info.getId();
                if (id2 != null) {
                    map.put("ad_id_size", Integer.toString(id2.length()));
                }
            }
            if (th2 != null) {
                map.put("error", th2.getClass().getName());
            }
            map.put("tag", "AdvertisingIdClient");
            map.put("time_spent", Long.toString(j11));
            new a(this, map).start();
        }
    }

    public final synchronized void d() {
        try {
            if (!this.f31686c) {
                try {
                    a();
                    if (!this.f31686c) {
                        throw new IOException("AdvertisingIdClient cannot reconnect.");
                    }
                } catch (Exception e3) {
                    throw new IOException("AdvertisingIdClient cannot reconnect.", e3);
                }
            }
        } finally {
        }
    }

    public final Info e() {
        Info info;
        w.g("Calling this from your main thread can lead to deadlock");
        synchronized (this) {
            d();
            w.h(this.f31684a);
            w.h(this.f31685b);
            try {
                gh.a aVar = (gh.a) this.f31685b;
                aVar.getClass();
                Parcel parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
                boolean z11 = true;
                Parcel parcelT = aVar.T(parcelObtain, 1);
                String string = parcelT.readString();
                parcelT.recycle();
                gh.a aVar2 = (gh.a) this.f31685b;
                aVar2.getClass();
                Parcel parcelObtain2 = Parcel.obtain();
                parcelObtain2.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
                parcelObtain2.writeInt(1);
                Parcel parcelT2 = aVar2.T(parcelObtain2, 2);
                if (parcelT2.readInt() == 0) {
                    z11 = false;
                }
                parcelT2.recycle();
                info = new Info(string, z11);
            } catch (RemoteException e3) {
                Log.i("AdvertisingIdClient", "GMS remote exception ", e3);
                throw new IOException("Remote exception", e3);
            }
        }
        synchronized (this.f31687d) {
            dg.a aVar3 = this.f31688e;
            if (aVar3 != null) {
                aVar3.f49227c.countDown();
                try {
                    this.f31688e.join();
                } catch (InterruptedException unused) {
                }
            }
            long j11 = this.f31690g;
            if (j11 > 0) {
                this.f31688e = new dg.a(this, j11);
            }
        }
        return info;
    }

    public final void finalize() throws Throwable {
        b();
        super.finalize();
    }
}
