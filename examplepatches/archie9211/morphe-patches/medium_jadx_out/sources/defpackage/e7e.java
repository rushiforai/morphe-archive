package defpackage;

import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e7e extends sbb {
    public final Uri b;
    public final /* synthetic */ ContentResolver c;

    public e7e(Uri uri, ContentResolver contentResolver) {
        this.c = contentResolver;
        this.b = uri;
    }

    @Override // defpackage.sbb
    public final long a() throws IOException {
        AssetFileDescriptor assetFileDescriptorOpenAssetFileDescriptor = this.c.openAssetFileDescriptor(this.b, "r");
        if (assetFileDescriptorOpenAssetFileDescriptor == null) {
            return -1L;
        }
        try {
            long length = assetFileDescriptorOpenAssetFileDescriptor.getLength();
            assetFileDescriptorOpenAssetFileDescriptor.close();
            return length;
        } finally {
        }
    }

    @Override // defpackage.sbb
    public final fn7 b() {
        String type = this.c.getType(this.b);
        if (type != null) {
            x2b x2bVar = fn7.d;
            try {
                return en7.x(type);
            } catch (IllegalArgumentException unused) {
            }
        }
        return null;
    }

    @Override // defpackage.sbb
    public final void d(xz0 xz0Var) throws IOException {
        ContentResolver contentResolver = this.c;
        Uri uri = this.b;
        InputStream inputStreamOpenInputStream = contentResolver.openInputStream(uri);
        if (inputStreamOpenInputStream == null) {
            lg8.m("Couldn't open content URI for reading: ", uri);
            return;
        }
        y26 y26VarN = vo7.N(inputStreamOpenInputStream);
        try {
            xz0Var.J(y26VarN);
            y26VarN.close();
        } finally {
        }
    }
}
