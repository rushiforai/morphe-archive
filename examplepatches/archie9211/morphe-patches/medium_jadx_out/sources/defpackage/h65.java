package defpackage;

import com.medium.proto.model.GFI;
import com.squareup.wire.Message;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h65 extends Message.Builder {
    public String a;
    public List b;
    public Integer c;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new GFI(this.a, this.b, this.c, buildUnknownFields());
    }
}
