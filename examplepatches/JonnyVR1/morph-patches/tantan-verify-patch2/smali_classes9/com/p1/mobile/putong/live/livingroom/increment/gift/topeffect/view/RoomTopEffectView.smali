.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dmd0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ljava/lang/String;Landroid/text/TextPaint;Landroid/text/StaticLayout;Landroid/text/TextPaint;Ljava/lang/String;Landroid/text/TextPaint;)Lcom/tantan/library/svga/compose/SVGADynamicEntity;
    .locals 2

    .line 1
    new-instance p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, "text01"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p4, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Landroid/text/StaticLayout;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0, p2, p3, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    const-string p2, "text02"

    .line 22
    .line 23
    invoke-virtual {p0, p6, p5, p2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    if-eqz p7, :cond_3

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getTag()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const/4 p3, 0x2

    .line 33
    invoke-static {p3}, Ll/wft;->b(I)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-nez p3, :cond_2

    .line 38
    .line 39
    sget-object p3, Ll/zrv;->a:Ll/wrv;

    .line 40
    .line 41
    invoke-virtual {p3}, Ll/wrv;->I()Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-eqz p3, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getGrade()J

    .line 48
    .line 49
    .line 50
    move-result-wide p2

    .line 51
    const-wide/16 p4, 0x26

    .line 52
    .line 53
    cmp-long p2, p2, p4

    .line 54
    .line 55
    if-lez p2, :cond_1

    .line 56
    .line 57
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->b6:I

    .line 58
    .line 59
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->a6:I

    .line 65
    .line 66
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    :cond_2
    :goto_1
    const-string p3, "text03"

    .line 71
    .line 72
    invoke-virtual {p0, p2, p7, p3}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserImageUrl()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string p2, "head"

    .line 80
    .line 81
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-object p0
.end method

.method public final c(FZLjava/lang/String;)Landroid/text/TextPaint;
    .locals 0

    .line 1
    new-instance p0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 21
    .line 22
    .line 23
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public final d(FLjava/lang/String;)Landroid/text/TextPaint;
    .locals 0

    .line 1
    new-instance p0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public final e(FFF)F
    .locals 1

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 14
    .line 15
    const/16 v0, 0x2d0

    .line 16
    .line 17
    if-gt p0, v0, :cond_1

    .line 18
    .line 19
    mul-float/2addr p1, p2

    .line 20
    return p1

    .line 21
    :cond_1
    invoke-static {}, Ll/xau;->A()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    mul-float/2addr p1, p3

    .line 28
    :cond_2
    :goto_0
    return p1
.end method

.method public final f(Landroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/StaticLayout;
    .locals 10

    .line 1
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v1, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 7
    .line 8
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result p4

    .line 12
    invoke-direct {p0, p4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    invoke-virtual {p2, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    add-int/2addr v0, p3

    .line 28
    const/16 p3, 0x12

    .line 29
    .line 30
    invoke-virtual {v1, p0, p4, v0, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Landroid/text/StaticLayout;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    float-to-int v5, p0

    .line 44
    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 45
    .line 46
    const/4 v8, 0x0

    .line 47
    const/4 v9, 0x0

    .line 48
    const/4 v2, 0x0

    .line 49
    const/high16 v7, 0x3f800000    # 1.0f

    .line 50
    .line 51
    move-object v4, p1

    .line 52
    invoke-direct/range {v0 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method

.method public g()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ll/x20;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getGrade()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const/4 v4, 0x4

    .line 12
    invoke-static {v3, v4}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getSuperGrade()J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    const-wide/16 v6, 0x0

    .line 21
    .line 22
    cmp-long v4, v4, v6

    .line 23
    .line 24
    const v5, 0x3f4ccccd    # 0.8f

    .line 25
    .line 26
    .line 27
    const v6, 0x3fcccccd    # 1.6f

    .line 28
    .line 29
    .line 30
    const/high16 v7, 0x41500000    # 13.0f

    .line 31
    .line 32
    const v8, 0x3fe66666    # 1.8f

    .line 33
    .line 34
    .line 35
    const/high16 v9, 0x41300000    # 11.0f

    .line 36
    .line 37
    const/high16 v10, 0x3f800000    # 1.0f

    .line 38
    .line 39
    const/4 v11, 0x1

    .line 40
    const-string v12, "#CCFFFFFF"

    .line 41
    .line 42
    const-string v13, "#CCFFD73E"

    .line 43
    .line 44
    const-string v14, "#FFD73E"

    .line 45
    .line 46
    if-nez v4, :cond_2

    .line 47
    .line 48
    const-wide/16 v15, 0x14

    .line 49
    .line 50
    cmp-long v4, v1, v15

    .line 51
    .line 52
    const/4 v15, 0x0

    .line 53
    if-gez v4, :cond_0

    .line 54
    .line 55
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    int-to-float v3, v3

    .line 60
    const v4, 0x3fd9999a    # 1.7f

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v3, v4, v10}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    const/4 v4, 0x0

    .line 68
    invoke-virtual {v0, v3, v4, v12}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->c(FZLjava/lang/String;)Landroid/text/TextPaint;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    int-to-float v4, v4

    .line 77
    invoke-virtual {v0, v4, v8, v10}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    const-string v5, "#FFFFFFFF"

    .line 82
    .line 83
    invoke-virtual {v0, v4, v11, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->c(FZLjava/lang/String;)Landroid/text/TextPaint;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->X5:I

    .line 88
    .line 89
    invoke-static {v5}, Ll/xau;->t(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    move-object v6, v5

    .line 94
    move-object v5, v4

    .line 95
    move-object v4, v15

    .line 96
    goto :goto_1

    .line 97
    :cond_0
    const-wide/16 v16, 0x1e

    .line 98
    .line 99
    cmp-long v4, v1, v16

    .line 100
    .line 101
    if-gez v4, :cond_1

    .line 102
    .line 103
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    int-to-float v4, v4

    .line 108
    invoke-virtual {v0, v4, v6, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-virtual {v0, v4, v12}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->d(FLjava/lang/String;)Landroid/text/TextPaint;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    int-to-float v5, v5

    .line 121
    invoke-virtual {v0, v5, v8, v10}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-virtual {v0, v5, v11, v14}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->c(FZLjava/lang/String;)Landroid/text/TextPaint;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y5:I

    .line 130
    .line 131
    invoke-static {v6}, Ll/xau;->t(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    invoke-virtual {v0, v4, v6, v3, v13}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->f(Landroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/StaticLayout;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    :goto_0
    move-object/from16 v18, v4

    .line 148
    .line 149
    move-object v4, v3

    .line 150
    move-object/from16 v3, v18

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_1
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    int-to-float v4, v4

    .line 158
    invoke-virtual {v0, v4, v6, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 159
    .line 160
    .line 161
    move-result v4

    .line 162
    invoke-virtual {v0, v4, v12}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->d(FLjava/lang/String;)Landroid/text/TextPaint;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    const/high16 v5, 0x41700000    # 15.0f

    .line 167
    .line 168
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    int-to-float v5, v5

    .line 173
    invoke-virtual {v0, v5, v8, v10}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 174
    .line 175
    .line 176
    move-result v5

    .line 177
    invoke-virtual {v0, v5, v11, v14}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->c(FZLjava/lang/String;)Landroid/text/TextPaint;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y5:I

    .line 182
    .line 183
    invoke-static {v6}, Ll/xau;->t(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    invoke-virtual {v0, v4, v6, v3, v13}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->f(Landroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/StaticLayout;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    goto :goto_0

    .line 200
    :goto_1
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    const-string v2, "Lv.%s"

    .line 209
    .line 210
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    move-object v2, v6

    .line 215
    move-object v6, v1

    .line 216
    :goto_2
    move-object v7, v15

    .line 217
    move-object/from16 v1, p2

    .line 218
    .line 219
    goto :goto_3

    .line 220
    :cond_2
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    int-to-float v1, v1

    .line 225
    invoke-virtual {v0, v1, v6, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    invoke-virtual {v0, v1, v12}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->d(FLjava/lang/String;)Landroid/text/TextPaint;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    int-to-float v2, v2

    .line 238
    invoke-virtual {v0, v2, v8, v10}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    invoke-virtual {v0, v2, v11, v14}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->c(FZLjava/lang/String;)Landroid/text/TextPaint;

    .line 243
    .line 244
    .line 245
    move-result-object v5

    .line 246
    const/high16 v2, 0x41600000    # 14.0f

    .line 247
    .line 248
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    int-to-float v2, v2

    .line 253
    const/high16 v4, 0x3fa00000    # 1.25f

    .line 254
    .line 255
    const/high16 v6, 0x3f400000    # 0.75f

    .line 256
    .line 257
    invoke-virtual {v0, v2, v4, v6}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->e(FFF)F

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    invoke-virtual {v0, v2, v11, v14}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->c(FZLjava/lang/String;)Landroid/text/TextPaint;

    .line 262
    .line 263
    .line 264
    move-result-object v15

    .line 265
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z5:I

    .line 266
    .line 267
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v6

    .line 279
    invoke-virtual {v0, v1, v6, v3, v13}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->f(Landroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/StaticLayout;

    .line 280
    .line 281
    .line 282
    move-result-object v4

    .line 283
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->c6:I

    .line 284
    .line 285
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getSuperGrade()J

    .line 290
    .line 291
    .line 292
    move-result-wide v7

    .line 293
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    move-object v3, v6

    .line 306
    move-object v6, v2

    .line 307
    move-object v2, v3

    .line 308
    move-object v3, v1

    .line 309
    goto :goto_2

    .line 310
    :goto_3
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->b(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ljava/lang/String;Landroid/text/TextPaint;Landroid/text/StaticLayout;Landroid/text/TextPaint;Ljava/lang/String;Landroid/text/TextPaint;)Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    invoke-static/range {p1 .. p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getSvgUrl()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    invoke-virtual {v1, v11}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;

    .line 335
    .line 336
    move-object/from16 v3, p3

    .line 337
    .line 338
    invoke-direct {v2, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;Ll/x20;)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    invoke-virtual {v1, v11}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 350
    .line 351
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 352
    .line 353
    .line 354
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Ll/rdh0;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p2, Ll/rdh0;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p2, p2, Ll/rdh0;->b:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$b;

    .line 23
    .line 24
    invoke-direct {p2, p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
