package defpackage;

import com.medium.android.core.models.CatalogName;
import com.medium.android.data.notification.UnsupportedNotificationException;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.graphql.fragment.HighlightData;
import com.medium.android.graphql.fragment.NewsletterData;
import com.medium.android.graphql.fragment.NewsletterSubscriptionData;
import com.medium.android.graphql.fragment.NotificationData;
import com.medium.android.graphql.fragment.NotificationDetail;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class dj8 {
    public static NotificationData.Actor a(ArrayList arrayList) {
        NotificationData notificationData;
        NotificationDetail.RollupItem rollupItem = (NotificationDetail.RollupItem) bu1.z0(arrayList);
        if (rollupItem == null || (notificationData = rollupItem.getNotificationData()) == null) {
            return null;
        }
        return notificationData.getActor();
    }

    public static ArrayList b(NotificationDetail notificationDetail) {
        List<NotificationDetail.RollupItem> rollupItems = notificationDetail.getRollupItems();
        if (rollupItems != null) {
            HashSet hashSet = new HashSet();
            ArrayList arrayList = new ArrayList();
            for (Object obj : rollupItems) {
                NotificationData.Actor actor = ((NotificationDetail.RollupItem) obj).getNotificationData().getActor();
                if (hashSet.add(actor != null ? actor.getId() : null)) {
                    arrayList.add(obj);
                }
            }
            if (arrayList.size() > 1) {
                return arrayList;
            }
        }
        return null;
    }

    public static xi8 c(NotificationData notificationData, SourceParameter sourceParameter) {
        NotificationData.Post post;
        String title;
        String title2;
        NotificationData.Post post2;
        NotificationData.Post post3;
        String title3;
        NotificationData.Post post4;
        NotificationData.Quote quote;
        HighlightData highlightData;
        HighlightData.Paragraph paragraph;
        Integer startOffset;
        NewsletterData newsletterData;
        NewsletterSubscriptionData newsletterSubscriptionData;
        NewsletterSubscriptionData.ViewerEdge viewerEdge;
        NewsletterData newsletterData2;
        NotificationData.Post post5;
        NotificationData.ResponsePost responsePost;
        String title4;
        NotificationData.Post post6;
        NotificationData.Quote quote2;
        HighlightData highlightData2;
        NotificationData.Post post7;
        String title5;
        HighlightData.Paragraph paragraph2;
        Integer startOffset2;
        NotificationData.Post post8;
        NotificationData.Post post9;
        String title6;
        NotificationData.Post post10;
        NotificationData.Post post11;
        String title7;
        NotificationData.Catalog catalog;
        NotificationData.Post post12;
        String title8;
        NotificationData.Post post13;
        NotificationData.Post post14;
        String title9;
        NotificationData.Catalog catalog2;
        List<NotificationData.RollupItem> rollupItems;
        NotificationData.Catalog catalog3;
        NotificationData.Post post15;
        String title10;
        NotificationData.ViewerEdge viewerEdge2;
        String id;
        NotificationData.Catalog catalog4;
        NotificationData.ResponsePost responsePost2;
        String id2;
        NotificationData.Catalog catalog5;
        String name;
        String notificationType = notificationData.getNotificationType();
        if (g76.L(notificationType, wj8.CATALOG_FOLLOWED_MILESTONE.getIdentifier())) {
            NotificationData.Catalog catalog6 = notificationData.getCatalog();
            if (catalog6 != null && (name = catalog6.getCreator().getName()) != null) {
                Integer milestoneArg = notificationData.getMilestoneArg();
                if (milestoneArg == null) {
                    ay0.e("Required value 'milestoneArg' is null.");
                    return null;
                }
                int iIntValue = milestoneArg.intValue();
                boolean zIsUnread = notificationData.isUnread();
                long occurredAt = notificationData.getOccurredAt();
                String id3 = catalog6.getCreator().getId();
                String imageId = catalog6.getCreator().getImageId();
                return new sd1(iIntValue, occurredAt, df1.a(catalog6), sourceParameter, id3, name, imageId != null ? imageId : null, catalog6.getId(), zIsUnread);
            }
        } else if (g76.L(notificationType, wj8.CATALOG_RECOMMENDED_MILESTONE.getIdentifier())) {
            NotificationData.Catalog catalog7 = notificationData.getCatalog();
            if (catalog7 != null) {
                Integer milestoneArg2 = notificationData.getMilestoneArg();
                if (milestoneArg2 == null) {
                    ay0.e("Required value 'milestoneArg' is null.");
                    return null;
                }
                int iIntValue2 = milestoneArg2.intValue();
                boolean zIsUnread2 = notificationData.isUnread();
                long occurredAt2 = notificationData.getOccurredAt();
                String id4 = catalog7.getId();
                CatalogName catalogNameA = df1.a(catalog7);
                String id5 = catalog7.getCreator().getId();
                String imageId2 = catalog7.getCreator().getImageId();
                return new nf1(zIsUnread2, occurredAt2, iIntValue2, id4, catalogNameA, id5, imageId2 != null ? imageId2 : null, sourceParameter);
            }
        } else if (g76.L(notificationType, wj8.CATALOG_RECOMMENDED.getIdentifier())) {
            NotificationData.Actor actor = notificationData.getActor();
            if (actor != null && (catalog5 = notificationData.getCatalog()) != null) {
                boolean zIsUnread3 = notificationData.isUnread();
                long occurredAt3 = notificationData.getOccurredAt();
                String id6 = actor.getId();
                String id7 = catalog5.getId();
                String imageId3 = actor.getImageId();
                return new pf1(zIsUnread3, occurredAt3, id6, d(actor), imageId3 != null ? imageId3 : null, id7, df1.a(catalog5), sourceParameter);
            }
        } else if (g76.L(notificationType, wj8.CATALOG_RESPONSE_CREATED.getIdentifier())) {
            NotificationData.Actor actor2 = notificationData.getActor();
            if (actor2 != null && (catalog4 = notificationData.getCatalog()) != null && (responsePost2 = notificationData.getResponsePost()) != null && (id2 = responsePost2.getId()) != null) {
                boolean zIsUnread4 = notificationData.isUnread();
                long occurredAt4 = notificationData.getOccurredAt();
                String id8 = actor2.getId();
                String id9 = catalog4.getId();
                String imageId4 = actor2.getImageId();
                return new vf1(occurredAt4, df1.a(catalog4), sourceParameter, id8, d(actor2), imageId4 != null ? imageId4 : null, id9, id2, zIsUnread4);
            }
        } else {
            boolean z = false;
            if (g76.L(notificationType, wj8.COLLECTION_POST_PUBLISHED.getIdentifier())) {
                NotificationData.Post post16 = notificationData.getPost();
                if (post16 != null && (post15 = notificationData.getPost()) != null && (title10 = post15.getTitle()) != null) {
                    String str = !muc.b0(title10) ? title10 : null;
                    if (str != null) {
                        NotificationData.Actor actor3 = notificationData.getActor();
                        if (actor3 == null) {
                            ay0.e("Required value 'actor' is null.");
                            return null;
                        }
                        NotificationData.Collection collection = notificationData.getCollection();
                        if (collection == null) {
                            ay0.e("Required value 'collection' is null.");
                            return null;
                        }
                        boolean zIsUnread5 = notificationData.isUnread();
                        long occurredAt5 = notificationData.getOccurredAt();
                        String id10 = post16.getId();
                        String id11 = actor3.getId();
                        String name2 = actor3.getName();
                        String imageId5 = actor3.getImageId();
                        String str2 = imageId5 != null ? imageId5 : null;
                        String id12 = collection.getId();
                        String name3 = collection.getName();
                        NotificationData.Avatar avatar = collection.getAvatar();
                        String str3 = (avatar == null || (id = avatar.getId()) == null) ? null : id;
                        NotificationData.Collection collection2 = notificationData.getCollection();
                        return new ms1(zIsUnread5, occurredAt5, id10, str, id11, name2, str2, id12, name3, str3, (collection2 == null || (viewerEdge2 = collection2.getViewerEdge()) == null || !viewerEdge2.isEditor()) ? false : true, sourceParameter);
                    }
                }
            } else if (g76.L(notificationType, wj8.ITEM_ADDED_TO_FOLLOWED_CATALOG.getIdentifier())) {
                NotificationData.Actor actor4 = notificationData.getActor();
                if (actor4 != null && (catalog3 = notificationData.getCatalog()) != null) {
                    boolean zIsUnread6 = notificationData.isUnread();
                    long occurredAt6 = notificationData.getOccurredAt();
                    String id13 = actor4.getId();
                    String imageId6 = actor4.getImageId();
                    return new f86(zIsUnread6, occurredAt6, id13, d(actor4), imageId6 != null ? imageId6 : null, catalog3.getId(), df1.a(catalog3), sourceParameter);
                }
            } else if (g76.L(notificationType, wj8.ITEM_ADDED_TO_FOLLOWED_CATALOG_ROLLUP.getIdentifier())) {
                NotificationData.Actor actor5 = notificationData.getActor();
                if (actor5 != null && (catalog2 = notificationData.getCatalog()) != null && (rollupItems = notificationData.getRollupItems()) != null) {
                    int size = rollupItems.size();
                    boolean zIsUnread7 = notificationData.isUnread();
                    long occurredAt7 = notificationData.getOccurredAt();
                    String id14 = actor5.getId();
                    String imageId7 = actor5.getImageId();
                    return new h86(size, occurredAt7, df1.a(catalog2), sourceParameter, id14, d(actor5), imageId7 != null ? imageId7 : null, catalog2.getId(), zIsUnread7);
                }
            } else if (g76.L(notificationType, wj8.MENTION_IN_POST.getIdentifier())) {
                NotificationData.Actor actor6 = notificationData.getActor();
                if (actor6 != null && (post13 = notificationData.getPost()) != null && (post14 = notificationData.getPost()) != null && (title9 = post14.getTitle()) != null) {
                    String str4 = !muc.b0(title9) ? title9 : null;
                    if (str4 != null) {
                        boolean zIsUnread8 = notificationData.isUnread();
                        long occurredAt8 = notificationData.getOccurredAt();
                        String id15 = actor6.getId();
                        String imageId8 = actor6.getImageId();
                        return new gx7(zIsUnread8, occurredAt8, id15, d(actor6), imageId8 != null ? imageId8 : null, post13.getId(), str4, sourceParameter);
                    }
                }
            } else if (g76.L(notificationType, wj8.POST_ADDED_TO_CATALOG.getIdentifier())) {
                NotificationData.Actor actor7 = notificationData.getActor();
                if (actor7 != null && (catalog = notificationData.getCatalog()) != null && (post12 = notificationData.getPost()) != null && (title8 = post12.getTitle()) != null) {
                    String str5 = !muc.b0(title8) ? title8 : null;
                    if (str5 != null) {
                        boolean zIsUnread9 = notificationData.isUnread();
                        long occurredAt9 = notificationData.getOccurredAt();
                        String id16 = actor7.getId();
                        String id17 = catalog.getId();
                        String imageId9 = actor7.getImageId();
                        return new zd9(occurredAt9, df1.a(catalog), sourceParameter, id16, d(actor7), imageId9 != null ? imageId9 : null, str5, id17, zIsUnread9);
                    }
                }
            } else if (g76.L(notificationType, wj8.POST_RECOMMENDED.getIdentifier())) {
                NotificationData.Actor actor8 = notificationData.getActor();
                if (actor8 != null && (post10 = notificationData.getPost()) != null && (post11 = notificationData.getPost()) != null && (title7 = post11.getTitle()) != null) {
                    String str6 = !muc.b0(title7) ? title7 : null;
                    if (str6 != null) {
                        boolean zIsUnread10 = notificationData.isUnread();
                        long occurredAt10 = notificationData.getOccurredAt();
                        String id18 = actor8.getId();
                        String imageId10 = actor8.getImageId();
                        return new ml9(zIsUnread10, occurredAt10, id18, d(actor8), imageId10 != null ? imageId10 : null, post10.getId(), str6, sourceParameter);
                    }
                }
            } else if (g76.L(notificationType, wj8.POST_REPOSTED.getIdentifier())) {
                NotificationData.Actor actor9 = notificationData.getActor();
                if (actor9 != null && (post8 = notificationData.getPost()) != null && (post9 = notificationData.getPost()) != null && (title6 = post9.getTitle()) != null) {
                    String str7 = !muc.b0(title6) ? title6 : null;
                    if (str7 != null) {
                        boolean zIsUnread11 = notificationData.isUnread();
                        long occurredAt11 = notificationData.getOccurredAt();
                        String id19 = actor9.getId();
                        String imageId11 = actor9.getImageId();
                        return new kn9(zIsUnread11, occurredAt11, id19, d(actor9), imageId11 != null ? imageId11 : null, post8.getId(), str7, sourceParameter);
                    }
                }
            } else if (g76.L(notificationType, wj8.QUOTE.getIdentifier())) {
                NotificationData.Actor actor10 = notificationData.getActor();
                if (actor10 != null && (post6 = notificationData.getPost()) != null && (quote2 = notificationData.getQuote()) != null && (highlightData2 = quote2.getHighlightData()) != null && (post7 = notificationData.getPost()) != null && (title5 = post7.getTitle()) != null) {
                    String str8 = !muc.b0(title5) ? title5 : null;
                    if (str8 != null && (paragraph2 = (HighlightData.Paragraph) bu1.z0(highlightData2.getParagraphs())) != null) {
                        boolean zIsUnread12 = notificationData.isUnread();
                        long occurredAt12 = notificationData.getOccurredAt();
                        String id20 = actor10.getId();
                        String imageId12 = actor10.getImageId();
                        String str9 = imageId12 != null ? imageId12 : null;
                        String strD = d(actor10);
                        String id21 = post6.getId();
                        String text = paragraph2.getText();
                        if (text != null && (startOffset2 = highlightData2.getStartOffset()) != null) {
                            int iIntValue3 = startOffset2.intValue();
                            Integer endOffset = highlightData2.getEndOffset();
                            if (endOffset != null) {
                                int iIntValue4 = endOffset.intValue();
                                List<HighlightData.Markup> markups = paragraph2.getMarkups();
                                ArrayList arrayList = new ArrayList();
                                Iterator<T> it2 = markups.iterator();
                                while (it2.hasNext()) {
                                    Markup markupO = bgf.O(((HighlightData.Markup) it2.next()).getMarkupData());
                                    if (markupO != null) {
                                        arrayList.add(markupO);
                                    }
                                }
                                return new kra(zIsUnread12, occurredAt12, id20, strD, str9, id21, str8, text, iIntValue3, iIntValue4, arrayList, sourceParameter);
                            }
                        }
                    }
                }
            } else if (g76.L(notificationType, wj8.RESPONSE_CREATED.getIdentifier())) {
                NotificationData.Actor actor11 = notificationData.getActor();
                if (actor11 != null && (post5 = notificationData.getPost()) != null && (responsePost = notificationData.getResponsePost()) != null && (title4 = post5.getTitle()) != null) {
                    String str10 = !muc.b0(title4) ? title4 : null;
                    if (str10 != null) {
                        boolean zIsUnread13 = notificationData.isUnread();
                        long occurredAt13 = notificationData.getOccurredAt();
                        String id22 = actor11.getId();
                        String imageId13 = actor11.getImageId();
                        return new mdb(zIsUnread13, occurredAt13, id22, d(actor11), imageId13 != null ? imageId13 : null, post5.getId(), str10, responsePost.getId(), cj8.b(responsePost.getContent().getBodyModel().getParagraphs()), sourceParameter);
                    }
                }
            } else if (g76.L(notificationType, wj8.USERS_EMAIL_SUBSCRIBED.getIdentifier())) {
                NotificationData.Actor actor12 = notificationData.getActor();
                if (actor12 != null) {
                    boolean zIsUnread14 = notificationData.isUnread();
                    long occurredAt14 = notificationData.getOccurredAt();
                    String id23 = actor12.getId();
                    String imageId14 = actor12.getImageId();
                    return new vne(zIsUnread14, occurredAt14, id23, d(actor12), imageId14 != null ? imageId14 : null, sourceParameter);
                }
            } else if (g76.L(notificationType, wj8.USERS_FOLLOWING_YOU.getIdentifier())) {
                NotificationData.Actor actor13 = notificationData.getActor();
                if (actor13 != null) {
                    NotificationData.NewsletterV3 newsletterV3 = actor13.getNewsletterV3();
                    String id24 = (newsletterV3 == null || (newsletterData2 = newsletterV3.getNewsletterData()) == null) ? null : newsletterData2.getId();
                    NotificationData.NewsletterV3 newsletterV32 = actor13.getNewsletterV3();
                    if (newsletterV32 != null && (newsletterData = newsletterV32.getNewsletterData()) != null && (newsletterSubscriptionData = newsletterData.getNewsletterSubscriptionData()) != null && (viewerEdge = newsletterSubscriptionData.getViewerEdge()) != null && viewerEdge.isSubscribed()) {
                        z = true;
                    }
                    boolean zIsUnread15 = notificationData.isUnread();
                    long occurredAt15 = notificationData.getOccurredAt();
                    String id25 = actor13.getId();
                    String imageId15 = actor13.getImageId();
                    return new xne(zIsUnread15, occurredAt15, id25, d(actor13), imageId15 != null ? imageId15 : null, actor13.getUserFollowData().getViewerEdge().isFollowing() ? bt4.FOLLOWING : bt4.NOT_FOLLOWING, (!z || id24 == null) ? new ag8(id24) : new bg8(id24), sourceParameter);
                }
            } else if (g76.L(notificationType, wj8.HIGHLIGHT_WAS_PILED_ONTO.getIdentifier())) {
                NotificationData.Actor actor14 = notificationData.getActor();
                if (actor14 != null && (post4 = notificationData.getPost()) != null && (quote = notificationData.getQuote()) != null && (highlightData = quote.getHighlightData()) != null && (paragraph = (HighlightData.Paragraph) bu1.z0(highlightData.getParagraphs())) != null) {
                    boolean zIsUnread16 = notificationData.isUnread();
                    long occurredAt16 = notificationData.getOccurredAt();
                    String id26 = actor14.getId();
                    String imageId16 = actor14.getImageId();
                    String str11 = imageId16 != null ? imageId16 : null;
                    String strD2 = d(actor14);
                    String id27 = post4.getId();
                    String text2 = paragraph.getText();
                    if (text2 != null && (startOffset = highlightData.getStartOffset()) != null) {
                        int iIntValue5 = startOffset.intValue();
                        Integer endOffset2 = highlightData.getEndOffset();
                        if (endOffset2 != null) {
                            int iIntValue6 = endOffset2.intValue();
                            List<HighlightData.Markup> markups2 = paragraph.getMarkups();
                            ArrayList arrayList2 = new ArrayList();
                            Iterator<T> it3 = markups2.iterator();
                            while (it3.hasNext()) {
                                Markup markupO2 = bgf.O(((HighlightData.Markup) it3.next()).getMarkupData());
                                if (markupO2 != null) {
                                    arrayList2.add(markupO2);
                                }
                            }
                            return new ll5(zIsUnread16, occurredAt16, id26, strD2, str11, id27, text2, iIntValue5, iIntValue6, arrayList2, sourceParameter);
                        }
                    }
                }
            } else if (g76.L(notificationType, wj8.COLLECTION_DRAFT_SUBMITTED.getIdentifier())) {
                NotificationData.Actor actor15 = notificationData.getActor();
                if (actor15 != null && (post2 = notificationData.getPost()) != null && (post3 = notificationData.getPost()) != null && (title3 = post3.getTitle()) != null) {
                    String str12 = !muc.b0(title3) ? title3 : null;
                    if (str12 != null) {
                        NotificationData.Collection collection3 = notificationData.getCollection();
                        String name4 = collection3 != null ? collection3.getName() : null;
                        if (name4 == null) {
                            ay0.e("Required value 'collectionName' is null.");
                            return null;
                        }
                        boolean zIsUnread17 = notificationData.isUnread();
                        long occurredAt17 = notificationData.getOccurredAt();
                        String id28 = actor15.getId();
                        String imageId17 = actor15.getImageId();
                        return new gr1(zIsUnread17, occurredAt17, id28, d(actor15), imageId17 != null ? imageId17 : null, post2.getId(), str12, name4, sourceParameter);
                    }
                }
            } else if (g76.L(notificationType, wj8.POST_RECOMMENDED_MILESTONE.getIdentifier())) {
                NotificationData.Post post17 = notificationData.getPost();
                if (post17 != null) {
                    Integer milestoneArg3 = notificationData.getMilestoneArg();
                    if (milestoneArg3 == null) {
                        ay0.e("Required value 'milestoneArg' is null.");
                        return null;
                    }
                    int iIntValue7 = milestoneArg3.intValue();
                    NotificationData.Creator creator = post17.getCreator();
                    if (creator == null) {
                        ay0.e("Required value 'creator' is null.");
                        return null;
                    }
                    NotificationData.Post post18 = notificationData.getPost();
                    if (post18 != null && (title2 = post18.getTitle()) != null) {
                        String str13 = !muc.b0(title2) ? title2 : null;
                        if (str13 != null) {
                            boolean zIsUnread18 = notificationData.isUnread();
                            long occurredAt18 = notificationData.getOccurredAt();
                            String id29 = post17.getId();
                            String id30 = creator.getId();
                            String imageId18 = creator.getImageId();
                            return new kl9(iIntValue7, occurredAt18, sourceParameter, id29, str13, id30, imageId18 != null ? imageId18 : null, zIsUnread18);
                        }
                    }
                }
            } else {
                if (!g76.L(notificationType, wj8.PUBLICATION_FEATURED_YOUR_POST.getIdentifier())) {
                    String notificationType2 = notificationData.getNotificationType();
                    notificationType2.getClass();
                    throw new UnsupportedNotificationException("Unsupported notification type: ".concat(notificationType2));
                }
                NotificationData.Post post19 = notificationData.getPost();
                if (post19 != null && (post = notificationData.getPost()) != null && (title = post.getTitle()) != null) {
                    String str14 = !muc.b0(title) ? title : null;
                    if (str14 != null) {
                        NotificationData.Collection collection4 = notificationData.getCollection();
                        if (collection4 != null) {
                            boolean zIsUnread19 = notificationData.isUnread();
                            long occurredAt19 = notificationData.getOccurredAt();
                            String id31 = post19.getId();
                            String id32 = collection4.getId();
                            String name5 = collection4.getName();
                            NotificationData.Avatar avatar2 = collection4.getAvatar();
                            return new eda(zIsUnread19, occurredAt19, id31, str14, id32, name5, avatar2 != null ? avatar2.getId() : null, sourceParameter);
                        }
                        ay0.e("Required value 'collection' is null.");
                    }
                }
            }
        }
        return null;
    }

    public static String d(NotificationData.Actor actor) {
        String name = actor.getName();
        if (name != null) {
            return name;
        }
        ay0.e("Required value 'Actor name' is null.");
        return null;
    }
}
