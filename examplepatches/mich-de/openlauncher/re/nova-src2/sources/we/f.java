package we;

import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class f extends ie.f {

    /* renamed from: i, reason: collision with root package name */
    public long f94239i;

    /* renamed from: j, reason: collision with root package name */
    public int f94240j;

    /* renamed from: k, reason: collision with root package name */
    public int f94241k;

    @Override // ie.f
    public final void q() {
        super.q();
        this.f94240j = 0;
    }

    public final boolean w(ie.f fVar) {
        ByteBuffer byteBuffer;
        wf.a.e(!fVar.d(1073741824));
        wf.a.e(!fVar.d(268435456));
        wf.a.e(!fVar.d(4));
        int i5 = this.f94240j;
        if (i5 > 0) {
            if (i5 >= this.f94241k || fVar.d(Integer.MIN_VALUE) != d(Integer.MIN_VALUE)) {
                return false;
            }
            ByteBuffer byteBuffer2 = fVar.f61580d;
            if (byteBuffer2 != null && (byteBuffer = this.f61580d) != null) {
                if (byteBuffer2.remaining() + byteBuffer.position() > 3072000) {
                    return false;
                }
            }
        }
        int i11 = this.f94240j;
        this.f94240j = i11 + 1;
        if (i11 == 0) {
            this.f61582f = fVar.f61582f;
            if (fVar.d(1)) {
                this.f61556b = 1;
            }
        }
        if (fVar.d(Integer.MIN_VALUE)) {
            this.f61556b = Integer.MIN_VALUE;
        }
        ByteBuffer byteBuffer3 = fVar.f61580d;
        if (byteBuffer3 != null) {
            u(byteBuffer3.remaining());
            this.f61580d.put(byteBuffer3);
        }
        this.f94239i = fVar.f61582f;
        return true;
    }
}
