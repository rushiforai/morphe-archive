.class public Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;
.super Lv/VDraweeView;
.source "SourceFile"


# instance fields
.field public o:Landroid/graphics/Paint;

.field public p:Landroid/graphics/LinearGradient;

.field public q:I

.field public r:I

.field public s:Landroid/graphics/LinearGradient;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "#41d2ff"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->q:I

    .line 11
    .line 12
    const-string p1, "#279aff"

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->r:I

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    const-string p1, "#41d2ff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->q:I

    .line 23
    const-string p1, "#279aff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    const-string p1, "#41d2ff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->q:I

    .line 26
    const-string p1, "#279aff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->r:I

    return-void
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/facebook/drawee/view/DraweeView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Lv/VDraweeView;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->s:Landroid/graphics/LinearGradient;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->p:Landroid/graphics/LinearGradient;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    :cond_0
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 15
    .line 16
    sget v1, Ll/qa00;->i:I

    .line 17
    .line 18
    neg-int v3, v1

    .line 19
    int-to-float v3, v3

    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    add-int/2addr v4, v1

    .line 25
    int-to-float v4, v4

    .line 26
    sget v5, Ll/qa00;->V:I

    .line 27
    .line 28
    int-to-float v5, v5

    .line 29
    neg-int v6, v1

    .line 30
    int-to-float v6, v6

    .line 31
    iget v7, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->q:I

    .line 32
    .line 33
    iget v8, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->r:I

    .line 34
    .line 35
    sget-object v16, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 36
    .line 37
    move-object/from16 v9, v16

    .line 38
    .line 39
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 40
    .line 41
    .line 42
    iput-object v2, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->s:Landroid/graphics/LinearGradient;

    .line 43
    .line 44
    new-instance v9, Landroid/graphics/LinearGradient;

    .line 45
    .line 46
    sget v2, Ll/qa00;->t:I

    .line 47
    .line 48
    neg-int v3, v2

    .line 49
    int-to-float v10, v3

    .line 50
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    sub-int/2addr v3, v1

    .line 55
    int-to-float v11, v3

    .line 56
    sget v1, Ll/qa00;->T:I

    .line 57
    .line 58
    int-to-float v12, v1

    .line 59
    neg-int v1, v2

    .line 60
    int-to-float v13, v1

    .line 61
    iget v14, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->q:I

    .line 62
    .line 63
    iget v15, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->r:I

    .line 64
    .line 65
    invoke-direct/range {v9 .. v16}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 66
    .line 67
    .line 68
    iput-object v9, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->p:Landroid/graphics/LinearGradient;

    .line 69
    .line 70
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->o:Landroid/graphics/Paint;

    .line 71
    .line 72
    const/high16 v2, 0x40000000    # 2.0f

    .line 73
    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    new-instance v1, Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->o:Landroid/graphics/Paint;

    .line 82
    .line 83
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 84
    .line 85
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->o:Landroid/graphics/Paint;

    .line 89
    .line 90
    const/4 v3, 0x1

    .line 91
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 92
    .line 93
    .line 94
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->o:Landroid/graphics/Paint;

    .line 95
    .line 96
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    int-to-float v3, v3

    .line 101
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 102
    .line 103
    .line 104
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    int-to-float v3, v3

    .line 113
    div-float/2addr v3, v2

    .line 114
    cmpl-float v1, v1, v3

    .line 115
    .line 116
    iget-object v3, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->o:Landroid/graphics/Paint;

    .line 117
    .line 118
    if-lez v1, :cond_3

    .line 119
    .line 120
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->p:Landroid/graphics/LinearGradient;

    .line 121
    .line 122
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->s:Landroid/graphics/LinearGradient;

    .line 127
    .line 128
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 129
    .line 130
    .line 131
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    int-to-float v1, v1

    .line 136
    div-float/2addr v1, v2

    .line 137
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    int-to-float v3, v3

    .line 142
    div-float/2addr v3, v2

    .line 143
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    int-to-float v4, v4

    .line 148
    div-float/2addr v4, v2

    .line 149
    sget v2, Ll/qa00;->c:I

    .line 150
    .line 151
    int-to-float v2, v2

    .line 152
    sub-float/2addr v4, v2

    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->o:Landroid/graphics/Paint;

    .line 154
    .line 155
    move-object/from16 v2, p1

    .line 156
    .line 157
    invoke-virtual {v2, v1, v3, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public u(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->q:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->r:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
