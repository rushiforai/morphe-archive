package defpackage;

import android.content.Context;
import android.net.Uri;
import com.medium.android.unsplash.data.UnsplashPhoto;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.AnchorType;
import com.medium.proto.obv.post.MarkupType;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mx5 implements ou3 {
    public final fi9 a;
    public final Context b;

    public mx5(fi9 fi9Var, Context context) {
        this.a = fi9Var;
        this.b = context;
    }

    @Override // defpackage.ou3
    public final boolean a(SelectionPb selectionPb) {
        selectionPb.getClass();
        return false;
    }

    @Override // defpackage.ou3
    public final boolean b(yw1 yw1Var) {
        return yw1Var instanceof nw1;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0080 A[PHI: r0 r2 r10
      0x0080: PHI (r0v45 java.lang.String) = 
      (r0v6 java.lang.String)
      (r0v12 java.lang.String)
      (r0v17 java.lang.String)
      (r0v26 java.lang.String)
      (r0v50 java.lang.String)
     binds: [B:92:0x01ea, B:82:0x01ba, B:72:0x017d, B:51:0x0117, B:25:0x007d] A[DONT_GENERATE, DONT_INLINE]
      0x0080: PHI (r2v32 java.util.List<com.medium.proto.model.MarkupModel>) = 
      (r2v8 java.util.List<com.medium.proto.model.MarkupModel>)
      (r2v10 java.util.List<com.medium.proto.model.MarkupModel>)
      (r2v11 java.util.List<com.medium.proto.model.MarkupModel>)
      (r2v19 java.util.List<com.medium.proto.model.MarkupModel>)
      (r2v34 java.util.List<com.medium.proto.model.MarkupModel>)
     binds: [B:92:0x01ea, B:82:0x01ba, B:72:0x017d, B:51:0x0117, B:25:0x007d] A[DONT_GENERATE, DONT_INLINE]
      0x0080: PHI (r10v9 gen.model.ImageMetadata) = 
      (r10v0 gen.model.ImageMetadata)
      (r10v1 gen.model.ImageMetadata)
      (r10v2 gen.model.ImageMetadata)
      (r10v5 gen.model.ImageMetadata)
      (r10v10 gen.model.ImageMetadata)
     binds: [B:92:0x01ea, B:82:0x01ba, B:72:0x017d, B:51:0x0117, B:25:0x007d] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00d5 A[PHI: r2 r8 r11
      0x00d5: PHI (r2v22 java.lang.String) = (r2v16 java.lang.String), (r2v27 java.lang.String) binds: [B:62:0x0166, B:38:0x00d2] A[DONT_GENERATE, DONT_INLINE]
      0x00d5: PHI (r8v3 java.util.List<com.medium.proto.model.MarkupModel>) = (r8v2 java.util.List<com.medium.proto.model.MarkupModel>), (r8v4 java.util.List<com.medium.proto.model.MarkupModel>) binds: [B:62:0x0166, B:38:0x00d2] A[DONT_GENERATE, DONT_INLINE]
      0x00d5: PHI (r11v6 gen.model.ImageMetadata) = (r11v2 gen.model.ImageMetadata), (r11v7 gen.model.ImageMetadata) binds: [B:62:0x0166, B:38:0x00d2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00d7 A[PHI: r0 r2 r11
      0x00d7: PHI (r0v28 java.util.List<com.medium.proto.model.MarkupModel>) = 
      (r0v21 java.util.List<com.medium.proto.model.MarkupModel>)
      (r0v21 java.util.List<com.medium.proto.model.MarkupModel>)
      (r0v31 java.util.List<com.medium.proto.model.MarkupModel>)
      (r0v31 java.util.List<com.medium.proto.model.MarkupModel>)
     binds: [B:60:0x0162, B:62:0x0166, B:36:0x00ce, B:38:0x00d2] A[DONT_GENERATE, DONT_INLINE]
      0x00d7: PHI (r2v20 java.lang.String) = (r2v16 java.lang.String), (r2v16 java.lang.String), (r2v27 java.lang.String), (r2v27 java.lang.String) binds: [B:60:0x0162, B:62:0x0166, B:36:0x00ce, B:38:0x00d2] A[DONT_GENERATE, DONT_INLINE]
      0x00d7: PHI (r11v4 gen.model.ImageMetadata) = 
      (r11v2 gen.model.ImageMetadata)
      (r11v2 gen.model.ImageMetadata)
      (r11v7 gen.model.ImageMetadata)
      (r11v7 gen.model.ImageMetadata)
     binds: [B:60:0x0162, B:62:0x0166, B:36:0x00ce, B:38:0x00d2] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.ou3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(defpackage.yw1 r42, com.medium.proto.model.SelectionPb r43) {
        /*
            Method dump skipped, instruction units count: 742
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mx5.d(yw1, com.medium.proto.model.SelectionPb):void");
    }

    public final f09 f(UnsplashPhoto unsplashPhoto) {
        Uri uri;
        Uri.Builder builderBuildUpon;
        Uri.Builder builderAppendQueryParameter;
        Uri.Builder builderAppendQueryParameter2;
        Uri uriBuild;
        ArrayList arrayList = new ArrayList();
        String name = unsplashPhoto.getUser().getName();
        String html = unsplashPhoto.getUser().getLinks().getHtml();
        String string = null;
        if (html != null) {
            if (muc.b0(html)) {
                html = null;
            }
            if (html != null && (uri = Uri.parse(html)) != null && (builderBuildUpon = uri.buildUpon()) != null && (builderAppendQueryParameter = builderBuildUpon.appendQueryParameter("utm_source", "medium")) != null && (builderAppendQueryParameter2 = builderAppendQueryParameter.appendQueryParameter("utm_medium", "referral")) != null && (uriBuild = builderAppendQueryParameter2.build()) != null) {
                string = uriBuild.toString();
            }
        }
        String str = string;
        Context context = this.b;
        String string2 = context.getString(R.string.unsplash_caption_unsplash);
        string2.getClass();
        String string3 = Uri.parse("https://unsplash.com/").buildUpon().appendQueryParameter("utm_source", "medium").appendQueryParameter("utm_medium", "referral").build().toString();
        string3.getClass();
        String string4 = context.getString(R.string.unsplash_caption, name, string2);
        string4.getClass();
        if (str != null) {
            int iZ = muc.Z(string4, name, 0, false, 6);
            arrayList.add(new MarkupModel(MarkupType.A, Integer.valueOf(iZ), Integer.valueOf(name.length() + iZ), str, null, "photo-creator", AnchorType.LINK, null, null, null, null, null, 3984, null));
        }
        int iZ2 = muc.Z(string4, string2, 0, false, 6);
        arrayList.add(new MarkupModel(MarkupType.A, Integer.valueOf(iZ2), Integer.valueOf(string2.length() + iZ2), string3, null, "photo-source", AnchorType.LINK, null, null, null, null, null, 3984, null));
        return new f09(string4, arrayList);
    }
}
