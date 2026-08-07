.class public Ll/vj5;
.super Ll/h9c;
.source "SourceFile"

# interfaces
.implements Ll/gq2;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h9c;",
        "Ll/gq2<",
        "Lcom/p1/mobile/putong/data/CommonData;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/ejk0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h9c;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/vj5;Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vj5;->l(Lcom/p1/mobile/putong/data/DbLinks;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Lcom/p1/mobile/putong/data/Envelope;Lcom/tantanapp/common/data/BaseData;ZZZ)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/vj5;->m(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/CommonData;ZZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/16 p0, 0x20

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "commonDb"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/wzh0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h()V
    .locals 12

    .line 1
    new-instance v0, Ll/wzh0;

    .line 2
    .line 3
    sget-object v3, Lcom/p1/mobile/putong/data/DbLinks;->DB_ADAPTER:Ll/vzf0;

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    const/16 v5, 0x3e8

    .line 7
    .line 8
    const-string v2, "links"

    .line 9
    .line 10
    move-object v1, p0

    .line 11
    invoke-direct/range {v0 .. v5}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, v1, Ll/vj5;->c:Ll/wzh0;

    .line 15
    .line 16
    new-instance v6, Ll/ejk0;

    .line 17
    .line 18
    sget-object v9, Lcom/p1/mobile/putong/data/User;->DB_ADAPTER:Ll/vzf0;

    .line 19
    .line 20
    const/4 v10, 0x0

    .line 21
    const/16 v11, 0x3e8

    .line 22
    .line 23
    const-string v8, "users"

    .line 24
    .line 25
    move-object v7, v1

    .line 26
    invoke-direct/range {v6 .. v11}, Ll/ejk0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 27
    .line 28
    .line 29
    iput-object v6, v1, Ll/vj5;->d:Ll/ejk0;

    .line 30
    .line 31
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/h9c;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1}, Ll/rrq;->i(Ll/gq2;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    .line 1
    const-string p3, "ALTER TABLE "

    .line 2
    .line 3
    packed-switch p2, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " ADD COLUMN inactivated_c INTEGER"

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :pswitch_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 37
    .line 38
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, " ADD COLUMN profile_extensions_basic_country_c BLOB"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance p2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 61
    .line 62
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v0, " ADD COLUMN profile_extensions_basic_province_c BLOB"

    .line 68
    .line 69
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance p2, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 85
    .line 86
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v0, " ADD COLUMN profile_extensions_basic_city_c BLOB"

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :pswitch_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 109
    .line 110
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v0, " ADD COLUMN str_profile_zodiac_c TEXT"

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    new-instance p2, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 133
    .line 134
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v0, " ADD COLUMN str_status_c BLOB"

    .line 140
    .line 141
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    new-instance p2, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 157
    .line 158
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v0, " ADD COLUMN str_gender_c TEXT"

    .line 164
    .line 165
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    new-instance p2, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 181
    .line 182
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v0, " ADD COLUMN str_membership_name_c TEXT"

    .line 188
    .line 189
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    new-instance p2, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 205
    .line 206
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v0, " ADD COLUMN str_source_c TEXT"

    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    new-instance p2, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 229
    .line 230
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v0, " ADD COLUMN str_membership_vipBadgeType_c TEXT"

    .line 236
    .line 237
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    new-instance p2, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 253
    .line 254
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string v0, " ADD COLUMN str_profile_studies_qualification_c TEXT"

    .line 260
    .line 261
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    new-instance p2, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 277
    .line 278
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v0, " ADD COLUMN str_location_invisibleFields_c BLOB"

    .line 284
    .line 285
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    new-instance p2, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 301
    .line 302
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    const-string v0, " ADD COLUMN str_profile_extensions_physical_bloodType_c BLOB"

    .line 308
    .line 309
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p2

    .line 316
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    new-instance p2, Ljava/lang/StringBuilder;

    .line 320
    .line 321
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 325
    .line 326
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 327
    .line 328
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    const-string v0, " ADD COLUMN str_profile_extensions_basic_friendPurpose_c BLOB"

    .line 332
    .line 333
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p2

    .line 340
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    new-instance p2, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 349
    .line 350
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 351
    .line 352
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    const-string v0, " ADD COLUMN str_profile_extensions_friendStatus_status_c BLOB"

    .line 356
    .line 357
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p2

    .line 364
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    :pswitch_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 373
    .line 374
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 375
    .line 376
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    const-string v0, " ADD COLUMN profile_extensions_momentSwitch_noSyncMoment_c BLOB"

    .line 380
    .line 381
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object p2

    .line 388
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    :pswitch_4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 397
    .line 398
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 399
    .line 400
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    const-string v0, " ADD COLUMN profile_extensions_wealth_c BLOB"

    .line 404
    .line 405
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object p2

    .line 412
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    new-instance p2, Ljava/lang/StringBuilder;

    .line 416
    .line 417
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 421
    .line 422
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 423
    .line 424
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v0, " ADD COLUMN profile_extensions_basic_qualification_c BLOB"

    .line 428
    .line 429
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object p2

    .line 436
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    new-instance p2, Ljava/lang/StringBuilder;

    .line 440
    .line 441
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 445
    .line 446
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 447
    .line 448
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    const-string v0, " ADD COLUMN profile_extensions_physical_height_c BLOB"

    .line 452
    .line 453
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object p2

    .line 460
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 461
    .line 462
    .line 463
    :pswitch_5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 464
    .line 465
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 469
    .line 470
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 471
    .line 472
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    const-string v0, " ADD COLUMN profile_extensions_profileCompletion_c BLOB"

    .line 476
    .line 477
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object p2

    .line 484
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    new-instance p2, Ljava/lang/StringBuilder;

    .line 488
    .line 489
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 490
    .line 491
    .line 492
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 493
    .line 494
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 495
    .line 496
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    const-string v0, " ADD COLUMN profile_extensions_voiceSignature_c BLOB"

    .line 500
    .line 501
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object p2

    .line 508
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 509
    .line 510
    .line 511
    :pswitch_6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 512
    .line 513
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 517
    .line 518
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 519
    .line 520
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 521
    .line 522
    .line 523
    const-string v0, " ADD COLUMN activityUser_action_c TEXT"

    .line 524
    .line 525
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    .line 527
    .line 528
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 529
    .line 530
    .line 531
    move-result-object p2

    .line 532
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 533
    .line 534
    .line 535
    new-instance p2, Ljava/lang/StringBuilder;

    .line 536
    .line 537
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 538
    .line 539
    .line 540
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 541
    .line 542
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 543
    .line 544
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    const-string v0, " ADD COLUMN activityUser_score_c INTEGER"

    .line 548
    .line 549
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object p2

    .line 556
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    :pswitch_7
    new-instance p2, Ljava/lang/StringBuilder;

    .line 560
    .line 561
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 565
    .line 566
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 567
    .line 568
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    const-string v0, " ADD COLUMN matePlanUser_c INTEGER"

    .line 572
    .line 573
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object p2

    .line 580
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    new-instance p2, Ljava/lang/StringBuilder;

    .line 584
    .line 585
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 586
    .line 587
    .line 588
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 589
    .line 590
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 591
    .line 592
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    const-string v0, " ADD COLUMN matePlanAdUser_c INTEGER"

    .line 596
    .line 597
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    .line 599
    .line 600
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 601
    .line 602
    .line 603
    move-result-object p2

    .line 604
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 605
    .line 606
    .line 607
    :pswitch_8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 608
    .line 609
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 613
    .line 614
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 615
    .line 616
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    .line 618
    .line 619
    const-string v0, " ADD COLUMN regionTag_c TEXT"

    .line 620
    .line 621
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object p2

    .line 628
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    :pswitch_9
    new-instance p2, Ljava/lang/StringBuilder;

    .line 632
    .line 633
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 637
    .line 638
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 639
    .line 640
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    .line 642
    .line 643
    const-string v0, " ADD COLUMN localLikeIdentifiers_c BLOB"

    .line 644
    .line 645
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    .line 647
    .line 648
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object p2

    .line 652
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 653
    .line 654
    .line 655
    :pswitch_a
    new-instance p2, Ljava/lang/StringBuilder;

    .line 656
    .line 657
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 658
    .line 659
    .line 660
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 661
    .line 662
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 663
    .line 664
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 665
    .line 666
    .line 667
    const-string v0, " ADD COLUMN deleted_c INTEGER"

    .line 668
    .line 669
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 670
    .line 671
    .line 672
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object p2

    .line 676
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    new-instance p2, Ljava/lang/StringBuilder;

    .line 680
    .line 681
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 682
    .line 683
    .line 684
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 685
    .line 686
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 687
    .line 688
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    .line 690
    .line 691
    const-string v0, " ADD COLUMN profile_extensions_interest_tags_c BLOB"

    .line 692
    .line 693
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    .line 695
    .line 696
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object p2

    .line 700
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 701
    .line 702
    .line 703
    :pswitch_b
    new-instance p2, Ljava/lang/StringBuilder;

    .line 704
    .line 705
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 706
    .line 707
    .line 708
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 709
    .line 710
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 711
    .line 712
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 713
    .line 714
    .line 715
    const-string v0, " ADD COLUMN profile_extensions_live_voiceImgId_c BLOB"

    .line 716
    .line 717
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 718
    .line 719
    .line 720
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 721
    .line 722
    .line 723
    move-result-object p2

    .line 724
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 725
    .line 726
    .line 727
    new-instance p2, Ljava/lang/StringBuilder;

    .line 728
    .line 729
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 730
    .line 731
    .line 732
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 733
    .line 734
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 735
    .line 736
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 737
    .line 738
    .line 739
    const-string v0, " ADD COLUMN profile_extensions_live_voiceImgUrl_c BLOB"

    .line 740
    .line 741
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 742
    .line 743
    .line 744
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 745
    .line 746
    .line 747
    move-result-object p2

    .line 748
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 749
    .line 750
    .line 751
    :pswitch_c
    new-instance p2, Ljava/lang/StringBuilder;

    .line 752
    .line 753
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 754
    .line 755
    .line 756
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 757
    .line 758
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 759
    .line 760
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 761
    .line 762
    .line 763
    const-string v0, " ADD COLUMN profile_extensions_mate_c BLOB"

    .line 764
    .line 765
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 766
    .line 767
    .line 768
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 769
    .line 770
    .line 771
    move-result-object p2

    .line 772
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 773
    .line 774
    .line 775
    :pswitch_d
    new-instance p2, Ljava/lang/StringBuilder;

    .line 776
    .line 777
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 778
    .line 779
    .line 780
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 781
    .line 782
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 783
    .line 784
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 785
    .line 786
    .line 787
    const-string v0, " ADD COLUMN profile_extensions_pet_c BLOB"

    .line 788
    .line 789
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    .line 791
    .line 792
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 793
    .line 794
    .line 795
    move-result-object p2

    .line 796
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 797
    .line 798
    .line 799
    :pswitch_e
    new-instance p2, Ljava/lang/StringBuilder;

    .line 800
    .line 801
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 802
    .line 803
    .line 804
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 805
    .line 806
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 807
    .line 808
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 809
    .line 810
    .line 811
    const-string v0, " ADD COLUMN profile_extensions_tailFrame_url_c BLOB"

    .line 812
    .line 813
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 814
    .line 815
    .line 816
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 817
    .line 818
    .line 819
    move-result-object p2

    .line 820
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 821
    .line 822
    .line 823
    new-instance p2, Ljava/lang/StringBuilder;

    .line 824
    .line 825
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 826
    .line 827
    .line 828
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 829
    .line 830
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 831
    .line 832
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 833
    .line 834
    .line 835
    const-string v0, " ADD COLUMN profile_extensions_tailFrame_expiredTime_c BLOB"

    .line 836
    .line 837
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 838
    .line 839
    .line 840
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 841
    .line 842
    .line 843
    move-result-object p2

    .line 844
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 845
    .line 846
    .line 847
    :pswitch_f
    new-instance p2, Ljava/lang/StringBuilder;

    .line 848
    .line 849
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 850
    .line 851
    .line 852
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 853
    .line 854
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 855
    .line 856
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 857
    .line 858
    .line 859
    const-string v0, " ADD COLUMN profile_extensions_business_avatarID_c BLOB"

    .line 860
    .line 861
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 862
    .line 863
    .line 864
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 865
    .line 866
    .line 867
    move-result-object p2

    .line 868
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 869
    .line 870
    .line 871
    new-instance p2, Ljava/lang/StringBuilder;

    .line 872
    .line 873
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 874
    .line 875
    .line 876
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 877
    .line 878
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 879
    .line 880
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 881
    .line 882
    .line 883
    const-string v0, " ADD COLUMN profile_extensions_business_avatarExpireTime_c BLOB"

    .line 884
    .line 885
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 886
    .line 887
    .line 888
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 889
    .line 890
    .line 891
    move-result-object p2

    .line 892
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 893
    .line 894
    .line 895
    new-instance p2, Ljava/lang/StringBuilder;

    .line 896
    .line 897
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 898
    .line 899
    .line 900
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 901
    .line 902
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 903
    .line 904
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 905
    .line 906
    .line 907
    const-string v0, " ADD COLUMN profile_extensions_business_avatarClose_c BLOB"

    .line 908
    .line 909
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 910
    .line 911
    .line 912
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 913
    .line 914
    .line 915
    move-result-object p2

    .line 916
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 917
    .line 918
    .line 919
    :pswitch_10
    new-instance p2, Ljava/lang/StringBuilder;

    .line 920
    .line 921
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 922
    .line 923
    .line 924
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 925
    .line 926
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 927
    .line 928
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 929
    .line 930
    .line 931
    const-string v0, " ADD COLUMN specialEffect_c BLOB"

    .line 932
    .line 933
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 934
    .line 935
    .line 936
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 937
    .line 938
    .line 939
    move-result-object p2

    .line 940
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 941
    .line 942
    .line 943
    :pswitch_11
    new-instance p2, Ljava/lang/StringBuilder;

    .line 944
    .line 945
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 946
    .line 947
    .line 948
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 949
    .line 950
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 951
    .line 952
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 953
    .line 954
    .line 955
    const-string v0, " ADD COLUMN profile_extensions_basic_ethnicity_c BLOB"

    .line 956
    .line 957
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 958
    .line 959
    .line 960
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 961
    .line 962
    .line 963
    move-result-object p2

    .line 964
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 965
    .line 966
    .line 967
    new-instance p2, Ljava/lang/StringBuilder;

    .line 968
    .line 969
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 970
    .line 971
    .line 972
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 973
    .line 974
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 975
    .line 976
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 977
    .line 978
    .line 979
    const-string v0, " ADD COLUMN profile_extensions_basic_language_c BLOB"

    .line 980
    .line 981
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 982
    .line 983
    .line 984
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 985
    .line 986
    .line 987
    move-result-object p2

    .line 988
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 989
    .line 990
    .line 991
    :pswitch_12
    new-instance p2, Ljava/lang/StringBuilder;

    .line 992
    .line 993
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 994
    .line 995
    .line 996
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 997
    .line 998
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 999
    .line 1000
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1001
    .line 1002
    .line 1003
    const-string v0, " ADD COLUMN profile_extensions_voiceAvatarFrame_c BLOB"

    .line 1004
    .line 1005
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1006
    .line 1007
    .line 1008
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1009
    .line 1010
    .line 1011
    move-result-object p2

    .line 1012
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1013
    .line 1014
    .line 1015
    :pswitch_13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1016
    .line 1017
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1018
    .line 1019
    .line 1020
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1021
    .line 1022
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1023
    .line 1024
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1025
    .line 1026
    .line 1027
    const-string v0, " ADD COLUMN profile_extensions_physical_heightImg_c BLOB"

    .line 1028
    .line 1029
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1030
    .line 1031
    .line 1032
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1033
    .line 1034
    .line 1035
    move-result-object p2

    .line 1036
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1037
    .line 1038
    .line 1039
    :pswitch_14
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1040
    .line 1041
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1042
    .line 1043
    .line 1044
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1045
    .line 1046
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1047
    .line 1048
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1049
    .line 1050
    .line 1051
    const-string v0, " ADD COLUMN profile_extensions_marriage_c BLOB"

    .line 1052
    .line 1053
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1054
    .line 1055
    .line 1056
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1057
    .line 1058
    .line 1059
    move-result-object p2

    .line 1060
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1061
    .line 1062
    .line 1063
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1064
    .line 1065
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1066
    .line 1067
    .line 1068
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1069
    .line 1070
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1071
    .line 1072
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1073
    .line 1074
    .line 1075
    const-string v0, " ADD COLUMN profile_extensions_basic_address_c BLOB"

    .line 1076
    .line 1077
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1078
    .line 1079
    .line 1080
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1081
    .line 1082
    .line 1083
    move-result-object p2

    .line 1084
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1085
    .line 1086
    .line 1087
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1088
    .line 1089
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1090
    .line 1091
    .line 1092
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1093
    .line 1094
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1095
    .line 1096
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1097
    .line 1098
    .line 1099
    const-string v0, " ADD COLUMN profile_extensions_basic_familyBackground_c BLOB"

    .line 1100
    .line 1101
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1102
    .line 1103
    .line 1104
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1105
    .line 1106
    .line 1107
    move-result-object p2

    .line 1108
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1109
    .line 1110
    .line 1111
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1112
    .line 1113
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1114
    .line 1115
    .line 1116
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1117
    .line 1118
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1119
    .line 1120
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1121
    .line 1122
    .line 1123
    const-string v0, " ADD COLUMN profile_extensions_physical_weight_c BLOB"

    .line 1124
    .line 1125
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1126
    .line 1127
    .line 1128
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1129
    .line 1130
    .line 1131
    move-result-object p2

    .line 1132
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1133
    .line 1134
    .line 1135
    :pswitch_15
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1136
    .line 1137
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1138
    .line 1139
    .line 1140
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1141
    .line 1142
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1143
    .line 1144
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1145
    .line 1146
    .line 1147
    const-string v0, " ADD COLUMN verifications_others_otherCTDID_verified_c INTEGER"

    .line 1148
    .line 1149
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1150
    .line 1151
    .line 1152
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1153
    .line 1154
    .line 1155
    move-result-object p2

    .line 1156
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1157
    .line 1158
    .line 1159
    :pswitch_16
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1160
    .line 1161
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1162
    .line 1163
    .line 1164
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1165
    .line 1166
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1167
    .line 1168
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1169
    .line 1170
    .line 1171
    const-string v0, " ADD COLUMN profile_extensions_game_c BLOB"

    .line 1172
    .line 1173
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1174
    .line 1175
    .line 1176
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1177
    .line 1178
    .line 1179
    move-result-object p2

    .line 1180
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1181
    .line 1182
    .line 1183
    :pswitch_17
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1184
    .line 1185
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1186
    .line 1187
    .line 1188
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1189
    .line 1190
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1191
    .line 1192
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1193
    .line 1194
    .line 1195
    const-string v0, " ADD COLUMN profile_extensions_basic_facialFeature_c BLOB"

    .line 1196
    .line 1197
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1198
    .line 1199
    .line 1200
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1201
    .line 1202
    .line 1203
    move-result-object p2

    .line 1204
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1205
    .line 1206
    .line 1207
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1208
    .line 1209
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1210
    .line 1211
    .line 1212
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1213
    .line 1214
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1215
    .line 1216
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1217
    .line 1218
    .line 1219
    const-string v0, " ADD COLUMN verifications_idCard_age_c INTEGER"

    .line 1220
    .line 1221
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1222
    .line 1223
    .line 1224
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1225
    .line 1226
    .line 1227
    move-result-object p2

    .line 1228
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1229
    .line 1230
    .line 1231
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1232
    .line 1233
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1234
    .line 1235
    .line 1236
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1237
    .line 1238
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1239
    .line 1240
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1241
    .line 1242
    .line 1243
    const-string v0, " ADD COLUMN verifications_idCard_first4_c TEXT"

    .line 1244
    .line 1245
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1246
    .line 1247
    .line 1248
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1249
    .line 1250
    .line 1251
    move-result-object p2

    .line 1252
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1253
    .line 1254
    .line 1255
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1256
    .line 1257
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1258
    .line 1259
    .line 1260
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1261
    .line 1262
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1263
    .line 1264
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1265
    .line 1266
    .line 1267
    const-string v0, " ADD COLUMN profile_extensions_physical_fitness_c BLOB"

    .line 1268
    .line 1269
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1270
    .line 1271
    .line 1272
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1273
    .line 1274
    .line 1275
    move-result-object p2

    .line 1276
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1277
    .line 1278
    .line 1279
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1280
    .line 1281
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1282
    .line 1283
    .line 1284
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1285
    .line 1286
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1287
    .line 1288
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1289
    .line 1290
    .line 1291
    const-string v0, " ADD COLUMN profile_extensions_physical_drink_c BLOB"

    .line 1292
    .line 1293
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1294
    .line 1295
    .line 1296
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1297
    .line 1298
    .line 1299
    move-result-object p2

    .line 1300
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1301
    .line 1302
    .line 1303
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1304
    .line 1305
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1306
    .line 1307
    .line 1308
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1309
    .line 1310
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1311
    .line 1312
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1313
    .line 1314
    .line 1315
    const-string v0, " ADD COLUMN profile_extensions_physical_smoke_c BLOB"

    .line 1316
    .line 1317
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1318
    .line 1319
    .line 1320
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1321
    .line 1322
    .line 1323
    move-result-object p2

    .line 1324
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1325
    .line 1326
    .line 1327
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1328
    .line 1329
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1330
    .line 1331
    .line 1332
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1333
    .line 1334
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1335
    .line 1336
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1337
    .line 1338
    .line 1339
    const-string v0, " ADD COLUMN profile_extensions_basic_mbti_c BLOB"

    .line 1340
    .line 1341
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1342
    .line 1343
    .line 1344
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1345
    .line 1346
    .line 1347
    move-result-object p2

    .line 1348
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1349
    .line 1350
    .line 1351
    :pswitch_18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1352
    .line 1353
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1354
    .line 1355
    .line 1356
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1357
    .line 1358
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1359
    .line 1360
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1361
    .line 1362
    .line 1363
    const-string v0, " ADD COLUMN userActivityInfo_c BLOB"

    .line 1364
    .line 1365
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1366
    .line 1367
    .line 1368
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1369
    .line 1370
    .line 1371
    move-result-object p2

    .line 1372
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1373
    .line 1374
    .line 1375
    :pswitch_19
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1376
    .line 1377
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1378
    .line 1379
    .line 1380
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1381
    .line 1382
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1383
    .line 1384
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1385
    .line 1386
    .line 1387
    const-string v0, " ADD COLUMN profile_extensions_basic_ideal_c BLOB"

    .line 1388
    .line 1389
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1390
    .line 1391
    .line 1392
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1393
    .line 1394
    .line 1395
    move-result-object p2

    .line 1396
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1397
    .line 1398
    .line 1399
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1400
    .line 1401
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1402
    .line 1403
    .line 1404
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1405
    .line 1406
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1407
    .line 1408
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1409
    .line 1410
    .line 1411
    const-string v0, " ADD COLUMN profile_extensions_basic_unideal_c BLOB"

    .line 1412
    .line 1413
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1414
    .line 1415
    .line 1416
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1417
    .line 1418
    .line 1419
    move-result-object p2

    .line 1420
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1421
    .line 1422
    .line 1423
    :pswitch_1a
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1424
    .line 1425
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1426
    .line 1427
    .line 1428
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1429
    .line 1430
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1431
    .line 1432
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1433
    .line 1434
    .line 1435
    const-string v0, " ADD COLUMN profile_moments_counters_totalNormalMoments_c INTEGER"

    .line 1436
    .line 1437
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1438
    .line 1439
    .line 1440
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1441
    .line 1442
    .line 1443
    move-result-object p2

    .line 1444
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1445
    .line 1446
    .line 1447
    :pswitch_1b
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1448
    .line 1449
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1450
    .line 1451
    .line 1452
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1453
    .line 1454
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1455
    .line 1456
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1457
    .line 1458
    .line 1459
    const-string v0, " ADD COLUMN profile_extensions_interest_taste_c BLOB"

    .line 1460
    .line 1461
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1462
    .line 1463
    .line 1464
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1465
    .line 1466
    .line 1467
    move-result-object p2

    .line 1468
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1469
    .line 1470
    .line 1471
    :pswitch_1c
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1472
    .line 1473
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1474
    .line 1475
    .line 1476
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1477
    .line 1478
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1479
    .line 1480
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1481
    .line 1482
    .line 1483
    const-string v0, " ADD COLUMN location_region_province_c TEXT"

    .line 1484
    .line 1485
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1486
    .line 1487
    .line 1488
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1489
    .line 1490
    .line 1491
    move-result-object p2

    .line 1492
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1493
    .line 1494
    .line 1495
    :pswitch_1d
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1496
    .line 1497
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1498
    .line 1499
    .line 1500
    iget-object v0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1501
    .line 1502
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1503
    .line 1504
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1505
    .line 1506
    .line 1507
    const-string v0, " ADD COLUMN profile_extensions_basic_intlFriendPurpose_c BLOB"

    .line 1508
    .line 1509
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1510
    .line 1511
    .line 1512
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1513
    .line 1514
    .line 1515
    move-result-object p2

    .line 1516
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1517
    .line 1518
    .line 1519
    :pswitch_1e
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1520
    .line 1521
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1522
    .line 1523
    .line 1524
    iget-object p0, p0, Ll/vj5;->d:Ll/ejk0;

    .line 1525
    .line 1526
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 1527
    .line 1528
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1529
    .line 1530
    .line 1531
    const-string p0, " ADD COLUMN profile_extensions_basic_intlFriendPurposeV2_c BLOB"

    .line 1532
    .line 1533
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1534
    .line 1535
    .line 1536
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1537
    .line 1538
    .line 1539
    move-result-object p0

    .line 1540
    invoke-virtual {p1, p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1541
    .line 1542
    .line 1543
    return-void

    .line 1544
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
    .end packed-switch
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vj5;->c:Ll/wzh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/CommonData;ZZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/uj5;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/uj5;-><init>(Ll/vj5;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
