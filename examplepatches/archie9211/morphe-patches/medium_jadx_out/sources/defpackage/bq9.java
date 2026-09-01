package defpackage;

import com.medium.proto.event.AnalyticsEventCommonFields;
import com.medium.proto.event.PostStreamScrolled;
import com.squareup.wire.Message;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bq9 extends Message.Builder {
    public AnalyticsEventCommonFields a;
    public List b;
    public List c;
    public List d;
    public List e;
    public Long f;
    public Integer g;
    public Integer h;
    public Long i;
    public List j;
    public List k;
    public String l;
    public List m;
    public Boolean n;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PostStreamScrolled(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, buildUnknownFields());
    }
}
