.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:F

.field public c:Landroid/graphics/Camera;

.field public d:Landroid/graphics/Matrix;

.field public e:Landroid/graphics/Paint;

.field public f:I

.field public g:I

.field public h:I

.field public i:Z

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public k:Landroid/graphics/Bitmap;

.field public l:Landroid/graphics/Bitmap;

.field public m:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 42
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->a:Z

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->b:F

    .line 9
    .line 10
    new-instance p2, Landroid/graphics/Camera;

    .line 11
    .line 12
    invoke-direct {p2}, Landroid/graphics/Camera;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c:Landroid/graphics/Camera;

    .line 16
    .line 17
    new-instance p2, Landroid/graphics/Matrix;

    .line 18
    .line 19
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->d:Landroid/graphics/Matrix;

    .line 23
    .line 24
    new-instance p2, Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-direct {p2, p1}, Landroid/graphics/Paint;-><init>(I)V

    .line 27
    .line 28
    .line 29
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->e:Landroid/graphics/Paint;

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->f:I

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->f:I

    .line 2
    .line 3
    const/16 v1, 0x63

    .line 4
    .line 5
    if-le v0, v1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->i:Z

    .line 9
    .line 10
    const/16 v0, 0x9

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->g:I

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->h:I

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->a:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/obc0;->E4:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->k:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Ll/obc0;->G5:I

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->k:Landroid/graphics/Bitmap;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v1, 0x0

    .line 47
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->i:Z

    .line 48
    .line 49
    div-int/lit8 v1, v0, 0xa

    .line 50
    .line 51
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->g:I

    .line 52
    .line 53
    rem-int/lit8 v0, v0, 0xa

    .line 54
    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->h:I

    .line 56
    .line 57
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 62
    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->h:I

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->l:Landroid/graphics/Bitmap;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 86
    .line 87
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->g:I

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    check-cast v1, Ljava/lang/Integer;

    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->m:Landroid/graphics/Bitmap;

    .line 104
    .line 105
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->a:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/obc0;->u4:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 17
    .line 18
    sget v1, Ll/obc0;->v4:I

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 28
    .line 29
    sget v1, Ll/obc0;->w4:I

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 39
    .line 40
    sget v1, Ll/obc0;->x4:I

    .line 41
    .line 42
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 50
    .line 51
    sget v1, Ll/obc0;->y4:I

    .line 52
    .line 53
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 61
    .line 62
    sget v1, Ll/obc0;->z4:I

    .line 63
    .line 64
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 72
    .line 73
    sget v1, Ll/obc0;->A4:I

    .line 74
    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 83
    .line 84
    sget v1, Ll/obc0;->B4:I

    .line 85
    .line 86
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 94
    .line 95
    sget v1, Ll/obc0;->C4:I

    .line 96
    .line 97
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 105
    .line 106
    sget v0, Ll/obc0;->D4:I

    .line 107
    .line 108
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_0
    sget v0, Ll/obc0;->w5:I

    .line 117
    .line 118
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 126
    .line 127
    sget v1, Ll/obc0;->x5:I

    .line 128
    .line 129
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 137
    .line 138
    sget v1, Ll/obc0;->y5:I

    .line 139
    .line 140
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 148
    .line 149
    sget v1, Ll/obc0;->z5:I

    .line 150
    .line 151
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 159
    .line 160
    sget v1, Ll/obc0;->A5:I

    .line 161
    .line 162
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 170
    .line 171
    sget v1, Ll/obc0;->B5:I

    .line 172
    .line 173
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 181
    .line 182
    sget v1, Ll/obc0;->C5:I

    .line 183
    .line 184
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 192
    .line 193
    sget v1, Ll/obc0;->D5:I

    .line 194
    .line 195
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 203
    .line 204
    sget v1, Ll/obc0;->E5:I

    .line 205
    .line 206
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 214
    .line 215
    sget v0, Ll/obc0;->F5:I

    .line 216
    .line 217
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    return-void
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->a:Z

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->b()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c:Landroid/graphics/Camera;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 22
    .line 23
    const/high16 v0, -0x3f800000    # -4.0f

    .line 24
    .line 25
    mul-float/2addr p0, v0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, v0, v0, p0}, Landroid/graphics/Camera;->setLocation(FFF)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->m:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    if-eqz v0, :cond_5

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->l:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    goto/16 :goto_1

    .line 23
    .line 24
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->g:I

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->h:I

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->d:Landroid/graphics/Matrix;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c:Landroid/graphics/Camera;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Camera;->save()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c:Landroid/graphics/Camera;

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->b:F

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/graphics/Camera;->rotateX(F)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c:Landroid/graphics/Camera;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->d:Landroid/graphics/Matrix;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c:Landroid/graphics/Camera;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/graphics/Camera;->restore()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->d:Landroid/graphics/Matrix;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    neg-int v1, v1

    .line 73
    int-to-float v1, v1

    .line 74
    const/high16 v2, 0x40000000    # 2.0f

    .line 75
    .line 76
    div-float/2addr v1, v2

    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    neg-int v3, v3

    .line 82
    int-to-float v3, v3

    .line 83
    div-float/2addr v3, v2

    .line 84
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->d:Landroid/graphics/Matrix;

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    int-to-float v1, v1

    .line 94
    div-float/2addr v1, v2

    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    int-to-float v3, v3

    .line 100
    div-float/2addr v3, v2

    .line 101
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->d:Landroid/graphics/Matrix;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 107
    .line 108
    .line 109
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->g:I

    .line 110
    .line 111
    const/4 v1, 0x0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->m:Landroid/graphics/Bitmap;

    .line 115
    .line 116
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->e:Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-virtual {p1, v0, v1, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->m:Landroid/graphics/Bitmap;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    int-to-float v0, v0

    .line 128
    add-float/2addr v0, v1

    .line 129
    goto :goto_0

    .line 130
    :cond_3
    move v0, v1

    .line 131
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->l:Landroid/graphics/Bitmap;

    .line 132
    .line 133
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->e:Landroid/graphics/Paint;

    .line 134
    .line 135
    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->l:Landroid/graphics/Bitmap;

    .line 139
    .line 140
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    int-to-float v2, v2

    .line 145
    add-float/2addr v0, v2

    .line 146
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->i:Z

    .line 147
    .line 148
    if-eqz v2, :cond_4

    .line 149
    .line 150
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->k:Landroid/graphics/Bitmap;

    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->e:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {p1, v2, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 155
    .line 156
    .line 157
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 158
    .line 159
    .line 160
    :cond_5
    :goto_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->f:I

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->m:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->l:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->i:Z

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->k:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 p1, 0x0

    .line 33
    :goto_0
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->g:I

    .line 34
    .line 35
    if-lez p2, :cond_3

    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->m:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    add-int/2addr p1, p2

    .line 44
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->l:Landroid/graphics/Bitmap;

    .line 45
    .line 46
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    add-int/2addr p1, p2

    .line 51
    const/high16 p2, 0x41600000    # 14.0f

    .line 52
    .line 53
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    :goto_1
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public setNumber(J)V
    .locals 0

    .line 1
    long-to-int p1, p1

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->f:I

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->a()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
