.class public final Ll/zee0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jkj0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/yee0;

.field public final b:Ll/ig60;

.field public c:I

.field public d:I

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Ll/yee0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zee0;->a:Ll/yee0;

    .line 5
    .line 6
    new-instance p1, Ll/ig60;

    .line 7
    .line 8
    const/16 v0, 0x20

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/ig60;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/zee0;->b:Ll/ig60;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Ll/ig60;I)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    and-int/2addr p2, v0

    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    move p2, v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move p2, v1

    .line 9
    :goto_0
    const/4 v2, -0x1

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    add-int/2addr v4, v3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move v4, v2

    .line 23
    :goto_1
    iget-boolean v3, p0, Ll/zee0;->f:Z

    .line 24
    .line 25
    if-eqz v3, :cond_3

    .line 26
    .line 27
    if-nez p2, :cond_2

    .line 28
    .line 29
    goto/16 :goto_5

    .line 30
    .line 31
    :cond_2
    iput-boolean v1, p0, Ll/zee0;->f:Z

    .line 32
    .line 33
    invoke-virtual {p1, v4}, Ll/ig60;->U(I)V

    .line 34
    .line 35
    .line 36
    iput v1, p0, Ll/zee0;->d:I

    .line 37
    .line 38
    :cond_3
    :goto_2
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-lez p2, :cond_9

    .line 43
    .line 44
    iget p2, p0, Ll/zee0;->d:I

    .line 45
    .line 46
    const/4 v3, 0x3

    .line 47
    if-ge p2, v3, :cond_6

    .line 48
    .line 49
    if-nez p2, :cond_4

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    sub-int/2addr v4, v0

    .line 60
    invoke-virtual {p1, v4}, Ll/ig60;->U(I)V

    .line 61
    .line 62
    .line 63
    const/16 v4, 0xff

    .line 64
    .line 65
    if-ne p2, v4, :cond_4

    .line 66
    .line 67
    iput-boolean v0, p0, Ll/zee0;->f:Z

    .line 68
    .line 69
    return-void

    .line 70
    :cond_4
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    iget v4, p0, Ll/zee0;->d:I

    .line 75
    .line 76
    rsub-int/lit8 v4, v4, 0x3

    .line 77
    .line 78
    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    iget-object v4, p0, Ll/zee0;->b:Ll/ig60;

    .line 83
    .line 84
    invoke-virtual {v4}, Ll/ig60;->e()[B

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    iget v5, p0, Ll/zee0;->d:I

    .line 89
    .line 90
    invoke-virtual {p1, v4, v5, p2}, Ll/ig60;->l([BII)V

    .line 91
    .line 92
    .line 93
    iget v4, p0, Ll/zee0;->d:I

    .line 94
    .line 95
    add-int/2addr v4, p2

    .line 96
    iput v4, p0, Ll/zee0;->d:I

    .line 97
    .line 98
    if-ne v4, v3, :cond_3

    .line 99
    .line 100
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 101
    .line 102
    invoke-virtual {p2, v1}, Ll/ig60;->U(I)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 106
    .line 107
    invoke-virtual {p2, v3}, Ll/ig60;->T(I)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Ll/ig60;->V(I)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 116
    .line 117
    invoke-virtual {p2}, Ll/ig60;->H()I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    iget-object v4, p0, Ll/zee0;->b:Ll/ig60;

    .line 122
    .line 123
    invoke-virtual {v4}, Ll/ig60;->H()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    and-int/lit16 v5, p2, 0x80

    .line 128
    .line 129
    if-eqz v5, :cond_5

    .line 130
    .line 131
    move v5, v0

    .line 132
    goto :goto_3

    .line 133
    :cond_5
    move v5, v1

    .line 134
    :goto_3
    iput-boolean v5, p0, Ll/zee0;->e:Z

    .line 135
    .line 136
    and-int/lit8 p2, p2, 0xf

    .line 137
    .line 138
    shl-int/lit8 p2, p2, 0x8

    .line 139
    .line 140
    or-int/2addr p2, v4

    .line 141
    add-int/2addr p2, v3

    .line 142
    iput p2, p0, Ll/zee0;->c:I

    .line 143
    .line 144
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 145
    .line 146
    invoke-virtual {p2}, Ll/ig60;->b()I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    iget v3, p0, Ll/zee0;->c:I

    .line 151
    .line 152
    if-ge p2, v3, :cond_3

    .line 153
    .line 154
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 155
    .line 156
    invoke-virtual {p2}, Ll/ig60;->b()I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    mul-int/lit8 p2, p2, 0x2

    .line 161
    .line 162
    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    .line 163
    .line 164
    .line 165
    move-result p2

    .line 166
    const/16 v3, 0x1002

    .line 167
    .line 168
    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    .line 169
    .line 170
    .line 171
    move-result p2

    .line 172
    iget-object v3, p0, Ll/zee0;->b:Ll/ig60;

    .line 173
    .line 174
    invoke-virtual {v3, p2}, Ll/ig60;->c(I)V

    .line 175
    .line 176
    .line 177
    goto/16 :goto_2

    .line 178
    .line 179
    :cond_6
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    iget v3, p0, Ll/zee0;->c:I

    .line 184
    .line 185
    iget v4, p0, Ll/zee0;->d:I

    .line 186
    .line 187
    sub-int/2addr v3, v4

    .line 188
    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    iget-object v3, p0, Ll/zee0;->b:Ll/ig60;

    .line 193
    .line 194
    invoke-virtual {v3}, Ll/ig60;->e()[B

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    iget v4, p0, Ll/zee0;->d:I

    .line 199
    .line 200
    invoke-virtual {p1, v3, v4, p2}, Ll/ig60;->l([BII)V

    .line 201
    .line 202
    .line 203
    iget v3, p0, Ll/zee0;->d:I

    .line 204
    .line 205
    add-int/2addr v3, p2

    .line 206
    iput v3, p0, Ll/zee0;->d:I

    .line 207
    .line 208
    iget p2, p0, Ll/zee0;->c:I

    .line 209
    .line 210
    if-ne v3, p2, :cond_3

    .line 211
    .line 212
    iget-boolean v3, p0, Ll/zee0;->e:Z

    .line 213
    .line 214
    iget-object v4, p0, Ll/zee0;->b:Ll/ig60;

    .line 215
    .line 216
    if-eqz v3, :cond_8

    .line 217
    .line 218
    invoke-virtual {v4}, Ll/ig60;->e()[B

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    iget v3, p0, Ll/zee0;->c:I

    .line 223
    .line 224
    invoke-static {p2, v1, v3, v2}, Ll/bmk0;->t([BIII)I

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    if-eqz p2, :cond_7

    .line 229
    .line 230
    iput-boolean v0, p0, Ll/zee0;->f:Z

    .line 231
    .line 232
    return-void

    .line 233
    :cond_7
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 234
    .line 235
    iget v3, p0, Ll/zee0;->c:I

    .line 236
    .line 237
    add-int/lit8 v3, v3, -0x4

    .line 238
    .line 239
    invoke-virtual {p2, v3}, Ll/ig60;->T(I)V

    .line 240
    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_8
    invoke-virtual {v4, p2}, Ll/ig60;->T(I)V

    .line 244
    .line 245
    .line 246
    :goto_4
    iget-object p2, p0, Ll/zee0;->b:Ll/ig60;

    .line 247
    .line 248
    invoke-virtual {p2, v1}, Ll/ig60;->U(I)V

    .line 249
    .line 250
    .line 251
    iget-object p2, p0, Ll/zee0;->a:Ll/yee0;

    .line 252
    .line 253
    iget-object v3, p0, Ll/zee0;->b:Ll/ig60;

    .line 254
    .line 255
    invoke-interface {p2, v3}, Ll/yee0;->a(Ll/ig60;)V

    .line 256
    .line 257
    .line 258
    iput v1, p0, Ll/zee0;->d:I

    .line 259
    .line 260
    goto/16 :goto_2

    .line 261
    .line 262
    :cond_9
    :goto_5
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/zee0;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/h0j0;Ll/bsf;Ll/jkj0$d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zee0;->a:Ll/yee0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2, p3}, Ll/yee0;->c(Ll/h0j0;Ll/bsf;Ll/jkj0$d;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/zee0;->f:Z

    .line 8
    .line 9
    return-void
.end method
