.class public final Ll/jtr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hur0;


# instance fields
.field public final a:Ll/itr0;

.field public final b:Ll/bgw0;

.field public c:I

.field public d:I

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Ll/itr0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jtr0;->a:Ll/itr0;

    .line 5
    .line 6
    new-instance p1, Ll/bgw0;

    .line 7
    .line 8
    const/16 v0, 0x20

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(Ll/nnw0;Ll/ser0;Ll/gur0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jtr0;->a:Ll/itr0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2, p3}, Ll/itr0;->a(Ll/nnw0;Ll/ser0;Ll/gur0;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/jtr0;->f:Z

    .line 8
    .line 9
    return-void
.end method

.method public final b(Ll/bgw0;I)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    and-int/2addr p2, v0

    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    add-int/2addr v3, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v3, v1

    .line 17
    :goto_0
    iget-boolean v2, p0, Ll/jtr0;->f:Z

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    if-eqz p2, :cond_8

    .line 24
    .line 25
    iput-boolean v4, p0, Ll/jtr0;->f:Z

    .line 26
    .line 27
    invoke-virtual {p1, v3}, Ll/bgw0;->k(I)V

    .line 28
    .line 29
    .line 30
    iput v4, p0, Ll/jtr0;->d:I

    .line 31
    .line 32
    :cond_2
    :goto_1
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-lez p2, :cond_8

    .line 37
    .line 38
    iget p2, p0, Ll/jtr0;->d:I

    .line 39
    .line 40
    const/4 v2, 0x3

    .line 41
    if-ge p2, v2, :cond_5

    .line 42
    .line 43
    if-nez p2, :cond_3

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    add-int/2addr v3, v1

    .line 54
    invoke-virtual {p1, v3}, Ll/bgw0;->k(I)V

    .line 55
    .line 56
    .line 57
    const/16 v3, 0xff

    .line 58
    .line 59
    if-eq p2, v3, :cond_6

    .line 60
    .line 61
    :cond_3
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iget v3, p0, Ll/jtr0;->d:I

    .line 66
    .line 67
    rsub-int/lit8 v3, v3, 0x3

    .line 68
    .line 69
    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    iget-object v3, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 74
    .line 75
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget v5, p0, Ll/jtr0;->d:I

    .line 80
    .line 81
    invoke-virtual {p1, v3, v5, p2}, Ll/bgw0;->g([BII)V

    .line 82
    .line 83
    .line 84
    iget v3, p0, Ll/jtr0;->d:I

    .line 85
    .line 86
    add-int/2addr v3, p2

    .line 87
    iput v3, p0, Ll/jtr0;->d:I

    .line 88
    .line 89
    if-ne v3, v2, :cond_2

    .line 90
    .line 91
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 92
    .line 93
    invoke-virtual {p2, v4}, Ll/bgw0;->k(I)V

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 97
    .line 98
    invoke-virtual {p2, v2}, Ll/bgw0;->j(I)V

    .line 99
    .line 100
    .line 101
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 102
    .line 103
    invoke-virtual {p2, v0}, Ll/bgw0;->l(I)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 107
    .line 108
    invoke-virtual {p2}, Ll/bgw0;->B()I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    and-int/lit16 v5, v3, 0x80

    .line 113
    .line 114
    if-eqz v5, :cond_4

    .line 115
    .line 116
    move v5, v0

    .line 117
    goto :goto_2

    .line 118
    :cond_4
    move v5, v4

    .line 119
    :goto_2
    invoke-virtual {p2}, Ll/bgw0;->B()I

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    iput-boolean v5, p0, Ll/jtr0;->e:Z

    .line 124
    .line 125
    and-int/lit8 v3, v3, 0xf

    .line 126
    .line 127
    shl-int/lit8 v3, v3, 0x8

    .line 128
    .line 129
    or-int/2addr p2, v3

    .line 130
    add-int/2addr p2, v2

    .line 131
    iput p2, p0, Ll/jtr0;->c:I

    .line 132
    .line 133
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 134
    .line 135
    invoke-virtual {p2}, Ll/bgw0;->r()I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    iget v2, p0, Ll/jtr0;->c:I

    .line 140
    .line 141
    if-ge p2, v2, :cond_2

    .line 142
    .line 143
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 144
    .line 145
    invoke-virtual {p2}, Ll/bgw0;->r()I

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    add-int/2addr p2, p2

    .line 150
    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    const/16 v2, 0x1002

    .line 155
    .line 156
    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    iget-object v2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 161
    .line 162
    invoke-virtual {v2, p2}, Ll/bgw0;->e(I)V

    .line 163
    .line 164
    .line 165
    goto/16 :goto_1

    .line 166
    .line 167
    :cond_5
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iget v3, p0, Ll/jtr0;->c:I

    .line 172
    .line 173
    sub-int/2addr v3, p2

    .line 174
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    iget-object v2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 179
    .line 180
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    iget v3, p0, Ll/jtr0;->d:I

    .line 185
    .line 186
    invoke-virtual {p1, v2, v3, p2}, Ll/bgw0;->g([BII)V

    .line 187
    .line 188
    .line 189
    iget v2, p0, Ll/jtr0;->d:I

    .line 190
    .line 191
    add-int/2addr v2, p2

    .line 192
    iput v2, p0, Ll/jtr0;->d:I

    .line 193
    .line 194
    iget p2, p0, Ll/jtr0;->c:I

    .line 195
    .line 196
    if-ne v2, p2, :cond_2

    .line 197
    .line 198
    iget-boolean v2, p0, Ll/jtr0;->e:Z

    .line 199
    .line 200
    iget-object v3, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 201
    .line 202
    if-eqz v2, :cond_7

    .line 203
    .line 204
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-static {v2, v4, p2, v1}, Ll/mpw0;->s([BIII)I

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    if-nez p2, :cond_6

    .line 213
    .line 214
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 215
    .line 216
    iget v2, p0, Ll/jtr0;->c:I

    .line 217
    .line 218
    add-int/lit8 v2, v2, -0x4

    .line 219
    .line 220
    invoke-virtual {p2, v2}, Ll/bgw0;->j(I)V

    .line 221
    .line 222
    .line 223
    goto :goto_3

    .line 224
    :cond_6
    iput-boolean v0, p0, Ll/jtr0;->f:Z

    .line 225
    .line 226
    return-void

    .line 227
    :cond_7
    invoke-virtual {v3, p2}, Ll/bgw0;->j(I)V

    .line 228
    .line 229
    .line 230
    :goto_3
    iget-object p2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 231
    .line 232
    invoke-virtual {p2, v4}, Ll/bgw0;->k(I)V

    .line 233
    .line 234
    .line 235
    iget-object p2, p0, Ll/jtr0;->a:Ll/itr0;

    .line 236
    .line 237
    iget-object v2, p0, Ll/jtr0;->b:Ll/bgw0;

    .line 238
    .line 239
    invoke-interface {p2, v2}, Ll/itr0;->b(Ll/bgw0;)V

    .line 240
    .line 241
    .line 242
    iput v4, p0, Ll/jtr0;->d:I

    .line 243
    .line 244
    goto/16 :goto_1

    .line 245
    .line 246
    :cond_8
    return-void
.end method

.method public final zzc()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/jtr0;->f:Z

    .line 3
    .line 4
    return-void
.end method
