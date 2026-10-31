package sd;

/* loaded from: classes.dex */
public final class n extends a {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f87191a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87192b;

    /* renamed from: c, reason: collision with root package name */
    public final String f87193c;

    /* renamed from: d, reason: collision with root package name */
    public final String f87194d;

    /* renamed from: e, reason: collision with root package name */
    public final String f87195e;

    /* renamed from: f, reason: collision with root package name */
    public final String f87196f;

    /* renamed from: g, reason: collision with root package name */
    public final String f87197g;

    /* renamed from: h, reason: collision with root package name */
    public final String f87198h;

    /* renamed from: i, reason: collision with root package name */
    public final String f87199i;

    /* renamed from: j, reason: collision with root package name */
    public final String f87200j;

    /* renamed from: k, reason: collision with root package name */
    public final String f87201k;

    /* renamed from: l, reason: collision with root package name */
    public final String f87202l;

    public n(Integer num, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11) {
        this.f87191a = num;
        this.f87192b = str;
        this.f87193c = str2;
        this.f87194d = str3;
        this.f87195e = str4;
        this.f87196f = str5;
        this.f87197g = str6;
        this.f87198h = str7;
        this.f87199i = str8;
        this.f87200j = str9;
        this.f87201k = str10;
        this.f87202l = str11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof a) {
            a aVar = (a) obj;
            Integer num = this.f87191a;
            if (num != null ? num.equals(((n) aVar).f87191a) : ((n) aVar).f87191a == null) {
                String str = this.f87192b;
                if (str != null ? str.equals(((n) aVar).f87192b) : ((n) aVar).f87192b == null) {
                    String str2 = this.f87193c;
                    if (str2 != null ? str2.equals(((n) aVar).f87193c) : ((n) aVar).f87193c == null) {
                        String str3 = this.f87194d;
                        if (str3 != null ? str3.equals(((n) aVar).f87194d) : ((n) aVar).f87194d == null) {
                            String str4 = this.f87195e;
                            if (str4 != null ? str4.equals(((n) aVar).f87195e) : ((n) aVar).f87195e == null) {
                                String str5 = this.f87196f;
                                if (str5 != null ? str5.equals(((n) aVar).f87196f) : ((n) aVar).f87196f == null) {
                                    String str6 = this.f87197g;
                                    if (str6 != null ? str6.equals(((n) aVar).f87197g) : ((n) aVar).f87197g == null) {
                                        String str7 = this.f87198h;
                                        if (str7 != null ? str7.equals(((n) aVar).f87198h) : ((n) aVar).f87198h == null) {
                                            String str8 = this.f87199i;
                                            if (str8 != null ? str8.equals(((n) aVar).f87199i) : ((n) aVar).f87199i == null) {
                                                String str9 = this.f87200j;
                                                if (str9 != null ? str9.equals(((n) aVar).f87200j) : ((n) aVar).f87200j == null) {
                                                    String str10 = this.f87201k;
                                                    if (str10 != null ? str10.equals(((n) aVar).f87201k) : ((n) aVar).f87201k == null) {
                                                        String str11 = this.f87202l;
                                                        if (str11 != null ? str11.equals(((n) aVar).f87202l) : ((n) aVar).f87202l == null) {
                                                            return true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        Integer num = this.f87191a;
        int iHashCode = ((num == null ? 0 : num.hashCode()) ^ 1000003) * 1000003;
        String str = this.f87192b;
        int iHashCode2 = (iHashCode ^ (str == null ? 0 : str.hashCode())) * 1000003;
        String str2 = this.f87193c;
        int iHashCode3 = (iHashCode2 ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        String str3 = this.f87194d;
        int iHashCode4 = (iHashCode3 ^ (str3 == null ? 0 : str3.hashCode())) * 1000003;
        String str4 = this.f87195e;
        int iHashCode5 = (iHashCode4 ^ (str4 == null ? 0 : str4.hashCode())) * 1000003;
        String str5 = this.f87196f;
        int iHashCode6 = (iHashCode5 ^ (str5 == null ? 0 : str5.hashCode())) * 1000003;
        String str6 = this.f87197g;
        int iHashCode7 = (iHashCode6 ^ (str6 == null ? 0 : str6.hashCode())) * 1000003;
        String str7 = this.f87198h;
        int iHashCode8 = (iHashCode7 ^ (str7 == null ? 0 : str7.hashCode())) * 1000003;
        String str8 = this.f87199i;
        int iHashCode9 = (iHashCode8 ^ (str8 == null ? 0 : str8.hashCode())) * 1000003;
        String str9 = this.f87200j;
        int iHashCode10 = (iHashCode9 ^ (str9 == null ? 0 : str9.hashCode())) * 1000003;
        String str10 = this.f87201k;
        int iHashCode11 = (iHashCode10 ^ (str10 == null ? 0 : str10.hashCode())) * 1000003;
        String str11 = this.f87202l;
        return (str11 != null ? str11.hashCode() : 0) ^ iHashCode11;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AndroidClientInfo{sdkVersion=");
        sb2.append(this.f87191a);
        sb2.append(", model=");
        sb2.append(this.f87192b);
        sb2.append(", hardware=");
        sb2.append(this.f87193c);
        sb2.append(", device=");
        sb2.append(this.f87194d);
        sb2.append(", product=");
        sb2.append(this.f87195e);
        sb2.append(", osBuild=");
        sb2.append(this.f87196f);
        sb2.append(", manufacturer=");
        sb2.append(this.f87197g);
        sb2.append(", fingerprint=");
        sb2.append(this.f87198h);
        sb2.append(", locale=");
        sb2.append(this.f87199i);
        sb2.append(", country=");
        sb2.append(this.f87200j);
        sb2.append(", mccMnc=");
        sb2.append(this.f87201k);
        sb2.append(", applicationBuild=");
        return b.c0.q(sb2, this.f87202l, "}");
    }
}
