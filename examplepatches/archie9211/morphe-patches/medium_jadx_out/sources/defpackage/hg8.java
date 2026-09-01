package defpackage;

import gen.model.NewsletterV3Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hg8 {
    public static NewsletterV3Type a(int i) {
        if (i == 0) {
            return NewsletterV3Type.NEWSLETTER_TYPE_UNKNOWN;
        }
        if (i == 1) {
            return NewsletterV3Type.NEWSLETTER_TYPE_COLLECTION;
        }
        if (i != 2) {
            return null;
        }
        return NewsletterV3Type.NEWSLETTER_TYPE_AUTHOR;
    }
}
