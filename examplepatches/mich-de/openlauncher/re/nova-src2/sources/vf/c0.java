package vf;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.net.Uri;
import android.text.TextUtils;
import com.google.android.exoplayer2.upstream.DataSourceException;
import com.google.android.exoplayer2.upstream.RawResourceDataSource$RawResourceDataSourceException;
import h6.c1;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

/* loaded from: classes3.dex */
public final class c0 extends f {

    /* renamed from: e, reason: collision with root package name */
    public final Resources f92642e;

    /* renamed from: f, reason: collision with root package name */
    public final String f92643f;

    /* renamed from: g, reason: collision with root package name */
    public Uri f92644g;

    /* renamed from: h, reason: collision with root package name */
    public AssetFileDescriptor f92645h;

    /* renamed from: i, reason: collision with root package name */
    public FileInputStream f92646i;

    /* renamed from: j, reason: collision with root package name */
    public long f92647j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f92648k;

    public c0(Context context) {
        super(false);
        this.f92642e = context.getResources();
        this.f92643f = context.getPackageName();
    }

    public static Uri buildRawResourceUri(int i5) {
        return Uri.parse("rawresource:///" + i5);
    }

    @Override // vf.k
    public final void close() {
        this.f92644g = null;
        try {
            try {
                FileInputStream fileInputStream = this.f92646i;
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                this.f92646i = null;
                try {
                    try {
                        AssetFileDescriptor assetFileDescriptor = this.f92645h;
                        if (assetFileDescriptor != null) {
                            assetFileDescriptor.close();
                        }
                    } catch (IOException e3) {
                        throw new RawResourceDataSource$RawResourceDataSourceException(null, e3, 2000);
                    }
                } finally {
                    this.f92645h = null;
                    if (this.f92648k) {
                        this.f92648k = false;
                        h();
                    }
                }
            } catch (IOException e11) {
                throw new RawResourceDataSource$RawResourceDataSourceException(null, e11, 2000);
            }
        } catch (Throwable th2) {
            this.f92646i = null;
            try {
                try {
                    AssetFileDescriptor assetFileDescriptor2 = this.f92645h;
                    if (assetFileDescriptor2 != null) {
                        assetFileDescriptor2.close();
                    }
                    this.f92645h = null;
                    if (this.f92648k) {
                        this.f92648k = false;
                        h();
                    }
                    throw th2;
                } catch (IOException e12) {
                    throw new RawResourceDataSource$RawResourceDataSourceException(null, e12, 2000);
                }
            } finally {
                this.f92645h = null;
                if (this.f92648k) {
                    this.f92648k = false;
                    h();
                }
            }
        }
    }

    @Override // vf.k
    public final Uri getUri() {
        return this.f92644g;
    }

    /* JADX WARN: Removed duplicated region for block: B:84:0x009a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // vf.k
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long open(l lVar) throws DataSourceException, Resources.NotFoundException, NumberFormatException {
        int identifier;
        Uri uri = lVar.f92691a;
        long j11 = lVar.f92696f;
        long j12 = lVar.f92695e;
        this.f92644g = uri;
        boolean zEquals = TextUtils.equals("rawresource", uri.getScheme());
        Resources resources = this.f92642e;
        if (zEquals) {
            try {
                String lastPathSegment = uri.getLastPathSegment();
                lastPathSegment.getClass();
                identifier = Integer.parseInt(lastPathSegment);
            } catch (NumberFormatException unused) {
                throw new RawResourceDataSource$RawResourceDataSourceException("Resource identifier must be an integer.", null, 1004);
            }
        } else {
            if (TextUtils.equals("android.resource", uri.getScheme()) && uri.getPathSegments().size() == 1) {
                String lastPathSegment2 = uri.getLastPathSegment();
                lastPathSegment2.getClass();
                if (lastPathSegment2.matches("\\d+")) {
                }
            }
            if (!TextUtils.equals("android.resource", uri.getScheme())) {
                throw new RawResourceDataSource$RawResourceDataSourceException("URI must either use scheme rawresource or android.resource", null, 1004);
            }
            String path = uri.getPath();
            path.getClass();
            if (path.startsWith("/")) {
                path = path.substring(1);
            }
            String host = uri.getHost();
            identifier = resources.getIdentifier(b.c0.q(new StringBuilder(), TextUtils.isEmpty(host) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : b.c0.E(host, ":"), path), "raw", this.f92643f);
            if (identifier == 0) {
                throw new RawResourceDataSource$RawResourceDataSourceException("Resource not found.", null, 2005);
            }
        }
        i();
        try {
            AssetFileDescriptor assetFileDescriptorOpenRawResourceFd = resources.openRawResourceFd(identifier);
            this.f92645h = assetFileDescriptorOpenRawResourceFd;
            if (assetFileDescriptorOpenRawResourceFd == null) {
                throw new RawResourceDataSource$RawResourceDataSourceException(c1.p(uri, "Resource is compressed: "), null, 2000);
            }
            long length = assetFileDescriptorOpenRawResourceFd.getLength();
            FileInputStream fileInputStream = new FileInputStream(assetFileDescriptorOpenRawResourceFd.getFileDescriptor());
            this.f92646i = fileInputStream;
            try {
                if (length != -1 && j12 > length) {
                    throw new RawResourceDataSource$RawResourceDataSourceException(null, null, 2008);
                }
                long startOffset = assetFileDescriptorOpenRawResourceFd.getStartOffset();
                long jSkip = fileInputStream.skip(startOffset + j12) - startOffset;
                if (jSkip != j12) {
                    throw new RawResourceDataSource$RawResourceDataSourceException(null, null, 2008);
                }
                if (length == -1) {
                    FileChannel channel = fileInputStream.getChannel();
                    if (channel.size() == 0) {
                        this.f92647j = -1L;
                    } else {
                        long size = channel.size() - channel.position();
                        this.f92647j = size;
                        if (size < 0) {
                            throw new RawResourceDataSource$RawResourceDataSourceException(null, null, 2008);
                        }
                    }
                } else {
                    long j13 = length - jSkip;
                    this.f92647j = j13;
                    if (j13 < 0) {
                        throw new DataSourceException(2008);
                    }
                }
                if (j11 != -1) {
                    long j14 = this.f92647j;
                    this.f92647j = j14 == -1 ? j11 : Math.min(j14, j11);
                }
                this.f92648k = true;
                j(lVar);
                return j11 != -1 ? j11 : this.f92647j;
            } catch (RawResourceDataSource$RawResourceDataSourceException e3) {
                throw e3;
            } catch (IOException e11) {
                throw new RawResourceDataSource$RawResourceDataSourceException(null, e11, 2000);
            }
        } catch (Resources.NotFoundException e12) {
            throw new RawResourceDataSource$RawResourceDataSourceException(null, e12, 2005);
        }
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        long j11 = this.f92647j;
        if (j11 != 0) {
            if (j11 != -1) {
                try {
                    i11 = (int) Math.min(j11, i11);
                } catch (IOException e3) {
                    throw new RawResourceDataSource$RawResourceDataSourceException(null, e3, 2000);
                }
            }
            FileInputStream fileInputStream = this.f92646i;
            int i12 = wf.v.f94376a;
            int i13 = fileInputStream.read(bArr, i5, i11);
            if (i13 != -1) {
                long j12 = this.f92647j;
                if (j12 != -1) {
                    this.f92647j = j12 - i13;
                }
                a(i13);
                return i13;
            }
            if (this.f92647j != -1) {
                throw new RawResourceDataSource$RawResourceDataSourceException("End of stream reached having not read sufficient data.", new EOFException(), 2000);
            }
        }
        return -1;
    }
}
