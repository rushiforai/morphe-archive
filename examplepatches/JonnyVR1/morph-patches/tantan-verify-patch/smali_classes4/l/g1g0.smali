.class public Ll/g1g0;
.super Lcom/sunshine/engine/base/a;
.source "SourceFile"


# instance fields
.field public A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/p60;",
            ">;"
        }
    .end annotation
.end field

.field public B:Z

.field public C:Z

.field private D:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sunshine/engine/base/a;-><init>(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

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
    iput-object p1, p0, Ll/g1g0;->A:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/g1g0;->B:Z

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Ll/g1g0;->C:Z

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Ll/g1g0;->D:Ljava/lang/Runnable;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/g1g0;->A:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/p60;

    .line 22
    .line 23
    invoke-virtual {v1, p0, p1}, Ll/p60;->e(Ll/g1g0;Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/sunshine/engine/base/a;->f()F

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    .line 33
    cmpl-float p1, p1, v0

    .line 34
    .line 35
    if-ltz p1, :cond_1

    .line 36
    .line 37
    iget-boolean p1, p0, Lcom/sunshine/engine/base/a;->r:Z

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iget v1, p0, Lcom/sunshine/engine/base/a;->m:I

    .line 43
    .line 44
    invoke-virtual {p0, p1, v0, v1}, Ll/g1g0;->i(FFI)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/g1g0;->D:Ljava/lang/Runnable;

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-boolean p1, p0, Lcom/sunshine/engine/base/a;->r:Z

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iget-boolean p1, p0, Ll/g1g0;->C:Z

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/sunshine/engine/base/a;->f()F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    cmpl-float p1, p1, v0

    .line 67
    .line 68
    if-ltz p1, :cond_2

    .line 69
    .line 70
    iget-boolean p1, p0, Lcom/sunshine/engine/base/a;->n:Z

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/sunshine/engine/base/s;->e()V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public e()Lorg/xml/sax/helpers/DefaultHandler;
    .locals 1

    .line 1
    new-instance v0, Ll/i1g0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i1g0;-><init>(Ll/g1g0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public h(F)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/sunshine/engine/base/a;->m:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->p:Ll/kk90;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ok90;->g()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    cmpl-float p0, p1, p0

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public i(FFI)V
    .locals 10

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/sunshine/engine/base/a;->i(FFI)V

    .line 2
    .line 3
    .line 4
    iget-boolean p3, p0, Ll/g1g0;->B:Z

    .line 5
    .line 6
    if-eqz p3, :cond_5

    .line 7
    .line 8
    iget-boolean p3, p0, Lcom/sunshine/engine/base/a;->t:Z

    .line 9
    .line 10
    if-eqz p3, :cond_5

    .line 11
    .line 12
    iget-object p0, p0, Ll/g1g0;->A:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    if-eqz p3, :cond_5

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    check-cast p3, Ll/p60;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    :goto_0
    iget-object v1, p3, Ll/p60;->g:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ge v0, v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p3, Ll/p60;->g:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/c53;

    .line 46
    .line 47
    iget-object v2, v1, Ll/c53;->h:Ll/ho0;

    .line 48
    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    invoke-virtual {v1, p1}, Ll/ho0$a;->a(F)Ll/ho0;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    :cond_1
    invoke-virtual {v1, p2}, Ll/ho0$a;->a(F)Ll/ho0;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    if-eqz v2, :cond_4

    .line 60
    .line 61
    if-nez v3, :cond_2

    .line 62
    .line 63
    goto/16 :goto_2

    .line 64
    .line 65
    :cond_2
    cmpl-float v4, p1, p2

    .line 66
    .line 67
    if-lez v4, :cond_3

    .line 68
    .line 69
    move-object v4, v3

    .line 70
    move-object v3, v2

    .line 71
    move-object v2, v4

    .line 72
    move v5, p1

    .line 73
    move v4, p2

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    move v4, p1

    .line 76
    move v5, p2

    .line 77
    :goto_1
    new-instance v6, Ll/ho0;

    .line 78
    .line 79
    invoke-direct {v6}, Ll/ho0;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v6, v1, Ll/c53;->h:Ll/ho0;

    .line 83
    .line 84
    iget-object v6, v6, Ll/ho0;->a:Ll/tfe;

    .line 85
    .line 86
    invoke-virtual {v6, v4, v5}, Ll/tfe;->e(FF)V

    .line 87
    .line 88
    .line 89
    iget-object v6, v2, Ll/ho0;->a:Ll/tfe;

    .line 90
    .line 91
    invoke-virtual {v6, v4}, Ll/tfe;->b(F)F

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    iget-object v6, v3, Ll/ho0;->a:Ll/tfe;

    .line 96
    .line 97
    invoke-virtual {v6, v5}, Ll/tfe;->b(F)F

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    iget-object v6, v1, Ll/c53;->h:Ll/ho0;

    .line 102
    .line 103
    iget-object v7, v6, Ll/ho0;->d:Ll/drf0;

    .line 104
    .line 105
    iget-object v8, v3, Ll/ho0;->d:Ll/drf0;

    .line 106
    .line 107
    iget-object v9, v8, Ll/drf0;->a:Ljava/lang/Object;

    .line 108
    .line 109
    iput-object v9, v7, Ll/drf0;->a:Ljava/lang/Object;

    .line 110
    .line 111
    iget-object v8, v8, Ll/drf0;->b:Ljava/lang/Object;

    .line 112
    .line 113
    iput-object v8, v7, Ll/drf0;->b:Ljava/lang/Object;

    .line 114
    .line 115
    iget-object v6, v6, Ll/ho0;->b:Ll/kk90;

    .line 116
    .line 117
    iget-object v7, v2, Ll/ho0;->b:Ll/kk90;

    .line 118
    .line 119
    invoke-virtual {v7, v4}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 120
    .line 121
    .line 122
    move-result-object v7

    .line 123
    iget-object v8, v3, Ll/ho0;->b:Ll/kk90;

    .line 124
    .line 125
    invoke-virtual {v8, v5}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    iget-object v9, v3, Ll/ho0;->b:Ll/kk90;

    .line 130
    .line 131
    invoke-virtual {v9}, Ll/ok90;->e()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    invoke-virtual {v6, v7, v8, v9}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    .line 136
    .line 137
    .line 138
    iget-object v6, v1, Ll/c53;->h:Ll/ho0;

    .line 139
    .line 140
    iget-object v6, v6, Ll/ho0;->c:Ll/kk90;

    .line 141
    .line 142
    iget-object v7, v2, Ll/ho0;->c:Ll/kk90;

    .line 143
    .line 144
    invoke-virtual {v7, v4}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    iget-object v8, v3, Ll/ho0;->c:Ll/kk90;

    .line 149
    .line 150
    invoke-virtual {v8, v5}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 151
    .line 152
    .line 153
    move-result-object v8

    .line 154
    iget-object v9, v3, Ll/ho0;->c:Ll/kk90;

    .line 155
    .line 156
    invoke-virtual {v9}, Ll/ok90;->e()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v9

    .line 160
    invoke-virtual {v6, v7, v8, v9}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    .line 161
    .line 162
    .line 163
    iget-object v6, v1, Ll/c53;->h:Ll/ho0;

    .line 164
    .line 165
    iget-object v6, v6, Ll/ho0;->e:Ll/kk90;

    .line 166
    .line 167
    iget-object v7, v2, Ll/ho0;->e:Ll/kk90;

    .line 168
    .line 169
    invoke-virtual {v7, v4}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    iget-object v8, v3, Ll/ho0;->e:Ll/kk90;

    .line 174
    .line 175
    invoke-virtual {v8, v5}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 176
    .line 177
    .line 178
    move-result-object v8

    .line 179
    iget-object v9, v3, Ll/ho0;->e:Ll/kk90;

    .line 180
    .line 181
    invoke-virtual {v9}, Ll/ok90;->e()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v9

    .line 185
    invoke-virtual {v6, v7, v8, v9}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    .line 186
    .line 187
    .line 188
    iget-object v6, v1, Ll/c53;->h:Ll/ho0;

    .line 189
    .line 190
    iget-object v6, v6, Ll/ho0;->f:Ll/kk90;

    .line 191
    .line 192
    iget-object v7, v2, Ll/ho0;->f:Ll/kk90;

    .line 193
    .line 194
    invoke-virtual {v7, v4}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    iget-object v8, v3, Ll/ho0;->f:Ll/kk90;

    .line 199
    .line 200
    invoke-virtual {v8, v5}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 201
    .line 202
    .line 203
    move-result-object v8

    .line 204
    iget-object v9, v3, Ll/ho0;->f:Ll/kk90;

    .line 205
    .line 206
    invoke-virtual {v9}, Ll/ok90;->e()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v9

    .line 210
    invoke-virtual {v6, v7, v8, v9}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    .line 211
    .line 212
    .line 213
    iget-object v6, v1, Ll/c53;->h:Ll/ho0;

    .line 214
    .line 215
    iget-object v6, v6, Ll/ho0;->i:Ll/lk90;

    .line 216
    .line 217
    iget-object v7, v2, Ll/ho0;->i:Ll/lk90;

    .line 218
    .line 219
    invoke-virtual {v7, v4}, Ll/lk90;->l(F)Ljava/lang/Integer;

    .line 220
    .line 221
    .line 222
    move-result-object v7

    .line 223
    iget-object v8, v3, Ll/ho0;->i:Ll/lk90;

    .line 224
    .line 225
    invoke-virtual {v8, v5}, Ll/lk90;->l(F)Ljava/lang/Integer;

    .line 226
    .line 227
    .line 228
    move-result-object v8

    .line 229
    iget-object v9, v3, Ll/ho0;->i:Ll/lk90;

    .line 230
    .line 231
    invoke-virtual {v9}, Ll/ok90;->e()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v9

    .line 235
    invoke-virtual {v6, v7, v8, v9}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    .line 236
    .line 237
    .line 238
    iget-object v6, v1, Ll/c53;->h:Ll/ho0;

    .line 239
    .line 240
    iget-object v6, v6, Ll/ho0;->h:Ll/lk90;

    .line 241
    .line 242
    iget-object v2, v2, Ll/ho0;->h:Ll/lk90;

    .line 243
    .line 244
    invoke-virtual {v2, v4}, Ll/lk90;->l(F)Ljava/lang/Integer;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    iget-object v4, v3, Ll/ho0;->h:Ll/lk90;

    .line 249
    .line 250
    invoke-virtual {v4, v5}, Ll/lk90;->l(F)Ljava/lang/Integer;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    iget-object v5, v3, Ll/ho0;->h:Ll/lk90;

    .line 255
    .line 256
    invoke-virtual {v5}, Ll/ok90;->e()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v5

    .line 260
    invoke-virtual {v6, v2, v4, v5}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    .line 261
    .line 262
    .line 263
    iget-object v1, v1, Ll/c53;->h:Ll/ho0;

    .line 264
    .line 265
    iget-object v1, v1, Ll/ho0;->g:Ll/li80;

    .line 266
    .line 267
    iget-object v2, v3, Ll/ho0;->g:Ll/li80;

    .line 268
    .line 269
    iget-object v3, v2, Ll/li80;->a:Ljava/lang/Object;

    .line 270
    .line 271
    check-cast v3, Ljava/lang/Float;

    .line 272
    .line 273
    iget-object v2, v2, Ll/li80;->b:Ljava/lang/Object;

    .line 274
    .line 275
    check-cast v2, Ljava/lang/Float;

    .line 276
    .line 277
    invoke-virtual {v1, v3, v2}, Ll/li80;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    goto :goto_3

    .line 281
    :cond_4
    :goto_2
    const/4 v2, 0x0

    .line 282
    iput-object v2, v1, Ll/c53;->h:Ll/ho0;

    .line 283
    .line 284
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 285
    .line 286
    goto/16 :goto_0

    .line 287
    .line 288
    :cond_5
    return-void
.end method

.method public k()Ll/p60;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g1g0;->A:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/g1g0;->A:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/p60;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public l(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g1g0;->D:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method
