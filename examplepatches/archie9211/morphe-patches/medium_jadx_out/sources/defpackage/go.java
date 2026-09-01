package defpackage;

import android.content.ClipData;
import android.graphics.fonts.Font;
import android.view.ContentInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class go {
    public static /* synthetic */ Font.Builder a(Font font) {
        return new Font.Builder(font);
    }

    public static /* synthetic */ ContentInfo.Builder b(ClipData clipData, int i) {
        return new ContentInfo.Builder(clipData, i);
    }
}
