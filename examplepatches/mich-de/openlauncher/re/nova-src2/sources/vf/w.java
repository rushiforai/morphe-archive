package vf;

import android.net.Uri;
import android.text.TextUtils;
import com.google.android.exoplayer2.upstream.FileDataSource$FileDataSourceException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

/* loaded from: classes3.dex */
public final class w extends f {

    /* renamed from: e, reason: collision with root package name */
    public RandomAccessFile f92750e;

    /* renamed from: f, reason: collision with root package name */
    public Uri f92751f;

    /* renamed from: g, reason: collision with root package name */
    public long f92752g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f92753h;

    @Override // vf.k
    public final void close() {
        this.f92751f = null;
        try {
            try {
                RandomAccessFile randomAccessFile = this.f92750e;
                if (randomAccessFile != null) {
                    randomAccessFile.close();
                }
            } catch (IOException e3) {
                throw new FileDataSource$FileDataSourceException(e3, 2000);
            }
        } finally {
            this.f92750e = null;
            if (this.f92753h) {
                this.f92753h = false;
                h();
            }
        }
    }

    @Override // vf.k
    public final Uri getUri() {
        return this.f92751f;
    }

    @Override // vf.k
    public final long open(l lVar) throws IOException {
        Uri uri = lVar.f92691a;
        long j11 = lVar.f92695e;
        this.f92751f = uri;
        i();
        try {
            String path = uri.getPath();
            path.getClass();
            RandomAccessFile randomAccessFile = new RandomAccessFile(path, "r");
            this.f92750e = randomAccessFile;
            try {
                randomAccessFile.seek(j11);
                long length = lVar.f92696f;
                if (length == -1) {
                    length = this.f92750e.length() - j11;
                }
                this.f92752g = length;
                if (length < 0) {
                    throw new FileDataSource$FileDataSourceException(null, null, 2008);
                }
                this.f92753h = true;
                j(lVar);
                return this.f92752g;
            } catch (IOException e3) {
                throw new FileDataSource$FileDataSourceException(e3, 2000);
            }
        } catch (FileNotFoundException e11) {
            if (TextUtils.isEmpty(uri.getQuery()) && TextUtils.isEmpty(uri.getFragment())) {
                throw new FileDataSource$FileDataSourceException(e11, (wf.v.f94376a < 21 || !v.b(e11.getCause())) ? 2005 : 2006);
            }
            String path2 = uri.getPath();
            String query = uri.getQuery();
            String fragment = uri.getFragment();
            StringBuilder sbW = b.c0.w("uri has query and/or fragment, which are not supported. Did you call Uri.parse() on a string containing '?' or '#'? Use Uri.fromFile(new File(path)) to avoid this. path=", path2, ",query=", query, ",fragment=");
            sbW.append(fragment);
            throw new FileDataSource$FileDataSourceException(sbW.toString(), e11, 1004);
        } catch (SecurityException e12) {
            throw new FileDataSource$FileDataSourceException(e12, 2006);
        } catch (RuntimeException e13) {
            throw new FileDataSource$FileDataSourceException(e13, 2000);
        }
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        long j11 = this.f92752g;
        if (j11 == 0) {
            return -1;
        }
        try {
            RandomAccessFile randomAccessFile = this.f92750e;
            int i12 = wf.v.f94376a;
            int i13 = randomAccessFile.read(bArr, i5, (int) Math.min(j11, i11));
            if (i13 > 0) {
                this.f92752g -= i13;
                a(i13);
            }
            return i13;
        } catch (IOException e3) {
            throw new FileDataSource$FileDataSourceException(e3, 2000);
        }
    }
}
