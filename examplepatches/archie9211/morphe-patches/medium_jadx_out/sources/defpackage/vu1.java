package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionColorType;
import gen.model.ColorCombination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vu1 extends Message.Builder {
    public String a;
    public CollectionColorType b;
    public CollectionColorType c;
    public CollectionColorType d;
    public CollectionColorType e;
    public CollectionColorType f;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new ColorCombination(this.a, this.b, this.c, this.d, this.e, this.f, buildUnknownFields());
    }
}
