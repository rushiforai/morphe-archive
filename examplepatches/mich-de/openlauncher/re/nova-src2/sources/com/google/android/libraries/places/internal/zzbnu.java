package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.SocketAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbnu implements zzbde {
    private final zznc zzc;
    private final InetSocketAddress zzd;
    private final zzbns zzf;
    private static final Logger zza = Logger.getLogger(zzbnu.class.getName());
    private static final zzbns zze = new zzbns();
    private static final zznc zzb = new zzbnt();

    public zzbnu() {
        zznc zzncVar = zzb;
        zzbns zzbnsVar = zze;
        String str = System.getenv("GRPC_PROXY_EXP");
        zzncVar.getClass();
        this.zzc = zzncVar;
        zzbnsVar.getClass();
        this.zzf = zzbnsVar;
        if (str == null) {
            this.zzd = null;
            return;
        }
        String[] strArrSplit = str.split(":", 2);
        int i5 = strArrSplit.length > 1 ? Integer.parseInt(strArrSplit[1]) : 80;
        zza.logp(Level.WARNING, "io.grpc.internal.ProxyDetectorImpl", "overrideProxy", "Detected GRPC_PROXY_EXP and will honor it, but this feature will be removed in a future release. Use the JVM flags \"-Dhttps.proxyHost=HOST -Dhttps.proxyPort=PORT\" to set the https proxy for this JVM.");
        this.zzd = new InetSocketAddress(strArrSplit[0], i5);
    }

    private static final zzbdd zzc(InetSocketAddress inetSocketAddress) throws IOException {
        try {
            try {
                URI uri = new URI("https", null, zzbjd.zze(inetSocketAddress), inetSocketAddress.getPort(), null, null, null);
                ProxySelector proxySelector = ProxySelector.getDefault();
                if (proxySelector == null) {
                    zza.logp(Level.FINE, "io.grpc.internal.ProxyDetectorImpl", "detectProxy", "proxy selector is null, so continuing without proxy lookup");
                    return null;
                }
                List<Proxy> listSelect = proxySelector.select(uri);
                if (listSelect.size() > 1) {
                    zza.logp(Level.WARNING, "io.grpc.internal.ProxyDetectorImpl", "detectProxy", "More than 1 proxy detected, gRPC will select the first one");
                }
                Proxy proxy = listSelect.get(0);
                if (proxy.type() == Proxy.Type.DIRECT) {
                    return null;
                }
                InetSocketAddress inetSocketAddress2 = (InetSocketAddress) proxy.address();
                PasswordAuthentication passwordAuthenticationZza = zzbns.zza(zzbjd.zze(inetSocketAddress2), inetSocketAddress2.getAddress(), inetSocketAddress2.getPort(), "https", b.f42142b, null);
                if (inetSocketAddress2.isUnresolved()) {
                    inetSocketAddress2 = new InetSocketAddress(InetAddress.getByName(inetSocketAddress2.getHostName()), inetSocketAddress2.getPort());
                }
                zzazy zzazyVarZza = zzbaa.zza();
                zzazyVarZza.zzc(inetSocketAddress);
                zzazyVarZza.zzb(inetSocketAddress2);
                if (passwordAuthenticationZza == null) {
                    return zzazyVarZza.zze();
                }
                zzazyVarZza.zzd(passwordAuthenticationZza.getUserName());
                zzazyVarZza.zza(passwordAuthenticationZza.getPassword() != null ? new String(passwordAuthenticationZza.getPassword()) : null);
                return zzazyVarZza.zze();
            } catch (URISyntaxException e3) {
                zza.logp(Level.WARNING, "io.grpc.internal.ProxyDetectorImpl", "detectProxy", "Failed to construct URI for proxy lookup, proceeding without proxy", (Throwable) e3);
                return null;
            }
        } catch (Throwable th2) {
            zza.logp(Level.WARNING, "io.grpc.internal.ProxyDetectorImpl", "detectProxy", "Failed to get host for proxy lookup, proceeding without proxy", th2);
            return null;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbde
    public final zzbdd zza(SocketAddress socketAddress) throws IOException {
        if (!(socketAddress instanceof InetSocketAddress)) {
            return null;
        }
        InetSocketAddress inetSocketAddress = this.zzd;
        if (inetSocketAddress == null) {
            return zzc((InetSocketAddress) socketAddress);
        }
        zzazy zzazyVarZza = zzbaa.zza();
        zzazyVarZza.zzb(inetSocketAddress);
        zzazyVarZza.zzc((InetSocketAddress) socketAddress);
        return zzazyVarZza.zze();
    }
}
