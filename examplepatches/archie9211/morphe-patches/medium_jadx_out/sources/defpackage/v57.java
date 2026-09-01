package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum v57 {
    CREATION_SAMPLING_RATE("_dd.local.head_sampling_rate_key"),
    REPORTING_SAMPLING_RATE("_dd.local.tail_sampling_rate_key"),
    VIEW_SCOPE_INSTRUMENTATION_TYPE("_dd.local.view_instrumentation_type_key");

    public final String a;

    v57(String str) {
        this.a = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.a;
    }
}
