package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sfa implements gga {
    public final List a;

    public sfa(az5 az5Var) {
        az5Var.getClass();
        this.a = az5Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof sfa) && this.a.equals(((sfa) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ka1.t("FailedToSaveTopics(topicDatas=", ")", this.a);
    }
}
