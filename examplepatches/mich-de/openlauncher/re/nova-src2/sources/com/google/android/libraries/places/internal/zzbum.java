package com.google.android.libraries.places.internal;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes3.dex */
final class zzbum extends InputStream implements zzazr, zzbav {
    private zzavf zza;
    private final zzavn zzb;
    private ByteArrayInputStream zzc;

    public zzbum(zzavf zzavfVar, zzavn zzavnVar) {
        this.zza = zzavfVar;
        this.zzb = zzavnVar;
    }

    @Override // java.io.InputStream
    public final int available() {
        zzavf zzavfVar = this.zza;
        if (zzavfVar != null) {
            return zzavfVar.zzaq();
        }
        ByteArrayInputStream byteArrayInputStream = this.zzc;
        if (byteArrayInputStream != null) {
            return byteArrayInputStream.available();
        }
        return 0;
    }

    @Override // java.io.InputStream
    public final int read() {
        zzavf zzavfVar = this.zza;
        if (zzavfVar != null) {
            this.zzc = new ByteArrayInputStream(zzavfVar.zzao());
            this.zza = null;
        }
        ByteArrayInputStream byteArrayInputStream = this.zzc;
        if (byteArrayInputStream != null) {
            return byteArrayInputStream.read();
        }
        return -1;
    }

    @Override // com.google.android.libraries.places.internal.zzazr
    public final int zza(OutputStream outputStream) throws IOException {
        zzavf zzavfVar = this.zza;
        if (zzavfVar != null) {
            int iZzaq = zzavfVar.zzaq();
            this.zza.zzan(outputStream);
            this.zza = null;
            return iZzaq;
        }
        ByteArrayInputStream byteArrayInputStream = this.zzc;
        if (byteArrayInputStream == null) {
            return 0;
        }
        zzmt.zzc(outputStream, "outputStream cannot be null!");
        byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        long j11 = 0;
        while (true) {
            int i5 = byteArrayInputStream.read(bArr);
            if (i5 == -1) {
                int i11 = (int) j11;
                this.zzc = null;
                return i11;
            }
            outputStream.write(bArr, 0, i5);
            j11 += i5;
        }
    }

    public final zzavf zzb() {
        zzavf zzavfVar = this.zza;
        if (zzavfVar != null) {
            return zzavfVar;
        }
        throw new IllegalStateException("message not available");
    }

    public final zzavn zzc() {
        return this.zzb;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        zzavf zzavfVar = this.zza;
        if (zzavfVar != null) {
            int iZzaq = zzavfVar.zzaq();
            if (iZzaq == 0) {
                this.zza = null;
                this.zzc = null;
                return -1;
            }
            if (i11 >= iZzaq) {
                zzasx zzasxVarZzD = zzasx.zzD(bArr, i5, iZzaq);
                this.zza.zzaK(zzasxVarZzD);
                zzasxVarZzD.zzE();
                this.zza = null;
                this.zzc = null;
                return iZzaq;
            }
            this.zzc = new ByteArrayInputStream(this.zza.zzao());
            this.zza = null;
        }
        ByteArrayInputStream byteArrayInputStream = this.zzc;
        if (byteArrayInputStream != null) {
            return byteArrayInputStream.read(bArr, i5, i11);
        }
        return -1;
    }
}
