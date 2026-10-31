package vf;

import android.content.Context;
import android.content.res.AssetManager;
import android.net.Uri;
import com.google.android.exoplayer2.upstream.AssetDataSource$AssetDataSourceException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public final class b extends f {

    /* renamed from: e, reason: collision with root package name */
    public final AssetManager f92628e;

    /* renamed from: f, reason: collision with root package name */
    public Uri f92629f;

    /* renamed from: g, reason: collision with root package name */
    public InputStream f92630g;

    /* renamed from: h, reason: collision with root package name */
    public long f92631h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f92632i;

    public b(Context context) {
        super(false);
        this.f92628e = context.getAssets();
    }

    @Override // vf.k
    public final void close() {
        this.f92629f = null;
        try {
            try {
                InputStream inputStream = this.f92630g;
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e3) {
                throw new AssetDataSource$AssetDataSourceException(e3, 2000);
            }
        } finally {
            this.f92630g = null;
            if (this.f92632i) {
                this.f92632i = false;
                h();
            }
        }
    }

    @Override // vf.k
    public final Uri getUri() {
        return this.f92629f;
    }

    @Override // vf.k
    public final long open(l lVar) throws IOException {
        try {
            Uri uri = lVar.f92691a;
            long j11 = lVar.f92695e;
            this.f92629f = uri;
            String path = uri.getPath();
            path.getClass();
            if (path.startsWith("/android_asset/")) {
                path = path.substring(15);
            } else if (path.startsWith("/")) {
                path = path.substring(1);
            }
            i();
            InputStream inputStreamOpen = this.f92628e.open(path, 1);
            this.f92630g = inputStreamOpen;
            if (inputStreamOpen.skip(j11) < j11) {
                throw new AssetDataSource$AssetDataSourceException(null, 2008);
            }
            long j12 = lVar.f92696f;
            if (j12 != -1) {
                this.f92631h = j12;
            } else {
                long jAvailable = this.f92630g.available();
                this.f92631h = jAvailable;
                if (jAvailable == 2147483647L) {
                    this.f92631h = -1L;
                }
            }
            this.f92632i = true;
            j(lVar);
            return this.f92631h;
        } catch (AssetDataSource$AssetDataSourceException e3) {
            throw e3;
        } catch (IOException e11) {
            throw new AssetDataSource$AssetDataSourceException(e11, e11 instanceof FileNotFoundException ? 2005 : 2000);
        }
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        long j11 = this.f92631h;
        if (j11 != 0) {
            if (j11 != -1) {
                try {
                    i11 = (int) Math.min(j11, i11);
                } catch (IOException e3) {
                    throw new AssetDataSource$AssetDataSourceException(e3, 2000);
                }
            }
            InputStream inputStream = this.f92630g;
            int i12 = wf.v.f94376a;
            int i13 = inputStream.read(bArr, i5, i11);
            if (i13 != -1) {
                long j12 = this.f92631h;
                if (j12 != -1) {
                    this.f92631h = j12 - i13;
                }
                a(i13);
                return i13;
            }
        }
        return -1;
    }
}
