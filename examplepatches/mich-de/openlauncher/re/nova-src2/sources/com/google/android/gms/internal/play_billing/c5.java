package com.google.android.gms.internal.play_billing;

import android.os.Build;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class c5 extends x2 {
    private static final c5 zzb;
    private int zzd;
    private int zzh;
    private long zzi;
    private long zzj;
    private boolean zzk;
    private int zzl;
    private int zzm;
    private long zzn;
    private int zzs;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzo = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzp = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzq = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzr = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        c5 c5Var = new c5();
        zzb = c5Var;
        x2.f(c5.class, c5Var);
    }

    public static b5 A() {
        return (b5) zzb.k();
    }

    public static /* synthetic */ void B(c5 c5Var, int i5) {
        c5Var.zzd |= 128;
        c5Var.zzl = i5;
    }

    public static /* synthetic */ void C(c5 c5Var, int i5) {
        c5Var.zzd |= 256;
        c5Var.zzm = i5;
    }

    public static /* synthetic */ void D(c5 c5Var, int i5) {
        c5Var.zzd |= 8;
        c5Var.zzh = i5;
    }

    public static /* synthetic */ void E(c5 c5Var, long j11) {
        c5Var.zzd |= 16;
        c5Var.zzi = j11;
    }

    public static /* synthetic */ void F(c5 c5Var, long j11) {
        c5Var.zzd |= 32;
        c5Var.zzj = j11;
    }

    public static /* synthetic */ void q(c5 c5Var) {
        c5Var.zzd |= EventBridgeChannel.QUEUE_CAPACITY;
        c5Var.zzn = 846465066L;
    }

    public static /* synthetic */ void r(c5 c5Var, String str) {
        str.getClass();
        c5Var.zzd |= 4;
        c5Var.zzg = str;
    }

    public static /* synthetic */ void s(c5 c5Var) {
        String str = Build.BRAND;
        str.getClass();
        c5Var.zzd |= 1024;
        c5Var.zzo = str;
    }

    public static /* synthetic */ void t(c5 c5Var) {
        String str = Build.FINGERPRINT;
        str.getClass();
        c5Var.zzd |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        c5Var.zzr = str;
    }

    public static /* synthetic */ void u(c5 c5Var) {
        String str = Build.MANUFACTURER;
        str.getClass();
        c5Var.zzd |= androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        c5Var.zzq = str;
    }

    public static /* synthetic */ void v(c5 c5Var) {
        String str = Build.MODEL;
        str.getClass();
        c5Var.zzd |= 2048;
        c5Var.zzp = str;
    }

    public static /* synthetic */ void w(c5 c5Var, int i5) {
        c5Var.zzd |= ReaderJsonLexerKt.BATCH_SIZE;
        c5Var.zzs = i5;
    }

    public static /* synthetic */ void x(c5 c5Var, boolean z11) {
        c5Var.zzd |= 64;
        c5Var.zzk = z11;
    }

    public static /* synthetic */ void y(c5 c5Var, String str) {
        str.getClass();
        c5Var.zzd |= 1;
        c5Var.zze = str;
    }

    public static /* synthetic */ void z(c5 c5Var, String str) {
        c5Var.zzd |= 2;
        c5Var.zzf = str;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u000f\u0000\u0001\u0001\u000f\u000f\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0002\u0003င\u0003\u0004ဂ\u0004\u0005ဈ\u0001\u0006ဂ\u0005\u0007ဇ\u0006\bင\u0007\tင\b\nဂ\t\u000bဈ\n\fဈ\u000b\rဈ\f\u000eဈ\r\u000fင\u000e", new Object[]{"zzd", "zze", "zzg", "zzh", "zzi", "zzf", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs"});
        }
        if (i11 == 3) {
            return new c5();
        }
        if (i11 == 4) {
            return new b5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
