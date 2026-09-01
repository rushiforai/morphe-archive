package defpackage;

import android.util.Log;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y54 {
    public static final Set b;
    public final JSONObject a;

    public y54(String str) {
        this.a = new JSONObject();
        if (str == null || str.isEmpty()) {
            return;
        }
        try {
            this.a = (JSONObject) new JSONTokener(str).nextValue();
        } catch (ClassCastException | JSONException e) {
            if (Log.isLoggable("y54", 2)) {
                Log.v("y54", "Experimental options could not be parsed, using default values. Error: " + e.getMessage());
            }
        }
    }

    public final String a() {
        String str = (String) c("QUIC", "connection_options", null, String.class);
        if (str == null || str.isEmpty()) {
            return str;
        }
        ArrayList arrayList = new ArrayList();
        for (String str2 : str.split(",", -1)) {
            if (b.contains(str2.toUpperCase(Locale.ROOT).trim())) {
                arrayList.add(str2);
            }
        }
        StringBuilder sb = new StringBuilder();
        Iterator it2 = arrayList.iterator();
        if (it2.hasNext()) {
            while (true) {
                sb.append((CharSequence) it2.next());
                if (!it2.hasNext()) {
                    break;
                }
                sb.append((CharSequence) ",");
            }
        }
        return sb.toString();
    }

    public final aw8 b() {
        Object objCast;
        JSONObject jSONObject = this.a;
        if (jSONObject.length() == 0) {
            objCast = null;
        } else {
            try {
                objCast = Boolean.class.cast(jSONObject.get("disable_ipv6_on_wifi"));
            } catch (ClassCastException | JSONException e) {
                if (Log.isLoggable("y54", 2)) {
                    Log.v("y54", "Failed to get disable_ipv6_on_wifi options: " + e.getMessage());
                }
                objCast = null;
            }
        }
        return aw8.fromBoolean((Boolean) objCast);
    }

    public final Object c(String str, String str2, Integer num, Class cls) {
        JSONObject jSONObject;
        JSONObject jSONObject2 = this.a;
        if (jSONObject2.length() == 0) {
            return num;
        }
        try {
            jSONObject = jSONObject2.getJSONObject(str);
        } catch (JSONException e) {
            if (Log.isLoggable("y54", 2)) {
                Log.v("y54", "Failed to get " + str + " options: " + e.getMessage());
            }
            jSONObject = null;
        }
        if (jSONObject == null || jSONObject.length() == 0) {
            return num;
        }
        try {
            return cls.cast(jSONObject.get(str2));
        } catch (ClassCastException | JSONException e2) {
            if (!Log.isLoggable("y54", 2)) {
                return num;
            }
            Log.v("y54", "Failed to get " + str2 + " options: " + e2.getMessage());
            return num;
        }
    }

    static {
        String[] strArr = {"CHLO", "SHLO", "SCFG", "REJ", "CETV", "PRST", "SCUP", "ALPN", "P256", "C255", "AESG", "CC20", "QBIC", "AFCW", "IFW5", "IFW6", "IFW7", "IFW8", "IFW9", "IFWA", HrUBqHumRuLe.jhDepmnkqBjg, "1RTT", "2RTT", "LRTT", "BBS1", "BBS2", "BBS3", "BBS4", "BBS5", "BBRR", "BBR1", "BBR2", "BBR3", "BBR4", "BBR5", "BBR9", "BBRA", "BBRB", "BBRS", "BBQ1", "BBQ2", "BBQ3", "BBQ5", "BBQ6", "BBQ7", "BBQ8", "BBQ9", "BBQ0", "RENO", "TPCC", "BYTE", "IW03", "IW10", "IW20", "IW50", "B2ON", "B2NA", "B2NE", "B2RP", "B2LO", "B2HR", "B2SL", "B2H2", "B2RC", "BSAO", "B2DL", "B201", "B202", "B203", "B204", "B205", "B206", "B207", "NTLP", "1TLP", "1RTO", "NRTO", "TIME", "ATIM", "MIN1", "MIN4", "MAD0", "MAD2", "MAD3", "1ACK", "AKD3", "AKDU", "AFFE", "AFF1", "AFF2", "SSLR", "NPRR", "2RTO", "3RTO", "4RTO", "5RTO", "6RTO", "CBHD", "NBHD", "CONH", "LFAK", "STMP", "EACK", "ILD0", "ILD1", "ILD2", "ILD3", "ILD4", "RUNT", "NSTP", "NRTT", "1PTO", "2PTO", "6PTO", "7PTO", "8PTO", "PTOS", "PTOA", "PEB1", "PEB2", "PVS1", "PAG1", "PAG2", "PSDA", "PLE1", "PLE2", "APTO", "ELDT", "RVCM", "TCID", "MPTH", "NCMR", "DFER", "NPCO", "BWRE", "BWMX", "BWID", "BWI1", "BWRS", "BWS2", "BWS3", "BWS4", "BWS5", "BWS6", "BWP0", "BWP1", "BWP2", "BWP3", "BWP4", PdtluglzAX.HBo, "BWG7", "BWG8", "BWS7", "BWM3", "BWM4", "ICW1", "DTOS", "FIDT", "3AFF", "10AF", "MTUH", "MTUL", "NSLC", "NCHP", "NBPE", "X509", "X59R", "CHID", "VER ", "NONC", "NONP", "KEXS", "AEAD", "COPT", "CLOP", "ICSL", "MIBS", "MIUS", "ADE ", "IRTT", "TRTT", "SNI ", "PUBS", "SCID", "ORBT", "PDMD", "PROF", "CCRT", "EXPY", "STTL", "SFCW", "CFCW", "UAID", "XLCT", "QLVE", "PDP1", "PDP2", "PDP3", "PDP5", uuLAxLN.InZlcLRHE, "MAD", "IGNP", "SRWP", "ROWF", "ROWR", "GSR0", "GSR1", "GSR2", "GSR3", "NRES", "INVC", "GWCH", "YTCH", "ACH0", "RREJ", "CADR", "ASAD", "SRST", "CIDK", "CIDS", "RNON", "RSEQ", "PAD ", "EPID", "SNO0", "STK0", "CRT255", "CSCT"};
        HashSet hashSet = new HashSet(228);
        for (int i = 0; i < 228; i++) {
            String str = strArr[i];
            Objects.requireNonNull(str);
            if (!hashSet.add(str)) {
                ik4.h("duplicate element: ", str);
                return;
            }
        }
        b = DesugarCollections.unmodifiableSet(hashSet);
    }
}
