package defpackage;

import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;
import gen.model.Catalog;
import gen.model.CatalogType;
import gen.model.CatalogVisibility;
import gen.model.ImageMetadata;
import gen.model.PredefinedCatalogKind;
import gen.model.User;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q71 extends Message.Builder {
    public String a;
    public String b;
    public User c;
    public Long d;
    public Long e;
    public String f;
    public String g;
    public ImageMetadata h;
    public Long i;
    public String j;
    public Long k;
    public CatalogVisibility l;
    public Boolean m;
    public CatalogType n;
    public String o;
    public PredefinedCatalogKind p;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        String str = this.a;
        if (str == null) {
            Internal.missingRequiredFields(str, "catalog_id");
            throw null;
        }
        String str2 = this.b;
        if (str2 == null) {
            Internal.missingRequiredFields(str2, "creator_id");
            throw null;
        }
        User user = this.c;
        Long l = this.d;
        if (l != null) {
            return new Catalog(str, str2, user, l.longValue(), this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, buildUnknownFields());
        }
        Internal.missingRequiredFields(l, "created_at");
        throw null;
    }
}
