package defpackage;

import com.squareup.wire.Message;
import gen.model.PageParams;
import gen.model.Paging;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zz8 extends Message.Builder {
    public String a;
    public PageParams b;
    public PageParams c;
    public String d;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new Paging(this.a, this.b, this.c, this.d, buildUnknownFields());
    }
}
