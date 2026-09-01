package com.medium.proto.event;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.p27;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000b\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\r¨\u0006\u000e"}, d2 = {"Lcom/medium/proto/event/ListPrivacyLevel;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "p27", "LIST_PRIVACY_LEVEL_PUBLIC", "LIST_PRIVACY_LEVEL_PRIVATE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ListPrivacyLevel implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ListPrivacyLevel[] $VALUES;
    public static final ProtoAdapter<ListPrivacyLevel> ADAPTER;
    public static final p27 Companion;
    public static final ListPrivacyLevel LIST_PRIVACY_LEVEL_PRIVATE;
    public static final ListPrivacyLevel LIST_PRIVACY_LEVEL_PUBLIC;
    private final int value;

    private static final /* synthetic */ ListPrivacyLevel[] $values() {
        return new ListPrivacyLevel[]{LIST_PRIVACY_LEVEL_PUBLIC, LIST_PRIVACY_LEVEL_PRIVATE};
    }

    static {
        ListPrivacyLevel listPrivacyLevel = new ListPrivacyLevel("LIST_PRIVACY_LEVEL_PUBLIC", 0, 0);
        LIST_PRIVACY_LEVEL_PUBLIC = listPrivacyLevel;
        LIST_PRIVACY_LEVEL_PRIVATE = new ListPrivacyLevel("LIST_PRIVACY_LEVEL_PRIVATE", 1, 1);
        ListPrivacyLevel[] listPrivacyLevelArr$values = $values();
        $VALUES = listPrivacyLevelArr$values;
        $ENTRIES = new i04(listPrivacyLevelArr$values);
        Companion = new p27();
        ADAPTER = new ListPrivacyLevel$Companion$ADAPTER$1(n1b.a.b(ListPrivacyLevel.class), Syntax.PROTO_3, listPrivacyLevel);
    }

    private ListPrivacyLevel(String str, int i, int i2) {
        this.value = i2;
    }

    public static final ListPrivacyLevel fromValue(int i) {
        Companion.getClass();
        if (i == 0) {
            return LIST_PRIVACY_LEVEL_PUBLIC;
        }
        if (i != 1) {
            return null;
        }
        return LIST_PRIVACY_LEVEL_PRIVATE;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ListPrivacyLevel valueOf(String str) {
        return (ListPrivacyLevel) Enum.valueOf(ListPrivacyLevel.class, str);
    }

    public static ListPrivacyLevel[] values() {
        return (ListPrivacyLevel[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
