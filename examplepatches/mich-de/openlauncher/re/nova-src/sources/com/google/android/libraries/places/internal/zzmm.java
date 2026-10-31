package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class zzmm {
    private final String zza;
    private final zzmk zzb;
    private zzmk zzc;
    private boolean zzd;

    public /* synthetic */ zzmm(String str, zzml zzmlVar) {
        zzmk zzmkVar = new zzmk();
        this.zzb = zzmkVar;
        this.zzc = zzmkVar;
        this.zzd = false;
        str.getClass();
        this.zza = str;
    }

    private final zzmk zzh() {
        zzmk zzmkVar = new zzmk();
        this.zzc.zzc = zzmkVar;
        this.zzc = zzmkVar;
        return zzmkVar;
    }

    private final zzmm zzi(String str, Object obj) {
        zzmj zzmjVar = new zzmj(null);
        this.zzc.zzc = zzmjVar;
        this.zzc = zzmjVar;
        zzmjVar.zzb = obj;
        zzmjVar.zza = str;
        return this;
    }

    public final String toString() {
        boolean z11 = this.zzd;
        StringBuilder sb2 = new StringBuilder(32);
        sb2.append(this.zza);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        String str = b.f42142b;
        for (zzmk zzmkVar = this.zzb.zzc; zzmkVar != null; zzmkVar = zzmkVar.zzc) {
            boolean z12 = zzmkVar instanceof zzmj;
            Object obj = zzmkVar.zzb;
            if (z12 || obj != null || !z11) {
                sb2.append(str);
                String str2 = zzmkVar.zza;
                if (str2 != null) {
                    sb2.append(str2);
                    sb2.append('=');
                }
                if (obj == null || !obj.getClass().isArray()) {
                    sb2.append(obj);
                } else {
                    sb2.append((CharSequence) Arrays.deepToString(new Object[]{obj}), 1, r3.length() - 1);
                }
                str = ", ";
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }

    public final zzmm zza(String str, double d5) {
        zzi("backoffMultiplier", String.valueOf(d5));
        return this;
    }

    public final zzmm zzb(String str, int i5) {
        zzi(str, String.valueOf(i5));
        return this;
    }

    public final zzmm zzc(String str, long j11) {
        zzi(str, String.valueOf(j11));
        return this;
    }

    public final zzmm zzd(String str, Object obj) {
        zzmk zzmkVarZzh = zzh();
        zzmkVarZzh.zzb = obj;
        zzmkVarZzh.zza = str;
        return this;
    }

    public final zzmm zze(String str, boolean z11) {
        zzi(str, String.valueOf(z11));
        return this;
    }

    public final zzmm zzf(Object obj) {
        zzh().zzb = obj;
        return this;
    }

    public final zzmm zzg() {
        this.zzd = true;
        return this;
    }
}
