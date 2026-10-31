package com.google.android.libraries.places.internal;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.Security;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;

/* loaded from: classes3.dex */
public class zzbtl {
    public static final Logger zza = Logger.getLogger(zzbtl.class.getName());
    private static final String[] zzb = {"com.google.android.gms.org.conscrypt.OpenSSLProvider", "org.conscrypt.OpenSSLProvider", "com.android.org.conscrypt.OpenSSLProvider", "org.apache.harmony.xnet.provider.jsse.OpenSSLProvider", "com.google.android.libraries.stitch.sslguard.SslGuardProvider"};
    private static final zzbtl zzc = zzh();
    private final Provider zzd;

    public zzbtl(Provider provider) {
        this.zzd = provider;
    }

    public static zzbtl zze() {
        return zzc;
    }

    public static byte[] zzg(List list) {
        zzbwb zzbwbVar = new zzbwb();
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            zzbtm zzbtmVar = (zzbtm) list.get(i5);
            if (zzbtmVar != zzbtm.HTTP_1_0) {
                zzbwbVar.zzm(zzbtmVar.toString().length());
                zzbwbVar.zzs(zzbtmVar.toString());
            }
        }
        return zzbwbVar.zzH(zzbwbVar.zzg());
    }

    private static zzbtl zzh() throws IllegalAccessException, NoSuchMethodException, NoSuchAlgorithmException, ClassNotFoundException, SecurityException, KeyManagementException, IllegalArgumentException, InvocationTargetException {
        Method method;
        Provider provider;
        Provider provider2;
        Method method2;
        Provider[] providers = Security.getProviders();
        int length = providers.length;
        int i5 = 0;
        loop0: while (true) {
            method = null;
            if (i5 >= length) {
                zza.logp(Level.WARNING, "io.grpc.okhttp.internal.Platform", "getAndroidSecurityProvider", "Unable to find Conscrypt");
                provider = null;
                break;
            }
            Provider provider3 = providers[i5];
            String[] strArr = zzb;
            int length2 = strArr.length;
            for (int i11 = 0; i11 < 5; i11++) {
                String str = strArr[i11];
                if (str.equals(provider3.getClass().getName())) {
                    zza.logp(Level.FINE, "io.grpc.okhttp.internal.Platform", "getAndroidSecurityProvider", "Found registered provider {0}", str);
                    provider = provider3;
                    break loop0;
                }
            }
            i5++;
        }
        if (provider != null) {
            zzbtf zzbtfVar = new zzbtf(null, "setUseSessionTickets", Boolean.TYPE);
            zzbtf zzbtfVar2 = new zzbtf(null, "setHostname", String.class);
            zzbtf zzbtfVar3 = new zzbtf(byte[].class, "getAlpnSelectedProtocol", new Class[0]);
            zzbtf zzbtfVar4 = new zzbtf(null, "setAlpnProtocols", byte[].class);
            try {
                Class<?> cls = Class.forName("android.net.TrafficStats");
                method2 = cls.getMethod("tagSocket", Socket.class);
                try {
                    method = cls.getMethod("untagSocket", Socket.class);
                } catch (ClassNotFoundException | NoSuchMethodException unused) {
                }
            } catch (ClassNotFoundException | NoSuchMethodException unused2) {
                method2 = null;
            }
            Method method3 = method2;
            Method method4 = method;
            int i12 = 1;
            if (!provider.getName().equals("GmsCore_OpenSSL") && !provider.getName().equals("Conscrypt") && !provider.getName().equals("Ssl_Guard")) {
                try {
                    zzbtl.class.getClassLoader().loadClass("android.net.Network");
                } catch (ClassNotFoundException e3) {
                    zza.logp(Level.FINE, "io.grpc.okhttp.internal.Platform", "isAtLeastAndroid5", "Can't find class", (Throwable) e3);
                    try {
                        zzbtl.class.getClassLoader().loadClass("android.app.ActivityOptions");
                        i12 = 2;
                    } catch (ClassNotFoundException e11) {
                        zza.logp(Level.FINE, "io.grpc.okhttp.internal.Platform", "isAtLeastAndroid41", "Can't find class", (Throwable) e11);
                        i12 = 3;
                    }
                }
            }
            return new zzbtg(zzbtfVar, zzbtfVar2, method3, method4, zzbtfVar3, zzbtfVar4, provider, i12);
        }
        try {
            Provider provider4 = SSLContext.getDefault().getProvider();
            try {
                try {
                    SSLContext sSLContext = SSLContext.getInstance("TLS", provider4);
                    sSLContext.init(null, null, null);
                    SSLEngine.class.getMethod("getApplicationProtocol", null).invoke(sSLContext.createSSLEngine(), null);
                    return new zzbti(provider4, SSLParameters.class.getMethod("setApplicationProtocols", String[].class), SSLSocket.class.getMethod("getApplicationProtocol", null), null);
                } catch (ClassNotFoundException | NoSuchMethodException unused3) {
                    provider2 = provider4;
                    return new zzbtl(provider2);
                }
            } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException | KeyManagementException | NoSuchAlgorithmException unused4) {
                Class<?> cls2 = Class.forName("org.eclipse.jetty.alpn.ALPN");
                Class<?> cls3 = Class.forName("org.eclipse.jetty.alpn.ALPN$Provider");
                try {
                    return new zzbtj(cls2.getMethod("put", SSLSocket.class, cls3), cls2.getMethod("get", SSLSocket.class), cls2.getMethod("remove", SSLSocket.class), Class.forName("org.eclipse.jetty.alpn.ALPN$ClientProvider"), Class.forName("org.eclipse.jetty.alpn.ALPN$ServerProvider"), provider4);
                } catch (ClassNotFoundException | NoSuchMethodException unused5) {
                    provider2 = provider4;
                    return new zzbtl(provider2);
                }
            }
        } catch (NoSuchAlgorithmException e12) {
            throw new RuntimeException(e12);
        }
    }

    public String zza(SSLSocket sSLSocket) {
        return null;
    }

    public void zzb(SSLSocket sSLSocket, String str, List list) {
    }

    public int zzc() {
        return 3;
    }

    public void zzd(SSLSocket sSLSocket) {
    }

    public final Provider zzf() {
        return this.zzd;
    }
}
