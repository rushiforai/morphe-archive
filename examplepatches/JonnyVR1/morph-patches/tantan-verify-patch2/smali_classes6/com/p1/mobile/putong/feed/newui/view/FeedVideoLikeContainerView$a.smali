.class public Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;Ll/zai;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;Landroid/view/MotionEvent;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x3

    .line 30
    const/4 v2, 0x0

    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 36
    .line 37
    .line 38
    return v2

    .line 39
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/4 v0, 0x2

    .line 44
    const/4 v1, 0x1

    .line 45
    if-ne p1, v1, :cond_7

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-le p1, v1, :cond_6

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 62
    .line 63
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->a:I

    .line 64
    .line 65
    if-nez p1, :cond_6

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    sub-int/2addr v3, v1

    .line 74
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 79
    .line 80
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->a:I

    .line 81
    .line 82
    if-ne p1, v1, :cond_6

    .line 83
    .line 84
    invoke-static {}, Ll/bnl0;->y0()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-static {}, Ll/bnl0;->w0()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    div-int/lit8 p1, p1, 0x32

    .line 97
    .line 98
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 105
    .line 106
    move v4, v1

    .line 107
    :goto_0
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    sub-int/2addr v5, v0

    .line 114
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 115
    .line 116
    if-ge v4, v5, :cond_5

    .line 117
    .line 118
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    check-cast v5, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 123
    .line 124
    iget v6, v5, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->a:I

    .line 125
    .line 126
    if-eq v6, v0, :cond_3

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_3
    iget v6, v5, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->c:F

    .line 130
    .line 131
    iget v7, v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->c:F

    .line 132
    .line 133
    sub-float/2addr v6, v7

    .line 134
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    int-to-float v7, p1

    .line 139
    cmpl-float v6, v6, v7

    .line 140
    .line 141
    if-gtz v6, :cond_6

    .line 142
    .line 143
    iget v5, v5, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->d:F

    .line 144
    .line 145
    iget v6, v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->d:F

    .line 146
    .line 147
    sub-float/2addr v5, v6

    .line 148
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    cmpl-float v5, v5, v7

    .line 153
    .line 154
    if-lez v5, :cond_4

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_5
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    sub-int/2addr p1, v1

    .line 165
    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 170
    .line 171
    iget-wide v4, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->b:J

    .line 172
    .line 173
    iget-wide v6, v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->b:J

    .line 174
    .line 175
    sub-long/2addr v4, v6

    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->b()J

    .line 177
    .line 178
    .line 179
    move-result-wide v6

    .line 180
    cmp-long p1, v4, v6

    .line 181
    .line 182
    if-gez p1, :cond_6

    .line 183
    .line 184
    move v2, v1

    .line 185
    :cond_6
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 186
    .line 187
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 188
    .line 189
    .line 190
    return v2

    .line 191
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 192
    .line 193
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 194
    .line 195
    if-eqz p1, :cond_c

    .line 196
    .line 197
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-le p1, v1, :cond_c

    .line 204
    .line 205
    invoke-static {}, Ll/bnl0;->y0()I

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    invoke-static {}, Ll/bnl0;->y0()I

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    div-int/lit8 p1, p1, 0x32

    .line 218
    .line 219
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 220
    .line 221
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 226
    .line 227
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 228
    .line 229
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    sub-int/2addr v5, v1

    .line 234
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    check-cast v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 239
    .line 240
    iget-wide v4, v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->b:J

    .line 241
    .line 242
    iget-wide v6, v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->b:J

    .line 243
    .line 244
    sub-long/2addr v4, v6

    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->b()J

    .line 246
    .line 247
    .line 248
    move-result-wide v6

    .line 249
    cmp-long v4, v4, v6

    .line 250
    .line 251
    if-ltz v4, :cond_8

    .line 252
    .line 253
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 254
    .line 255
    iput-boolean v2, v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 256
    .line 257
    :cond_8
    :goto_2
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 258
    .line 259
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 260
    .line 261
    .line 262
    move-result v4

    .line 263
    if-ge v1, v4, :cond_b

    .line 264
    .line 265
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 266
    .line 267
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v4

    .line 271
    check-cast v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 272
    .line 273
    iget v5, v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->a:I

    .line 274
    .line 275
    if-ne v5, v0, :cond_a

    .line 276
    .line 277
    iget v5, v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->c:F

    .line 278
    .line 279
    iget v6, v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->c:F

    .line 280
    .line 281
    sub-float/2addr v5, v6

    .line 282
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    int-to-float v6, p1

    .line 287
    cmpl-float v5, v5, v6

    .line 288
    .line 289
    if-gtz v5, :cond_9

    .line 290
    .line 291
    iget v4, v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->d:F

    .line 292
    .line 293
    iget v5, v3, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->d:F

    .line 294
    .line 295
    sub-float/2addr v4, v5

    .line 296
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    cmpl-float v4, v4, v6

    .line 301
    .line 302
    if-lez v4, :cond_a

    .line 303
    .line 304
    :cond_9
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 305
    .line 306
    iput-boolean v2, v4, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 307
    .line 308
    :cond_a
    add-int/lit8 v1, v1, 0x1

    .line 309
    .line 310
    goto :goto_2

    .line 311
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 312
    .line 313
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 314
    .line 315
    if-nez p1, :cond_c

    .line 316
    .line 317
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 318
    .line 319
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 320
    .line 321
    .line 322
    :cond_c
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string p0, "]"

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method
