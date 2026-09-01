package defpackage;

import com.squareup.wire.Message;
import gen.model.MediaResource;
import gen.model.MediaResourceCharted;
import gen.model.MediaResourceDisplay;
import gen.model.MediaResourceExternalLink;
import gen.model.MediaResourceGist;
import gen.model.MediaResourceMediumCatalog;
import gen.model.MediaResourceMediumCollection;
import gen.model.MediaResourceMediumPost;
import gen.model.MediaResourceMediumQuote;
import gen.model.MediaResourceMoment;
import gen.model.MediaResourceSuper;
import gen.model.MediaResourceTweet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xl7 extends Message.Builder {
    public String A;
    public String a;
    public String b;
    public String c;
    public String d;
    public String e;
    public MediaResourceMediumPost f;
    public String g;
    public MediaResourceExternalLink h;
    public Integer i;
    public MediaResourceTweet j;
    public Integer k;
    public MediaResourceGist l;
    public String m;
    public MediaResourceSuper n;
    public String o;
    public MediaResourceCharted p;
    public Integer q;
    public MediaResourceMediumCollection r;
    public Integer s;
    public MediaResourceMediumCatalog t;
    public MediaResourceDisplay u;
    public String v;
    public String w;
    public MediaResourceMediumQuote x;
    public MediaResourceMoment y;
    public String z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new MediaResource(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, buildUnknownFields());
    }
}
