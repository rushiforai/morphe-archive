package com.google.android.libraries.places.internal;

import b.c0;
import java.security.cert.Certificate;
import java.util.logging.Level;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;

/* loaded from: classes3.dex */
public final class zzbag {
    public final String zza;
    public final Certificate zzb;
    public final Certificate zzc;

    public zzbag(SSLSession sSLSession) throws SSLPeerUnverifiedException {
        String cipherSuite = sSLSession.getCipherSuite();
        Certificate[] localCertificates = sSLSession.getLocalCertificates();
        Certificate certificate = null;
        Certificate certificate2 = localCertificates != null ? localCertificates[0] : null;
        try {
            Certificate[] peerCertificates = sSLSession.getPeerCertificates();
            if (peerCertificates != null) {
                certificate = peerCertificates[0];
            }
        } catch (SSLPeerUnverifiedException e3) {
            zzbah.zza.logp(Level.FINE, "io.grpc.InternalChannelz$Tls", "<init>", c0.k("Peer cert not available for peerHost=", sSLSession.getPeerHost()), (Throwable) e3);
        }
        this.zza = cipherSuite;
        this.zzb = certificate2;
        this.zzc = certificate;
    }
}
