package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionColorBehavior;
import gen.model.CollectionColorPalette;
import gen.model.CollectionWithOwner;
import gen.model.ImageDisplay;
import gen.model.UserItem;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zt1 extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public ImageDisplay d;
    public String e;
    public UserItem f;
    public String g;
    public Integer h;
    public ImageDisplay i;
    public String j;
    public String k;
    public Boolean l;
    public CollectionColorPalette m;
    public CollectionColorBehavior n;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionWithOwner(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, buildUnknownFields());
    }
}
