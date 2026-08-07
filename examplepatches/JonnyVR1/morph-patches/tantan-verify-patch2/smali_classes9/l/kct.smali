.class public Ll/kct;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;",
        "Ll/rdh0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final B(Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;)Ll/rdh0;
    .locals 6

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;->getAnchorName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "\u606d\u795d%sPK\u6bb5\u4f4d\u8d5b\u5347\u7ea7\u81f3"

    .line 15
    .line 16
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;->getAnchorName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "#ffe500"

    .line 25
    .line 26
    invoke-virtual {p0, v1, v2, v3}, Ll/kct;->C(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/StaticLayout;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v1, "text01"

    .line 31
    .line 32
    invoke-virtual {v0, p0, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Landroid/text/StaticLayout;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Landroid/text/TextPaint;

    .line 36
    .line 37
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 38
    .line 39
    .line 40
    const/high16 v1, 0x41500000    # 13.0f

    .line 41
    .line 42
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 48
    .line 49
    .line 50
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;->getRankName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-string v3, "text02"

    .line 67
    .line 68
    invoke-virtual {v0, v2, p0, v3}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;->getStarCount()J

    .line 72
    .line 73
    .line 74
    move-result-wide v2

    .line 75
    const-wide/16 v4, 0x0

    .line 76
    .line 77
    cmp-long p0, v2, v4

    .line 78
    .line 79
    if-lez p0, :cond_0

    .line 80
    .line 81
    new-instance p0, Landroid/text/TextPaint;

    .line 82
    .line 83
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 84
    .line 85
    .line 86
    const/high16 v2, 0x41300000    # 11.0f

    .line 87
    .line 88
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    int-to-float v2, v2

    .line 93
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 94
    .line 95
    .line 96
    const-string v2, "#ffffff"

    .line 97
    .line 98
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;->getStarCount()J

    .line 109
    .line 110
    .line 111
    move-result-wide v1

    .line 112
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const-string v2, "text03"

    .line 117
    .line 118
    invoke-virtual {v0, v1, p0, v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_0
    new-instance p0, Ll/rdh0;

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;->getRankSvga()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-direct {p0, p1, v0}, Ll/rdh0;-><init>(Ljava/lang/String;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 128
    .line 129
    .line 130
    return-object p0
.end method

.method public final C(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/StaticLayout;
    .locals 10

    .line 1
    new-instance v4, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v4}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 p0, 0x41300000    # 11.0f

    .line 7
    .line 8
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float p0, p0

    .line 13
    invoke-virtual {v4, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    const-string p0, "#ffffff"

    .line 17
    .line 18
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {v4, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 26
    .line 27
    invoke-direct {v1, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 31
    .line 32
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    invoke-direct {p0, p3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    add-int/2addr v0, p2

    .line 52
    const/16 p2, 0x12

    .line 53
    .line 54
    invoke-virtual {v1, p0, p3, v0, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Landroid/text/StaticLayout;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    float-to-int v5, p0

    .line 68
    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 69
    .line 70
    const/4 v8, 0x0

    .line 71
    const/4 v9, 0x0

    .line 72
    const/4 v2, 0x0

    .line 73
    const/high16 v7, 0x3f800000    # 1.0f

    .line 74
    .line 75
    invoke-direct/range {v0 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 76
    .line 77
    .line 78
    return-object v0
.end method

.method public D(Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;)Ll/rdh0;
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/kct;->B(Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;)Ll/rdh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.pkRank.upgrade"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kct;->D(Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kct;->E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livePkRank/LongLinkSocketMessage$PkRankUpgrade;)Ll/rdh0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
