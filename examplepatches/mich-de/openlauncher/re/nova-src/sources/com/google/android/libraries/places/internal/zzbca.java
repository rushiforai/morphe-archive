package com.google.android.libraries.places.internal;

import b.c0;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.vungle.ads.internal.protos.Sdk;
import java.util.BitSet;
import java.util.Locale;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public abstract class zzbca {
    private static final BitSet zza;
    private final String zzb;
    private final String zzc;
    private final byte[] zzd;
    private final Object zze;

    static {
        BitSet bitSet = new BitSet(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        bitSet.set(45);
        bitSet.set(95);
        bitSet.set(46);
        for (char c11 = '0'; c11 <= '9'; c11 = (char) (c11 + 1)) {
            bitSet.set(c11);
        }
        for (char c12 = 'a'; c12 <= 'z'; c12 = (char) (c12 + 1)) {
            bitSet.set(c12);
        }
        zza = bitSet;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x005b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0058 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public /* synthetic */ zzbca(String str, boolean z11, Object obj, zzbbz zzbbzVar) {
        this.zzb = str;
        String lowerCase = str.toLowerCase(Locale.ROOT);
        zzmt.zzc(lowerCase, PendingUpgradeStore.KEY_NAME);
        zzmt.zzf(!lowerCase.isEmpty(), "token must have at least 1 tchar");
        if (lowerCase.equals("connection")) {
            zzbcf.zzd.logp(Level.WARNING, "io.grpc.Metadata$Key", "validateName", "Metadata key is 'Connection', which should not be used. That is used by HTTP/1 for connection-specific headers which are not to be forwarded. There is probably an HTTP/1 conversion bug. Simply removing the Connection header is not enough; you should remove all headers it references as well. See RFC 7230 section 6.1", (Throwable) new RuntimeException("exception to show backtrace"));
        }
        int i5 = 0;
        while (i5 < lowerCase.length()) {
            char cCharAt = lowerCase.charAt(i5);
            if (z11 && cCharAt == ':') {
                if (i5 == 0) {
                    i5 = 0;
                } else {
                    cCharAt = ':';
                    if (zza.get(cCharAt)) {
                    }
                }
            } else if (zza.get(cCharAt)) {
                throw new IllegalArgumentException(zznb.zzb("Invalid character '%s' in key name '%s'", Character.valueOf(cCharAt), lowerCase));
            }
            i5++;
        }
        this.zzc = lowerCase;
        this.zzd = lowerCase.getBytes(zzmb.zza);
        this.zze = obj;
    }

    public static zzbca zzc(String str, zzbbx zzbbxVar) {
        return new zzbbw(str, false, zzbbxVar, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return this.zzc.equals(((zzbca) obj).zzc);
    }

    public final int hashCode() {
        return this.zzc.hashCode();
    }

    public final String toString() {
        return c0.q(new StringBuilder("Key{name='"), this.zzc, "'}");
    }

    public abstract Object zza(byte[] bArr);

    public abstract byte[] zzb(Object obj);

    public final String zzd() {
        return this.zzc;
    }

    public final byte[] zze() {
        return this.zzd;
    }
}
