package defpackage;

import com.squareup.wire.Message;
import java.util.List;
import scalapb.options.FieldOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sf4 extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public String d;
    public String e;
    public List f;
    public Boolean g;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new FieldOptions(this.a, this.b, this.c, this.d, this.e, this.f, this.g, buildUnknownFields());
    }
}
