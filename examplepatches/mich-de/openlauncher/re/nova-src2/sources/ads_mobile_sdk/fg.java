package ads_mobile_sdk;

import java.io.IOException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;

/* loaded from: classes.dex */
public final class fg implements b.b2 {

    /* renamed from: a, reason: collision with root package name */
    public final FileChannel f3342a;

    /* renamed from: b, reason: collision with root package name */
    public final long f3343b;

    /* renamed from: c, reason: collision with root package name */
    public final long f3344c;

    public fg(FileChannel fileChannel, long j11, long j12) {
        this.f3342a = fileChannel;
        this.f3343b = j11;
        this.f3344c = j12;
    }

    @Override // b.b2
    public final void a(MessageDigest[] messageDigestArr, long j11, int i5) throws IOException {
        MappedByteBuffer map = this.f3342a.map(FileChannel.MapMode.READ_ONLY, this.f3343b + j11, i5);
        map.load();
        for (MessageDigest messageDigest : messageDigestArr) {
            map.position(0);
            messageDigest.update(map);
        }
    }

    @Override // b.b2
    public final long size() {
        return this.f3344c;
    }
}
