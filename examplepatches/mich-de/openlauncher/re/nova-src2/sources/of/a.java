package of;

import android.graphics.PointF;
import android.text.Layout;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import vk.b0;
import wf.v;

/* loaded from: classes3.dex */
public final class a extends jf.e {

    /* renamed from: r, reason: collision with root package name */
    public static final Pattern f80342r = Pattern.compile("(?:(\\d+):)?(\\d+):(\\d+)[:.](\\d+)");

    /* renamed from: m, reason: collision with root package name */
    public final boolean f80343m;
    public final b n;
    public LinkedHashMap o;

    /* renamed from: p, reason: collision with root package name */
    public float f80344p = -3.4028235E38f;

    /* renamed from: q, reason: collision with root package name */
    public float f80345q = -3.4028235E38f;

    public a(List list) throws NumberFormatException {
        if (list == null || list.isEmpty()) {
            this.f80343m = false;
            this.n = null;
            return;
        }
        this.f80343m = true;
        byte[] bArr = (byte[]) list.get(0);
        int i5 = v.f94376a;
        String str = new String(bArr, vk.e.f92809c);
        wf.a.e(str.startsWith("Format:"));
        b bVarA = b.a(str);
        bVarA.getClass();
        this.n = bVarA;
        i(new com.google.android.gms.internal.consent_sdk.a((byte[]) list.get(1)));
    }

    public static int h(long j11, ArrayList arrayList, ArrayList arrayList2) {
        int i5;
        int size = arrayList.size() - 1;
        while (true) {
            if (size < 0) {
                i5 = 0;
                break;
            }
            if (((Long) arrayList.get(size)).longValue() == j11) {
                return size;
            }
            if (((Long) arrayList.get(size)).longValue() < j11) {
                i5 = size + 1;
                break;
            }
            size--;
        }
        arrayList.add(i5, Long.valueOf(j11));
        arrayList2.add(i5, i5 == 0 ? new ArrayList() : new ArrayList((Collection) arrayList2.get(i5 - 1)));
        return i5;
    }

    public static long j(String str) {
        Matcher matcher = f80342r.matcher(str.trim());
        if (!matcher.matches()) {
            return -9223372036854775807L;
        }
        String strGroup = matcher.group(1);
        int i5 = v.f94376a;
        return (Long.parseLong(matcher.group(4)) * h.f42227c) + (Long.parseLong(matcher.group(3)) * 1000000) + (Long.parseLong(matcher.group(2)) * 60000000) + (Long.parseLong(strGroup) * 3600000000L);
    }

    @Override // jf.e
    public final jf.f f(byte[] bArr, int i5, boolean z11) throws NumberFormatException {
        com.google.android.gms.internal.consent_sdk.a aVar;
        b bVar;
        float f11;
        int i11;
        float f12;
        int i12;
        Layout.Alignment alignment;
        Layout.Alignment alignment2;
        int i13;
        int i14;
        int i15;
        float f13;
        float f14;
        float f15;
        boolean z12;
        int i16;
        int i17;
        float f16;
        int i18;
        float f17;
        int i19;
        int i21;
        int iA;
        int i22;
        a aVar2 = this;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        com.google.android.gms.internal.consent_sdk.a aVar3 = new com.google.android.gms.internal.consent_sdk.a(bArr, i5);
        boolean z13 = aVar2.f80343m;
        if (!z13) {
            aVar2.i(aVar3);
        }
        b bVarA = z13 ? aVar2.n : null;
        while (true) {
            String strB = aVar3.B();
            if (strB == null) {
                return new f(arrayList, arrayList2);
            }
            if (strB.startsWith("Format:")) {
                bVarA = b.a(strB);
            } else if (strB.startsWith("Dialogue:")) {
                if (bVarA == null) {
                    wf.a.D("SsaDecoder", "Skipping dialogue line before complete format: ".concat(strB));
                } else {
                    int i23 = bVarA.f80350e;
                    wf.a.e(strB.startsWith("Dialogue:"));
                    String[] strArrSplit = strB.substring(9).split(",", i23);
                    if (strArrSplit.length != i23) {
                        wf.a.D("SsaDecoder", "Skipping dialogue line with fewer columns than format: ".concat(strB));
                    } else {
                        long j11 = j(strArrSplit[bVarA.f80346a]);
                        if (j11 == -9223372036854775807L) {
                            wf.a.D("SsaDecoder", "Skipping invalid timing: ".concat(strB));
                        } else {
                            long j12 = j(strArrSplit[bVarA.f80347b]);
                            if (j12 == -9223372036854775807L) {
                                wf.a.D("SsaDecoder", "Skipping invalid timing: ".concat(strB));
                            } else {
                                LinkedHashMap linkedHashMap = aVar2.o;
                                e eVar = (linkedHashMap == null || (i22 = bVarA.f80348c) == -1) ? null : (e) linkedHashMap.get(strArrSplit[i22].trim());
                                String str = strArrSplit[bVarA.f80349d];
                                Matcher matcher = d.f80362a.matcher(str);
                                int i24 = -1;
                                PointF pointF = null;
                                while (matcher.find()) {
                                    com.google.android.gms.internal.consent_sdk.a aVar4 = aVar3;
                                    String strGroup = matcher.group(1);
                                    strGroup.getClass();
                                    try {
                                        PointF pointFA = d.a(strGroup);
                                        if (pointFA != null) {
                                            pointF = pointFA;
                                        }
                                    } catch (RuntimeException unused) {
                                    }
                                    try {
                                        Matcher matcher2 = d.f80365d.matcher(strGroup);
                                        if (matcher2.find()) {
                                            String strGroup2 = matcher2.group(1);
                                            strGroup2.getClass();
                                            iA = e.a(strGroup2);
                                        } else {
                                            iA = -1;
                                        }
                                        if (iA != -1) {
                                            i24 = iA;
                                        }
                                    } catch (RuntimeException unused2) {
                                    }
                                    aVar3 = aVar4;
                                }
                                aVar = aVar3;
                                String strReplace = d.f80362a.matcher(str).replaceAll(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).replace("\\N", "\n").replace("\\n", "\n").replace("\\h", " ");
                                float f18 = aVar2.f80344p;
                                float f19 = aVar2.f80345q;
                                SpannableString spannableString = new SpannableString(strReplace);
                                if (eVar != null) {
                                    boolean z14 = eVar.f80372g;
                                    Integer num = eVar.f80369d;
                                    Integer num2 = eVar.f80368c;
                                    if (num2 != null) {
                                        z12 = z14;
                                        bVar = bVarA;
                                        f11 = f18;
                                        i16 = 33;
                                        i17 = 0;
                                        spannableString.setSpan(new ForegroundColorSpan(num2.intValue()), 0, spannableString.length(), 33);
                                    } else {
                                        z12 = z14;
                                        bVar = bVarA;
                                        f11 = f18;
                                        i16 = 33;
                                        i17 = 0;
                                    }
                                    if (eVar.f80375j == 3 && num != null) {
                                        spannableString.setSpan(new BackgroundColorSpan(num.intValue()), i17, spannableString.length(), i16);
                                    }
                                    float f21 = eVar.f80370e;
                                    if (f21 == -3.4028235E38f || f19 == -3.4028235E38f) {
                                        f16 = -3.4028235E38f;
                                        i18 = Integer.MIN_VALUE;
                                    } else {
                                        f16 = f21 / f19;
                                        i18 = 1;
                                    }
                                    boolean z15 = eVar.f80371f;
                                    if (z15 && z12) {
                                        f17 = f16;
                                        i19 = i18;
                                        i21 = 33;
                                        i11 = 0;
                                        spannableString.setSpan(new StyleSpan(3), 0, spannableString.length(), 33);
                                    } else {
                                        f17 = f16;
                                        i19 = i18;
                                        i21 = 33;
                                        i11 = 0;
                                        if (z15) {
                                            spannableString.setSpan(new StyleSpan(1), 0, spannableString.length(), 33);
                                        } else if (z12) {
                                            spannableString.setSpan(new StyleSpan(2), 0, spannableString.length(), 33);
                                        }
                                    }
                                    if (eVar.f80373h) {
                                        spannableString.setSpan(new UnderlineSpan(), i11, spannableString.length(), i21);
                                    }
                                    if (eVar.f80374i) {
                                        spannableString.setSpan(new StrikethroughSpan(), i11, spannableString.length(), i21);
                                    }
                                    f12 = f17;
                                    i12 = i19;
                                } else {
                                    bVar = bVarA;
                                    f11 = f18;
                                    i11 = 0;
                                    f12 = -3.4028235E38f;
                                    i12 = Integer.MIN_VALUE;
                                }
                                int i25 = -1;
                                if (i24 != -1) {
                                    i25 = i24;
                                } else if (eVar != null) {
                                    i25 = eVar.f80367b;
                                }
                                switch (i25) {
                                    case 0:
                                    default:
                                        k2.t(i25, "Unknown alignment: ", "SsaDecoder");
                                    case -1:
                                        alignment2 = null;
                                        break;
                                    case 1:
                                    case 4:
                                    case 7:
                                        alignment = Layout.Alignment.ALIGN_NORMAL;
                                        alignment2 = alignment;
                                        break;
                                    case 2:
                                    case 5:
                                    case 8:
                                        alignment = Layout.Alignment.ALIGN_CENTER;
                                        alignment2 = alignment;
                                        break;
                                    case 3:
                                    case 6:
                                    case 9:
                                        alignment = Layout.Alignment.ALIGN_OPPOSITE;
                                        alignment2 = alignment;
                                        break;
                                }
                                int i26 = Integer.MIN_VALUE;
                                switch (i25) {
                                    case 0:
                                    default:
                                        k2.t(i25, "Unknown alignment: ", "SsaDecoder");
                                    case -1:
                                        i13 = Integer.MIN_VALUE;
                                        break;
                                    case 1:
                                    case 4:
                                    case 7:
                                        i13 = i11;
                                        break;
                                    case 2:
                                    case 5:
                                    case 8:
                                        i13 = 1;
                                        break;
                                    case 3:
                                    case 6:
                                    case 9:
                                        i13 = 2;
                                        break;
                                }
                                switch (i25) {
                                    case -1:
                                        break;
                                    case 0:
                                    default:
                                        k2.t(i25, "Unknown alignment: ", "SsaDecoder");
                                        break;
                                    case 1:
                                    case 2:
                                    case 3:
                                        i26 = 2;
                                        break;
                                    case 4:
                                    case 5:
                                    case 6:
                                        i26 = 1;
                                        break;
                                    case 7:
                                    case 8:
                                    case 9:
                                        i26 = i11;
                                        break;
                                }
                                if (pointF == null || f19 == -3.4028235E38f || f11 == -3.4028235E38f) {
                                    if (i13 != 0) {
                                        i15 = 1;
                                        if (i13 != 1) {
                                            i14 = 2;
                                            f13 = i13 != 2 ? -3.4028235E38f : 0.95f;
                                        } else {
                                            i14 = 2;
                                            f13 = 0.5f;
                                        }
                                    } else {
                                        i14 = 2;
                                        i15 = 1;
                                        f13 = 0.05f;
                                    }
                                    f14 = i26 != 0 ? i26 != i15 ? i26 != i14 ? -3.4028235E38f : 0.95f : 0.5f : 0.05f;
                                    f15 = f13;
                                } else {
                                    f15 = pointF.x / f11;
                                    f14 = pointF.y / f19;
                                }
                                jf.b bVar2 = new jf.b(spannableString, alignment2, null, null, f14, i11, i26, f15, i13, i12, f12, -3.4028235E38f, -3.4028235E38f, false, -16777216, Integer.MIN_VALUE, 0.0f);
                                int iH = h(j12, arrayList2, arrayList);
                                for (int iH2 = h(j11, arrayList2, arrayList); iH2 < iH; iH2++) {
                                    ((List) arrayList.get(iH2)).add(bVar2);
                                }
                                aVar2 = this;
                                aVar3 = aVar;
                                bVarA = bVar;
                            }
                        }
                    }
                }
                aVar = aVar3;
                bVar = bVarA;
                aVar2 = this;
                aVar3 = aVar;
                bVarA = bVar;
            } else {
                aVar = aVar3;
                bVar = bVarA;
                aVar2 = this;
                aVar3 = aVar;
                bVarA = bVar;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:166:0x02e2  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00da  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i(com.google.android.gms.internal.consent_sdk.a aVar) throws NumberFormatException {
        int i5;
        float f11;
        e eVar;
        int i11;
        float f12;
        while (true) {
            String strB = aVar.B();
            if (strB == null) {
                return;
            }
            boolean zEqualsIgnoreCase = "[Script Info]".equalsIgnoreCase(strB);
            int i12 = 0;
            char c11 = AbstractJsonLexerKt.BEGIN_LIST;
            if (zEqualsIgnoreCase) {
                while (true) {
                    String strB2 = aVar.B();
                    if (strB2 == null || (aVar.g() != 0 && (((byte[]) aVar.f31986d)[aVar.f31984b] & 255) == 91)) {
                        break;
                    }
                    String[] strArrSplit = strB2.split(":");
                    if (strArrSplit.length == 2) {
                        String strS = b0.s(strArrSplit[0].trim());
                        strS.getClass();
                        if (strS.equals("playresx")) {
                            this.f80344p = Float.parseFloat(strArrSplit[1].trim());
                        } else if (strS.equals("playresy")) {
                            try {
                                this.f80345q = Float.parseFloat(strArrSplit[1].trim());
                            } catch (NumberFormatException unused) {
                            }
                        }
                    }
                }
            } else if ("[V4+ Styles]".equalsIgnoreCase(strB)) {
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                c cVar = null;
                while (true) {
                    String strB3 = aVar.B();
                    if (strB3 != null && (aVar.g() == 0 || (((byte[]) aVar.f31986d)[aVar.f31984b] & 255) != c11)) {
                        int i13 = -1;
                        if (strB3.startsWith("Format:")) {
                            String[] strArrSplit2 = TextUtils.split(strB3.substring(7), ",");
                            int i14 = -1;
                            int i15 = -1;
                            int i16 = -1;
                            int i17 = -1;
                            int i18 = -1;
                            int i19 = -1;
                            int i21 = -1;
                            int i22 = -1;
                            int i23 = -1;
                            int i24 = -1;
                            for (int i25 = i12; i25 < strArrSplit2.length; i25++) {
                                String strS2 = b0.s(strArrSplit2[i25].trim());
                                strS2.getClass();
                                switch (strS2.hashCode()) {
                                    case -1178781136:
                                        if (strS2.equals("italic")) {
                                            i5 = i12;
                                            break;
                                        } else {
                                            i5 = -1;
                                            break;
                                        }
                                    case -1026963764:
                                        if (strS2.equals("underline")) {
                                            i5 = 1;
                                            break;
                                        }
                                        break;
                                    case -192095652:
                                        if (strS2.equals("strikeout")) {
                                            i5 = 2;
                                            break;
                                        }
                                        break;
                                    case -70925746:
                                        if (strS2.equals("primarycolour")) {
                                            i5 = 3;
                                            break;
                                        }
                                        break;
                                    case 3029637:
                                        if (strS2.equals("bold")) {
                                            i5 = 4;
                                            break;
                                        }
                                        break;
                                    case 3373707:
                                        if (strS2.equals(PendingUpgradeStore.KEY_NAME)) {
                                            i5 = 5;
                                            break;
                                        }
                                        break;
                                    case 366554320:
                                        if (strS2.equals("fontsize")) {
                                            i5 = 6;
                                            break;
                                        }
                                        break;
                                    case 767321349:
                                        if (strS2.equals("borderstyle")) {
                                            i5 = 7;
                                            break;
                                        }
                                        break;
                                    case 1767875043:
                                        if (strS2.equals("alignment")) {
                                            i5 = 8;
                                            break;
                                        }
                                        break;
                                    case 1988365454:
                                        if (strS2.equals("outlinecolour")) {
                                            i5 = 9;
                                            break;
                                        }
                                        break;
                                }
                                switch (i5) {
                                    case 0:
                                        i21 = i25;
                                        break;
                                    case 1:
                                        i22 = i25;
                                        break;
                                    case 2:
                                        i23 = i25;
                                        break;
                                    case 3:
                                        i16 = i25;
                                        break;
                                    case 4:
                                        i19 = i25;
                                        break;
                                    case 5:
                                        i14 = i25;
                                        break;
                                    case 6:
                                        i18 = i25;
                                        break;
                                    case 7:
                                        i24 = i25;
                                        break;
                                    case 8:
                                        i15 = i25;
                                        break;
                                    case 9:
                                        i17 = i25;
                                        break;
                                }
                            }
                            cVar = i14 != -1 ? new c(i14, i15, i16, i17, i18, i19, i21, i22, i23, i24, strArrSplit2.length) : null;
                        } else {
                            if (strB3.startsWith("Style:")) {
                                if (cVar == null) {
                                    wf.a.D("SsaDecoder", "Skipping 'Style:' line before 'Format:' line: ".concat(strB3));
                                } else {
                                    wf.a.e(strB3.startsWith("Style:"));
                                    String[] strArrSplit3 = TextUtils.split(strB3.substring(6), ",");
                                    int length = strArrSplit3.length;
                                    int i26 = cVar.f80361k;
                                    if (length != i26) {
                                        int length2 = strArrSplit3.length;
                                        int i27 = v.f94376a;
                                        Locale locale = Locale.US;
                                        StringBuilder sbT = c0.t(i26, "Skipping malformed 'Style:' line (expected ", " values, found ", length2, "): '");
                                        sbT.append(strB3);
                                        sbT.append("'");
                                        wf.a.D("SsaStyle", sbT.toString());
                                    } else {
                                        try {
                                            String strTrim = strArrSplit3[cVar.f80351a].trim();
                                            int i28 = cVar.f80352b;
                                            int iA = i28 != -1 ? e.a(strArrSplit3[i28].trim()) : -1;
                                            int i29 = cVar.f80353c;
                                            Integer numC = i29 != -1 ? e.c(strArrSplit3[i29].trim()) : null;
                                            int i31 = cVar.f80354d;
                                            Integer numC2 = i31 != -1 ? e.c(strArrSplit3[i31].trim()) : null;
                                            int i32 = cVar.f80355e;
                                            if (i32 != -1) {
                                                String strTrim2 = strArrSplit3[i32].trim();
                                                try {
                                                    f12 = Float.parseFloat(strTrim2);
                                                } catch (NumberFormatException e3) {
                                                    wf.a.E("SsaStyle", "Failed to parse font size: '" + strTrim2 + "'", e3);
                                                    f12 = -3.4028235E38f;
                                                }
                                                f11 = f12;
                                            } else {
                                                f11 = -3.4028235E38f;
                                            }
                                            int i33 = cVar.f80356f;
                                            boolean z11 = i33 != -1 && e.b(strArrSplit3[i33].trim());
                                            int i34 = cVar.f80357g;
                                            boolean z12 = i34 != -1 && e.b(strArrSplit3[i34].trim());
                                            int i35 = cVar.f80358h;
                                            boolean z13 = i35 != -1 && e.b(strArrSplit3[i35].trim());
                                            int i36 = cVar.f80359i;
                                            boolean z14 = i36 != -1 && e.b(strArrSplit3[i36].trim());
                                            int i37 = cVar.f80360j;
                                            if (i37 != -1) {
                                                String strTrim3 = strArrSplit3[i37].trim();
                                                try {
                                                    i11 = Integer.parseInt(strTrim3.trim());
                                                } catch (NumberFormatException unused2) {
                                                }
                                                if (i11 == 1 || i11 == 3) {
                                                    i13 = i11;
                                                } else {
                                                    wf.a.D("SsaStyle", "Ignoring unknown BorderStyle: " + strTrim3);
                                                }
                                            }
                                            eVar = new e(strTrim, iA, numC, numC2, f11, z11, z12, z13, z14, i13);
                                        } catch (RuntimeException e11) {
                                            wf.a.E("SsaStyle", "Skipping malformed 'Style:' line: '" + strB3 + "'", e11);
                                        }
                                        if (eVar != null) {
                                            linkedHashMap.put(eVar.f80366a, eVar);
                                        }
                                    }
                                    eVar = null;
                                    if (eVar != null) {
                                    }
                                }
                            }
                            i12 = 0;
                            c11 = AbstractJsonLexerKt.BEGIN_LIST;
                        }
                    }
                }
                this.o = linkedHashMap;
            } else if ("[V4 Styles]".equalsIgnoreCase(strB)) {
                wf.a.u("SsaDecoder", "[V4 Styles] are not supported");
            } else if ("[Events]".equalsIgnoreCase(strB)) {
                return;
            }
        }
    }
}
