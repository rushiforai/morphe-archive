package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionUserRelationItem;
import gen.model.CollectionWithOwner;
import gen.model.UserItem;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tt1 extends Message.Builder {
    public String a;
    public CollectionWithOwner b;
    public String c;
    public UserItem d;
    public String e;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionUserRelationItem(this.a, this.b, this.c, this.d, this.e, buildUnknownFields());
    }
}
