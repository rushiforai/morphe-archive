package defpackage;

import android.os.Build;
import j$.util.Objects;
import java.nio.charset.Charset;
import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.IvParameterSpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b6g {
    public static final bt a = new bt(11);

    public static AlgorithmParameterSpec a(byte[] bArr, int i, int i2) {
        Charset charset = ejg.a;
        Integer numValueOf = !Objects.equals(System.getProperty("java.vendor"), "The Android Project") ? null : Integer.valueOf(Build.VERSION.SDK_INT);
        return (numValueOf == null || numValueOf.intValue() > 19) ? new GCMParameterSpec(128, bArr, i, i2) : new IvParameterSpec(bArr, i, i2);
    }
}
