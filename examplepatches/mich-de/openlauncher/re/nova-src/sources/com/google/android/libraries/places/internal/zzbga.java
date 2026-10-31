package com.google.android.libraries.places.internal;

import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
final class zzbga implements zzbgc {
    @Override // com.google.android.libraries.places.internal.zzbgd
    public final /* bridge */ /* synthetic */ int zza(zzbnv zzbnvVar, int i5, Object obj, int i11) {
        ByteBuffer byteBuffer = (ByteBuffer) obj;
        int iLimit = byteBuffer.limit();
        byteBuffer.limit(byteBuffer.position() + i5);
        zzbnvVar.zzi(byteBuffer);
        byteBuffer.limit(iLimit);
        return 0;
    }
}
