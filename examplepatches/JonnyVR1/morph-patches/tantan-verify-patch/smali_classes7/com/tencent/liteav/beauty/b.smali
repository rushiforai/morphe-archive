.class public Lcom/tencent/liteav/beauty/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/beauty/TXBeautyManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/beauty/b$a;
    }
.end annotation


# instance fields
.field private a:Lcom/tencent/liteav/basic/license/e;

.field private b:Lcom/tencent/liteav/beauty/d;

.field private c:I

.field private d:Lcom/tencent/liteav/beauty/b$a;

.field private e:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/license/e;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/b;->e:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 8
    .line 9
    new-instance p1, Lcom/tencent/liteav/beauty/b$a;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lcom/tencent/liteav/beauty/b$a;-><init>(Lcom/tencent/liteav/beauty/b;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/b;->enableSharpnessEnhancement(Z)V

    .line 17
    .line 18
    .line 19
    const/high16 p1, 0x3f000000    # 0.5f

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b;->setFilterStrength(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private a()V
    .locals 3

    .line 1
    const-string v0, "TXBeautyManager"

    .line 2
    .line 3
    const-string v1, "applyBeautyParams"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 9
    .line 10
    iget v1, p0, Lcom/tencent/liteav/beauty/b;->c:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->b(I)V

    .line 13
    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/b;->e:Z

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/b;->b(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 31
    .line 32
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->e:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->g(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 40
    .line 41
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->f:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->h(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 49
    .line 50
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->g:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->i(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 58
    .line 59
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->h:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->k(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 67
    .line 68
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->i:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->j(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 76
    .line 77
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->j:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->l(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 85
    .line 86
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->k:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->m(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 94
    .line 95
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->l:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->n(I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 101
    .line 102
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 103
    .line 104
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->m:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->o(I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 110
    .line 111
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 112
    .line 113
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->n:I

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->p(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 121
    .line 122
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->o:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->q(I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 128
    .line 129
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 130
    .line 131
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->p:I

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->r(I)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 137
    .line 138
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 139
    .line 140
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->q:I

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->s(I)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 146
    .line 147
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 148
    .line 149
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->r:I

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->t(I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 155
    .line 156
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 157
    .line 158
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->s:I

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->u(I)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 164
    .line 165
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 166
    .line 167
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->t:I

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->v(I)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 173
    .line 174
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 175
    .line 176
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->u:I

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->w(I)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 182
    .line 183
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 184
    .line 185
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->v:I

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->x(I)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 191
    .line 192
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 193
    .line 194
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->w:I

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->y(I)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 200
    .line 201
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 202
    .line 203
    iget-object v1, v1, Lcom/tencent/liteav/beauty/b$a;->B:Ljava/lang/String;

    .line 204
    .line 205
    const/4 v2, 0x1

    .line 206
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/beauty/d;->a(Ljava/lang/String;Z)Z

    .line 207
    .line 208
    .line 209
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 210
    .line 211
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 212
    .line 213
    iget-object v1, v1, Lcom/tencent/liteav/beauty/b$a;->z:Landroid/graphics/Bitmap;

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->a(Landroid/graphics/Bitmap;)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 219
    .line 220
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 221
    .line 222
    iget v1, v1, Lcom/tencent/liteav/beauty/b$a;->A:F

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->a(F)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 228
    .line 229
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 230
    .line 231
    iget-object v1, v1, Lcom/tencent/liteav/beauty/b$a;->x:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->a(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 237
    .line 238
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 239
    .line 240
    iget-boolean p0, p0, Lcom/tencent/liteav/beauty/b$a;->y:Z

    .line 241
    .line 242
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/d;->c(Z)V

    .line 243
    .line 244
    .line 245
    return-void
.end method

.method private b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 6
    .line 7
    iget p1, p1, Lcom/tencent/liteav/beauty/b$a;->a:I

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->c(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 15
    .line 16
    iget v0, v0, Lcom/tencent/liteav/beauty/b$a;->b:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/beauty/d;->d(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 24
    .line 25
    iget v0, v0, Lcom/tencent/liteav/beauty/b$a;->c:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/beauty/d;->e(I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 33
    .line 34
    iget p0, p0, Lcom/tencent/liteav/beauty/b$a;->d:I

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/beauty/d;->f(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const/4 p1, 0x0

    .line 41
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->c(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->d(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->e(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->f(I)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 246
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/b;->e:Z

    .line 247
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/b;->b(Z)V

    return-void
.end method

.method public enableSharpnessEnhancement(Z)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "TXBeautyManager"

    .line 10
    .line 11
    const-string v2, "enableSharpnessEnhancement enable: %b"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x4

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    :goto_0
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->d:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/tencent/liteav/beauty/b;->e:Z

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->f(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public setBeautyLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setBeautyLevel beautyLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->a:I

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/tencent/liteav/beauty/b;->e:Z

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->c(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setBeautyStyle(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setBeautyStyle beautyStyle:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput p1, p0, Lcom/tencent/liteav/beauty/b;->c:I

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->b(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public setChinLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setChinLevel chinLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->h:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->k(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setEyeAngleLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setEyeAngleLevel eyeAngleLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->r:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->t(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setEyeDistanceLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setEyeDistanceLevel eyeDistanceLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->q:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->s(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setEyeLightenLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setEyeLightenLevel eyeLightenLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->k:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->m(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setEyeScaleLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setEyeScaleLevel eyeScaleLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->e:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->g(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setFaceBeautyLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setFaceBeautyLevel faceBeautyLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->w:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->y(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setFaceShortLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setFaceShortLevel faceShortLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->i:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->j(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setFaceSlimLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setFaceSlimLevel faceSlimLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->f:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->h(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setFaceVLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setFaceVLevel faceVLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->g:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->i(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setFilter(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setFilter image:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput-object p1, v0, Lcom/tencent/liteav/beauty/b$a;->z:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->a(Landroid/graphics/Bitmap;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setFilterStrength(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setFilterStrength strength:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->A:F

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->a(F)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setForeheadLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setForeheadLevel foreheadLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->p:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->r(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setGreenScreenFile(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setGreenScreenFile path:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput-object p1, v0, Lcom/tencent/liteav/beauty/b$a;->B:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 25
    .line 26
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    const-string p0, "setGreenScreenFile is only supported in EnterprisePro license"

    .line 33
    .line 34
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/beauty/d;->a(Ljava/lang/String;Z)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public setLipsThicknessLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLipsThicknessLevel lipsThicknessLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->v:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->x(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setMotionMute(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMotionMute motionMute:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput-boolean p1, v0, Lcom/tencent/liteav/beauty/b$a;->y:Z

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->c(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setMotionTmpl(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMotionTmpl tmplPath:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput-object p1, v0, Lcom/tencent/liteav/beauty/b$a;->x:Ljava/lang/String;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setMouthShapeLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMouthShapeLevel mouthShapeLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->s:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->u(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setNosePositionLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setNosePositionLevel nosePositionLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->u:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->w(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setNoseSlimLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setNoseSlimLevel noseSlimLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->j:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->l(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setNoseWingLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setNoseWingLevel noseWingLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->t:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->v(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setPounchRemoveLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setPounchRemoveLevel pounchRemoveLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->n:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->p(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setPreprocessor(Lcom/tencent/liteav/beauty/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setRuddyLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setRuddyLevel ruddyLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->c:I

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/tencent/liteav/beauty/b;->e:Z

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->e(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setSmileLinesRemoveLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setSmileLinesRemoveLevel smileLinesRemoveLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->o:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->q(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setToothWhitenLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setToothWhitenLevel toothWhitenLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->l:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->n(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setWhitenessLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setWhitenessLevel whitenessLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 21
    .line 22
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->b:I

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/tencent/liteav/beauty/b;->e:Z

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->d(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setWrinkleRemoveLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setWrinkleRemoveLevel wrinkleRemoveLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXBeautyManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->a:Lcom/tencent/liteav/basic/license/e;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/e;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string p0, "support EnterPrise above!!!"

    .line 29
    .line 30
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b;->d:Lcom/tencent/liteav/beauty/b$a;

    .line 35
    .line 36
    iput p1, v0, Lcom/tencent/liteav/beauty/b$a;->m:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b;->b:Lcom/tencent/liteav/beauty/d;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/d;->o(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method
