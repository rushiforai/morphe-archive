package defpackage;

import com.medium.proto.event.AnalyticsEventCommonFields;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostViewed;
import com.medium.proto.event.PostViewedContext;
import com.squareup.wire.Message;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tw9 extends Message.Builder {
    public AnalyticsEventCommonFields a;
    public String b;
    public String c;
    public String d;
    public String e;
    public PostViewedContext f;
    public Boolean g;
    public Boolean h;
    public PostClientVisibilityState i;
    public Boolean j;
    public Boolean k;
    public String l;
    public Boolean m;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PostViewed(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, buildUnknownFields());
    }
}
