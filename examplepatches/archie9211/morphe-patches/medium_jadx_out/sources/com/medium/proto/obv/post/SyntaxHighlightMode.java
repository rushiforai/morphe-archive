package com.medium.proto.obv.post;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.c6d;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/proto/obv/post/SyntaxHighlightMode;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "c6d", "DISABLED", "AUTO", "EXPLICIT", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SyntaxHighlightMode implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SyntaxHighlightMode[] $VALUES;
    public static final ProtoAdapter<SyntaxHighlightMode> ADAPTER;
    public static final SyntaxHighlightMode AUTO;
    public static final c6d Companion;
    public static final SyntaxHighlightMode DISABLED;
    public static final SyntaxHighlightMode EXPLICIT;
    private final int value;

    private static final /* synthetic */ SyntaxHighlightMode[] $values() {
        return new SyntaxHighlightMode[]{DISABLED, AUTO, EXPLICIT};
    }

    static {
        SyntaxHighlightMode syntaxHighlightMode = new SyntaxHighlightMode("DISABLED", 0, 0);
        DISABLED = syntaxHighlightMode;
        AUTO = new SyntaxHighlightMode("AUTO", 1, 1);
        EXPLICIT = new SyntaxHighlightMode("EXPLICIT", 2, 2);
        SyntaxHighlightMode[] syntaxHighlightModeArr$values = $values();
        $VALUES = syntaxHighlightModeArr$values;
        $ENTRIES = new i04(syntaxHighlightModeArr$values);
        Companion = new c6d();
        ADAPTER = new SyntaxHighlightMode$Companion$ADAPTER$1(n1b.a.b(SyntaxHighlightMode.class), Syntax.PROTO_2, syntaxHighlightMode);
    }

    private SyntaxHighlightMode(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SyntaxHighlightMode fromValue(int i) {
        Companion.getClass();
        return c6d.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SyntaxHighlightMode valueOf(String str) {
        return (SyntaxHighlightMode) Enum.valueOf(SyntaxHighlightMode.class, str);
    }

    public static SyntaxHighlightMode[] values() {
        return (SyntaxHighlightMode[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
