package com.medium.proto.event;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.vw9;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/proto/event/PostViewedContext;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "vw9", "STANDALONE", "INLINE", "STACK", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostViewedContext implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostViewedContext[] $VALUES;
    public static final ProtoAdapter<PostViewedContext> ADAPTER;
    public static final vw9 Companion;
    private final int value;
    public static final PostViewedContext STANDALONE = new PostViewedContext("STANDALONE", 0, 1);
    public static final PostViewedContext INLINE = new PostViewedContext("INLINE", 1, 2);
    public static final PostViewedContext STACK = new PostViewedContext("STACK", 2, 3);

    private static final /* synthetic */ PostViewedContext[] $values() {
        return new PostViewedContext[]{STANDALONE, INLINE, STACK};
    }

    static {
        PostViewedContext[] postViewedContextArr$values = $values();
        $VALUES = postViewedContextArr$values;
        $ENTRIES = new i04(postViewedContextArr$values);
        Companion = new vw9();
        ADAPTER = new PostViewedContext$Companion$ADAPTER$1(n1b.a.b(PostViewedContext.class), Syntax.PROTO_2, null);
    }

    private PostViewedContext(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostViewedContext fromValue(int i) {
        Companion.getClass();
        return vw9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostViewedContext valueOf(String str) {
        return (PostViewedContext) Enum.valueOf(PostViewedContext.class, str);
    }

    public static PostViewedContext[] values() {
        return (PostViewedContext[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
