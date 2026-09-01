package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionColors;
import gen.model.Color;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class er1 extends Message.Builder {
    public Color a;
    public Color b;
    public Color c;
    public Color d;
    public Color e;
    public Color f;
    public Color g;
    public Color h;
    public Color i;
    public Color j;
    public Color k;
    public Color l;
    public Color m;
    public Color n;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionColors(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, buildUnknownFields());
    }
}
