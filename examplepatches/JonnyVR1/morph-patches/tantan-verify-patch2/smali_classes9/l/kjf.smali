.class public Ll/kjf;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/cjf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->inputTypeName:I

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->inputTypeName:I

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->inputTypeName:I

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->inputTypeName:I

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const-string p0, "\u5168\u90e8\u5b8c\u6210\u5373\u53ef\u89e3\u9501\u7cbe\u9009"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const-string p0, "mytab_complete_card"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 9
    .line 10
    if-ne p1, p0, :cond_1

    .line 11
    .line 12
    const-string p0, "selected_users_complete_profile"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_CARD_GUIDE_IMPROVE_PROFILE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 16
    .line 17
    if-ne p1, p0, :cond_2

    .line 18
    .line 19
    const-string p0, "invisible_answer"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const-string p0, "edit_profile"

    .line 23
    .line 24
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/util/ArrayList;
    .locals 35
    .param p2    # Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputEmpty;

    .line 8
    .line 9
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputEmpty;-><init>()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object/from16 v2, p2

    .line 14
    .line 15
    :goto_0
    new-instance v3, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 21
    .line 22
    const/16 v5, 0xf

    .line 23
    .line 24
    const/4 v7, 0x6

    .line 25
    const/4 v8, 0x5

    .line 26
    const/4 v9, 0x4

    .line 27
    const/16 v10, 0x8

    .line 28
    .line 29
    const/4 v11, 0x3

    .line 30
    const/4 v12, 0x2

    .line 31
    const/4 v13, 0x1

    .line 32
    const/4 v14, 0x0

    .line 33
    if-ne v1, v4, :cond_1

    .line 34
    .line 35
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;

    .line 36
    .line 37
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v4, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyQuestion;

    .line 41
    .line 42
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyQuestion;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v15, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFriendPurpose;

    .line 46
    .line 47
    invoke-direct {v15}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFriendPurpose;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v16, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHeight;

    .line 51
    .line 52
    invoke-direct/range {v16 .. v16}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHeight;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance v17, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;

    .line 56
    .line 57
    invoke-direct/range {v17 .. v17}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;-><init>()V

    .line 58
    .line 59
    .line 60
    new-instance v18, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCompany;

    .line 61
    .line 62
    invoke-direct/range {v18 .. v18}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCompany;-><init>()V

    .line 63
    .line 64
    .line 65
    new-instance v19, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSchoolNew;

    .line 66
    .line 67
    invoke-direct/range {v19 .. v19}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSchoolNew;-><init>()V

    .line 68
    .line 69
    .line 70
    new-instance v20, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputQualification;

    .line 71
    .line 72
    invoke-direct/range {v20 .. v20}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputQualification;-><init>()V

    .line 73
    .line 74
    .line 75
    new-instance v21, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHomeTown;

    .line 76
    .line 77
    invoke-direct/range {v21 .. v21}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHomeTown;-><init>()V

    .line 78
    .line 79
    .line 80
    new-instance v22, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHangouts;

    .line 81
    .line 82
    invoke-direct/range {v22 .. v22}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHangouts;-><init>()V

    .line 83
    .line 84
    .line 85
    new-instance v23, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFitness;

    .line 86
    .line 87
    invoke-direct/range {v23 .. v23}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFitness;-><init>()V

    .line 88
    .line 89
    .line 90
    new-instance v24, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputDrinking;

    .line 91
    .line 92
    invoke-direct/range {v24 .. v24}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputDrinking;-><init>()V

    .line 93
    .line 94
    .line 95
    new-instance v25, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSmoking;

    .line 96
    .line 97
    invoke-direct/range {v25 .. v25}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSmoking;-><init>()V

    .line 98
    .line 99
    .line 100
    new-instance v26, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputIncome;

    .line 101
    .line 102
    invoke-direct/range {v26 .. v26}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputIncome;-><init>()V

    .line 103
    .line 104
    .line 105
    new-instance v27, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCar;

    .line 106
    .line 107
    invoke-direct/range {v27 .. v27}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCar;-><init>()V

    .line 108
    .line 109
    .line 110
    new-instance v28, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;

    .line 111
    .line 112
    invoke-direct/range {v28 .. v28}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;-><init>()V

    .line 113
    .line 114
    .line 115
    new-instance v29, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameName;

    .line 116
    .line 117
    invoke-direct/range {v29 .. v29}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameName;-><init>()V

    .line 118
    .line 119
    .line 120
    new-instance v30, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;

    .line 121
    .line 122
    invoke-direct/range {v30 .. v30}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;-><init>()V

    .line 123
    .line 124
    .line 125
    new-instance v31, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameLevel;

    .line 126
    .line 127
    invoke-direct/range {v31 .. v31}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameLevel;-><init>()V

    .line 128
    .line 129
    .line 130
    new-instance v32, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameVoice;

    .line 131
    .line 132
    invoke-direct/range {v32 .. v32}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameVoice;-><init>()V

    .line 133
    .line 134
    .line 135
    new-instance v33, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFoodFlavor;

    .line 136
    .line 137
    invoke-direct/range {v33 .. v33}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFoodFlavor;-><init>()V

    .line 138
    .line 139
    .line 140
    new-instance v34, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputPet;

    .line 141
    .line 142
    invoke-direct/range {v34 .. v34}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputPet;-><init>()V

    .line 143
    .line 144
    .line 145
    const/16 p2, 0x7

    .line 146
    .line 147
    const/16 v6, 0x16

    .line 148
    .line 149
    new-array v6, v6, [Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 150
    .line 151
    aput-object v1, v6, v14

    .line 152
    .line 153
    aput-object v4, v6, v13

    .line 154
    .line 155
    aput-object v15, v6, v12

    .line 156
    .line 157
    aput-object v16, v6, v11

    .line 158
    .line 159
    aput-object v17, v6, v9

    .line 160
    .line 161
    aput-object v18, v6, v8

    .line 162
    .line 163
    aput-object v19, v6, v7

    .line 164
    .line 165
    aput-object v20, v6, p2

    .line 166
    .line 167
    aput-object v21, v6, v10

    .line 168
    .line 169
    const/16 v1, 0x9

    .line 170
    .line 171
    aput-object v22, v6, v1

    .line 172
    .line 173
    const/16 v1, 0xa

    .line 174
    .line 175
    aput-object v23, v6, v1

    .line 176
    .line 177
    const/16 v1, 0xb

    .line 178
    .line 179
    aput-object v24, v6, v1

    .line 180
    .line 181
    const/16 v1, 0xc

    .line 182
    .line 183
    aput-object v25, v6, v1

    .line 184
    .line 185
    const/16 v1, 0xd

    .line 186
    .line 187
    aput-object v26, v6, v1

    .line 188
    .line 189
    const/16 v1, 0xe

    .line 190
    .line 191
    aput-object v27, v6, v1

    .line 192
    .line 193
    aput-object v28, v6, v5

    .line 194
    .line 195
    const/16 v1, 0x10

    .line 196
    .line 197
    aput-object v29, v6, v1

    .line 198
    .line 199
    const/16 v1, 0x11

    .line 200
    .line 201
    aput-object v30, v6, v1

    .line 202
    .line 203
    const/16 v1, 0x12

    .line 204
    .line 205
    aput-object v31, v6, v1

    .line 206
    .line 207
    const/16 v1, 0x13

    .line 208
    .line 209
    aput-object v32, v6, v1

    .line 210
    .line 211
    const/16 v1, 0x14

    .line 212
    .line 213
    aput-object v33, v6, v1

    .line 214
    .line 215
    const/16 v1, 0x15

    .line 216
    .line 217
    aput-object v34, v6, v1

    .line 218
    .line 219
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0, v3, v2}, Ll/kjf;->g(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/util/ArrayList;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    return-object v0

    .line 231
    :cond_1
    const/16 p2, 0x7

    .line 232
    .line 233
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 234
    .line 235
    if-ne v1, v4, :cond_2

    .line 236
    .line 237
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;

    .line 238
    .line 239
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;-><init>()V

    .line 240
    .line 241
    .line 242
    new-instance v4, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyLife;

    .line 243
    .line 244
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyLife;-><init>()V

    .line 245
    .line 246
    .line 247
    new-instance v5, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputVerification;

    .line 248
    .line 249
    invoke-direct {v5}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputVerification;-><init>()V

    .line 250
    .line 251
    .line 252
    new-array v6, v11, [Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 253
    .line 254
    aput-object v1, v6, v14

    .line 255
    .line 256
    aput-object v4, v6, v13

    .line 257
    .line 258
    aput-object v5, v6, v12

    .line 259
    .line 260
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0, v3, v2}, Ll/kjf;->h(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/util/ArrayList;

    .line 268
    .line 269
    .line 270
    return-object v3

    .line 271
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_CARD_GUIDE_IMPROVE_PROFILE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 272
    .line 273
    if-ne v1, v0, :cond_3

    .line 274
    .line 275
    iget v0, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->inputTypeName:I

    .line 276
    .line 277
    if-ne v0, v10, :cond_4

    .line 278
    .line 279
    move-object v0, v2

    .line 280
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameName;

    .line 281
    .line 282
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameName;->selectInfoUserId:Ljava/lang/String;

    .line 283
    .line 284
    iget-object v1, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->subTitle:Ljava/lang/String;

    .line 285
    .line 286
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;

    .line 287
    .line 288
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;->setSelectInfoUserId(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setSubTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    filled-new-array {v0}, [Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    return-object v0

    .line 308
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 309
    .line 310
    if-ne v1, v0, :cond_4

    .line 311
    .line 312
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;

    .line 313
    .line 314
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;-><init>()V

    .line 315
    .line 316
    .line 317
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputQualification;

    .line 318
    .line 319
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputQualification;-><init>()V

    .line 320
    .line 321
    .line 322
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHomeTown;

    .line 323
    .line 324
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHomeTown;-><init>()V

    .line 325
    .line 326
    .line 327
    new-instance v3, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFriendPurpose;

    .line 328
    .line 329
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFriendPurpose;-><init>()V

    .line 330
    .line 331
    .line 332
    new-instance v4, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHeight;

    .line 333
    .line 334
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHeight;-><init>()V

    .line 335
    .line 336
    .line 337
    new-instance v6, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;

    .line 338
    .line 339
    invoke-direct {v6}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;-><init>()V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v6, v5}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;->setNeedCount(I)Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;

    .line 343
    .line 344
    .line 345
    move-result-object v5

    .line 346
    new-instance v6, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyLife;

    .line 347
    .line 348
    invoke-direct {v6}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyLife;-><init>()V

    .line 349
    .line 350
    .line 351
    new-instance v15, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputVerification;

    .line 352
    .line 353
    invoke-direct {v15}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputVerification;-><init>()V

    .line 354
    .line 355
    .line 356
    move/from16 v16, v7

    .line 357
    .line 358
    const-string v7, "\u7cbe\u9009\u4e13\u533a\u7684\u7528\u6237\u5747\u5df2\u901a\u8fc7\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1\uff0c\u5e0c\u671b\u4f60\u4e5f\u53ef\u4ee5\u4f7f\u7528\u771f\u5b9e\u5934\u50cf\u548c\u4ed6\u4eec\u4ea4\u53cb"

    .line 359
    .line 360
    invoke-virtual {v15, v7}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setSubTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 361
    .line 362
    .line 363
    move-result-object v7

    .line 364
    new-array v10, v10, [Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 365
    .line 366
    aput-object v0, v10, v14

    .line 367
    .line 368
    aput-object v1, v10, v13

    .line 369
    .line 370
    aput-object v2, v10, v12

    .line 371
    .line 372
    aput-object v3, v10, v11

    .line 373
    .line 374
    aput-object v4, v10, v9

    .line 375
    .line 376
    aput-object v5, v10, v8

    .line 377
    .line 378
    aput-object v6, v10, v16

    .line 379
    .line 380
    aput-object v7, v10, p2

    .line 381
    .line 382
    invoke-static {v10}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    return-object v0

    .line 387
    :cond_4
    return-object v3
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    return-object p0
.end method

.method public final g(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/ijf;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/ijf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-ltz p0, :cond_0

    .line 11
    .line 12
    new-instance p2, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    add-int/2addr p1, p0

    .line 30
    invoke-interface {p2, p0, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_0
    return-object p1
.end method

.method public final h(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/jjf;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/jjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-ltz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    :cond_0
    return-object p1
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 9
    .line 10
    if-ne p1, p0, :cond_1

    .line 11
    .line 12
    iget p0, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->inputTypeName:I

    .line 13
    .line 14
    const/16 p1, 0x19

    .line 15
    .line 16
    if-ne p0, p1, :cond_1

    .line 17
    .line 18
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    return-object p0
.end method
