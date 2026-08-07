.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroid/graphics/Bitmap;

.field public d:I

.field public e:I

.field public f:Landroid/graphics/Paint;

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    .line 22
    .line 23
    const/high16 p1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    .line 30
    .line 31
    const/high16 p1, 0x40000000    # 2.0f

    .line 32
    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 38
    .line 39
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->i:I

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 50
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 51
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    const/high16 p1, 0x40000000    # 2.0f

    .line 52
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 53
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->i:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 54
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 56
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 58
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 59
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    const/high16 p1, 0x40000000    # 2.0f

    .line 60
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 61
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->i:I

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    if-gez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/16 v0, 0xe10

    .line 13
    .line 14
    if-ltz p1, :cond_1

    .line 15
    .line 16
    if-ge p1, v0, :cond_1

    .line 17
    .line 18
    div-int/lit8 v0, p1, 0x3c

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 21
    .line 22
    rem-int/lit8 p1, p1, 0x3c

    .line 23
    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    if-lt p1, v0, :cond_2

    .line 28
    .line 29
    const/16 p1, 0x3b

    .line 30
    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 32
    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 p1, 0x0

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 38
    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 40
    .line 41
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->a:Z

    .line 8
    .line 9
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-eq v0, v1, :cond_7

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->a:Z

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget v3, Ll/obc0;->m5:I

    .line 34
    .line 35
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sget v3, Ll/obc0;->n5:I

    .line 49
    .line 50
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    sget v3, Ll/obc0;->o5:I

    .line 64
    .line 65
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    sget v3, Ll/obc0;->p5:I

    .line 79
    .line 80
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sget v3, Ll/obc0;->q5:I

    .line 94
    .line 95
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    sget v3, Ll/obc0;->r5:I

    .line 109
    .line 110
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    sget v3, Ll/obc0;->s5:I

    .line 124
    .line 125
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    sget v3, Ll/obc0;->t5:I

    .line 139
    .line 140
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    sget v3, Ll/obc0;->u5:I

    .line 154
    .line 155
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 163
    .line 164
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    sget v3, Ll/obc0;->v5:I

    .line 169
    .line 170
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    sget v2, Ll/obc0;->O4:I

    .line 182
    .line 183
    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->c:Landroid/graphics/Bitmap;

    .line 188
    .line 189
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->a:Z

    .line 190
    .line 191
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->d:I

    .line 192
    .line 193
    div-int/lit8 v2, v0, 0xa

    .line 194
    .line 195
    rem-int/lit8 v0, v0, 0xa

    .line 196
    .line 197
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->e:I

    .line 198
    .line 199
    div-int/lit8 v4, v3, 0xa

    .line 200
    .line 201
    rem-int/lit8 v3, v3, 0xa

    .line 202
    .line 203
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    .line 204
    .line 205
    int-to-float v5, v5

    .line 206
    if-ne v2, v1, :cond_2

    .line 207
    .line 208
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->i:I

    .line 209
    .line 210
    int-to-float v6, v6

    .line 211
    add-float/2addr v5, v6

    .line 212
    :cond_2
    if-ne v0, v1, :cond_3

    .line 213
    .line 214
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->i:I

    .line 215
    .line 216
    int-to-float v6, v6

    .line 217
    add-float/2addr v5, v6

    .line 218
    :cond_3
    if-ne v4, v1, :cond_4

    .line 219
    .line 220
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->i:I

    .line 221
    .line 222
    int-to-float v6, v6

    .line 223
    add-float/2addr v5, v6

    .line 224
    :cond_4
    if-ne v3, v1, :cond_5

    .line 225
    .line 226
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->i:I

    .line 227
    .line 228
    int-to-float v1, v1

    .line 229
    add-float/2addr v5, v1

    .line 230
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-eqz v1, :cond_6

    .line 237
    .line 238
    goto :goto_0

    .line 239
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 240
    .line 241
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Landroid/graphics/Bitmap;

    .line 246
    .line 247
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 248
    .line 249
    int-to-float v2, v2

    .line 250
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    .line 251
    .line 252
    invoke-virtual {p1, v1, v5, v2, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 253
    .line 254
    .line 255
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 256
    .line 257
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    check-cast v0, Landroid/graphics/Bitmap;

    .line 262
    .line 263
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    int-to-float v1, v1

    .line 268
    add-float/2addr v5, v1

    .line 269
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    .line 270
    .line 271
    int-to-float v1, v1

    .line 272
    add-float/2addr v5, v1

    .line 273
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 274
    .line 275
    int-to-float v1, v1

    .line 276
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    .line 277
    .line 278
    invoke-virtual {p1, v0, v5, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    int-to-float v0, v0

    .line 286
    add-float/2addr v5, v0

    .line 287
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    .line 288
    .line 289
    int-to-float v0, v0

    .line 290
    add-float/2addr v5, v0

    .line 291
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->c:Landroid/graphics/Bitmap;

    .line 292
    .line 293
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 294
    .line 295
    int-to-float v1, v1

    .line 296
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    .line 297
    .line 298
    invoke-virtual {p1, v0, v5, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 302
    .line 303
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    check-cast v0, Landroid/graphics/Bitmap;

    .line 308
    .line 309
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->c:Landroid/graphics/Bitmap;

    .line 310
    .line 311
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    int-to-float v1, v1

    .line 316
    add-float/2addr v5, v1

    .line 317
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    .line 318
    .line 319
    int-to-float v1, v1

    .line 320
    add-float/2addr v5, v1

    .line 321
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 322
    .line 323
    int-to-float v1, v1

    .line 324
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    .line 325
    .line 326
    invoke-virtual {p1, v0, v5, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 327
    .line 328
    .line 329
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->b:Ljava/util/ArrayList;

    .line 330
    .line 331
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    check-cast v1, Landroid/graphics/Bitmap;

    .line 336
    .line 337
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    int-to-float v0, v0

    .line 342
    add-float/2addr v5, v0

    .line 343
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->g:I

    .line 344
    .line 345
    int-to-float v0, v0

    .line 346
    add-float/2addr v5, v0

    .line 347
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->h:I

    .line 348
    .line 349
    int-to-float v0, v0

    .line 350
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->f:Landroid/graphics/Paint;

    .line 351
    .line 352
    invoke-virtual {p1, v1, v5, v0, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 353
    .line 354
    .line 355
    :cond_7
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    const/high16 v1, 0x41c00000    # 24.0f

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/high16 v2, 0x41000000    # 8.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
