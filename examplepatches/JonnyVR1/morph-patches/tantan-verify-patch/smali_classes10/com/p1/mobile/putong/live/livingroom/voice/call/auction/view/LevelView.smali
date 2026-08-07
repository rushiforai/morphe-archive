.class public Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:[Landroid/widget/TextView;

.field public e:[Landroid/widget/TextView;

.field public f:[Landroid/widget/ImageView;

.field public g:Landroid/widget/ProgressBar;

.field public h:[Landroid/view/View;

.field public i:[I

.field public j:[J

.field public k:[J

.field public l:J

.field public m:I

.field public n:I

.field public o:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 229
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x4

    .line 5
    new-array v0, p2, [Landroid/widget/TextView;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 8
    .line 9
    new-array v0, p2, [Landroid/widget/TextView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 12
    .line 13
    new-array v0, p2, [Landroid/widget/ImageView;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 16
    .line 17
    new-array p2, p2, [Landroid/view/View;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h:[Landroid/view/View;

    .line 20
    .line 21
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget p2, Ll/yec0;->f3:I

    .line 26
    .line 27
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 31
    .line 32
    sget p2, Ll/mdc0;->g3:I

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Landroid/widget/TextView;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    aput-object p2, p1, v0

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 44
    .line 45
    sget p2, Ll/mdc0;->h3:I

    .line 46
    .line 47
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    check-cast p2, Landroid/widget/TextView;

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    aput-object p2, p1, v1

    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 57
    .line 58
    sget p2, Ll/mdc0;->i3:I

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Landroid/widget/TextView;

    .line 65
    .line 66
    const/4 v2, 0x2

    .line 67
    aput-object p2, p1, v2

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 70
    .line 71
    sget p2, Ll/mdc0;->j3:I

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Landroid/widget/TextView;

    .line 78
    .line 79
    const/4 v3, 0x3

    .line 80
    aput-object p2, p1, v3

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h:[Landroid/view/View;

    .line 83
    .line 84
    sget p2, Ll/mdc0;->l3:I

    .line 85
    .line 86
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    aput-object p2, p1, v0

    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h:[Landroid/view/View;

    .line 93
    .line 94
    sget p2, Ll/mdc0;->m3:I

    .line 95
    .line 96
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    aput-object p2, p1, v1

    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h:[Landroid/view/View;

    .line 103
    .line 104
    sget p2, Ll/mdc0;->n3:I

    .line 105
    .line 106
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    aput-object p2, p1, v2

    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h:[Landroid/view/View;

    .line 113
    .line 114
    sget p2, Ll/mdc0;->o3:I

    .line 115
    .line 116
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    aput-object p2, p1, v3

    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 123
    .line 124
    sget p2, Ll/mdc0;->o4:I

    .line 125
    .line 126
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    check-cast p2, Landroid/widget/TextView;

    .line 131
    .line 132
    aput-object p2, p1, v0

    .line 133
    .line 134
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 135
    .line 136
    sget p2, Ll/mdc0;->p4:I

    .line 137
    .line 138
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    check-cast p2, Landroid/widget/TextView;

    .line 143
    .line 144
    aput-object p2, p1, v1

    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 147
    .line 148
    sget p2, Ll/mdc0;->q4:I

    .line 149
    .line 150
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    check-cast p2, Landroid/widget/TextView;

    .line 155
    .line 156
    aput-object p2, p1, v2

    .line 157
    .line 158
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 159
    .line 160
    sget p2, Ll/mdc0;->r4:I

    .line 161
    .line 162
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    check-cast p2, Landroid/widget/TextView;

    .line 167
    .line 168
    aput-object p2, p1, v3

    .line 169
    .line 170
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 171
    .line 172
    sget p2, Ll/mdc0;->j4:I

    .line 173
    .line 174
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    check-cast p2, Landroid/widget/ImageView;

    .line 179
    .line 180
    aput-object p2, p1, v0

    .line 181
    .line 182
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 183
    .line 184
    sget p2, Ll/mdc0;->k4:I

    .line 185
    .line 186
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    check-cast p2, Landroid/widget/ImageView;

    .line 191
    .line 192
    aput-object p2, p1, v1

    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 195
    .line 196
    sget p2, Ll/mdc0;->l4:I

    .line 197
    .line 198
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    check-cast p2, Landroid/widget/ImageView;

    .line 203
    .line 204
    aput-object p2, p1, v2

    .line 205
    .line 206
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 207
    .line 208
    sget p2, Ll/mdc0;->m4:I

    .line 209
    .line 210
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    check-cast p2, Landroid/widget/ImageView;

    .line 215
    .line 216
    aput-object p2, p1, v3

    .line 217
    .line 218
    sget p1, Ll/mdc0;->n4:I

    .line 219
    .line 220
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    check-cast p1, Landroid/widget/ProgressBar;

    .line 225
    .line 226
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->g:Landroid/widget/ProgressBar;

    .line 227
    .line 228
    return-void
.end method


# virtual methods
.method public final h0(I)Ljava/lang/String;
    .locals 3

    .line 1
    const/16 p0, 0x2710

    .line 2
    .line 3
    if-le p1, p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/text/DecimalFormat;

    .line 6
    .line 7
    const-string v0, "#"

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    int-to-float p1, p1

    .line 18
    const v1, 0x461c4000    # 10000.0f

    .line 19
    .line 20
    .line 21
    div-float/2addr p1, v1

    .line 22
    float-to-double v1, p1

    .line 23
    invoke-virtual {p0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, "\u4e07"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, ""

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public i0([I[JJI)V
    .locals 9

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->i:[I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->j:[J

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->l:J

    .line 6
    .line 7
    iput p5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->m:I

    .line 8
    .line 9
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 10
    .line 11
    array-length p5, p5

    .line 12
    const/4 v0, 0x1

    .line 13
    sub-int/2addr p5, v0

    .line 14
    new-array p5, p5, [J

    .line 15
    .line 16
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->k:[J

    .line 17
    .line 18
    const/4 p5, 0x0

    .line 19
    aget-wide v1, p2, p5

    .line 20
    .line 21
    move v3, p5

    .line 22
    move v4, v3

    .line 23
    :goto_0
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 24
    .line 25
    array-length v6, v5

    .line 26
    if-ge v3, v6, :cond_3

    .line 27
    .line 28
    aget-object v5, v5, v3

    .line 29
    .line 30
    new-instance v6, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v7, "Lv."

    .line 33
    .line 34
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    aget v7, p1, v3

    .line 38
    .line 39
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 50
    .line 51
    aget-object v5, v5, v3

    .line 52
    .line 53
    aget-wide v6, p2, v3

    .line 54
    .line 55
    long-to-int v6, v6

    .line 56
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h0(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    aget v5, p1, v3

    .line 64
    .line 65
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 66
    .line 67
    if-nez v5, :cond_0

    .line 68
    .line 69
    aget-object v5, v6, v3

    .line 70
    .line 71
    const/4 v6, 0x4

    .line 72
    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_0
    aget-object v5, v6, v3

    .line 77
    .line 78
    invoke-virtual {v5, p5}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    :goto_1
    aget-wide v5, p2, v3

    .line 82
    .line 83
    cmp-long v7, v5, p3

    .line 84
    .line 85
    if-gtz v7, :cond_1

    .line 86
    .line 87
    move v4, v3

    .line 88
    :cond_1
    if-lez v3, :cond_2

    .line 89
    .line 90
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->k:[J

    .line 91
    .line 92
    add-int/lit8 v8, v3, -0x1

    .line 93
    .line 94
    sub-long/2addr v5, v1

    .line 95
    aput-wide v5, v7, v8

    .line 96
    .line 97
    :cond_2
    aget-wide v1, p2, v3

    .line 98
    .line 99
    add-int/lit8 v3, v3, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    move v1, p5

    .line 103
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 104
    .line 105
    array-length v3, v2

    .line 106
    const-wide/16 v5, 0x0

    .line 107
    .line 108
    if-ge v1, v3, :cond_5

    .line 109
    .line 110
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h:[Landroid/view/View;

    .line 111
    .line 112
    aget-object v2, v2, v1

    .line 113
    .line 114
    invoke-static {v2, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    if-gt v1, v4, :cond_4

    .line 118
    .line 119
    cmp-long v2, p3, v5

    .line 120
    .line 121
    if-eqz v2, :cond_4

    .line 122
    .line 123
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 124
    .line 125
    aget-object v2, v2, v1

    .line 126
    .line 127
    sget v3, Ll/obc0;->v7:I

    .line 128
    .line 129
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 130
    .line 131
    .line 132
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 133
    .line 134
    aget-object v2, v2, v1

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    sget v5, Ll/n9c0;->e1:I

    .line 141
    .line 142
    invoke-static {v3, v5}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 150
    .line 151
    aget-object v2, v2, v1

    .line 152
    .line 153
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    sget v5, Ll/n9c0;->e1:I

    .line 158
    .line 159
    invoke-static {v3, v5}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 164
    .line 165
    .line 166
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 167
    .line 168
    aget-object v2, v2, v1

    .line 169
    .line 170
    sget v3, Ll/obc0;->A3:I

    .line 171
    .line 172
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 173
    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 177
    .line 178
    aget-object v2, v2, v1

    .line 179
    .line 180
    sget v3, Ll/obc0;->w7:I

    .line 181
    .line 182
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 183
    .line 184
    .line 185
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 186
    .line 187
    aget-object v2, v2, v1

    .line 188
    .line 189
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    sget v5, Ll/n9c0;->q0:I

    .line 194
    .line 195
    invoke-static {v3, v5}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    .line 201
    .line 202
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->e:[Landroid/widget/TextView;

    .line 203
    .line 204
    aget-object v2, v2, v1

    .line 205
    .line 206
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    sget v5, Ll/n9c0;->m1:I

    .line 211
    .line 212
    invoke-static {v3, v5}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 217
    .line 218
    .line 219
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 220
    .line 221
    aget-object v2, v2, v1

    .line 222
    .line 223
    sget v3, Ll/obc0;->B3:I

    .line 224
    .line 225
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 226
    .line 227
    .line 228
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_5
    aget-object v1, v2, v4

    .line 232
    .line 233
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    cmp-long v1, p3, v5

    .line 237
    .line 238
    if-ltz v1, :cond_6

    .line 239
    .line 240
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->o:Ljava/lang/String;

    .line 241
    .line 242
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result v2

    .line 246
    if-nez v2, :cond_6

    .line 247
    .line 248
    add-int/lit8 v2, v4, 0x1

    .line 249
    .line 250
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 251
    .line 252
    array-length v5, v3

    .line 253
    if-ge v2, v5, :cond_6

    .line 254
    .line 255
    aget-object v3, v3, v2

    .line 256
    .line 257
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->o:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 260
    .line 261
    .line 262
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 263
    .line 264
    aget-object v3, v3, v2

    .line 265
    .line 266
    sget v5, Ll/n9c0;->m1:I

    .line 267
    .line 268
    invoke-static {v5}, Ll/n3d0;->a(I)I

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 273
    .line 274
    .line 275
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 276
    .line 277
    aget-object v3, v3, v2

    .line 278
    .line 279
    sget v5, Ll/obc0;->p3:I

    .line 280
    .line 281
    invoke-virtual {v3, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 282
    .line 283
    .line 284
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->h:[Landroid/view/View;

    .line 285
    .line 286
    aget-object v2, v3, v2

    .line 287
    .line 288
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 289
    .line 290
    .line 291
    const/4 v2, 0x2

    .line 292
    if-ne v4, v2, :cond_6

    .line 293
    .line 294
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->d:[Landroid/widget/TextView;

    .line 295
    .line 296
    aget-object v2, v2, v4

    .line 297
    .line 298
    invoke-static {v2, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 299
    .line 300
    .line 301
    :cond_6
    array-length p1, p1

    .line 302
    sub-int/2addr p1, v0

    .line 303
    if-lt v4, p1, :cond_7

    .line 304
    .line 305
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->g:Landroid/widget/ProgressBar;

    .line 306
    .line 307
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMax()I

    .line 308
    .line 309
    .line 310
    move-result p5

    .line 311
    goto :goto_7

    .line 312
    :cond_7
    if-nez v1, :cond_8

    .line 313
    .line 314
    goto :goto_7

    .line 315
    :cond_8
    aget-wide p1, p2, p5

    .line 316
    .line 317
    sub-long/2addr p3, p1

    .line 318
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->k:[J

    .line 319
    .line 320
    array-length p2, p1

    .line 321
    if-ge p5, p2, :cond_a

    .line 322
    .line 323
    aget-wide v0, p1, p5

    .line 324
    .line 325
    cmp-long p2, p3, v0

    .line 326
    .line 327
    if-gez p2, :cond_9

    .line 328
    .line 329
    goto :goto_5

    .line 330
    :cond_9
    sub-long/2addr p3, v0

    .line 331
    add-int/lit8 p5, p5, 0x1

    .line 332
    .line 333
    goto :goto_4

    .line 334
    :cond_a
    :goto_5
    int-to-float p2, p5

    .line 335
    array-length v0, p1

    .line 336
    int-to-float v0, v0

    .line 337
    const/high16 v1, 0x3f800000    # 1.0f

    .line 338
    .line 339
    div-float v0, v1, v0

    .line 340
    .line 341
    mul-float/2addr p2, v0

    .line 342
    array-length v0, p1

    .line 343
    if-lt p5, v0, :cond_b

    .line 344
    .line 345
    const/4 p1, 0x0

    .line 346
    goto :goto_6

    .line 347
    :cond_b
    long-to-float p3, p3

    .line 348
    mul-float/2addr p3, v1

    .line 349
    aget-wide p4, p1, p5

    .line 350
    .line 351
    long-to-float p4, p4

    .line 352
    div-float/2addr p3, p4

    .line 353
    array-length p1, p1

    .line 354
    int-to-float p1, p1

    .line 355
    div-float/2addr v1, p1

    .line 356
    mul-float p1, p3, v1

    .line 357
    .line 358
    :goto_6
    add-float/2addr p2, p1

    .line 359
    const/high16 p1, 0x42c80000    # 100.0f

    .line 360
    .line 361
    mul-float/2addr p2, p1

    .line 362
    float-to-int p1, p2

    .line 363
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->n:I

    .line 364
    .line 365
    add-int p5, p1, p2

    .line 366
    .line 367
    :goto_7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->g:Landroid/widget/ProgressBar;

    .line 368
    .line 369
    invoke-virtual {p0, p5}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 370
    .line 371
    .line 372
    return-void
.end method

.method public j0(IJLjava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLevel;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v5, ""

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move-wide v2, p2

    .line 6
    move-object v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->k0(IJLjava/util/List;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k0(IJLjava/util/List;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLevel;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->o:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    const/4 p5, -0x1

    .line 10
    if-ne p1, p5, :cond_1

    .line 11
    .line 12
    const-wide/16 v0, -0x1

    .line 13
    .line 14
    cmp-long p5, p2, v0

    .line 15
    .line 16
    if-nez p5, :cond_1

    .line 17
    .line 18
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->m:I

    .line 19
    .line 20
    iget-wide p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->l:J

    .line 21
    .line 22
    :cond_1
    move v5, p1

    .line 23
    move-wide v3, p2

    .line 24
    const/4 p1, 0x0

    .line 25
    if-nez p4, :cond_2

    .line 26
    .line 27
    move p2, p1

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    :goto_0
    new-array p3, p2, [I

    .line 34
    .line 35
    new-array p5, p2, [J

    .line 36
    .line 37
    move v0, p1

    .line 38
    :goto_1
    if-ge v0, p2, :cond_3

    .line 39
    .line 40
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLevel;

    .line 45
    .line 46
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLevel;->level:I

    .line 47
    .line 48
    aput v2, p3, v0

    .line 49
    .line 50
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLevel;->minWorth:I

    .line 51
    .line 52
    int-to-long v1, v1

    .line 53
    aput-wide v1, p5, v0

    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    const/4 p4, 0x7

    .line 59
    const/4 v0, 0x4

    .line 60
    if-lt v5, p4, :cond_4

    .line 61
    .line 62
    move p4, v5

    .line 63
    goto :goto_2

    .line 64
    :cond_4
    const/4 p4, 0x5

    .line 65
    if-lt v5, p4, :cond_5

    .line 66
    .line 67
    move p4, v0

    .line 68
    goto :goto_2

    .line 69
    :cond_5
    const/4 p4, 0x3

    .line 70
    if-lt v5, p4, :cond_6

    .line 71
    .line 72
    const/4 p4, 0x2

    .line 73
    goto :goto_2

    .line 74
    :cond_6
    move p4, p1

    .line 75
    :goto_2
    sub-int v1, p2, p4

    .line 76
    .line 77
    if-ge v1, v0, :cond_7

    .line 78
    .line 79
    add-int/lit8 p4, p2, -0x4

    .line 80
    .line 81
    :cond_7
    new-array v1, v0, [I

    .line 82
    .line 83
    new-array v2, v0, [J

    .line 84
    .line 85
    invoke-static {p3, p4, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    .line 87
    .line 88
    invoke-static {p5, p4, v2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 89
    .line 90
    .line 91
    move-object v0, p0

    .line 92
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->i0([I[JJI)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance p2, Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 15
    .line 16
    const/4 p4, 0x0

    .line 17
    aget-object p3, p3, p4

    .line 18
    .line 19
    invoke-virtual {p0, p3, p1}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->f:[Landroid/widget/ImageView;

    .line 23
    .line 24
    const/4 p4, 0x3

    .line 25
    aget-object p3, p3, p4

    .line 26
    .line 27
    invoke-virtual {p0, p3, p2}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 28
    .line 29
    .line 30
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->g:Landroid/widget/ProgressBar;

    .line 31
    .line 32
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result p4

    .line 36
    mul-int/lit8 p4, p4, 0x64

    .line 37
    .line 38
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    sub-int/2addr p2, p1

    .line 43
    sget p1, Ll/qa00;->h:I

    .line 44
    .line 45
    add-int/2addr p2, p1

    .line 46
    div-int/2addr p4, p2

    .line 47
    invoke-virtual {p3, p4}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->g:Landroid/widget/ProgressBar;

    .line 51
    .line 52
    invoke-virtual {p2}, Landroid/widget/ProgressBar;->getMax()I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    mul-int/2addr p1, p2

    .line 57
    int-to-float p1, p1

    .line 58
    const/high16 p2, 0x3f800000    # 1.0f

    .line 59
    .line 60
    mul-float/2addr p1, p2

    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->g:Landroid/widget/ProgressBar;

    .line 62
    .line 63
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    int-to-float p2, p2

    .line 68
    div-float/2addr p1, p2

    .line 69
    float-to-int p1, p1

    .line 70
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;->n:I

    .line 71
    .line 72
    return-void
.end method
