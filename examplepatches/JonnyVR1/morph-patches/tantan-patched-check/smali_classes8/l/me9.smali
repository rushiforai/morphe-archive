.class public Ll/me9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v8r;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/r8r;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/r8r$a;

    .line 7
    .line 8
    const-string v1, "\u95ea\u804a\u5339\u914d"

    .line 9
    .line 10
    sget v2, Ll/tbc0;->P:I

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const v1, -0x6dd6f4

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/r8r$a;->d(I)Ll/r8r$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/16 v1, -0x2a42

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->QUICK_CHAT:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/r8r$a;

    .line 42
    .line 43
    const-string v1, "\u76f4\u64ad\u4e2d"

    .line 44
    .line 45
    sget v2, Ll/tbc0;->O:I

    .line 46
    .line 47
    invoke-direct {v0, v1, v2}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    const v1, -0x67e57a

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/r8r$a;->d(I)Ll/r8r$a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/16 v1, -0x2e19

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->VOICING:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/r8r$a;

    .line 77
    .line 78
    const-string v1, "\u5b9e\u540d\u00b7\u5934\u50cf\u672c\u4eba"

    .line 79
    .line 80
    sget v2, Ll/tbc0;->N:I

    .line 81
    .line 82
    invoke-direct {v0, v1, v2}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    const v1, -0x88b800

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/r8r$a;->d(I)Ll/r8r$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const/16 v1, -0x2073

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->ID_VERIFIED:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/r8r$a;

    .line 112
    .line 113
    const-string v1, "\u5934\u50cf\u672c\u4eba"

    .line 114
    .line 115
    sget v2, Ll/tbc0;->J:I

    .line 116
    .line 117
    invoke-direct {v0, v1, v2}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 118
    .line 119
    .line 120
    const v1, -0xf5a287

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ll/r8r$a;->d(I)Ll/r8r$a;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const v1, -0x531401

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->AVATAR_VERIFIED:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    new-instance v0, Ll/r8r$a;

    .line 148
    .line 149
    const-string v1, "\u5b66\u751f"

    .line 150
    .line 151
    sget v2, Ll/tbc0;->R:I

    .line 152
    .line 153
    invoke-direct {v0, v1, v2}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 154
    .line 155
    .line 156
    const v1, -0xf69e9c

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v1}, Ll/r8r$a;->d(I)Ll/r8r$a;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const v1, -0x550301

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->STUDENT:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    new-instance v0, Ll/r8r$a;

    .line 184
    .line 185
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_0

    .line 198
    .line 199
    sget v1, Ll/tbc0;->K:I

    .line 200
    .line 201
    goto :goto_0

    .line 202
    :cond_0
    sget v1, Ll/tbc0;->U:I

    .line 203
    .line 204
    :goto_0
    invoke-direct {v0, v1}, Ll/r8r$a;-><init>(I)V

    .line 205
    .line 206
    .line 207
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->NEW:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    new-instance v0, Ll/r8r$a;

    .line 221
    .line 222
    sget v1, Ll/tbc0;->S:I

    .line 223
    .line 224
    invoke-direct {v0, v1}, Ll/r8r$a;-><init>(I)V

    .line 225
    .line 226
    .line 227
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->SVIP:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    new-instance v0, Ll/r8r$a;

    .line 241
    .line 242
    sget v1, Ll/tbc0;->L:I

    .line 243
    .line 244
    invoke-direct {v0, v1}, Ll/r8r$a;-><init>(I)V

    .line 245
    .line 246
    .line 247
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->DIAMOND:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 248
    .line 249
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    new-instance v0, Ll/r8r$a;

    .line 261
    .line 262
    sget v1, Ll/tbc0;->T:I

    .line 263
    .line 264
    invoke-direct {v0, v1}, Ll/r8r$a;-><init>(I)V

    .line 265
    .line 266
    .line 267
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->VIP:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 268
    .line 269
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    new-instance v0, Ll/r8r$a;

    .line 281
    .line 282
    const-string v1, ""

    .line 283
    .line 284
    sget v2, Ll/tbc0;->I:I

    .line 285
    .line 286
    invoke-direct {v0, v1, v2}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 287
    .line 288
    .line 289
    const v1, -0x352914

    .line 290
    .line 291
    .line 292
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->AVATAR_ICON:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 297
    .line 298
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    new-instance v0, Ll/r8r$a;

    .line 310
    .line 311
    sget v1, Ll/tbc0;->Z:I

    .line 312
    .line 313
    invoke-direct {v0, v1}, Ll/r8r$a;-><init>(I)V

    .line 314
    .line 315
    .line 316
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->OLD_VERIFIED_ICON:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 317
    .line 318
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    new-instance v0, Ll/r8r$a;

    .line 330
    .line 331
    sget v1, Ll/tbc0;->Y:I

    .line 332
    .line 333
    invoke-direct {v0, v1}, Ll/r8r$a;-><init>(I)V

    .line 334
    .line 335
    .line 336
    sget-object v1, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->OLD_AVATAR_ICON:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 337
    .line 338
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    return-object p0
.end method

.method public b()Lcom/p1/mobile/android/ui/label/LabelModule;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 2
    .line 3
    return-object p0
.end method
