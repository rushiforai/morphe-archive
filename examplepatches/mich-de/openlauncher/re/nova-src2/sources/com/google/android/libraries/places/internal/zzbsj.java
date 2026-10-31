package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;

/* loaded from: classes3.dex */
final class zzbsj extends zzbsk {
    private static final zzbtf zzb;
    private static final zzbtf zzc;
    private static final zzbtf zzd;
    private static final zzbtf zze;
    private static final zzbtf zzf;
    private static final zzbtf zzg;
    private static final Method zzh;
    private static final Method zzi;
    private static final Method zzj;
    private static final Method zzk;
    private static final Method zzl;
    private static final Method zzm;
    private static final Constructor zzn;

    /* JADX WARN: Can't wrap try/catch for region: R(13:0|2|(2:72|3)|(6:74|4|68|5|64|6)|(2:76|7)|44|70|45|66|46|62|63|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x011a, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x011c, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0122, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0124, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0126, code lost:
    
        r1 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0128, code lost:
    
        com.google.android.libraries.places.internal.zzbsk.zzb.logp(java.util.logging.Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "<clinit>", "Failed to find Android 7.0+ APIs", (java.lang.Throwable) r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0138, code lost:
    
        r1 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x013a, code lost:
    
        com.google.android.libraries.places.internal.zzbsk.zzb.logp(java.util.logging.Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "<clinit>", "Failed to find Android 7.0+ APIs", (java.lang.Throwable) r0);
     */
    static {
        NoSuchMethodException noSuchMethodException;
        Method method;
        Method method2;
        Method method3;
        ClassNotFoundException classNotFoundException;
        Method method4;
        Method method5;
        Method method6;
        Method method7;
        Method method8;
        Class<?> cls;
        Class cls2 = Boolean.TYPE;
        Constructor<?> constructor = null;
        zzb = new zzbtf(null, "setUseSessionTickets", cls2);
        zzc = new zzbtf(null, "setHostname", String.class);
        zzd = new zzbtf(byte[].class, "getAlpnSelectedProtocol", new Class[0]);
        zze = new zzbtf(null, "setAlpnProtocols", byte[].class);
        zzf = new zzbtf(byte[].class, "getNpnSelectedProtocol", new Class[0]);
        zzg = new zzbtf(null, "setNpnProtocols", byte[].class);
        try {
            method2 = SSLParameters.class.getMethod("setApplicationProtocols", String[].class);
        } catch (ClassNotFoundException e3) {
            classNotFoundException = e3;
            method = null;
            method2 = null;
            method3 = null;
        } catch (NoSuchMethodException e11) {
            noSuchMethodException = e11;
            method = null;
            method2 = null;
            method3 = null;
        }
        try {
            method5 = SSLParameters.class.getMethod("getApplicationProtocols", null);
            try {
                method6 = SSLSocket.class.getMethod("getApplicationProtocol", null);
                try {
                    cls = Class.forName("android.net.ssl.SSLSockets");
                    method8 = cls.getMethod("isSupportedSocket", SSLSocket.class);
                } catch (ClassNotFoundException e12) {
                    classNotFoundException = e12;
                    method4 = null;
                    method = method5;
                    method3 = method6;
                } catch (NoSuchMethodException e13) {
                    noSuchMethodException = e13;
                    method4 = null;
                    method = method5;
                    method3 = method6;
                }
            } catch (ClassNotFoundException e14) {
                classNotFoundException = e14;
                method3 = null;
                method4 = null;
                method = method5;
            } catch (NoSuchMethodException e15) {
                noSuchMethodException = e15;
                method3 = null;
                method4 = null;
                method = method5;
            }
        } catch (ClassNotFoundException e16) {
            classNotFoundException = e16;
            method = null;
            method3 = null;
            method4 = method3;
            zzbsk.zzb.logp(Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "<clinit>", "Failed to find Android 10.0+ APIs", (Throwable) classNotFoundException);
            method5 = method;
            method6 = method3;
            method7 = null;
            method8 = method4;
            zzj = method2;
            zzk = method5;
            zzl = method6;
            zzh = method8;
            zzi = method7;
            Method method9 = SSLParameters.class.getMethod("setServerNames", List.class);
            constructor = Class.forName("javax.net.ssl.SNIHostName").getConstructor(String.class);
            zzm = method9;
            zzn = constructor;
        } catch (NoSuchMethodException e17) {
            noSuchMethodException = e17;
            method = null;
            method3 = null;
            method4 = method3;
            zzbsk.zzb.logp(Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "<clinit>", "Failed to find Android 10.0+ APIs", (Throwable) noSuchMethodException);
            method5 = method;
            method6 = method3;
            method7 = null;
            method8 = method4;
            zzj = method2;
            zzk = method5;
            zzl = method6;
            zzh = method8;
            zzi = method7;
            Method method92 = SSLParameters.class.getMethod("setServerNames", List.class);
            constructor = Class.forName("javax.net.ssl.SNIHostName").getConstructor(String.class);
            zzm = method92;
            zzn = constructor;
        }
        try {
            method7 = cls.getMethod("setUseSessionTickets", SSLSocket.class, cls2);
        } catch (ClassNotFoundException e18) {
            classNotFoundException = e18;
            method = method5;
            method3 = method6;
            method4 = method8;
            zzbsk.zzb.logp(Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "<clinit>", "Failed to find Android 10.0+ APIs", (Throwable) classNotFoundException);
            method5 = method;
            method6 = method3;
            method7 = null;
            method8 = method4;
            zzj = method2;
            zzk = method5;
            zzl = method6;
            zzh = method8;
            zzi = method7;
            Method method922 = SSLParameters.class.getMethod("setServerNames", List.class);
            constructor = Class.forName("javax.net.ssl.SNIHostName").getConstructor(String.class);
            zzm = method922;
            zzn = constructor;
        } catch (NoSuchMethodException e19) {
            noSuchMethodException = e19;
            method = method5;
            method3 = method6;
            method4 = method8;
            zzbsk.zzb.logp(Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "<clinit>", "Failed to find Android 10.0+ APIs", (Throwable) noSuchMethodException);
            method5 = method;
            method6 = method3;
            method7 = null;
            method8 = method4;
            zzj = method2;
            zzk = method5;
            zzl = method6;
            zzh = method8;
            zzi = method7;
            Method method9222 = SSLParameters.class.getMethod("setServerNames", List.class);
            constructor = Class.forName("javax.net.ssl.SNIHostName").getConstructor(String.class);
            zzm = method9222;
            zzn = constructor;
        }
        zzj = method2;
        zzk = method5;
        zzl = method6;
        zzh = method8;
        zzi = method7;
        Method method92222 = SSLParameters.class.getMethod("setServerNames", List.class);
        constructor = Class.forName("javax.net.ssl.SNIHostName").getConstructor(String.class);
        zzm = method92222;
        zzn = constructor;
    }

    public zzbsj(zzbtl zzbtlVar) {
        super(zzbtlVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbsk
    public final String zza(SSLSocket sSLSocket) {
        Method method = zzl;
        if (method != null) {
            try {
                return (String) method.invoke(sSLSocket, null);
            } catch (IllegalAccessException e3) {
                throw new RuntimeException(e3);
            } catch (InvocationTargetException e11) {
                if (!(e11.getTargetException() instanceof UnsupportedOperationException)) {
                    throw new RuntimeException(e11);
                }
                zzbsk.zzb.logp(Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "getSelectedProtocol", "Socket unsupported for getApplicationProtocol, will try old methods");
            }
        }
        if (this.zza.zzc() == 1) {
            try {
                byte[] bArr = (byte[]) zzd.zzb(sSLSocket, new Object[0]);
                if (bArr != null) {
                    return new String(bArr, zzbto.zzb);
                }
            } catch (Exception e12) {
                zzbsk.zzb.logp(Level.FINE, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "getSelectedProtocol", "Failed calling getAlpnSelectedProtocol()", (Throwable) e12);
            }
        }
        if (this.zza.zzc() != 3) {
            try {
                byte[] bArr2 = (byte[]) zzf.zzb(sSLSocket, new Object[0]);
                if (bArr2 != null) {
                    return new String(bArr2, zzbto.zzb);
                }
            } catch (Exception e13) {
                zzbsk.zzb.logp(Level.FINE, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "getSelectedProtocol", "Failed calling getNpnSelectedProtocol()", (Throwable) e13);
            }
        }
        return null;
    }

    @Override // com.google.android.libraries.places.internal.zzbsk
    public final String zzb(SSLSocket sSLSocket, String str, List list) throws IOException {
        String strZza = zza(sSLSocket);
        return strZza == null ? super.zzb(sSLSocket, str, list) : strZza;
    }

    @Override // com.google.android.libraries.places.internal.zzbsk
    public final void zzc(SSLSocket sSLSocket, String str, List list) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        Constructor constructor;
        Method method;
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((zzbtm) it.next()).toString());
        }
        boolean z11 = false;
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
        SSLParameters sSLParameters = sSLSocket.getSSLParameters();
        if (str != null) {
            try {
                try {
                    if (!str.contains("_")) {
                        try {
                            zzmt.zzj(zzbjd.zzf(str).getAuthority().indexOf(64) == -1, "Userinfo must not be present on authority: '%s'", str);
                            Method method2 = zzh;
                            if (method2 == null || !((Boolean) method2.invoke(null, sSLSocket)).booleanValue()) {
                                zzb.zza(sSLSocket, Boolean.TRUE);
                            } else {
                                zzi.invoke(null, sSLSocket, Boolean.TRUE);
                            }
                            Method method3 = zzm;
                            if (method3 == null || (constructor = zzn) == null) {
                                zzc.zza(sSLSocket, str);
                            } else {
                                method3.invoke(sSLParameters, Collections.singletonList(constructor.newInstance(str)));
                            }
                        } catch (IllegalArgumentException unused) {
                        }
                    }
                } catch (InvocationTargetException e3) {
                    throw new RuntimeException(e3);
                }
            } catch (IllegalAccessException e11) {
                throw new RuntimeException(e11);
            } catch (InstantiationException e12) {
                throw new RuntimeException(e12);
            }
        }
        Method method4 = zzl;
        if (method4 != null) {
            try {
                method4.invoke(sSLSocket, null);
                zzj.invoke(sSLParameters, strArr);
                z11 = true;
            } catch (InvocationTargetException e13) {
                if (!(e13.getTargetException() instanceof UnsupportedOperationException)) {
                    throw e13;
                }
                zzbsk.zzb.logp(Level.FINER, "io.grpc.okhttp.OkHttpProtocolNegotiator$AndroidNegotiator", "configureTlsExtensions", "setApplicationProtocol unsupported, will try old methods");
            }
        }
        sSLSocket.setSSLParameters(sSLParameters);
        if (z11 && (method = zzk) != null && Arrays.equals(strArr, (String[]) method.invoke(sSLSocket.getSSLParameters(), null))) {
            return;
        }
        Object[] objArr = {zzbtl.zzg(list)};
        if (this.zza.zzc() == 1) {
            zze.zzb(sSLSocket, objArr);
        }
        if (this.zza.zzc() == 3) {
            throw new RuntimeException("We can not do TLS handshake on this Android version, please install the Google Play Services Dynamic Security Provider to use TLS");
        }
        zzg.zzb(sSLSocket, objArr);
    }
}
