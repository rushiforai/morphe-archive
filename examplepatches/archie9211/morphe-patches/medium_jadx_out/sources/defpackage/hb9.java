package defpackage;

import com.medium.proto.model.PlaybackModel;
import com.medium.proto.model.PostDisplay;
import com.medium.proto.model.PostViewContent;
import com.medium.proto.model.RichTextModel;
import gen.model.ImageInfo;
import gen.model.ImageMetadata;
import gen.model.Post;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class hb9 {
    public static final PlaybackModel a;

    static {
        String str = null;
        a = new PlaybackModel(str, null, null, null, new RichTextModel(null, null, null, 7, null), new PostDisplay(Boolean.TRUE, null, null, 6, null), null, null, null, null, 975, null);
    }

    public static PlaybackModel a(Post post) {
        PostDisplay postDisplay;
        PostViewContent postViewContent = post.content;
        if (postViewContent == null) {
            postViewContent = new PostViewContent(null, null, null, null, null, null, null, null, null, null, 1023, null);
        }
        RichTextModel richTextModel = postViewContent.body_model;
        RichTextModel richTextModel2 = richTextModel == null ? new RichTextModel(null, null, null, 7, null) : richTextModel;
        PostDisplay postDisplay2 = postViewContent.post_display;
        if (postDisplay2 == null) {
            postDisplay2 = new PostDisplay(null, null, null, 7, null);
        }
        Boolean bool = post.coverless;
        Boolean bool2 = Boolean.TRUE;
        if (g76.L(bool, bool2) && g76.L(postDisplay2.coverless, Boolean.FALSE)) {
            df9 df9VarNewBuilder = postDisplay2.newBuilder();
            df9VarNewBuilder.a = bool2;
            postDisplay = new PostDisplay(df9VarNewBuilder.a, df9VarNewBuilder.b, df9VarNewBuilder.buildUnknownFields());
        } else {
            postDisplay = postDisplay2;
        }
        Boolean bool3 = post.is_title_synthesized;
        boolean zBooleanValue = bool3 != null ? bool3.booleanValue() : false;
        String str = zBooleanValue ? "" : post.title;
        String str2 = zBooleanValue ? "" : postViewContent.subtitle;
        ImageInfo imageInfo = postViewContent.image;
        return new PlaybackModel(str, str2, postViewContent.caption, imageInfo != null ? new ImageMetadata(imageInfo.image_id, imageInfo.original_width, imageInfo.original_height, null, null, null, null, imageInfo.focus_percent_x, imageInfo.focus_percent_y, null, null, null, null, 7800, null) : null, richTextModel2, postDisplay, null, null, null, null, 960, null);
    }
}
