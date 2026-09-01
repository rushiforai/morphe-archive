package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum jv2 {
    NTP_0("0.datadog.pool.ntp.org"),
    NTP_1("1.datadog.pool.ntp.org"),
    NTP_2("2.datadog.pool.ntp.org"),
    NTP_3("3.datadog.pool.ntp.org");

    public final String a;

    jv2(String str) {
        this.a = str;
    }

    public final String getHost() {
        return this.a;
    }
}
