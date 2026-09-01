package com.medium.proto.obv.post;

import com.squareup.wire.EnumAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.c6d;
import defpackage.wg6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0004\u001a\u00020\u0005H\u0014¨\u0006\u0006"}, d2 = {"com/medium/proto/obv/post/SyntaxHighlightMode$Companion$ADAPTER$1", "Lcom/squareup/wire/EnumAdapter;", "Lcom/medium/proto/obv/post/SyntaxHighlightMode;", "fromValue", "value", "", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SyntaxHighlightMode$Companion$ADAPTER$1 extends EnumAdapter<SyntaxHighlightMode> {
    public SyntaxHighlightMode$Companion$ADAPTER$1(wg6 wg6Var, Syntax syntax, SyntaxHighlightMode syntaxHighlightMode) {
        super(wg6Var, syntax, syntaxHighlightMode);
    }

    @Override // com.squareup.wire.EnumAdapter
    public final SyntaxHighlightMode fromValue(int value) {
        SyntaxHighlightMode.Companion.getClass();
        return c6d.a(value);
    }

    @Override // com.squareup.wire.EnumAdapter
    public final WireEnum fromValue(int i) {
        SyntaxHighlightMode.Companion.getClass();
        return c6d.a(i);
    }
}
