package com.google.android.libraries.places.internal;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbih extends zzbcv {
    static final boolean zza;
    static final boolean zzb;
    protected static final boolean zzc;
    private static final Logger zzg;
    private static final Set zzh;
    private static final String zzi;
    private static final String zzj;
    private static final String zzk;
    private static final zzbig zzl;
    private static String zzm;
    private boolean zzA;
    private zzbcr zzB;
    final zzbde zzd;
    protected boolean zzf;
    private final String zzp;
    private final String zzq;
    private final int zzr;
    private final zzbql zzs;
    private final long zzt;
    private final zzbdw zzu;
    private final zzna zzv;
    private boolean zzw;
    private Executor zzx;
    private final boolean zzy;
    private final zzbcu zzz;
    private final Random zzn = new Random();
    protected volatile zzbhz zze = zzbic.INSTANCE;
    private final AtomicReference zzo = new AtomicReference();

    static {
        Logger logger = Logger.getLogger(zzbih.class.getName());
        zzg = logger;
        zzh = Collections.unmodifiableSet(new HashSet(Arrays.asList("clientLanguage", "percentage", "clientHostname", "serviceConfig")));
        String property = System.getProperty("io.grpc.internal.DnsNameResolverProvider.enable_jndi", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
        zzi = property;
        String property2 = System.getProperty("io.grpc.internal.DnsNameResolverProvider.enable_jndi_localhost", "false");
        zzj = property2;
        String property3 = System.getProperty("io.grpc.internal.DnsNameResolverProvider.enable_service_config", "false");
        zzk = property3;
        zza = Boolean.parseBoolean(property);
        zzb = Boolean.parseBoolean(property2);
        zzc = Boolean.parseBoolean(property3);
        zzbig zzbigVar = null;
        try {
            try {
                try {
                    zzbig zzbigVar2 = (zzbig) Class.forName("io.grpc.internal.JndiResourceResolverFactory", true, zzbih.class.getClassLoader()).asSubclass(zzbig.class).getConstructor(null).newInstance(null);
                    if (zzbigVar2.zzb() != null) {
                        logger.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "getResourceResolverFactory", "JndiResourceResolverFactory not available, skipping.", zzbigVar2.zzb());
                    } else {
                        zzbigVar = zzbigVar2;
                    }
                } catch (Exception e3) {
                    zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "getResourceResolverFactory", "Can't construct JndiResourceResolverFactory, skipping.", (Throwable) e3);
                }
            } catch (Exception e11) {
                zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "getResourceResolverFactory", "Can't find JndiResourceResolverFactory ctor, skipping.", (Throwable) e11);
            }
        } catch (ClassCastException e12) {
            zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "getResourceResolverFactory", "Unable to cast JndiResourceResolverFactory, skipping.", (Throwable) e12);
        } catch (ClassNotFoundException e13) {
            zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "getResourceResolverFactory", "Unable to find JndiResourceResolverFactory, skipping.", (Throwable) e13);
        }
        zzl = zzbigVar;
    }

    public zzbih(String str, String str2, zzbco zzbcoVar, zzbql zzbqlVar, zzna zznaVar, boolean z11) throws NumberFormatException {
        zzmt.zzc(zzbcoVar, "args");
        this.zzs = zzbqlVar;
        zzmt.zzc(str2, PendingUpgradeStore.KEY_NAME);
        URI uriCreate = URI.create("//".concat(str2));
        zzmt.zzj(uriCreate.getHost() != null, "Invalid DNS name: %s", str2);
        String authority = uriCreate.getAuthority();
        zzmt.zzd(authority, "nameUri (%s) doesn't have an authority", uriCreate);
        this.zzp = authority;
        this.zzq = uriCreate.getHost();
        if (uriCreate.getPort() == -1) {
            this.zzr = zzbcoVar.zza();
        } else {
            this.zzr = uriCreate.getPort();
        }
        this.zzd = zzbcoVar.zzd();
        long nanos = 0;
        if (!z11) {
            String property = System.getProperty("networkaddress.cache.ttl");
            long j11 = 30;
            if (property != null) {
                try {
                    j11 = Long.parseLong(property);
                } catch (NumberFormatException unused) {
                    zzg.logp(Level.WARNING, "io.grpc.internal.DnsNameResolver", "getNetworkAddressCacheTtlNanos", "Property({0}) valid is not valid number format({1}), fall back to default({2})", new Object[]{"networkaddress.cache.ttl", property, 30L});
                }
            }
            nanos = j11 > 0 ? TimeUnit.SECONDS.toNanos(j11) : j11;
        }
        this.zzt = nanos;
        this.zzv = zznaVar;
        this.zzu = zzbcoVar.zze();
        Executor executorZzf = zzbcoVar.zzf();
        this.zzx = executorZzf;
        this.zzy = executorZzf == null;
        this.zzz = zzbcoVar.zzc();
    }

    public static /* bridge */ /* synthetic */ zzazs zzg(zzbih zzbihVar) throws IOException {
        zzbdd zzbddVarZza = zzbihVar.zzd.zza(InetSocketAddress.createUnresolved(zzbihVar.zzq, zzbihVar.zzr));
        if (zzbddVarZza == null) {
            return null;
        }
        return new zzazs(Collections.singletonList(zzbddVarZza), zzaye.zza);
    }

    private static String zzm() {
        if (zzm == null) {
            try {
                zzm = InetAddress.getLocalHost().getHostName();
            } catch (UnknownHostException e3) {
                throw new RuntimeException(e3);
            }
        }
        return zzm;
    }

    private final void zzn() {
        if (this.zzA || this.zzw) {
            return;
        }
        if (this.zzf) {
            long j11 = this.zzt;
            if (j11 != 0 && (j11 <= 0 || this.zzv.zza(TimeUnit.NANOSECONDS) <= this.zzt)) {
                return;
            }
        }
        this.zzA = true;
        this.zzx.execute(new zzbie(this, this.zzB));
    }

    @Override // com.google.android.libraries.places.internal.zzbcv
    public final String zza() {
        return this.zzp;
    }

    @Override // com.google.android.libraries.places.internal.zzbcv
    public final void zzb() {
        zzmt.zzp(this.zzB != null, "not started");
        zzn();
    }

    @Override // com.google.android.libraries.places.internal.zzbcv
    public final void zzc() {
        if (this.zzw) {
            return;
        }
        this.zzw = true;
        Executor executor = this.zzx;
        if (executor == null || !this.zzy) {
            return;
        }
        zzbqm.zzc(this.zzs, executor);
        this.zzx = null;
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [java.lang.Object, java.util.concurrent.Executor] */
    @Override // com.google.android.libraries.places.internal.zzbcv
    public final void zzd(zzbcr zzbcrVar) {
        zzmt.zzp(this.zzB == null, "already started");
        if (this.zzy) {
            this.zzx = zzbqm.zza(this.zzs);
        }
        this.zzB = zzbcrVar;
        zzn();
    }

    /* JADX WARN: Removed duplicated region for block: B:119:0x0215  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x01d8 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:160:? A[LOOP:2: B:67:0x012e->B:160:?, LOOP_END, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0192 A[Catch: RuntimeException -> 0x015e, TryCatch #1 {RuntimeException -> 0x015e, blocks: (B:70:0x013a, B:71:0x0142, B:73:0x0148, B:76:0x0161, B:78:0x0169, B:80:0x016f, B:81:0x0173, B:83:0x0179, B:87:0x018a, B:89:0x0192, B:94:0x019f, B:97:0x01ab, B:99:0x01b3, B:101:0x01b9, B:102:0x01bd, B:104:0x01c3, B:106:0x01cf, B:111:0x01d9, B:112:0x01e8), top: B:140:0x013a }] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01ab A[Catch: RuntimeException -> 0x015e, TryCatch #1 {RuntimeException -> 0x015e, blocks: (B:70:0x013a, B:71:0x0142, B:73:0x0148, B:76:0x0161, B:78:0x0169, B:80:0x016f, B:81:0x0173, B:83:0x0179, B:87:0x018a, B:89:0x0192, B:94:0x019f, B:97:0x01ab, B:99:0x01b3, B:101:0x01b9, B:102:0x01bd, B:104:0x01c3, B:106:0x01cf, B:111:0x01d9, B:112:0x01e8), top: B:140:0x013a }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final zzbib zzi(boolean z11) {
        zzbif zzbifVarZza;
        zzbig zzbigVar;
        zzbcp zzbcpVarZzb;
        Double dZzb;
        Exception exc = null;
        zzbcpVarZzb = null;
        zzbcp zzbcpVarZzb2 = null;
        exc = null;
        zzbib zzbibVar = new zzbib(null);
        try {
            try {
                try {
                    List listUnmodifiableList = Collections.unmodifiableList(Arrays.asList(InetAddress.getAllByName(this.zzq)));
                    ArrayList arrayList = new ArrayList(listUnmodifiableList.size());
                    Iterator it = listUnmodifiableList.iterator();
                    while (it.hasNext()) {
                        arrayList.add(new zzazs(Collections.singletonList(new InetSocketAddress((InetAddress) it.next(), this.zzr)), zzaye.zza));
                    }
                    zzbibVar.zzb = Collections.unmodifiableList(arrayList);
                    if (zzc) {
                        String str = this.zzq;
                        List<String> listZza = Collections.EMPTY_LIST;
                        boolean z12 = zza;
                        boolean z13 = zzb;
                        if (z12) {
                            if (!"localhost".equalsIgnoreCase(str)) {
                                if (!str.contains(":")) {
                                    boolean z14 = true;
                                    int i5 = 0;
                                    while (i5 < str.length()) {
                                        char cCharAt = str.charAt(i5);
                                        if (cCharAt != '.') {
                                            z14 = (z14 ? 1 : 0) & (cCharAt >= '0' && cCharAt <= '9');
                                        }
                                        i5++;
                                        z14 = z14;
                                    }
                                    if (z14) {
                                    }
                                }
                                zzbifVarZza = null;
                            } else if (z13) {
                                zzbifVarZza = (zzbif) this.zzo.get();
                                if (zzbifVarZza == null && (zzbigVar = zzl) != null) {
                                    zzbifVarZza = zzbigVar.zza();
                                }
                            } else {
                                zzbifVarZza = null;
                            }
                            if (zzbifVarZza != null) {
                                try {
                                    listZza = zzbifVarZza.zza();
                                } catch (Exception e3) {
                                    zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "resolveServiceConfig", "ServiceConfig resolution failure", (Throwable) e3);
                                }
                            }
                            if (listZza.isEmpty()) {
                                zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "resolveServiceConfig", "No TXT records found for {0}", new Object[]{this.zzq});
                            } else {
                                Random random = this.zzn;
                                String strZzm = zzm();
                                try {
                                    ArrayList arrayList2 = new ArrayList();
                                    for (String str2 : listZza) {
                                        if (str2.startsWith("grpc_config=")) {
                                            Object objZza = zzbkf.zza(str2.substring(12));
                                            if (!(objZza instanceof List)) {
                                                throw new ClassCastException("wrong type ".concat(String.valueOf(objZza)));
                                            }
                                            List list = (List) objZza;
                                            zzbkg.zzf(list);
                                            arrayList2.addAll(list);
                                        } else {
                                            zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "parseTxtResults", "Ignoring non service config {0}", new Object[]{str2});
                                        }
                                    }
                                    Iterator it2 = arrayList2.iterator();
                                    Map map = null;
                                    while (it2.hasNext()) {
                                        Map map2 = (Map) it2.next();
                                        try {
                                            for (Map.Entry entry : map2.entrySet()) {
                                                zzng.zza(zzh.contains(entry.getKey()), "Bad key: %s", entry);
                                            }
                                            List listZzi = zzbkg.zzi(map2, "clientLanguage");
                                            if (listZzi == null || listZzi.isEmpty()) {
                                                dZzb = zzbkg.zzb(map2, "percentage");
                                                if (dZzb == null) {
                                                    List listZzi2 = zzbkg.zzi(map2, "clientHostname");
                                                    if (listZzi2 != null && !listZzi2.isEmpty()) {
                                                        Iterator it3 = listZzi2.iterator();
                                                        while (it3.hasNext()) {
                                                            if (((String) it3.next()).equals(strZzm)) {
                                                            }
                                                        }
                                                        map = null;
                                                        if (map == null) {
                                                            break;
                                                        }
                                                    }
                                                    Map mapZzj = zzbkg.zzj(map2, "serviceConfig");
                                                    if (mapZzj == null) {
                                                        throw new zznh(String.format("key '%s' missing in '%s'", map2, "serviceConfig"));
                                                    }
                                                    map = mapZzj;
                                                    if (map == null) {
                                                    }
                                                } else {
                                                    int iIntValue = dZzb.intValue();
                                                    zzng.zza(iIntValue >= 0 && iIntValue <= 100, "Bad percentage: %s", dZzb);
                                                    if (random.nextInt(100) >= iIntValue) {
                                                    }
                                                    map = null;
                                                    if (map == null) {
                                                    }
                                                }
                                            } else {
                                                Iterator it4 = listZzi.iterator();
                                                while (it4.hasNext()) {
                                                    if ("java".equalsIgnoreCase((String) it4.next())) {
                                                        dZzb = zzbkg.zzb(map2, "percentage");
                                                        if (dZzb == null) {
                                                        }
                                                    }
                                                }
                                                map = null;
                                                if (map == null) {
                                                }
                                            }
                                        } catch (RuntimeException e11) {
                                            zzbcpVarZzb = zzbcp.zzb(zzbdo.zzc.zzg("failed to pick service config choice").zzf(e11));
                                        }
                                    }
                                    zzbcpVarZzb = map == null ? null : zzbcp.zza(map);
                                } catch (IOException e12) {
                                    e = e12;
                                    zzbcpVarZzb = zzbcp.zzb(zzbdo.zzc.zzg("failed to parse TXT records").zzf(e));
                                    if (zzbcpVarZzb != null) {
                                    }
                                    zzbibVar.zzc = zzbcpVarZzb2;
                                    return zzbibVar;
                                } catch (RuntimeException e13) {
                                    e = e13;
                                    zzbcpVarZzb = zzbcp.zzb(zzbdo.zzc.zzg("failed to parse TXT records").zzf(e));
                                    if (zzbcpVarZzb != null) {
                                    }
                                    zzbibVar.zzc = zzbcpVarZzb2;
                                    return zzbibVar;
                                }
                                if (zzbcpVarZzb != null) {
                                    zzbcpVarZzb2 = zzbcpVarZzb.zzc() != null ? zzbcp.zzb(zzbcpVarZzb.zzc()) : this.zzz.zza((Map) zzbcpVarZzb.zzd());
                                }
                            }
                            zzbibVar.zzc = zzbcpVarZzb2;
                        }
                    }
                    return zzbibVar;
                } catch (Exception e14) {
                    exc = e14;
                    zznd.zza(exc);
                    throw new RuntimeException(exc);
                }
            } catch (Throwable th2) {
                Exception exc2 = exc;
                if (exc2 != null) {
                    zzg.logp(Level.FINE, "io.grpc.internal.DnsNameResolver", "resolveAddresses", "Address resolution failure", (Throwable) exc2);
                }
                throw th2;
            }
        } catch (Exception e15) {
            zzbibVar.zza = zzbdo.zzp.zzg("Unable to resolve host ".concat(String.valueOf(this.zzq))).zzf(e15);
            return zzbibVar;
        }
    }
}
