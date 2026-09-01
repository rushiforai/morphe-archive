package defpackage;

import com.medium.android.postpublishing.ui.TopicData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mea extends pea {
    public final TopicData a;

    public mea(TopicData topicData) {
        this.a = topicData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof mea) && this.a.equals(((mea) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "RemoveTopic(topic=" + this.a + ")";
    }
}
