package vf;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.Bundle;
import com.google.android.exoplayer2.upstream.ContentDataSource$ContentDataSourceException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.channels.FileChannel;

/* loaded from: classes3.dex */
public final class g extends f {

    /* renamed from: e, reason: collision with root package name */
    public final ContentResolver f92671e;

    /* renamed from: f, reason: collision with root package name */
    public Uri f92672f;

    /* renamed from: g, reason: collision with root package name */
    public AssetFileDescriptor f92673g;

    /* renamed from: h, reason: collision with root package name */
    public FileInputStream f92674h;

    /* renamed from: i, reason: collision with root package name */
    public long f92675i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f92676j;

    public g(Context context) {
        super(false);
        this.f92671e = context.getContentResolver();
    }

    @Override // vf.k
    public final void close() {
        this.f92672f = null;
        try {
            try {
                FileInputStream fileInputStream = this.f92674h;
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                this.f92674h = null;
                try {
                    try {
                        AssetFileDescriptor assetFileDescriptor = this.f92673g;
                        if (assetFileDescriptor != null) {
                            assetFileDescriptor.close();
                        }
                    } catch (IOException e3) {
                        throw new ContentDataSource$ContentDataSourceException(e3, 2000);
                    }
                } finally {
                    this.f92673g = null;
                    if (this.f92676j) {
                        this.f92676j = false;
                        h();
                    }
                }
            } catch (IOException e11) {
                throw new ContentDataSource$ContentDataSourceException(e11, 2000);
            }
        } catch (Throwable th2) {
            this.f92674h = null;
            try {
                try {
                    AssetFileDescriptor assetFileDescriptor2 = this.f92673g;
                    if (assetFileDescriptor2 != null) {
                        assetFileDescriptor2.close();
                    }
                    this.f92673g = null;
                    if (this.f92676j) {
                        this.f92676j = false;
                        h();
                    }
                    throw th2;
                } catch (IOException e12) {
                    throw new ContentDataSource$ContentDataSourceException(e12, 2000);
                }
            } finally {
                this.f92673g = null;
                if (this.f92676j) {
                    this.f92676j = false;
                    h();
                }
            }
        }
    }

    @Override // vf.k
    public final Uri getUri() {
        return this.f92672f;
    }

    @Override // vf.k
    public final long open(l lVar) throws IOException {
        int i5;
        AssetFileDescriptor assetFileDescriptorOpenAssetFileDescriptor;
        try {
            try {
                Uri uri = lVar.f92691a;
                long j11 = lVar.f92696f;
                long j12 = lVar.f92695e;
                this.f92672f = uri;
                i();
                boolean zEquals = "content".equals(lVar.f92691a.getScheme());
                ContentResolver contentResolver = this.f92671e;
                if (zEquals) {
                    Bundle bundle = new Bundle();
                    bundle.putBoolean("android.provider.extra.ACCEPT_ORIGINAL_MEDIA_FORMAT", true);
                    assetFileDescriptorOpenAssetFileDescriptor = contentResolver.openTypedAssetFileDescriptor(uri, "*/*", bundle);
                } else {
                    assetFileDescriptorOpenAssetFileDescriptor = contentResolver.openAssetFileDescriptor(uri, "r");
                }
                this.f92673g = assetFileDescriptorOpenAssetFileDescriptor;
                if (assetFileDescriptorOpenAssetFileDescriptor == null) {
                    i5 = 2000;
                    try {
                        throw new ContentDataSource$ContentDataSourceException(new IOException("Could not open file descriptor for: " + uri), 2000);
                    } catch (IOException e3) {
                        e = e3;
                        if (e instanceof FileNotFoundException) {
                            i5 = 2005;
                        }
                        throw new ContentDataSource$ContentDataSourceException(e, i5);
                    }
                }
                long length = assetFileDescriptorOpenAssetFileDescriptor.getLength();
                FileInputStream fileInputStream = new FileInputStream(assetFileDescriptorOpenAssetFileDescriptor.getFileDescriptor());
                this.f92674h = fileInputStream;
                if (length != -1 && j12 > length) {
                    throw new ContentDataSource$ContentDataSourceException(null, 2008);
                }
                long startOffset = assetFileDescriptorOpenAssetFileDescriptor.getStartOffset();
                long jSkip = fileInputStream.skip(startOffset + j12) - startOffset;
                if (jSkip != j12) {
                    throw new ContentDataSource$ContentDataSourceException(null, 2008);
                }
                if (length == -1) {
                    FileChannel channel = fileInputStream.getChannel();
                    long size = channel.size();
                    if (size == 0) {
                        this.f92675i = -1L;
                    } else {
                        long jPosition = size - channel.position();
                        this.f92675i = jPosition;
                        if (jPosition < 0) {
                            throw new ContentDataSource$ContentDataSourceException(null, 2008);
                        }
                    }
                } else {
                    long j13 = length - jSkip;
                    this.f92675i = j13;
                    if (j13 < 0) {
                        throw new ContentDataSource$ContentDataSourceException(null, 2008);
                    }
                }
                if (j11 != -1) {
                    long j14 = this.f92675i;
                    this.f92675i = j14 == -1 ? j11 : Math.min(j14, j11);
                }
                this.f92676j = true;
                j(lVar);
                return j11 != -1 ? j11 : this.f92675i;
            } catch (IOException e11) {
                e = e11;
                i5 = 2000;
            }
        } catch (ContentDataSource$ContentDataSourceException e12) {
            throw e12;
        }
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        long j11 = this.f92675i;
        if (j11 != 0) {
            if (j11 != -1) {
                try {
                    i11 = (int) Math.min(j11, i11);
                } catch (IOException e3) {
                    throw new ContentDataSource$ContentDataSourceException(e3, 2000);
                }
            }
            FileInputStream fileInputStream = this.f92674h;
            int i12 = wf.v.f94376a;
            int i13 = fileInputStream.read(bArr, i5, i11);
            if (i13 != -1) {
                long j12 = this.f92675i;
                if (j12 != -1) {
                    this.f92675i = j12 - i13;
                }
                a(i13);
                return i13;
            }
        }
        return -1;
    }
}
