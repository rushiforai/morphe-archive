package defpackage;

import com.medium.proto.model.MarkupModel;
import com.medium.proto.obv.post.AnchorType;
import com.medium.proto.obv.post.MarkupType;
import com.squareup.wire.Message;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class li7 extends Message.Builder {
    public MarkupType a;
    public Integer b;
    public Integer c;
    public String d;
    public String e;
    public String f;
    public AnchorType g;
    public String h;
    public String i;
    public List j = ey3.a;
    public String k;

    @Override // com.squareup.wire.Message.Builder
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final MarkupModel build() {
        return new MarkupModel(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, buildUnknownFields());
    }
}
