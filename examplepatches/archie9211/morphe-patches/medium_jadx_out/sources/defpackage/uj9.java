package defpackage;

import com.medium.android.graphql.fragment.PostPreviewData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class uj9 {
    public static final int a(PostPreviewData postPreviewData) {
        postPreviewData.getClass();
        Double readingTime = postPreviewData.getReadingTime();
        return (int) Math.ceil(readingTime != null ? readingTime.doubleValue() : 0.0d);
    }
}
