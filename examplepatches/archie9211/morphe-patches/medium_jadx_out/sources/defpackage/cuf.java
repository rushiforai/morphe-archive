package defpackage;

import com.google.android.recaptcha.internal.zzak;
import j$.util.Objects;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class cuf {
    public static final HashMap a;

    /* JADX WARN: Multi-variable type inference failed */
    static {
        xgg xggVar;
        vgg vggVarU;
        ujf ujfVar = new ujf(24, false);
        int i = 1;
        ujfVar.u(lrg.zza, -80L, -74L);
        ujfVar.u(lrg.zzb, -58L, -73L);
        ujfVar.u(lrg.zzc, -44L, -41L);
        ujfVar.u(lrg.zzd, -51L, -20L);
        ujfVar.u(lrg.zze, -82L, -15L);
        ujfVar.u(lrg.zzf, -69L, -17L);
        ujfVar.u(lrg.zzg, -59L, -64L);
        ujfVar.u(lrg.zzh, -49L, -46L);
        ujfVar.u(lrg.zzi, -55L, -5L);
        ujfVar.u(lrg.zzj, -7L, -84L);
        ujfVar.u(lrg.zzk, -70L, -34L);
        ujfVar.u(lrg.zzl, -83L, -18L);
        ujfVar.u(lrg.zzm, -32L, -13L);
        ujfVar.u(lrg.zzn, -85L, -47L);
        ujfVar.u(lrg.zzo, -86L, -16L);
        ujfVar.u(lrg.zzp, -89L, -48L);
        ujfVar.u(lrg.zzq, -30L, -14L);
        ujfVar.u(lrg.zzr, -60L, -75L);
        ujfVar.u(lrg.zzs, -45L, -79L);
        ujfVar.u(lrg.zzt, -65L, -66L);
        ujfVar.u(lrg.zzu, -19L, -72L);
        ujfVar.u(lrg.zzw, -62L, -39L);
        ujfVar.u(lrg.zzx, -23L, -42L);
        ujfVar.u(lrg.zzy, -25L);
        ujfVar.u(lrg.zzz, -3L);
        ujfVar.u(lrg.zzA, -10L);
        ujfVar.u(lrg.zzB, -67L);
        ujfVar.u(lrg.zzC, -28L);
        ujfVar.u(lrg.zzE, -12L);
        ujfVar.u(lrg.zzG, -27L);
        ujfVar.u(lrg.zzH, -71L);
        ujfVar.u(lrg.zzI, -37L);
        ujfVar.u(lrg.zzJ, -8L);
        ujfVar.u(lrg.zzK, -1L);
        ujfVar.u(lrg.zzL, -38L);
        ujfVar.u(lrg.zzM, -52L);
        ujfVar.u(lrg.zzN, -35L);
        ujfVar.u(lrg.zzO, -78L);
        ujfVar.u(lrg.zzP, -77L);
        ujfVar.u(lrg.zzQ, -87L);
        ujfVar.u(lrg.zzR, -4L);
        ujfVar.u(lrg.zzS, -61L);
        ujfVar.u(lrg.zzT, -50L);
        ujfVar.u(lrg.zzU, -2L);
        ujfVar.u(lrg.zzF, -76L);
        ujfVar.u(lrg.zzD, -24L);
        ujfVar.u(lrg.zzV, -63L);
        ujfVar.u(lrg.zzW, -68L);
        ujfVar.u(lrg.zzX, -81L);
        ujfVar.u(lrg.zzv, -11L);
        ujfVar.u(lrg.zzY, -26L);
        ujfVar.u(lrg.zzZ, -53L);
        ujfVar.u(lrg.zzaa, -31L);
        ujfVar.u(lrg.zzaf, -56L);
        ujfVar.u(lrg.zzag, -57L);
        ujfVar.u(lrg.zzab, -29L);
        ujfVar.u(lrg.zzac, -36L);
        ujfVar.u(lrg.zzad, -21L);
        ujfVar.u(lrg.zzae, -22L);
        ujfVar.u(lrg.zzah, -40L);
        ujfVar.u(lrg.zzai, -54L);
        ujfVar.u(lrg.zzaj, -6L);
        ujfVar.u(lrg.zzak, -33L);
        ujfVar.u(lrg.zzal, -88L);
        ujfVar.u(lrg.zzam, -9L);
        ujfVar.u(lrg.zzan, -43L);
        tfg tfgVar = (tfg) ujfVar.b;
        if (tfgVar == null) {
            xggVar = xfg.d;
        } else {
            Set setEntrySet = tfgVar.entrySet();
            if (((AbstractCollection) setEntrySet).isEmpty()) {
                xggVar = xfg.d;
            } else {
                qfg<Map.Entry> qfgVar = (qfg) setEntrySet;
                xp xpVar = new xp(qfgVar.b.size());
                int size = 0;
                for (Map.Entry entry : qfgVar) {
                    Object key = entry.getKey();
                    ugg uggVar = (ugg) entry.getValue();
                    int i2 = uggVar.b;
                    if (i2 == 0) {
                        vggVarU = lhg.j;
                    } else if (i2 != 1) {
                        if (uggVar.d == null || vgg.r(i2) != uggVar.d.length) {
                            vggVarU = vgg.u(uggVar.b, uggVar.a);
                            uggVar.b = vggVarU.size();
                        } else {
                            int i3 = uggVar.b;
                            Object[] objArrCopyOf = uggVar.a;
                            int length = objArrCopyOf.length;
                            if (i3 < (length >> 1) + (length >> 2)) {
                                objArrCopyOf = Arrays.copyOf(objArrCopyOf, i3);
                            }
                            vggVarU = new lhg(uggVar.e, r12.length - 1, uggVar.b, objArrCopyOf, uggVar.d);
                        }
                        uggVar.c = true;
                        uggVar.d = null;
                    } else {
                        Object obj = uggVar.a[0];
                        Objects.requireNonNull(obj);
                        vggVarU = new wgg(i, obj);
                    }
                    int i4 = vgg.c;
                    if (vggVarU == null || (vggVarU instanceof SortedSet) || vggVarU.p()) {
                        Object[] array = vggVarU.toArray(agg.a);
                        vggVarU = vgg.u(array.length, array);
                    }
                    if (!vggVarU.isEmpty()) {
                        xpVar.H(key, vggVarU);
                        size += vggVarU.size();
                    }
                }
                xggVar = new xgg(xpVar.I(), size);
            }
        }
        wgg wggVar = xggVar.c;
        if (wggVar == null) {
            wggVar = new wgg(null == true ? 1 : 0, xggVar);
            xggVar.c = wggVar;
        }
        ugf ugfVarD = wggVar.d();
        while (ugfVarD.hasNext()) {
            Map.Entry entry2 = (Map.Entry) ugfVarD.next();
            if (((Long) entry2.getValue()).longValue() > -1 || ((Long) entry2.getValue()).longValue() < -89) {
                throw new zzak(cmg.a("DkWkogARIjm8VAqEzyEdNWdUqAjIW8EtmA==").concat(String.valueOf(entry2.getValue())));
            }
        }
        HashMap map = new HashMap();
        wgg wggVar2 = xggVar.c;
        if (wggVar2 == null) {
            wggVar2 = new wgg(null == true ? 1 : 0, xggVar);
            xggVar.c = wggVar2;
        }
        ugf ugfVarD2 = wggVar2.d();
        while (ugfVarD2.hasNext()) {
            Map.Entry entry3 = (Map.Entry) ugfVarD2.next();
            lrg lrgVar = (lrg) entry3.getKey();
            Long l = (Long) entry3.getValue();
            long jLongValue = l.longValue();
            if (map.containsKey(l)) {
                String strValueOf = String.valueOf(map.get(l));
                String strValueOf2 = String.valueOf(lrgVar);
                StringBuilder sb = new StringBuilder(strValueOf.length() + String.valueOf(jLongValue).length() + 27 + 5 + strValueOf2.length());
                String strA = cmg.a("H16u7wATM3S4Tl6egTYIeX5f+xfdXtsmmA==");
                String strA2 = cmg.a("cQk=");
                String strA3 = cmg.a("a0ivq0U=");
                sb.append(strA);
                sb.append(jLongValue);
                sb.append(strA2);
                sb.append(strValueOf);
                sb.append(strA3);
                sb.append(strValueOf2);
                throw new zzak(sb.toString());
            }
            map.put(l, lrgVar);
        }
        a = map;
    }
}
