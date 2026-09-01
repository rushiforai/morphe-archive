package defpackage;

import com.squareup.wire.Message;
import gen.model.CardStyleHalfFeature;
import gen.model.CardStyleHeader;
import gen.model.CardStyleQuote;
import gen.model.CardStyleShortStory;
import gen.model.CardStyleStandard;
import gen.model.CollectionColors;
import gen.model.CollectionTheme;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ft1 extends Message.Builder {
    public CollectionColors a;
    public CardStyleHeader b;
    public CardStyleStandard c;
    public CardStyleHalfFeature d;
    public CardStyleQuote e;
    public CardStyleShortStory f;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionTheme(this.a, this.b, this.c, this.d, this.e, this.f, buildUnknownFields());
    }
}
