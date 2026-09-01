package defpackage;

import gen.model.ReadingListType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tua {
    public static ReadingListType a(int i) {
        if (i == 0) {
            return ReadingListType.READING_LIST_NONE;
        }
        if (i == 2) {
            return ReadingListType.READING_LIST_QUEUE;
        }
        if (i != 3) {
            return null;
        }
        return ReadingListType.READING_LIST_ARCHIVE;
    }
}
