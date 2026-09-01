package com.google.protobuf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l extends j {
    @Override // com.google.protobuf.j
    public final k a(Object obj) {
        e eVar = (e) obj;
        k kVar = eVar.unknownFields;
        if (kVar != k.f) {
            return kVar;
        }
        k kVar2 = new k();
        eVar.unknownFields = kVar2;
        return kVar2;
    }
}
