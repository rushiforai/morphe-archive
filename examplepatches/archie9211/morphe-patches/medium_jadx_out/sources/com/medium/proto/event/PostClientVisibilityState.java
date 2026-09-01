package com.medium.proto.event;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.af9;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/proto/event/PostClientVisibilityState;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "af9", "PUBLIC", "UNLISTED", "LOCKED_MEMBER", "LOCKED_PREVIEW", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostClientVisibilityState implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostClientVisibilityState[] $VALUES;
    public static final ProtoAdapter<PostClientVisibilityState> ADAPTER;
    public static final af9 Companion;
    public static final PostClientVisibilityState LOCKED_MEMBER;
    public static final PostClientVisibilityState LOCKED_PREVIEW;
    public static final PostClientVisibilityState PUBLIC;
    public static final PostClientVisibilityState UNLISTED;
    private final int value;

    private static final /* synthetic */ PostClientVisibilityState[] $values() {
        return new PostClientVisibilityState[]{PUBLIC, UNLISTED, LOCKED_MEMBER, LOCKED_PREVIEW};
    }

    static {
        PostClientVisibilityState postClientVisibilityState = new PostClientVisibilityState("PUBLIC", 0, 0);
        PUBLIC = postClientVisibilityState;
        UNLISTED = new PostClientVisibilityState("UNLISTED", 1, 1);
        LOCKED_MEMBER = new PostClientVisibilityState("LOCKED_MEMBER", 2, 2);
        LOCKED_PREVIEW = new PostClientVisibilityState("LOCKED_PREVIEW", 3, 3);
        PostClientVisibilityState[] postClientVisibilityStateArr$values = $values();
        $VALUES = postClientVisibilityStateArr$values;
        $ENTRIES = new i04(postClientVisibilityStateArr$values);
        Companion = new af9();
        ADAPTER = new PostClientVisibilityState$Companion$ADAPTER$1(n1b.a.b(PostClientVisibilityState.class), Syntax.PROTO_2, postClientVisibilityState);
    }

    private PostClientVisibilityState(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostClientVisibilityState fromValue(int i) {
        Companion.getClass();
        return af9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostClientVisibilityState valueOf(String str) {
        return (PostClientVisibilityState) Enum.valueOf(PostClientVisibilityState.class, str);
    }

    public static PostClientVisibilityState[] values() {
        return (PostClientVisibilityState[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
