package io.branch.search.internal;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ImageDecoder;
import android.os.Build;
import android.util.Size;
import io.branch.search.internal.C3427w1;
import java.io.IOException;
import java.nio.ByteBuffer;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.w1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3427w1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final m90.j f66199a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final m90.j f66200b;

    /* renamed from: io.branch.search.internal.w1$a */
    public static final class a extends m90.o {

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public IOException f66201a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull m90.i delegate) {
            super(delegate);
            Intrinsics.g(delegate, "delegate");
        }

        @Override // m90.o, m90.j0
        public final long read(@NotNull m90.g sink, long j11) throws IOException {
            Intrinsics.g(sink, "sink");
            try {
                return super.read(sink, j11);
            } catch (IOException e3) {
                this.f66201a = e3;
                throw e3;
            }
        }
    }

    static {
        m90.j jVar = m90.j.f76130d;
        f66199a = lm.e.n("RIFF");
        f66200b = lm.e.n("WEBP");
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [z40.d] */
    public static Bitmap a(ImageDecoder.Source source, final int i5, final int i11, final boolean z11, final boolean z12) throws IOException {
        Bitmap bitmapDecodeBitmap = ImageDecoder.decodeBitmap(source, new ImageDecoder.OnHeaderDecodedListener() { // from class: z40.d
            @Override // android.graphics.ImageDecoder.OnHeaderDecodedListener
            public final void onHeaderDecoded(ImageDecoder imageDecoder, ImageDecoder.ImageInfo imageInfo, ImageDecoder.Source source2) {
                C3427w1.a(i5, i11, z11, z12, imageDecoder, imageInfo, source2);
            }
        });
        Intrinsics.f(bitmapDecodeBitmap, "decodeBitmap(imageSource…}\n            }\n        }");
        return bitmapDecodeBitmap;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(int i5, int i11, boolean z11, boolean z12, ImageDecoder imageDecoder, ImageDecoder.ImageInfo imageInfo, ImageDecoder.Source source) {
        int iMax;
        Intrinsics.g(imageDecoder, "imageDecoder");
        Intrinsics.g(imageInfo, "imageInfo");
        Intrinsics.g(source, "source");
        imageDecoder.setMutableRequired(true);
        if (i5 == 0 || i11 == 0) {
            return;
        }
        Size size = imageInfo.getSize();
        Intrinsics.f(size, "imageInfo.size");
        int width = size.getWidth();
        int height = size.getHeight();
        if (!z11 || ((i5 != 0 && width > i5) || (i11 != 0 && height > i11))) {
            if (height > i11 || width > i5) {
                if (i11 == 0) {
                    iMax = width / i5;
                } else if (i5 == 0) {
                    iMax = height / i11;
                } else {
                    int i12 = height / i11;
                    int i13 = width / i5;
                    iMax = z12 ? Math.max(i12, i13) : Math.min(i12, i13);
                }
                if (iMax == 0) {
                    iMax = 1;
                }
            }
            imageDecoder.setTargetSize(width / iMax, height / iMax);
        }
    }

    public static Bitmap a(m90.i source) throws IOException {
        Bitmap bitmapDecodeStream;
        Intrinsics.g(source, "source");
        a aVar = new a(source);
        m90.d0 d0VarR = x7.f.r(aVar);
        if (Build.VERSION.SDK_INT >= 28) {
            ImageDecoder.Source sourceCreateSource = ImageDecoder.createSource(ByteBuffer.wrap(d0VarR.L()));
            Intrinsics.f(sourceCreateSource, "createSource(ByteBuffer.…dSource.readByteArray()))");
            bitmapDecodeStream = a(sourceCreateSource, 0, 0, false, false);
        } else {
            if (d0VarR.R(0L, f66199a) && d0VarR.R(8L, f66200b)) {
                byte[] bArrL = d0VarR.L();
                bitmapDecodeStream = BitmapFactory.decodeByteArray(bArrL, 0, bArrL.length, null);
            } else {
                bitmapDecodeStream = BitmapFactory.decodeStream(new a60.b(d0VarR, 5), null, null);
            }
            if (bitmapDecodeStream == null) {
                throw new IOException("Failed to decode bitmap.");
            }
        }
        IOException iOException = aVar.f66201a;
        if (iOException == null) {
            return bitmapDecodeStream;
        }
        throw iOException;
    }
}
