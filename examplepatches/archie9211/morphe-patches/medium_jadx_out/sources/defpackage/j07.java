package defpackage;

import android.net.Uri;
import com.medium.android.graphql.fragment.LinkMetadataList;
import com.medium.android.graphql.type.LinkAlternateType;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class j07 {
    public static final f09 a(LinkMetadataList linkMetadataList) {
        String str;
        linkMetadataList.getClass();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (LinkMetadataList.C0000LinkMetadataList c0000LinkMetadataList : linkMetadataList.getLinkMetadataList()) {
            List<LinkMetadataList.Alt> alts = c0000LinkMetadataList.getAlts();
            if (alts != null) {
                for (LinkMetadataList.Alt alt : alts) {
                    Uri uri = null;
                    if ((alt != null ? alt.getType() : null) != null && alt.getType() == LinkAlternateType.ANDROID_APPLINK) {
                        String url = alt.getUrl();
                        str = url != null ? url : "";
                        x2b x2bVar = huc.a;
                        if (str.length() != 0) {
                            Uri uri2 = Uri.parse(str);
                            if (uri2.isAbsolute()) {
                                uri = uri2;
                            }
                        }
                        if (uri != null) {
                            linkedHashMap.put(c0000LinkMetadataList.getUrl(), uri);
                        }
                    } else if ((alt != null ? alt.getType() : null) != null && alt.getType() == LinkAlternateType.AMP) {
                        String url2 = alt.getUrl();
                        str = url2 != null ? url2 : "";
                        x2b x2bVar2 = huc.a;
                        if (str.length() != 0) {
                            Uri uri3 = Uri.parse(str);
                            if (uri3.isAbsolute()) {
                                uri = uri3;
                            }
                        }
                        if (uri != null) {
                            linkedHashMap2.put(c0000LinkMetadataList.getUrl(), uri);
                        }
                    }
                }
            }
        }
        return new f09(linkedHashMap, linkedHashMap2);
    }
}
