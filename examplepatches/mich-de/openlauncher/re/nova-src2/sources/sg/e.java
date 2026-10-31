package sg;

import android.accounts.Account;
import android.content.AttributionSource;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.ConnectionTelemetryConfiguration;
import com.google.android.gms.common.internal.GetServiceRequest;
import com.google.android.gms.common.internal.RootTelemetryConfiguration;
import com.google.android.gms.common.internal.zzj;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public abstract class e {
    private static final Feature[] zze = new Feature[0];
    private volatile String zzA;
    private volatile y90.f zzB;
    private ConnectionResult zzC;
    private boolean zzD;
    private volatile zzj zzE;
    h0 zza;
    final y zzb;
    protected d zzc;
    protected final AtomicInteger zzd;
    private volatile String zzk;
    private final Context zzl;
    private final g0 zzn;
    private final pg.c zzo;
    private final Object zzp;
    private final Object zzq;
    private s zzr;
    private IInterface zzs;
    private final ArrayList zzt;
    private a0 zzu;
    private int zzv;
    private final b zzw;
    private final c zzx;
    private final int zzy;
    private final String zzz;

    /* JADX WARN: Illegal instructions before constructor call */
    public e(int i5, Context context, Looper looper, b bVar, c cVar) {
        g0 g0VarA = g0.a(context);
        pg.c cVar2 = pg.c.f82562b;
        w.h(bVar);
        w.h(cVar);
        this(context, looper, g0VarA, cVar2, i5, bVar, cVar, null);
    }

    public final void a(int i5, IInterface iInterface) {
        h0 h0Var;
        w.c((i5 == 4) == (iInterface != null));
        synchronized (this.zzp) {
            try {
                this.zzv = i5;
                this.zzs = iInterface;
                Bundle bundle = null;
                if (i5 == 1) {
                    a0 a0Var = this.zzu;
                    if (a0Var != null) {
                        g0 g0Var = this.zzn;
                        String str = this.zza.f87442b;
                        w.h(str);
                        this.zza.getClass();
                        if (this.zzz == null) {
                            this.zzl.getClass();
                        }
                        g0Var.c(str, a0Var, this.zza.f87443c);
                        this.zzu = null;
                    }
                } else if (i5 == 2 || i5 == 3) {
                    a0 a0Var2 = this.zzu;
                    if (a0Var2 != null && (h0Var = this.zza) != null) {
                        String str2 = h0Var.f87442b;
                        StringBuilder sb2 = new StringBuilder(String.valueOf(str2).length() + 70 + "com.google.android.gms".length());
                        sb2.append("Calling connect() while still connected, missing disconnect() for ");
                        sb2.append(str2);
                        sb2.append(" on com.google.android.gms");
                        Log.e("GmsClient", sb2.toString());
                        g0 g0Var2 = this.zzn;
                        String str3 = this.zza.f87442b;
                        w.h(str3);
                        this.zza.getClass();
                        if (this.zzz == null) {
                            this.zzl.getClass();
                        }
                        g0Var2.c(str3, a0Var2, this.zza.f87443c);
                        this.zzd.incrementAndGet();
                    }
                    a0 a0Var3 = new a0(this, this.zzd.get());
                    this.zzu = a0Var3;
                    String startServiceAction = getStartServiceAction();
                    boolean useDynamicLookup = getUseDynamicLookup();
                    this.zza = new h0(0, startServiceAction, useDynamicLookup);
                    if (useDynamicLookup && getMinApkVersion() < 17895000) {
                        throw new IllegalStateException("Internal Error, the minimum apk version of this BaseGmsClient is too low to support dynamic lookup. Start service action: ".concat(String.valueOf(this.zza.f87442b)));
                    }
                    g0 g0Var3 = this.zzn;
                    String str4 = this.zza.f87442b;
                    w.h(str4);
                    this.zza.getClass();
                    String name = this.zzz;
                    if (name == null) {
                        name = this.zzl.getClass().getName();
                    }
                    ConnectionResult connectionResultB = g0Var3.b(new d0(str4, this.zza.f87443c), a0Var3, name, getBindServiceExecutor());
                    if (!(connectionResultB.f31779g == 0)) {
                        String str5 = this.zza.f87442b;
                        StringBuilder sb3 = new StringBuilder(String.valueOf(str5).length() + 34 + "com.google.android.gms".length());
                        sb3.append("unable to connect to service: ");
                        sb3.append(str5);
                        sb3.append(" on com.google.android.gms");
                        Log.w("GmsClient", sb3.toString());
                        int i11 = connectionResultB.f31779g;
                        if (i11 == -1) {
                            i11 = 16;
                        }
                        if (connectionResultB.f31780h != null) {
                            bundle = new Bundle();
                            bundle.putParcelable("pendingIntent", connectionResultB.f31780h);
                        }
                        int i12 = this.zzd.get();
                        c0 c0Var = new c0(this, i11, bundle);
                        y yVar = this.zzb;
                        yVar.sendMessage(yVar.obtainMessage(7, i12, -1, c0Var));
                    }
                } else if (i5 == 4) {
                    w.h(iInterface);
                }
            } finally {
            }
        }
    }

    public final void checkAvailabilityAndConnect() {
        int iB = this.zzo.b(this.zzl, getMinApkVersion());
        if (iB == 0) {
            this.zzc = new k(this);
            a(2, null);
            return;
        }
        a(1, null);
        this.zzc = new k(this);
        int i5 = this.zzd.get();
        y yVar = this.zzb;
        yVar.sendMessage(yVar.obtainMessage(3, i5, iB, null));
    }

    public final void connect(d dVar) {
        this.zzc = dVar;
        a(2, null);
    }

    public abstract IInterface createServiceInterface(IBinder iBinder);

    public final void disconnect() {
        this.zzd.incrementAndGet();
        ArrayList arrayList = this.zzt;
        synchronized (arrayList) {
            try {
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    r rVar = (r) arrayList.get(i5);
                    synchronized (rVar) {
                        rVar.f87458a = null;
                    }
                }
                arrayList.clear();
            } catch (Throwable th2) {
                throw th2;
            }
        }
        synchronized (this.zzq) {
            this.zzr = null;
        }
        a(1, null);
    }

    public Account getAccount() {
        return null;
    }

    public Feature[] getApiFeatures() {
        return zze;
    }

    public final Feature[] getAvailableFeatures() {
        zzj zzjVar = this.zzE;
        if (zzjVar == null) {
            return null;
        }
        return zzjVar.f31882g;
    }

    public Executor getBindServiceExecutor() {
        return null;
    }

    public final Context getContext() {
        return this.zzl;
    }

    public final void getEndpointPackageName() {
        if (!isConnected() || this.zza == null) {
            throw new RuntimeException("Failed to connect when checking package");
        }
    }

    public final int getGCoreServiceId() {
        return this.zzy;
    }

    public Bundle getGetServiceRequestExtraArgs() {
        return new Bundle();
    }

    public final String getLastDisconnectMessage() {
        return this.zzk;
    }

    public abstract int getMinApkVersion();

    public final void getRemoteService(g gVar, Set<Scope> set) {
        AttributionSource attributionSourceC;
        Bundle getServiceRequestExtraArgs = getGetServiceRequestExtraArgs();
        String attributionTag = (Build.VERSION.SDK_INT < 31 || this.zzB == null || (attributionSourceC = this.zzB.c()) == null || attributionSourceC.getAttributionTag() == null) ? this.zzA : attributionSourceC.getAttributionTag();
        String str = attributionTag;
        int i5 = this.zzy;
        int i11 = pg.c.f82561a;
        Scope[] scopeArr = GetServiceRequest.f31837t;
        Bundle bundle = new Bundle();
        Feature[] featureArr = GetServiceRequest.f31838u;
        GetServiceRequest getServiceRequest = new GetServiceRequest(6, i5, i11, null, null, scopeArr, bundle, null, featureArr, featureArr, true, 0, false, str);
        getServiceRequest.f31842i = this.zzl.getPackageName();
        getServiceRequest.f31845l = getServiceRequestExtraArgs;
        if (set != null) {
            getServiceRequest.f31844k = (Scope[]) set.toArray(new Scope[0]);
        }
        if (requiresSignIn()) {
            Account account = getAccount();
            if (account == null) {
                account = new Account("<<default account>>", "com.google");
            }
            getServiceRequest.f31846m = account;
            if (gVar != null) {
                getServiceRequest.f31843j = gVar.asBinder();
            }
        } else if (this instanceof th.d) {
            getServiceRequest.f31846m = null;
        }
        getServiceRequest.n = zze;
        getServiceRequest.o = getApiFeatures();
        if (usesClientTelemetry()) {
            getServiceRequest.f31849r = true;
        }
        try {
            synchronized (this.zzq) {
                try {
                    s sVar = this.zzr;
                    if (sVar != null) {
                        sVar.T(new z(this, this.zzd.get()), getServiceRequest);
                    } else {
                        Log.w("GmsClient", "mServiceBroker is null, client disconnected");
                    }
                } finally {
                }
            }
        } catch (DeadObjectException e3) {
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e3);
            int i12 = this.zzd.get();
            y yVar = this.zzb;
            yVar.sendMessage(yVar.obtainMessage(6, i12, 3));
        } catch (RemoteException e11) {
            e = e11;
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e);
            int i13 = this.zzd.get();
            b0 b0Var = new b0(this, 8, null, null);
            y yVar2 = this.zzb;
            yVar2.sendMessage(yVar2.obtainMessage(1, i13, -1, b0Var));
        } catch (SecurityException e12) {
            throw e12;
        } catch (RuntimeException e13) {
            e = e13;
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e);
            int i132 = this.zzd.get();
            b0 b0Var2 = new b0(this, 8, null, null);
            y yVar22 = this.zzb;
            yVar22.sendMessage(yVar22.obtainMessage(1, i132, -1, b0Var2));
        }
    }

    public Set<Scope> getScopes() {
        return Collections.EMPTY_SET;
    }

    public final IInterface getService() throws DeadObjectException {
        IInterface iInterface;
        synchronized (this.zzp) {
            try {
                if (this.zzv == 5) {
                    throw new DeadObjectException();
                }
                if (!isConnected()) {
                    throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
                }
                IInterface iInterface2 = this.zzs;
                w.i(iInterface2, "Client is connected but service is null");
                iInterface = iInterface2;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return iInterface;
    }

    public abstract String getServiceDescriptor();

    public abstract String getStartServiceAction();

    public final ConnectionTelemetryConfiguration getTelemetryConfiguration() {
        zzj zzjVar = this.zzE;
        if (zzjVar == null) {
            return null;
        }
        return zzjVar.f31884i;
    }

    public boolean getUseDynamicLookup() {
        return getMinApkVersion() >= 211700000;
    }

    public final boolean hasConnectionInfo() {
        return this.zzE != null;
    }

    public final boolean isConnected() {
        boolean z11;
        synchronized (this.zzp) {
            z11 = this.zzv == 4;
        }
        return z11;
    }

    public final boolean isConnecting() {
        boolean z11;
        synchronized (this.zzp) {
            int i5 = this.zzv;
            z11 = true;
            if (i5 != 2 && i5 != 3) {
                z11 = false;
            }
        }
        return z11;
    }

    public void onConnectionSuspended() {
    }

    public boolean requiresSignIn() {
        return false;
    }

    public final void setAttributionSourceWrapper(y90.f fVar) {
        this.zzB = fVar;
    }

    public final void setAttributionTag(String str) {
        this.zzA = str;
    }

    public boolean usesClientTelemetry() {
        return this instanceof ng.a;
    }

    public final void zzc(zzj zzjVar) {
        this.zzE = zzjVar;
        if (usesClientTelemetry()) {
            ConnectionTelemetryConfiguration connectionTelemetryConfiguration = zzjVar.f31884i;
            k kVarB = k.b();
            RootTelemetryConfiguration rootTelemetryConfigurationD = connectionTelemetryConfiguration == null ? null : connectionTelemetryConfiguration.d();
            synchronized (kVarB) {
                if (rootTelemetryConfigurationD == null) {
                    kVarB.f87446a = k.f87445c;
                    return;
                }
                RootTelemetryConfiguration rootTelemetryConfiguration = (RootTelemetryConfiguration) kVarB.f87446a;
                if (rootTelemetryConfiguration == null || rootTelemetryConfiguration.f31859f < rootTelemetryConfigurationD.f31859f) {
                    kVarB.f87446a = rootTelemetryConfigurationD;
                }
            }
        }
    }

    public final /* synthetic */ boolean zze(int i5, int i11, IInterface iInterface) {
        synchronized (this.zzp) {
            try {
                if (this.zzv != i5) {
                    return false;
                }
                a(i11, iInterface);
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final /* synthetic */ void zzf() {
        int i5;
        int i11;
        synchronized (this.zzp) {
            i5 = this.zzv;
        }
        if (i5 == 3) {
            this.zzD = true;
            i11 = 5;
        } else {
            i11 = 4;
        }
        y yVar = this.zzb;
        yVar.sendMessage(yVar.obtainMessage(i11, this.zzd.get(), 16));
    }

    public final /* synthetic */ boolean zzg() throws ClassNotFoundException {
        if (this.zzD || TextUtils.isEmpty(getServiceDescriptor()) || TextUtils.isEmpty(null)) {
            return false;
        }
        try {
            Class.forName(getServiceDescriptor());
            return true;
        } catch (ClassNotFoundException unused) {
            return false;
        }
    }

    public final /* synthetic */ Object zzh() {
        return this.zzq;
    }

    public final /* synthetic */ void zzi(s sVar) {
        this.zzr = sVar;
    }

    public final /* synthetic */ ArrayList zzj() {
        return this.zzt;
    }

    public final /* synthetic */ b zzk() {
        return this.zzw;
    }

    public final /* synthetic */ c zzl() {
        return this.zzx;
    }

    public final /* synthetic */ ConnectionResult zzm() {
        return this.zzC;
    }

    public final /* synthetic */ void zzn(ConnectionResult connectionResult) {
        this.zzC = connectionResult;
    }

    public final /* synthetic */ boolean zzo() {
        return this.zzD;
    }

    public e(Context context, Looper looper, g0 g0Var, pg.c cVar, int i5, b bVar, c cVar2, String str) {
        this.zzk = null;
        this.zzp = new Object();
        this.zzq = new Object();
        this.zzt = new ArrayList();
        this.zzv = 1;
        this.zzC = null;
        this.zzD = false;
        this.zzE = null;
        this.zzd = new AtomicInteger(0);
        w.i(context, "Context must not be null");
        this.zzl = context;
        w.i(looper, "Looper must not be null");
        w.i(g0Var, "Supervisor must not be null");
        this.zzn = g0Var;
        w.i(cVar, "API availability must not be null");
        this.zzo = cVar;
        this.zzb = new y(this, looper);
        this.zzy = i5;
        this.zzw = bVar;
        this.zzx = cVar2;
        this.zzz = str;
    }

    public final void disconnect(String str) {
        this.zzk = str;
        disconnect();
    }
}
