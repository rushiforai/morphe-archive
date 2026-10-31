package com.fyber.inneractive.sdk.player.exoplayer2.source;

import java.io.EOFException;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.i[] f30200a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.j f30201b;

    /* renamed from: c, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.i f30202c;

    public n(com.fyber.inneractive.sdk.player.exoplayer2.extractor.i[] iVarArr, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        this.f30200a = iVarArr;
        this.f30201b = jVar;
    }

    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.i a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws a0 {
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.i iVar = this.f30202c;
        if (iVar != null) {
            return iVar;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.i[] iVarArr = this.f30200a;
        int length = iVarArr.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.i iVar2 = iVarArr[i5];
            try {
            } catch (EOFException unused) {
            } catch (Throwable th2) {
                bVar.f29135e = 0;
                throw th2;
            }
            if (iVar2.a(bVar)) {
                this.f30202c = iVar2;
                bVar.f29135e = 0;
                break;
            }
            continue;
            bVar.f29135e = 0;
            i5++;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.i iVar3 = this.f30202c;
        if (iVar3 != null) {
            iVar3.a(this.f30201b);
            return this.f30202c;
        }
        StringBuilder sb2 = new StringBuilder("None of the available extractors (");
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.i[] iVarArr2 = this.f30200a;
        int i11 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
        StringBuilder sb3 = new StringBuilder();
        for (int i12 = 0; i12 < iVarArr2.length; i12++) {
            sb3.append(iVarArr2[i12].getClass().getSimpleName());
            if (i12 < iVarArr2.length - 1) {
                sb3.append(", ");
            }
        }
        sb2.append(sb3.toString());
        sb2.append(") could read the stream.");
        throw new a0(sb2.toString());
    }
}
