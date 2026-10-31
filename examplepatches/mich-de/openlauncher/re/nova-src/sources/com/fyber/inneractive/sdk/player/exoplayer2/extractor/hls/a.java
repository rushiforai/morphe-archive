package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls;

import android.net.Uri;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes3.dex */
public final class a implements com.fyber.inneractive.sdk.player.exoplayer2.upstream.h {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f29195a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f29196b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f29197c;

    /* renamed from: d, reason: collision with root package name */
    public CipherInputStream f29198d;

    public a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar, byte[] bArr, byte[] bArr2) {
        this.f29195a = hVar;
        this.f29196b = bArr;
        this.f29197c = bArr2;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding");
            try {
                cipher.init(2, new SecretKeySpec(this.f29196b, "AES"), new IvParameterSpec(this.f29197c));
                this.f29198d = new CipherInputStream(new com.fyber.inneractive.sdk.player.exoplayer2.upstream.j(this.f29195a, kVar), cipher);
                return -1L;
            } catch (InvalidAlgorithmParameterException | InvalidKeyException e3) {
                throw new RuntimeException(e3);
            }
        } catch (NoSuchAlgorithmException | NoSuchPaddingException e11) {
            throw new RuntimeException(e11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() {
        this.f29198d = null;
        this.f29195a.close();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        CipherInputStream cipherInputStream = this.f29198d;
        if (cipherInputStream == null) {
            throw new IllegalStateException();
        }
        int i12 = cipherInputStream.read(bArr, i5, i11);
        if (i12 < 0) {
            return -1;
        }
        return i12;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final Uri a() {
        return this.f29195a.a();
    }
}
