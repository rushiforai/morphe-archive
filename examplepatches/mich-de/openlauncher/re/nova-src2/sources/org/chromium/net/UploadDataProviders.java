package org.chromium.net;

import android.os.ParcelFileDescriptor;
import java.io.File;
import java.nio.ByteBuffer;

@Deprecated
/* loaded from: classes5.dex */
public final class UploadDataProviders {
    private UploadDataProviders() {
    }

    public static UploadDataProvider create(File file) {
        return new q90.b(new q.c(file, 2));
    }

    public static UploadDataProvider create(ParcelFileDescriptor parcelFileDescriptor) {
        return new q90.b(new q.c(parcelFileDescriptor, 3));
    }

    public static UploadDataProvider create(ByteBuffer byteBuffer) {
        return new q90.a(byteBuffer.slice(), 0);
    }

    public static UploadDataProvider create(byte[] bArr, int i5, int i11) {
        return new q90.a(ByteBuffer.wrap(bArr, i5, i11).slice(), 0);
    }

    public static UploadDataProvider create(byte[] bArr) {
        return new q90.a(ByteBuffer.wrap(bArr, 0, bArr.length).slice(), 0);
    }
}
