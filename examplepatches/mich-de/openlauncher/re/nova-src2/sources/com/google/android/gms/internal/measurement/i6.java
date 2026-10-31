package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class i6 implements Iterable, f6 {

    /* renamed from: a, reason: collision with root package name */
    public final String f32640a;

    public i6(String str) {
        if (str == null) {
            throw new IllegalArgumentException("StringValue cannot be null.");
        }
        this.f32640a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof i6) {
            return this.f32640a.equals(((i6) obj).f32640a);
        }
        return false;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x02ec A[PHI: r7
      0x02ec: PHI (r7v6 boolean) = (r7v13 boolean), (r7v14 boolean), (r7v17 boolean) binds: [B:100:0x02d8, B:101:0x02da, B:103:0x02ea] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:107:0x02f2  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x02f6 A[LOOP:0: B:108:0x02f4->B:109:0x02f6, LOOP_END] */
    @Override // com.google.android.gms.internal.measurement.f6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        String str2;
        String str3;
        String strZzc;
        int i5;
        int i11;
        int i12;
        j8 j8Var2;
        if ("charAt".equals(str) || "concat".equals(str) || "hasOwnProperty".equals(str) || "indexOf".equals(str) || "lastIndexOf".equals(str) || "match".equals(str) || "replace".equals(str) || "search".equals(str) || "slice".equals(str) || "split".equals(str) || "substring".equals(str) || "toLowerCase".equals(str) || "toLocaleLowerCase".equals(str) || "toString".equals(str) || "toUpperCase".equals(str) || "toLocaleUpperCase".equals(str)) {
            str2 = "hasOwnProperty";
            str3 = "trim";
        } else {
            str2 = "hasOwnProperty";
            str3 = "trim";
            if (!str3.equals(str)) {
                throw new IllegalArgumentException(str.concat(" is not a String function"));
            }
        }
        int iHashCode = str.hashCode();
        strZzc = "undefined";
        String str4 = this.f32640a;
        z = false;
        boolean z11 = false;
        switch (iHashCode) {
            case -1789698943:
                String str5 = str2;
                if (str.equals(str5)) {
                    gh.c(1, str5, arrayList);
                    f6 f6VarE = ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0));
                    boolean zEquals = "length".equals(f6VarE.zzc());
                    h2 h2Var = f6.Vo;
                    if (zEquals) {
                        return h2Var;
                    }
                    double dDoubleValue = f6VarE.zzd().doubleValue();
                    return (dDoubleValue != Math.floor(dDoubleValue) || (i5 = (int) dDoubleValue) < 0 || i5 >= str4.length()) ? f6.Wo : h2Var;
                }
                throw new IllegalArgumentException("Command not supported");
            case -1776922004:
                if (str.equals("toString")) {
                    gh.c(0, "toString", arrayList);
                    return this;
                }
                throw new IllegalArgumentException("Command not supported");
            case -1464939364:
                if (str.equals("toLocaleLowerCase")) {
                    gh.c(0, "toLocaleLowerCase", arrayList);
                    return new i6(str4.toLowerCase());
                }
                throw new IllegalArgumentException("Command not supported");
            case -1361633751:
                if (str.equals("charAt")) {
                    gh.g(1, "charAt", arrayList);
                    int iL = arrayList.isEmpty() ? 0 : (int) gh.l(((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzd().doubleValue());
                    return (iL < 0 || iL >= str4.length()) ? f6.Xo : new i6(String.valueOf(str4.charAt(iL)));
                }
                throw new IllegalArgumentException("Command not supported");
            case -1354795244:
                if (str.equals("concat")) {
                    if (!arrayList.isEmpty()) {
                        StringBuilder sb2 = new StringBuilder(str4);
                        for (int i13 = 0; i13 < arrayList.size(); i13++) {
                            sb2.append(((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(i13)).zzc());
                        }
                        return new i6(sb2.toString());
                    }
                    return this;
                }
                throw new IllegalArgumentException("Command not supported");
            case -1137582698:
                if (str.equals("toLowerCase")) {
                    gh.c(0, "toLowerCase", arrayList);
                    return new i6(str4.toLowerCase(Locale.ENGLISH));
                }
                throw new IllegalArgumentException("Command not supported");
            case -906336856:
                if (str.equals("search")) {
                    gh.g(1, "search", arrayList);
                    return Pattern.compile(arrayList.isEmpty() ? "undefined" : ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzc()).matcher(str4).find() ? new s3(Double.valueOf(r0.start())) : new s3(Double.valueOf(-1.0d));
                }
                throw new IllegalArgumentException("Command not supported");
            case -726908483:
                if (str.equals("toLocaleUpperCase")) {
                    gh.c(0, "toLocaleUpperCase", arrayList);
                    return new i6(str4.toUpperCase());
                }
                throw new IllegalArgumentException("Command not supported");
            case -467511597:
                if (str.equals("lastIndexOf")) {
                    gh.g(2, "lastIndexOf", arrayList);
                    String strZzc2 = arrayList.size() > 0 ? ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzc() : "undefined";
                    return new s3(Double.valueOf(str4.lastIndexOf(strZzc2, (int) (Double.isNaN(arrayList.size() < 2 ? Double.NaN : ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(1)).zzd().doubleValue()) ? Double.POSITIVE_INFINITY : gh.l(r1)))));
                }
                throw new IllegalArgumentException("Command not supported");
            case -399551817:
                if (str.equals("toUpperCase")) {
                    gh.c(0, "toUpperCase", arrayList);
                    return new i6(str4.toUpperCase(Locale.ENGLISH));
                }
                throw new IllegalArgumentException("Command not supported");
            case 3568674:
                if (str.equals(str3)) {
                    gh.c(0, "toUpperCase", arrayList);
                    return new i6(str4.trim());
                }
                throw new IllegalArgumentException("Command not supported");
            case 103668165:
                if (str.equals("match")) {
                    gh.g(1, "match", arrayList);
                    Matcher matcher = Pattern.compile(arrayList.size() <= 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzc()).matcher(str4);
                    return matcher.find() ? new s1(Arrays.asList(new i6(matcher.group()))) : f6.Ro;
                }
                throw new IllegalArgumentException("Command not supported");
            case 109526418:
                if (str.equals("slice")) {
                    gh.g(2, "slice", arrayList);
                    double dL = gh.l(!arrayList.isEmpty() ? ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzd().doubleValue() : 0.0d);
                    double dMax = dL < 0.0d ? Math.max(str4.length() + dL, 0.0d) : Math.min(dL, str4.length());
                    double dL2 = gh.l(arrayList.size() > 1 ? ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(1)).zzd().doubleValue() : str4.length());
                    int i14 = (int) dMax;
                    return new i6(str4.substring(i14, Math.max(0, ((int) (dL2 < 0.0d ? Math.max(str4.length() + dL2, 0.0d) : Math.min(dL2, str4.length()))) - i14) + i14));
                }
                throw new IllegalArgumentException("Command not supported");
            case 109648666:
                if (str.equals("split")) {
                    gh.g(2, "split", arrayList);
                    if (str4.length() == 0) {
                        return new s1(Arrays.asList(this));
                    }
                    ArrayList arrayList2 = new ArrayList();
                    if (arrayList.isEmpty()) {
                        arrayList2.add(this);
                    } else {
                        String strZzc3 = ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzc();
                        long jK = arrayList.size() > 1 ? gh.k(((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(1)).zzd().doubleValue()) & 4294967295L : 2147483647L;
                        if (jK == 0) {
                            return new s1();
                        }
                        String[] strArrSplit = str4.split(Pattern.quote(strZzc3), ((int) jK) + 1);
                        int length = strArrSplit.length;
                        if (!strZzc3.isEmpty() || length <= 0) {
                            i11 = length;
                            i12 = z11;
                            if (length > jK) {
                                i11--;
                            }
                            while (i12 < i11) {
                                arrayList2.add(new i6(strArrSplit[i12]));
                                i12++;
                            }
                        } else {
                            boolean zIsEmpty = strArrSplit[0].isEmpty();
                            i11 = length - 1;
                            i12 = zIsEmpty;
                            z11 = zIsEmpty;
                            if (!strArrSplit[i11].isEmpty()) {
                            }
                            if (length > jK) {
                            }
                            while (i12 < i11) {
                            }
                        }
                    }
                    return new s1(arrayList2);
                }
                throw new IllegalArgumentException("Command not supported");
            case 530542161:
                if (str.equals("substring")) {
                    gh.g(2, "substring", arrayList);
                    int iL2 = !arrayList.isEmpty() ? (int) gh.l(((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzd().doubleValue()) : 0;
                    int iL3 = arrayList.size() > 1 ? (int) gh.l(((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(1)).zzd().doubleValue()) : str4.length();
                    int iMin = Math.min(Math.max(iL2, 0), str4.length());
                    int iMin2 = Math.min(Math.max(iL3, 0), str4.length());
                    return new i6(str4.substring(Math.min(iMin, iMin2), Math.max(iMin, iMin2)));
                }
                throw new IllegalArgumentException("Command not supported");
            case 1094496948:
                if (str.equals("replace")) {
                    gh.g(2, "replace", arrayList);
                    boolean zIsEmpty2 = arrayList.isEmpty();
                    f6 f6VarA = f6.Qo;
                    if (!zIsEmpty2) {
                        strZzc = ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzc();
                        if (arrayList.size() > 1) {
                            f6VarA = ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(1));
                        }
                    }
                    String str6 = strZzc;
                    int iIndexOf = str4.indexOf(str6);
                    if (iIndexOf >= 0) {
                        if (f6VarA instanceof t4) {
                            f6VarA = ((t4) f6VarA).a(j8Var, Arrays.asList(new i6(str6), new s3(Double.valueOf(iIndexOf)), this));
                        }
                        String strSubstring = str4.substring(0, iIndexOf);
                        String strZzc4 = f6VarA.zzc();
                        String strSubstring2 = str4.substring(str6.length() + iIndexOf);
                        return new i6(b.c0.r(new StringBuilder(String.valueOf(strSubstring).length() + String.valueOf(strZzc4).length() + String.valueOf(strSubstring2).length()), strSubstring, strZzc4, strSubstring2));
                    }
                    return this;
                }
                throw new IllegalArgumentException("Command not supported");
            case 1943291465:
                if (str.equals("indexOf")) {
                    gh.g(2, "indexOf", arrayList);
                    if (arrayList.size() <= 0) {
                        j8Var2 = j8Var;
                    } else {
                        j8Var2 = j8Var;
                        strZzc = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList.get(0)).zzc();
                    }
                    return new s3(Double.valueOf(str4.indexOf(strZzc, (int) gh.l(arrayList.size() < 2 ? 0.0d : ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList.get(1)).zzd().doubleValue()))));
                }
                throw new IllegalArgumentException("Command not supported");
            default:
                throw new IllegalArgumentException("Command not supported");
        }
    }

    public final int hashCode() {
        return this.f32640a.hashCode();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new h6(this, 1);
    }

    public final String toString() {
        String str = this.f32640a;
        return b.c0.r(new StringBuilder(str.length() + 2), "\"", str, "\"");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        return this.f32640a;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        String str = this.f32640a;
        if (str.isEmpty()) {
            return Double.valueOf(0.0d);
        }
        try {
            return Double.valueOf(str);
        } catch (NumberFormatException unused) {
            return Double.valueOf(Double.NaN);
        }
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        return Boolean.valueOf(!this.f32640a.isEmpty());
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return new h6(this, 0);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        return new i6(this.f32640a);
    }
}
