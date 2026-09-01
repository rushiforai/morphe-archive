package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class j79 {
    public static boolean a(zv7 zv7Var) {
        String str;
        String str2;
        String str3;
        String str4 = zv7Var.b;
        return (str4 != null && (muc.b0(str4) ^ true)) || ((str = zv7Var.f) != null && (muc.b0(str) ^ true)) || (((str2 = zv7Var.g) != null && (muc.b0(str2) ^ true)) || ((str3 = zv7Var.d) != null && (muc.b0(str3) ^ true)));
    }

    public static on3 b(PostMetaData.CreatorSpotlight creatorSpotlight) {
        String name = creatorSpotlight.getName();
        String jobTitle = creatorSpotlight.getJobTitle();
        String company = creatorSpotlight.getCompany();
        String imageId = creatorSpotlight.getImageId();
        imageId.getClass();
        Boolean hideOnMediumScreen = creatorSpotlight.getHideOnMediumScreen();
        return new on3(name, jobTitle, company, imageId, hideOnMediumScreen != null ? hideOnMediumScreen.booleanValue() : false);
    }
}
