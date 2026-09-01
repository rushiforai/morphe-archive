package defpackage;

import gen.model.TopicVisibility;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fpd {
    public static TopicVisibility a(int i) {
        if (i == 0) {
            return TopicVisibility.TOPIC_VISIBILITY_STAFF;
        }
        if (i == 1) {
            return TopicVisibility.TOPIC_VISIBILITY_PUBLIC;
        }
        if (i != 2) {
            return null;
        }
        return TopicVisibility.TOPIC_VISIBILITY_SPECIAL;
    }
}
