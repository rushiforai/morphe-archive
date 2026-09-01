package defpackage;

import android.net.Uri;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.fragment.PostMetaData;
import com.medium.android.graphql.fragment.PostShareData;
import com.medium.android.graphql.type.PostVisibilityType;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xo9 {
    public final tz7 a;

    public xo9(tz7 tz7Var) {
        this.a = tz7Var;
    }

    public static PostShareData b(xo9 xo9Var, com.medium.android.graphql.fragment.PostShareData postShareData) {
        ImageMetadataData imageMetadataData;
        xo9Var.getClass();
        postShareData.getClass();
        String title = postShareData.getTitle();
        PostShareData.Creator creator = postShareData.getCreator();
        String name = creator != null ? creator.getName() : null;
        String username = creator != null ? creator.getUsername() : null;
        if (postShareData.getMediumUrl() == null || title == null || creator == null || name == null || username == null) {
            return null;
        }
        Uri uri = Uri.parse(postShareData.getMediumUrl());
        uri.getClass();
        String id = postShareData.getId();
        PostShareData.PreviewContent previewContent = postShareData.getPreviewContent();
        String subtitle = previewContent != null ? previewContent.getSubtitle() : null;
        PostShareData.PreviewImage previewImage = postShareData.getPreviewImage();
        sw5 sw5VarM = (previewImage == null || (imageMetadataData = previewImage.getImageMetadataData()) == null) ? null : pxf.M(imageMetadataData);
        Double readingTime = postShareData.getReadingTime();
        Integer numValueOf = readingTime != null ? Integer.valueOf((int) Math.ceil(readingTime.doubleValue())) : null;
        sw5 sw5Var = sw5VarM;
        String imageId = creator.getImageId();
        Uri uriH = xo9Var.a.h(username, creator.getHasSubdomain());
        ey3 ey3Var = ey3.a;
        bu1.p0(ey3Var, null);
        return new com.medium.android.core.share.PostShareData(uri, id, title, subtitle, sw5Var, numValueOf, name, imageId, uriH, bu1.m1(bu1.p1(ey3Var)), null, postShareData.getVisibility() == PostVisibilityType.LOCKED, postShareData.getViewerEdge().getShareKey());
    }

    public final com.medium.android.core.share.PostShareData a(PostMetaData postMetaData, List list, String str) {
        ImageMetadataData imageMetadataData;
        postMetaData.getClass();
        list.getClass();
        String title = postMetaData.getTitle();
        PostMetaData.Creator creator = postMetaData.getCreator();
        String name = creator != null ? creator.getName() : null;
        String username = creator != null ? creator.getUsername() : null;
        if (postMetaData.getMediumUrl() == null || title == null || creator == null || name == null || username == null) {
            return null;
        }
        Uri uri = Uri.parse(postMetaData.getMediumUrl());
        uri.getClass();
        String id = postMetaData.getId();
        PostMetaData.PreviewContent previewContent = postMetaData.getPreviewContent();
        String subtitle = previewContent != null ? previewContent.getSubtitle() : null;
        PostMetaData.PreviewImage previewImage = postMetaData.getPreviewImage();
        sw5 sw5VarM = (previewImage == null || (imageMetadataData = previewImage.getImageMetadataData()) == null) ? null : pxf.M(imageMetadataData);
        Double readingTime = postMetaData.getReadingTime();
        return new com.medium.android.core.share.PostShareData(uri, id, title, subtitle, sw5VarM, readingTime != null ? Integer.valueOf((int) Math.ceil(readingTime.doubleValue())) : null, name, creator.getImageId(), this.a.h(username, creator.getHasSubdomain()), (bu1.p0(list, str) || str == null) ? bu1.m1(bu1.p1(list)) : bu1.m1(bu1.p1(bu1.R0(list, str))), str, postMetaData.getVisibility() == PostVisibilityType.LOCKED, postMetaData.getViewerEdge().getShareKey());
    }
}
