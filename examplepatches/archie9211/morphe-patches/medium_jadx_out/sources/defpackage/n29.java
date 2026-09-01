package defpackage;

import com.medium.proto.model.CodeBlockMetadata;
import com.medium.proto.model.IframeMetadata;
import com.medium.proto.model.MixtapeMetadata;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.obv.post.Alignment;
import com.medium.proto.obv.post.BlockLayout;
import com.medium.proto.obv.post.ParagraphPurpose;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.proto.obv.post.TranslationStatus;
import com.squareup.wire.Message;
import gen.model.ImageMetadata;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n29 extends Message.Builder {
    public String a;
    public ParagraphType b;
    public String c;
    public List d = ey3.a;
    public BlockLayout e;
    public String f;
    public ImageMetadata g;
    public IframeMetadata h;
    public Boolean i;
    public Alignment j;
    public String k;
    public MixtapeMetadata l;
    public TranslationStatus m;
    public ImageMetadata n;
    public ParagraphPurpose o;
    public String p;
    public String q;
    public CodeBlockMetadata r;

    @Override // com.squareup.wire.Message.Builder
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final ParagraphPb build() {
        return new ParagraphPb(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, buildUnknownFields());
    }
}
