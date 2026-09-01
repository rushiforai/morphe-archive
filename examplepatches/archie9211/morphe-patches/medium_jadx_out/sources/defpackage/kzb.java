package defpackage;

import com.medium.proto.model.SequenceColorPalette;
import com.squareup.wire.Message;
import gen.model.ImageMetadata;
import gen.model.Sequence;
import gen.model.SequencePostLabelMode;
import gen.model.SequenceVisibility;
import gen.model.User;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kzb extends Message.Builder {
    public String A;
    public User B;
    public String a;
    public String b;
    public Long c;
    public Long d;
    public Long e;
    public SequencePostLabelMode f;
    public ImageMetadata g;
    public ImageMetadata h;
    public ImageMetadata i;
    public Boolean j;
    public String k;
    public String l;
    public String m;
    public String n;
    public List o;
    public String p;
    public String q;
    public String r;
    public String s;
    public SequenceColorPalette t;
    public SequenceVisibility u;
    public Boolean v;
    public Boolean w;
    public String x;
    public Boolean y;
    public List z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new Sequence(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, this.B, buildUnknownFields());
    }
}
