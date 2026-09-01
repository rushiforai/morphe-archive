package defpackage;

import com.medium.android.graphql.fragment.PublicationPostSectionData;
import com.medium.android.graphql.fragment.PublicationPromotionSectionData;
import com.medium.android.graphql.fragment.PublicationSections;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gja {
    public final kla a;
    public final r6c b = k40.x(0, 7, null);

    public gja(kla klaVar) {
        this.a = klaVar;
    }

    public static ArrayList a(PublicationSections publicationSections) {
        aja ziaVar;
        String rgb;
        List<PublicationSections.Section> sections = publicationSections.getSections();
        ArrayList arrayList = new ArrayList();
        for (PublicationSections.Section section : sections) {
            PublicationPostSectionData publicationPostSectionData = section.getOnPublicationSection().getPublicationPostSectionData();
            PublicationPromotionSectionData publicationPromotionSectionData = section.getOnPublicationSection().getPublicationPromotionSectionData();
            if (publicationPostSectionData != null) {
                String id = publicationPostSectionData.getId();
                String title = publicationPostSectionData.getTitle();
                List<PublicationPostSectionData.Post> posts = publicationPostSectionData.getPosts();
                ArrayList arrayList2 = new ArrayList(cu1.k0(posts, 10));
                Iterator<T> it2 = posts.iterator();
                while (it2.hasNext()) {
                    arrayList2.add(((PublicationPostSectionData.Post) it2.next()).getId());
                }
                ziaVar = new yia(id, title, arrayList2);
            } else {
                ziaVar = null;
                if (publicationPromotionSectionData != null) {
                    String id2 = publicationPromotionSectionData.getId();
                    String headlineText = publicationPromotionSectionData.getHeadlineText();
                    String str = (headlineText == null || muc.b0(headlineText)) ? null : headlineText;
                    String imageId = publicationPromotionSectionData.getImageId();
                    String str2 = (imageId == null || muc.b0(imageId)) ? null : imageId;
                    PublicationPromotionSectionData.BackgroundColor backgroundColor = publicationPromotionSectionData.getBackgroundColor();
                    String str3 = (backgroundColor == null || (rgb = backgroundColor.getRgb()) == null || muc.b0(rgb)) ? null : rgb;
                    String buttonText = publicationPromotionSectionData.getButtonText();
                    String str4 = (buttonText == null || muc.b0(buttonText)) ? null : buttonText;
                    String url = publicationPromotionSectionData.getUrl();
                    ziaVar = new zia(id2, str, str2, str3, str4, !muc.b0(url) ? url : null);
                }
            }
            if (ziaVar != null) {
                arrayList.add(ziaVar);
            }
        }
        return arrayList;
    }
}
