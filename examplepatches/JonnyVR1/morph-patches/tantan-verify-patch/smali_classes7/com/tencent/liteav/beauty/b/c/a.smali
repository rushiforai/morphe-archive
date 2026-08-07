.class public Lcom/tencent/liteav/beauty/b/c/a;
.super Lcom/tencent/liteav/beauty/b/b;
.source "SourceFile"


# instance fields
.field private r:Lcom/tencent/liteav/beauty/b/c/d;

.field private s:Lcom/tencent/liteav/beauty/b/c/d;

.field private t:Lcom/tencent/liteav/beauty/b/c/b;

.field private u:Lcom/tencent/liteav/beauty/b/c/c;

.field private v:Lcom/tencent/liteav/beauty/b/c/d;

.field private w:Lcom/tencent/liteav/beauty/b/c/d;

.field private x:F

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 16
    .line 17
    const v0, 0x3e4ccccd    # 0.2f

    .line 18
    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->x:F

    .line 21
    .line 22
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->y:F

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->z:F

    .line 25
    .line 26
    return-void
.end method

.method private d(II)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 2
    .line 3
    const-string v1, "TXCBeauty4Filter"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/tencent/liteav/beauty/b/c/d;

    .line 10
    .line 11
    invoke-direct {v0, v3}, Lcom/tencent/liteav/beauty/b/c/d;-><init>(Z)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const-string p0, "mSkinBlurFilterVertical init failed!!, break init"

    .line 28
    .line 29
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return v2

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Lcom/tencent/liteav/beauty/b/c/d;

    .line 38
    .line 39
    invoke-direct {v0, v2}, Lcom/tencent/liteav/beauty/b/c/d;-><init>(Z)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    const-string p0, "mSkinBlurFilterHorizontal init failed!!, break init"

    .line 56
    .line 57
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v2

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 62
    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    new-instance v0, Lcom/tencent/liteav/beauty/b/c/b;

    .line 66
    .line 67
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/c/b;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    const-string p0, "mBorderFilter init failed!!, break init"

    .line 84
    .line 85
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return v2

    .line 89
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 90
    .line 91
    if-nez v0, :cond_3

    .line 92
    .line 93
    new-instance v0, Lcom/tencent/liteav/beauty/b/c/d;

    .line 94
    .line 95
    invoke-direct {v0, v3}, Lcom/tencent/liteav/beauty/b/c/d;-><init>(Z)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 99
    .line 100
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_3

    .line 110
    .line 111
    const-string p0, "mBorderBlurFilterVertical init failed!!, break init"

    .line 112
    .line 113
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return v2

    .line 117
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 118
    .line 119
    if-nez v0, :cond_4

    .line 120
    .line 121
    new-instance v0, Lcom/tencent/liteav/beauty/b/c/d;

    .line 122
    .line 123
    invoke-direct {v0, v2}, Lcom/tencent/liteav/beauty/b/c/d;-><init>(Z)V

    .line 124
    .line 125
    .line 126
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 127
    .line 128
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_4

    .line 138
    .line 139
    const-string p0, "mBorderBlurFilterHorizontal init failed!!, break init"

    .line 140
    .line 141
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return v2

    .line 145
    :cond_4
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 146
    .line 147
    if-nez v0, :cond_5

    .line 148
    .line 149
    new-instance v0, Lcom/tencent/liteav/beauty/b/c/c;

    .line 150
    .line 151
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/c/c;-><init>()V

    .line 152
    .line 153
    .line 154
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 155
    .line 156
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_5

    .line 166
    .line 167
    const-string p0, "mSmoothFilter init failed!!, break init"

    .line 168
    .line 169
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    return v2

    .line 173
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 174
    .line 175
    const/high16 v1, 0x43b40000    # 360.0f

    .line 176
    .line 177
    const/high16 v2, 0x44200000    # 640.0f

    .line 178
    .line 179
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/beauty/b/c/c;->a(FF)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 183
    .line 184
    iget v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->x:F

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/c/c;->a(F)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 190
    .line 191
    iget v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->y:F

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/c/c;->b(F)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 197
    .line 198
    iget v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->z:F

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/c/c;->c(F)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/a;->a(II)V

    .line 204
    .line 205
    .line 206
    return v3
.end method


# virtual methods
.method public a(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 5
    .line 6
    iput p2, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 9
    .line 10
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/d;->a(II)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/d;->a(II)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 19
    .line 20
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/b;->a(II)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/d;->a(II)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 29
    .line 30
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/d;->a(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/c;->a(II)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public b(I)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->x:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-gtz v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->y:F

    .line 9
    .line 10
    cmpl-float v0, v0, v1

    .line 11
    .line 12
    if-gtz v0, :cond_1

    .line 13
    .line 14
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->z:F

    .line 15
    .line 16
    cmpl-float v0, v0, v1

    .line 17
    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return p1

    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/b/c/d;->b(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/beauty/b/c/d;->b(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 35
    .line 36
    invoke-virtual {v1, p1, v0}, Lcom/tencent/liteav/beauty/b/u;->c(II)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Lcom/tencent/liteav/beauty/b/c/d;->b(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 47
    .line 48
    invoke-virtual {v2, v1}, Lcom/tencent/liteav/beauty/b/c/d;->b(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 53
    .line 54
    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/liteav/beauty/b/c/c;->a(III)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method public c(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x41200000    # 10.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c/a;->x:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/c/c;->a(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(II)Z
    .locals 0

    .line 15
    iput p1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 16
    iput p2, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/a;->d(II)Z

    move-result p0

    return p0
.end method

.method public d(I)V
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x41200000    # 10.0f

    div-float/2addr p1, v0

    .line 207
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c/a;->y:F

    .line 208
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    if-eqz p0, :cond_0

    .line 209
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/c/c;->b(F)V

    :cond_0
    return-void
.end method

.method public e()V
    .locals 0

    .line 15
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/c/a;->q()V

    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x41200000    # 10.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c/a;->z:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/c/c;->c(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    const/high16 v0, 0x41200000    # 10.0f

    .line 5
    .line 6
    div-float/2addr p1, v0

    .line 7
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/c/c;->d(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->r:Lcom/tencent/liteav/beauty/b/c/d;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->s:Lcom/tencent/liteav/beauty/b/c/d;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/u;->e()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->t:Lcom/tencent/liteav/beauty/b/c/b;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->u:Lcom/tencent/liteav/beauty/b/c/c;

    .line 37
    .line 38
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 39
    .line 40
    if-eqz v0, :cond_4

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->v:Lcom/tencent/liteav/beauty/b/c/d;

    .line 46
    .line 47
    :cond_4
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 48
    .line 49
    if-eqz v0, :cond_5

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c/a;->w:Lcom/tencent/liteav/beauty/b/c/d;

    .line 55
    .line 56
    :cond_5
    return-void
.end method
