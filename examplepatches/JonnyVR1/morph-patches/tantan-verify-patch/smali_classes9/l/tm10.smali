.class public Ll/tm10;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tm10$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:[Ll/tm10$a;

.field public d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Ll/tm10;->a:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/tm10;->d:I

    .line 9
    .line 10
    iput-object p1, p0, Ll/tm10;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/tm10;->d()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static a(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const-string p0, "2x2"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "1plus8"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    const-string p0, "3x3"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const-string p0, "1plus5"

    .line 20
    .line 21
    return-object p0
.end method


# virtual methods
.method public b(III)Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_1

    .line 3
    .line 4
    iget v1, p0, Ll/tm10;->a:I

    .line 5
    .line 6
    if-le p1, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/tm10;->c:[Ll/tm10$a;

    .line 10
    .line 11
    sub-int/2addr p1, v0

    .line 12
    aget-object p0, p0, p1

    .line 13
    .line 14
    invoke-static {}, Ll/ynp0;->p()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float p1, p1

    .line 19
    iget v0, p0, Ll/tm10$a;->a:F

    .line 20
    .line 21
    mul-float/2addr p1, v0

    .line 22
    float-to-int p1, p1

    .line 23
    invoke-static {}, Ll/ynp0;->p()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    iget v1, p0, Ll/tm10$a;->b:F

    .line 29
    .line 30
    mul-float/2addr v0, v1

    .line 31
    float-to-int v0, v0

    .line 32
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    .line 34
    invoke-direct {v1, p1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/ynp0;->p()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    int-to-float p1, p1

    .line 42
    iget v0, p0, Ll/tm10$a;->d:F

    .line 43
    .line 44
    mul-float/2addr p1, v0

    .line 45
    float-to-int p1, p1

    .line 46
    add-int/2addr p3, p1

    .line 47
    iput p3, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 48
    .line 49
    invoke-static {}, Ll/ynp0;->p()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    int-to-float p1, p1

    .line 54
    iget p0, p0, Ll/tm10$a;->c:F

    .line 55
    .line 56
    mul-float/2addr p1, p0

    .line 57
    float-to-int p0, p1

    .line 58
    add-int/2addr p2, p0

    .line 59
    iput p2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 60
    .line 61
    return-object v1

    .line 62
    :cond_1
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p3, "setLayoutParams userPos illegal, userPos = "

    .line 65
    .line 66
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, " maxUserCount="

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget p0, p0, Ll/tm10;->a:I

    .line 78
    .line 79
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const/4 p0, 0x0

    .line 90
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tm10;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public final d()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/tm10;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x3

    .line 13
    const/4 v4, 0x2

    .line 14
    const/4 v5, 0x1

    .line 15
    const/4 v6, 0x0

    .line 16
    const/4 v7, -0x1

    .line 17
    sparse-switch v2, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_0
    const-string v2, "1plus8"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v7, v3

    .line 31
    goto :goto_0

    .line 32
    :sswitch_1
    const-string v2, "1plus5"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move v7, v4

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string v2, "3x3"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v7, v5

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string v2, "2x2"

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move v7, v6

    .line 64
    :goto_0
    const/16 v1, 0x9

    .line 65
    .line 66
    const v2, 0x3eab020c    # 0.334f

    .line 67
    .line 68
    .line 69
    const v8, 0x3f2ac083    # 0.667f

    .line 70
    .line 71
    .line 72
    const/4 v9, 0x0

    .line 73
    const/high16 v10, 0x3f000000    # 0.5f

    .line 74
    .line 75
    const v11, 0x3eaa7efa    # 0.333f

    .line 76
    .line 77
    .line 78
    packed-switch v7, :pswitch_data_0

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :pswitch_0
    iput v1, v0, Ll/tm10;->a:I

    .line 83
    .line 84
    iput v3, v0, Ll/tm10;->d:I

    .line 85
    .line 86
    new-instance v12, Ll/tm10$a;

    .line 87
    .line 88
    const/high16 v1, 0x3f800000    # 1.0f

    .line 89
    .line 90
    invoke-direct {v12, v9, v9, v10, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 91
    .line 92
    .line 93
    new-instance v13, Ll/tm10$a;

    .line 94
    .line 95
    const/high16 v1, 0x3e800000    # 0.25f

    .line 96
    .line 97
    invoke-direct {v13, v9, v10, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 98
    .line 99
    .line 100
    new-instance v14, Ll/tm10$a;

    .line 101
    .line 102
    const/high16 v2, 0x3f400000    # 0.75f

    .line 103
    .line 104
    invoke-direct {v14, v9, v2, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 105
    .line 106
    .line 107
    new-instance v15, Ll/tm10$a;

    .line 108
    .line 109
    invoke-direct {v15, v1, v10, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 110
    .line 111
    .line 112
    new-instance v3, Ll/tm10$a;

    .line 113
    .line 114
    invoke-direct {v3, v1, v2, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 115
    .line 116
    .line 117
    new-instance v4, Ll/tm10$a;

    .line 118
    .line 119
    invoke-direct {v4, v10, v10, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 120
    .line 121
    .line 122
    new-instance v5, Ll/tm10$a;

    .line 123
    .line 124
    invoke-direct {v5, v10, v2, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 125
    .line 126
    .line 127
    new-instance v6, Ll/tm10$a;

    .line 128
    .line 129
    invoke-direct {v6, v2, v10, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 130
    .line 131
    .line 132
    new-instance v7, Ll/tm10$a;

    .line 133
    .line 134
    invoke-direct {v7, v2, v2, v1, v1}, Ll/tm10$a;-><init>(FFFF)V

    .line 135
    .line 136
    .line 137
    move-object/from16 v16, v3

    .line 138
    .line 139
    move-object/from16 v17, v4

    .line 140
    .line 141
    move-object/from16 v18, v5

    .line 142
    .line 143
    move-object/from16 v19, v6

    .line 144
    .line 145
    move-object/from16 v20, v7

    .line 146
    .line 147
    filled-new-array/range {v12 .. v20}, [Ll/tm10$a;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    iput-object v1, v0, Ll/tm10;->c:[Ll/tm10$a;

    .line 152
    .line 153
    return-void

    .line 154
    :pswitch_1
    const/4 v1, 0x6

    .line 155
    iput v1, v0, Ll/tm10;->a:I

    .line 156
    .line 157
    iput v5, v0, Ll/tm10;->d:I

    .line 158
    .line 159
    new-instance v12, Ll/tm10$a;

    .line 160
    .line 161
    invoke-direct {v12, v9, v9, v8, v8}, Ll/tm10$a;-><init>(FFFF)V

    .line 162
    .line 163
    .line 164
    new-instance v13, Ll/tm10$a;

    .line 165
    .line 166
    invoke-direct {v13, v9, v8, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 167
    .line 168
    .line 169
    new-instance v14, Ll/tm10$a;

    .line 170
    .line 171
    invoke-direct {v14, v11, v8, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 172
    .line 173
    .line 174
    new-instance v15, Ll/tm10$a;

    .line 175
    .line 176
    invoke-direct {v15, v8, v9, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 177
    .line 178
    .line 179
    new-instance v1, Ll/tm10$a;

    .line 180
    .line 181
    invoke-direct {v1, v8, v11, v2, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 182
    .line 183
    .line 184
    new-instance v2, Ll/tm10$a;

    .line 185
    .line 186
    invoke-direct {v2, v8, v8, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 187
    .line 188
    .line 189
    move-object/from16 v16, v1

    .line 190
    .line 191
    move-object/from16 v17, v2

    .line 192
    .line 193
    filled-new-array/range {v12 .. v17}, [Ll/tm10$a;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    iput-object v1, v0, Ll/tm10;->c:[Ll/tm10$a;

    .line 198
    .line 199
    return-void

    .line 200
    :pswitch_2
    iput v1, v0, Ll/tm10;->a:I

    .line 201
    .line 202
    iput v4, v0, Ll/tm10;->d:I

    .line 203
    .line 204
    new-instance v1, Ll/tm10$a;

    .line 205
    .line 206
    invoke-direct {v1, v9, v9, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 207
    .line 208
    .line 209
    new-instance v3, Ll/tm10$a;

    .line 210
    .line 211
    invoke-direct {v3, v9, v11, v11, v2}, Ll/tm10$a;-><init>(FFFF)V

    .line 212
    .line 213
    .line 214
    new-instance v4, Ll/tm10$a;

    .line 215
    .line 216
    invoke-direct {v4, v9, v8, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 217
    .line 218
    .line 219
    new-instance v5, Ll/tm10$a;

    .line 220
    .line 221
    invoke-direct {v5, v11, v9, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 222
    .line 223
    .line 224
    new-instance v6, Ll/tm10$a;

    .line 225
    .line 226
    invoke-direct {v6, v11, v11, v2, v2}, Ll/tm10$a;-><init>(FFFF)V

    .line 227
    .line 228
    .line 229
    new-instance v7, Ll/tm10$a;

    .line 230
    .line 231
    invoke-direct {v7, v11, v8, v2, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 232
    .line 233
    .line 234
    new-instance v10, Ll/tm10$a;

    .line 235
    .line 236
    invoke-direct {v10, v8, v9, v2, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 237
    .line 238
    .line 239
    new-instance v9, Ll/tm10$a;

    .line 240
    .line 241
    invoke-direct {v9, v8, v11, v11, v2}, Ll/tm10$a;-><init>(FFFF)V

    .line 242
    .line 243
    .line 244
    move-object v2, v10

    .line 245
    new-instance v10, Ll/tm10$a;

    .line 246
    .line 247
    invoke-direct {v10, v8, v8, v11, v11}, Ll/tm10$a;-><init>(FFFF)V

    .line 248
    .line 249
    .line 250
    move-object v8, v2

    .line 251
    move-object v2, v1

    .line 252
    filled-new-array/range {v2 .. v10}, [Ll/tm10$a;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    iput-object v1, v0, Ll/tm10;->c:[Ll/tm10$a;

    .line 257
    .line 258
    return-void

    .line 259
    :pswitch_3
    const/4 v1, 0x4

    .line 260
    iput v1, v0, Ll/tm10;->a:I

    .line 261
    .line 262
    iput v6, v0, Ll/tm10;->d:I

    .line 263
    .line 264
    new-instance v1, Ll/tm10$a;

    .line 265
    .line 266
    invoke-direct {v1, v9, v9, v10, v10}, Ll/tm10$a;-><init>(FFFF)V

    .line 267
    .line 268
    .line 269
    new-instance v2, Ll/tm10$a;

    .line 270
    .line 271
    invoke-direct {v2, v9, v10, v10, v10}, Ll/tm10$a;-><init>(FFFF)V

    .line 272
    .line 273
    .line 274
    new-instance v3, Ll/tm10$a;

    .line 275
    .line 276
    invoke-direct {v3, v10, v9, v10, v10}, Ll/tm10$a;-><init>(FFFF)V

    .line 277
    .line 278
    .line 279
    new-instance v4, Ll/tm10$a;

    .line 280
    .line 281
    invoke-direct {v4, v10, v10, v10, v10}, Ll/tm10$a;-><init>(FFFF)V

    .line 282
    .line 283
    .line 284
    filled-new-array {v1, v2, v3, v4}, [Ll/tm10$a;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iput-object v1, v0, Ll/tm10;->c:[Ll/tm10$a;

    .line 289
    .line 290
    return-void

    .line 291
    :sswitch_data_0
    .sparse-switch
        0xca6c -> :sswitch_3
        0xce2e -> :sswitch_2
        0x59fa9c4a -> :sswitch_1
        0x59fa9c4d -> :sswitch_0
    .end sparse-switch

    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e(ILcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_1

    .line 3
    .line 4
    iget v1, p0, Ll/tm10;->a:I

    .line 5
    .line 6
    if-le p1, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/tm10;->c:[Ll/tm10$a;

    .line 10
    .line 11
    sub-int/2addr p1, v0

    .line 12
    aget-object p0, p0, p1

    .line 13
    .line 14
    iget p1, p0, Ll/tm10$a;->a:F

    .line 15
    .line 16
    iput p1, p2, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 17
    .line 18
    iget p1, p0, Ll/tm10$a;->b:F

    .line 19
    .line 20
    iput p1, p2, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 21
    .line 22
    iget p1, p0, Ll/tm10$a;->c:F

    .line 23
    .line 24
    iput p1, p2, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 25
    .line 26
    iget p0, p0, Ll/tm10$a;->d:F

    .line 27
    .line 28
    iput p0, p2, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "setMember userPos illegal, userPos = "

    .line 34
    .line 35
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, " maxUserCount="

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget p0, p0, Ll/tm10;->a:I

    .line 47
    .line 48
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
