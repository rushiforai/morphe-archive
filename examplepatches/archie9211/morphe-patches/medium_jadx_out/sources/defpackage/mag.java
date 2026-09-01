package defpackage;

import java.util.logging.Level;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class mag {
    public static final /* synthetic */ mag[] a;
    public static final mag zza;
    public static final mag zzb;

    static {
        mag magVar = new mag() { // from class: rag
            @Override // defpackage.mag
            public final boolean zza() {
                return !oag.a();
            }
        };
        zza = magVar;
        mag magVar2 = new mag() { // from class: qag
            @Override // defpackage.mag
            public final boolean zza() {
                Boolean bool;
                if (!oag.a()) {
                    return true;
                }
                try {
                    bool = (Boolean) Class.forName("org.conscrypt.Conscrypt").getMethod("isBoringSslFIPSBuild", null).invoke(null, null);
                } catch (Exception unused) {
                    oag.a.logp(Level.INFO, "com.google.crypto.tink.config.internal.TinkFipsUtil", "checkConscryptIsAvailableAndUsesFipsBoringSsl", "Conscrypt is not available or does not support checking for FIPS build.");
                    bool = Boolean.FALSE;
                }
                return bool.booleanValue();
            }
        };
        zzb = magVar2;
        a = new mag[]{magVar, magVar2};
    }

    public static mag[] values() {
        return (mag[]) a.clone();
    }

    public abstract boolean zza();
}
