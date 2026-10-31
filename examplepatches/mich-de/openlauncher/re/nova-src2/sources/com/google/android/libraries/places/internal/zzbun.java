package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
final class zzbun implements zzbci {
    private static final ThreadLocal zza = new ThreadLocal();
    private final zzavn zzb;
    private final zzavf zzc;

    public zzbun(zzavf zzavfVar, int i5) {
        zzmt.zzc(zzavfVar, "defaultInstance cannot be null");
        this.zzc = zzavfVar;
        this.zzb = zzavfVar.zzaz();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.android.libraries.places.internal.zzbci
    public final /* bridge */ /* synthetic */ InputStream zza(Object obj) {
        return new zzbum(obj, this.zzb);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v7, types: [com.google.android.libraries.places.internal.zzavf, java.lang.Object] */
    @Override // com.google.android.libraries.places.internal.zzbci
    public final /* bridge */ /* synthetic */ Object zzb(InputStream inputStream) throws IOException {
        zzasq zzasqVarZzI;
        byte[] bArr;
        if (inputStream instanceof zzbum) {
            zzbum zzbumVar = (zzbum) inputStream;
            if (zzbumVar.zzc() == this.zzb) {
                try {
                    return zzbumVar.zzb();
                } catch (IllegalStateException unused) {
                }
            }
        }
        try {
            if (inputStream instanceof zzbav) {
                int iAvailable = inputStream.available();
                if (iAvailable <= 0 || iAvailable > 4194304) {
                    if (iAvailable == 0) {
                        return this.zzc;
                    }
                    zzasqVarZzI = null;
                } else {
                    ThreadLocal threadLocal = zza;
                    Reference reference = (Reference) threadLocal.get();
                    if (reference == null || (bArr = (byte[]) reference.get()) == null || bArr.length < iAvailable) {
                        bArr = new byte[iAvailable];
                        threadLocal.set(new WeakReference(bArr));
                    }
                    int i5 = iAvailable;
                    while (i5 > 0) {
                        int i11 = inputStream.read(bArr, iAvailable - i5, i5);
                        if (i11 == -1) {
                            break;
                        }
                        i5 -= i11;
                    }
                    if (i5 != 0) {
                        throw new RuntimeException("size inaccurate: " + iAvailable + " != " + (iAvailable - i5));
                    }
                    zzasqVarZzI = zzasq.zzJ(bArr, 0, iAvailable);
                }
            } else {
                zzasqVarZzI = null;
            }
            if (zzasqVarZzI == null) {
                zzasqVarZzI = zzasq.zzI(inputStream, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            }
            zzasqVarZzI.zzG(LayoutNode.NotPlacedPlaceOrder);
            try {
                ?? Zza = this.zzb.zza(zzasqVarZzI, zzbuo.zza);
                try {
                    zzasqVarZzI.zzz(0);
                    return Zza;
                } catch (zzauf e3) {
                    e3.zzh(Zza);
                    throw e3;
                }
            } catch (zzauf e11) {
                throw new zzbdq(zzbdo.zzo.zzg("Invalid protobuf byte sequence").zzf(e11), null);
            }
        } catch (IOException e12) {
            throw new RuntimeException(e12);
        }
    }
}
