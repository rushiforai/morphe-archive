package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

import androidx.recyclerview.widget.u1;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: g, reason: collision with root package name */
    public static final byte[] f29130g = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f29131a;

    /* renamed from: b, reason: collision with root package name */
    public final long f29132b;

    /* renamed from: c, reason: collision with root package name */
    public long f29133c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f29134d = new byte[SQLiteDatabase.OPEN_FULLMUTEX];

    /* renamed from: e, reason: collision with root package name */
    public int f29135e;

    /* renamed from: f, reason: collision with root package name */
    public int f29136f;

    public b(com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar, long j11, long j12) {
        this.f29131a = hVar;
        this.f29133c = j11;
        this.f29132b = j12;
    }

    public final boolean a(byte[] bArr, int i5, int i11, boolean z11) {
        if (!a(i11, z11)) {
            return false;
        }
        System.arraycopy(this.f29134d, this.f29135e - i11, bArr, i5, i11);
        return true;
    }

    public final boolean b(byte[] bArr, int i5, int i11, boolean z11) throws InterruptedException, EOFException {
        int iA;
        int i12 = this.f29136f;
        if (i12 == 0) {
            iA = 0;
        } else {
            int iMin = Math.min(i12, i11);
            System.arraycopy(this.f29134d, 0, bArr, i5, iMin);
            b(iMin);
            iA = iMin;
        }
        while (iA < i11 && iA != -1) {
            iA = a(bArr, i5, i11, iA, z11);
        }
        if (iA != -1) {
            this.f29133c += iA;
        }
        return iA != -1;
    }

    public final boolean a(int i5, boolean z11) throws InterruptedException, EOFException {
        int i11 = this.f29135e + i5;
        byte[] bArr = this.f29134d;
        if (i11 > bArr.length) {
            int length = bArr.length * 2;
            int i12 = SQLiteDatabase.OPEN_FULLMUTEX + i11;
            int i13 = z.f30489a;
            this.f29134d = Arrays.copyOf(this.f29134d, Math.max(i12, Math.min(length, i11 + 524288)));
        }
        int iMin = Math.min(this.f29136f - this.f29135e, i5);
        while (iMin < i5) {
            int i14 = i5;
            boolean z12 = z11;
            iMin = a(this.f29134d, this.f29135e, i14, iMin, z12);
            if (iMin == -1) {
                return false;
            }
            i5 = i14;
            z11 = z12;
        }
        int i15 = this.f29135e + i5;
        this.f29135e = i15;
        this.f29136f = Math.max(this.f29136f, i15);
        return true;
    }

    public final void b(int i5) {
        int i11 = this.f29136f - i5;
        this.f29136f = i11;
        this.f29135e = 0;
        byte[] bArr = this.f29134d;
        byte[] bArr2 = i11 < bArr.length - 524288 ? new byte[SQLiteDatabase.OPEN_FULLMUTEX + i11] : bArr;
        System.arraycopy(bArr, i5, bArr2, 0, i11);
        this.f29134d = bArr2;
    }

    public final void a(int i5) throws InterruptedException, EOFException {
        int iMin = Math.min(this.f29136f, i5);
        b(iMin);
        int iA = iMin;
        while (iA < i5 && iA != -1) {
            iA = a(f29130g, -iA, Math.min(i5, iA + u1.FLAG_APPEARED_IN_PRE_LAYOUT), iA, false);
        }
        if (iA != -1) {
            this.f29133c += iA;
        }
    }

    public final int a(byte[] bArr, int i5, int i11, int i12, boolean z11) throws InterruptedException, EOFException {
        if (!Thread.interrupted()) {
            int i13 = this.f29131a.read(bArr, i5 + i12, i11 - i12);
            if (i13 != -1) {
                return i12 + i13;
            }
            if (i12 == 0 && z11) {
                return -1;
            }
            throw new EOFException();
        }
        throw new InterruptedException();
    }
}
