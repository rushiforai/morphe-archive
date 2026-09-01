package com.medium.proto.obv.post;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.mvb;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000b\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\r¨\u0006\u000e"}, d2 = {"Lcom/medium/proto/obv/post/SectionVideoLayout;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "mvb", "NO_VIDEO", "SECTION_ASPECT_FIT_VIDEO", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SectionVideoLayout implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SectionVideoLayout[] $VALUES;
    public static final ProtoAdapter<SectionVideoLayout> ADAPTER;
    public static final mvb Companion;
    public static final SectionVideoLayout NO_VIDEO = new SectionVideoLayout("NO_VIDEO", 0, 1);
    public static final SectionVideoLayout SECTION_ASPECT_FIT_VIDEO = new SectionVideoLayout("SECTION_ASPECT_FIT_VIDEO", 1, 2);
    private final int value;

    private static final /* synthetic */ SectionVideoLayout[] $values() {
        return new SectionVideoLayout[]{NO_VIDEO, SECTION_ASPECT_FIT_VIDEO};
    }

    static {
        SectionVideoLayout[] sectionVideoLayoutArr$values = $values();
        $VALUES = sectionVideoLayoutArr$values;
        $ENTRIES = new i04(sectionVideoLayoutArr$values);
        Companion = new mvb();
        ADAPTER = new SectionVideoLayout$Companion$ADAPTER$1(n1b.a.b(SectionVideoLayout.class), Syntax.PROTO_2, null);
    }

    private SectionVideoLayout(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SectionVideoLayout fromValue(int i) {
        Companion.getClass();
        if (i == 1) {
            return NO_VIDEO;
        }
        if (i != 2) {
            return null;
        }
        return SECTION_ASPECT_FIT_VIDEO;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SectionVideoLayout valueOf(String str) {
        return (SectionVideoLayout) Enum.valueOf(SectionVideoLayout.class, str);
    }

    public static SectionVideoLayout[] values() {
        return (SectionVideoLayout[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
