package com.fyber.inneractive.sdk.player.cache;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;

/* loaded from: classes3.dex */
public final class j extends ByteArrayOutputStream {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ k f28866a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, int i5) {
        super(i5);
        this.f28866a = kVar;
    }

    @Override // java.io.ByteArrayOutputStream
    public final String toString() {
        int i5 = ((ByteArrayOutputStream) this).count;
        if (i5 > 0) {
            int i11 = i5 - 1;
            if (((ByteArrayOutputStream) this).buf[i11] == 13) {
                i5 = i11;
            }
        }
        try {
            return new String(((ByteArrayOutputStream) this).buf, 0, i5, this.f28866a.f28868b.name());
        } catch (UnsupportedEncodingException e3) {
            throw new AssertionError(e3);
        }
    }
}
