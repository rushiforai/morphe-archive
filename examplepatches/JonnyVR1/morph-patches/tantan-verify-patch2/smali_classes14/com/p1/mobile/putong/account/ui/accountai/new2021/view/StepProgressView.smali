.class public Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$b;
    }
.end annotation


# instance fields
.field public a:F

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:J

.field public final i:Landroid/graphics/Paint;

.field public final j:Landroid/graphics/Paint;

.field public k:Landroid/view/Choreographer;

.field public l:Landroid/view/Choreographer$FrameCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x19000000

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->e:I

    .line 7
    .line 8
    const p1, -0xbcb7

    .line 9
    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->f:I

    .line 12
    .line 13
    const/16 p1, 0x3e8

    .line 14
    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->g:I

    .line 16
    .line 17
    new-instance p1, Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 23
    .line 24
    new-instance p1, Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 30
    .line 31
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->l:Landroid/view/Choreographer$FrameCallback;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x19000000

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->e:I

    const p1, -0xbcb7

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->f:I

    const/16 p1, 0x3e8

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->g:I

    .line 43
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 44
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 45
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->l:Landroid/view/Choreographer$FrameCallback;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x19000000

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->e:I

    const p1, -0xbcb7

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->f:I

    const/16 p1, 0x3e8

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->g:I

    .line 50
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 51
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 52
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->l:Landroid/view/Choreographer$FrameCallback;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->d:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c:I

    return p0
.end method


# virtual methods
.method public final c()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/z8c0;->w:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->e:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Ll/z8c0;->t:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->f:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 37
    .line 38
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 44
    .line 45
    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->k:Landroid/view/Choreographer;

    .line 75
    .line 76
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-lez v1, :cond_5

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-gtz v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->b:I

    .line 23
    .line 24
    add-int/lit8 v3, v2, -0x1

    .line 25
    .line 26
    int-to-float v3, v3

    .line 27
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->a:F

    .line 28
    .line 29
    mul-float/2addr v3, v4

    .line 30
    sub-float/2addr v1, v3

    .line 31
    int-to-float v2, v2

    .line 32
    div-float/2addr v1, v2

    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    div-int/lit8 v2, v2, 0x2

    .line 38
    .line 39
    iget-object v3, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    int-to-float v4, v4

    .line 46
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 47
    .line 48
    .line 49
    iget-object v3, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 50
    .line 51
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->f:I

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object v3, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    int-to-float v4, v4

    .line 63
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 64
    .line 65
    .line 66
    iget-object v3, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 67
    .line 68
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->e:I

    .line 69
    .line 70
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    .line 72
    .line 73
    const/4 v3, 0x0

    .line 74
    :goto_0
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->b:I

    .line 75
    .line 76
    if-ge v3, v4, :cond_5

    .line 77
    .line 78
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c:I

    .line 79
    .line 80
    iget v5, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->d:I

    .line 81
    .line 82
    if-le v4, v5, :cond_3

    .line 83
    .line 84
    if-ne v5, v3, :cond_3

    .line 85
    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 87
    .line 88
    .line 89
    move-result-wide v4

    .line 90
    iget-wide v6, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->h:J

    .line 91
    .line 92
    sub-long/2addr v4, v6

    .line 93
    long-to-float v4, v4

    .line 94
    const/high16 v5, 0x3f800000    # 1.0f

    .line 95
    .line 96
    mul-float/2addr v4, v5

    .line 97
    iget v6, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->g:I

    .line 98
    .line 99
    int-to-float v6, v6

    .line 100
    div-float/2addr v4, v6

    .line 101
    int-to-float v6, v3

    .line 102
    mul-float v7, v6, v1

    .line 103
    .line 104
    iget v8, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->a:F

    .line 105
    .line 106
    mul-float/2addr v6, v8

    .line 107
    add-float/2addr v7, v6

    .line 108
    cmpl-float v5, v4, v5

    .line 109
    .line 110
    if-ltz v5, :cond_2

    .line 111
    .line 112
    int-to-float v10, v2

    .line 113
    add-float v9, v7, v10

    .line 114
    .line 115
    add-float/2addr v7, v1

    .line 116
    sub-float v11, v7, v10

    .line 117
    .line 118
    iget-object v13, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 119
    .line 120
    move v12, v10

    .line 121
    move-object/from16 v8, p1

    .line 122
    .line 123
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 124
    .line 125
    .line 126
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c:I

    .line 127
    .line 128
    iput v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->d:I

    .line 129
    .line 130
    const/4 v4, 0x0

    .line 131
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    if-nez v5, :cond_1

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_1
    throw v4

    .line 139
    :cond_2
    int-to-float v5, v2

    .line 140
    add-float v15, v7, v5

    .line 141
    .line 142
    add-float/2addr v7, v1

    .line 143
    sub-float v17, v7, v5

    .line 144
    .line 145
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 146
    .line 147
    move/from16 v18, v5

    .line 148
    .line 149
    move-object/from16 v14, p1

    .line 150
    .line 151
    move/from16 v16, v5

    .line 152
    .line 153
    move-object/from16 v19, v6

    .line 154
    .line 155
    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    int-to-float v5, v5

    .line 163
    sub-float v5, v1, v5

    .line 164
    .line 165
    mul-float/2addr v5, v4

    .line 166
    add-float v17, v15, v5

    .line 167
    .line 168
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 169
    .line 170
    move/from16 v18, v16

    .line 171
    .line 172
    move-object/from16 v19, v4

    .line 173
    .line 174
    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 175
    .line 176
    .line 177
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->k:Landroid/view/Choreographer;

    .line 178
    .line 179
    iget-object v5, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->l:Landroid/view/Choreographer$FrameCallback;

    .line 180
    .line 181
    invoke-virtual {v4, v5}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_3
    iget v5, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->a:F

    .line 186
    .line 187
    if-ge v3, v4, :cond_4

    .line 188
    .line 189
    int-to-float v4, v3

    .line 190
    mul-float v6, v4, v1

    .line 191
    .line 192
    mul-float/2addr v4, v5

    .line 193
    add-float/2addr v6, v4

    .line 194
    int-to-float v4, v2

    .line 195
    add-float v15, v6, v4

    .line 196
    .line 197
    add-float/2addr v6, v1

    .line 198
    sub-float v17, v6, v4

    .line 199
    .line 200
    iget-object v5, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->i:Landroid/graphics/Paint;

    .line 201
    .line 202
    move/from16 v18, v4

    .line 203
    .line 204
    move-object/from16 v14, p1

    .line 205
    .line 206
    move/from16 v16, v4

    .line 207
    .line 208
    move-object/from16 v19, v5

    .line 209
    .line 210
    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 211
    .line 212
    .line 213
    goto :goto_1

    .line 214
    :cond_4
    int-to-float v4, v3

    .line 215
    mul-float v6, v4, v1

    .line 216
    .line 217
    mul-float/2addr v4, v5

    .line 218
    add-float/2addr v6, v4

    .line 219
    int-to-float v4, v2

    .line 220
    add-float v15, v6, v4

    .line 221
    .line 222
    add-float/2addr v6, v1

    .line 223
    sub-float v17, v6, v4

    .line 224
    .line 225
    iget-object v5, v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->j:Landroid/graphics/Paint;

    .line 226
    .line 227
    move/from16 v18, v4

    .line 228
    .line 229
    move-object/from16 v14, p1

    .line 230
    .line 231
    move/from16 v16, v4

    .line 232
    .line 233
    move-object/from16 v19, v5

    .line 234
    .line 235
    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 236
    .line 237
    .line 238
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :cond_5
    :goto_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setDefaultStep(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c:I

    .line 2
    .line 3
    if-gt p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c:I

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->d:I

    .line 9
    .line 10
    return-void
.end method

.method public setSpace(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->a:F

    .line 3
    .line 4
    return-void
.end method

.method public setStepAnimationDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setStepCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public setStepEndAnimationListener(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$b;)V
    .locals 0

    return-void
.end method

.method public setTargetStep(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c:I

    .line 2
    .line 3
    if-gt p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->c:I

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->h:J

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->k:Landroid/view/Choreographer;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->l:Landroid/view/Choreographer$FrameCallback;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
