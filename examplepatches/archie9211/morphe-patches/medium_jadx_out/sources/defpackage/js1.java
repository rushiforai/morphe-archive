package defpackage;

import gen.model.CollectionNavItemType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class js1 {
    public static CollectionNavItemType a(int i) {
        switch (i) {
            case 1:
                return CollectionNavItemType.TAG_NAV_ITEM;
            case 2:
                return CollectionNavItemType.POST_NAV_ITEM;
            case 3:
                return CollectionNavItemType.EXTERNAL_LINK_NAV_ITEM;
            case 4:
                return CollectionNavItemType.TOPIC_PAGE;
            case 5:
                return CollectionNavItemType.ARCHIVE_NAV_ITEM;
            case 6:
                return CollectionNavItemType.ABOUT_PAGE_NAV_ITEM;
            case 7:
                return CollectionNavItemType.TRENDING_NAV_ITEM;
            case 8:
                return CollectionNavItemType.LATEST_NAV_ITEM;
            case 9:
                return CollectionNavItemType.SOCIAL_ITEM;
            default:
                return null;
        }
    }
}
