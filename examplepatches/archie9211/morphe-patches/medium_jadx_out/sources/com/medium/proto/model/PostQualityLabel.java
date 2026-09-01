package com.medium.proto.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.hl9;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0010\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0013"}, d2 = {"Lcom/medium/proto/model/PostQualityLabel;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "hl9", "POST_QUALITY_UNKNOWN", "POST_QUALITY_MARQUEE", "POST_QUALITY_FEATURED", "POST_QUALITY_DISTRIBUTABLE", "POST_QUALITY_HOST_ONLY", "POST_QUALITY_SUSPENDED", "POST_QUALITY_AVERAGE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostQualityLabel implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostQualityLabel[] $VALUES;
    public static final ProtoAdapter<PostQualityLabel> ADAPTER;
    public static final hl9 Companion;
    public static final PostQualityLabel POST_QUALITY_AVERAGE;
    public static final PostQualityLabel POST_QUALITY_DISTRIBUTABLE;
    public static final PostQualityLabel POST_QUALITY_FEATURED;
    public static final PostQualityLabel POST_QUALITY_HOST_ONLY;
    public static final PostQualityLabel POST_QUALITY_MARQUEE;
    public static final PostQualityLabel POST_QUALITY_SUSPENDED;
    public static final PostQualityLabel POST_QUALITY_UNKNOWN;
    private final int value;

    private static final /* synthetic */ PostQualityLabel[] $values() {
        return new PostQualityLabel[]{POST_QUALITY_UNKNOWN, POST_QUALITY_MARQUEE, POST_QUALITY_FEATURED, POST_QUALITY_DISTRIBUTABLE, POST_QUALITY_HOST_ONLY, POST_QUALITY_SUSPENDED, POST_QUALITY_AVERAGE};
    }

    static {
        PostQualityLabel postQualityLabel = new PostQualityLabel("POST_QUALITY_UNKNOWN", 0, 0);
        POST_QUALITY_UNKNOWN = postQualityLabel;
        POST_QUALITY_MARQUEE = new PostQualityLabel("POST_QUALITY_MARQUEE", 1, 1);
        POST_QUALITY_FEATURED = new PostQualityLabel("POST_QUALITY_FEATURED", 2, 2);
        POST_QUALITY_DISTRIBUTABLE = new PostQualityLabel("POST_QUALITY_DISTRIBUTABLE", 3, 3);
        POST_QUALITY_HOST_ONLY = new PostQualityLabel("POST_QUALITY_HOST_ONLY", 4, 4);
        POST_QUALITY_SUSPENDED = new PostQualityLabel("POST_QUALITY_SUSPENDED", 5, 5);
        POST_QUALITY_AVERAGE = new PostQualityLabel("POST_QUALITY_AVERAGE", 6, 6);
        PostQualityLabel[] postQualityLabelArr$values = $values();
        $VALUES = postQualityLabelArr$values;
        $ENTRIES = new i04(postQualityLabelArr$values);
        Companion = new hl9();
        ADAPTER = new PostQualityLabel$Companion$ADAPTER$1(n1b.a.b(PostQualityLabel.class), Syntax.PROTO_2, postQualityLabel);
    }

    private PostQualityLabel(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostQualityLabel fromValue(int i) {
        Companion.getClass();
        return hl9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostQualityLabel valueOf(String str) {
        return (PostQualityLabel) Enum.valueOf(PostQualityLabel.class, str);
    }

    public static PostQualityLabel[] values() {
        return (PostQualityLabel[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
