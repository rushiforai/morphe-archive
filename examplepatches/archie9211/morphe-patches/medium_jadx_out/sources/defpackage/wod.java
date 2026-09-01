package defpackage;

import com.squareup.wire.Message;
import gen.model.ImageMetadata;
import gen.model.Topic;
import gen.model.TopicUpdateSchedule;
import gen.model.TopicVisibility;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wod extends Message.Builder {
    public String a;
    public String b;
    public Long c;
    public Long d;
    public ImageMetadata e;
    public String f;
    public String g;
    public Boolean h;
    public List i;
    public List j;
    public TopicVisibility k;
    public String l;
    public String m;
    public String n;
    public TopicUpdateSchedule o;
    public Long p;
    public List q;
    public String r;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new Topic(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, buildUnknownFields());
    }
}
