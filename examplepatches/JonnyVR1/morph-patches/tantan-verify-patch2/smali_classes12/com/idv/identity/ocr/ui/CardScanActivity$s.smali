.class Lcom/idv/identity/ocr/ui/CardScanActivity$s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jfm;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->D2(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;JLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 14

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->a:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    long-to-double v1, v1

    .line 14
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v1, v3

    .line 20
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "s"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v11

    .line 36
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v12, "sideType"

    .line 43
    .line 44
    iget-object v13, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->b:Ljava/lang/String;

    .line 45
    .line 46
    const-string v2, "status"

    .line 47
    .line 48
    const-string v3, "error"

    .line 49
    .line 50
    const-string v4, "code"

    .line 51
    .line 52
    const-string v6, "msg"

    .line 53
    .line 54
    const-string v8, "tag"

    .line 55
    .line 56
    const-string v9, "onError"

    .line 57
    .line 58
    const-string v10, "timeCost"

    .line 59
    .line 60
    move-object v5, p1

    .line 61
    move-object/from16 v7, p2

    .line 62
    .line 63
    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const-string v3, "ocrDeviceCost"

    .line 68
    .line 69
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 75
    .line 76
    const/16 v0, 0x3f2

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 14

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->a:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    long-to-double v1, v1

    .line 14
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v1, v3

    .line 20
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "s"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v11

    .line 36
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v12, "sideType"

    .line 43
    .line 44
    iget-object v13, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->b:Ljava/lang/String;

    .line 45
    .line 46
    const-string v2, "status"

    .line 47
    .line 48
    const-string v3, "error"

    .line 49
    .line 50
    const-string v4, "code"

    .line 51
    .line 52
    const-string v6, "msg"

    .line 53
    .line 54
    const-string v8, "tag"

    .line 55
    .line 56
    const-string v9, "onServerError"

    .line 57
    .line 58
    const-string v10, "timeCost"

    .line 59
    .line 60
    move-object v5, p1

    .line 61
    move-object/from16 v7, p2

    .line 62
    .line 63
    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const-string v3, "ocrDeviceCost"

    .line 68
    .line 69
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 75
    .line 76
    const/16 v0, 0x3f3

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->a:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    long-to-double v1, v1

    .line 14
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v1, v3

    .line 20
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "s"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Q0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    const-string v8, "sideType"

    .line 53
    .line 54
    iget-object v9, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->b:Ljava/lang/String;

    .line 55
    .line 56
    const-string v2, "status"

    .line 57
    .line 58
    const-string v3, "success"

    .line 59
    .line 60
    const-string v4, "isVerifyAlbumPhoto"

    .line 61
    .line 62
    const-string v6, "timeCost"

    .line 63
    .line 64
    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const-string v3, "ocrDeviceCost"

    .line 69
    .line 70
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v1, Ll/ffm;->f:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const-string v1, "idcardResult is null content:"

    .line 88
    .line 89
    const/16 v2, 0x3f9

    .line 90
    .line 91
    const/16 v3, 0x3f3

    .line 92
    .line 93
    const/16 v4, 0x3f7

    .line 94
    .line 95
    const/16 v5, 0x3f4

    .line 96
    .line 97
    if-eqz v0, :cond_e

    .line 98
    .line 99
    const-class v0, Lcom/idv/identity/platform/model/IDCardOcrProResult;

    .line 100
    .line 101
    invoke-static {p1, v0}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/idv/identity/platform/model/IDCardOcrProResult;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isOCRSuccess()Z

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    if-eqz v6, :cond_a

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->sortOcrResult()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->getSortedOcrResult()Ljava/util/Map;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->getOcrStandardDataMap()Ljava/util/Map;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    if-eqz v0, :cond_0

    .line 128
    .line 129
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1, v0}, Ll/afm;->p1(Ljava/util/Map;)V

    .line 134
    .line 135
    .line 136
    :cond_0
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 137
    .line 138
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 139
    .line 140
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    if-ne v0, v1, :cond_1

    .line 145
    .line 146
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0, p1}, Ll/afm;->o1(Ljava/util/Map;)V

    .line 151
    .line 152
    .line 153
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 158
    .line 159
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v0, v1}, Ll/afm;->E1(Landroid/graphics/Bitmap;)V

    .line 164
    .line 165
    .line 166
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 171
    .line 172
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Ll/afm;->A1(Landroid/graphics/Bitmap;)V

    .line 177
    .line 178
    .line 179
    goto/16 :goto_2

    .line 180
    .line 181
    :cond_1
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 182
    .line 183
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 184
    .line 185
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    if-ne v0, v1, :cond_5

    .line 190
    .line 191
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0}, Ll/afm;->P()Ljava/util/Map;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    if-eqz p1, :cond_4

    .line 200
    .line 201
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    if-eqz v2, :cond_4

    .line 214
    .line 215
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    check-cast v2, Ljava/util/Map$Entry;

    .line 220
    .line 221
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    if-eqz v3, :cond_3

    .line 230
    .line 231
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, Ljava/lang/String;

    .line 240
    .line 241
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    if-eqz v3, :cond_2

    .line 246
    .line 247
    :cond_3
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    check-cast v3, Ljava/lang/String;

    .line 252
    .line 253
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    goto :goto_0

    .line 261
    :cond_4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-virtual {v1, v0}, Ll/afm;->o1(Ljava/util/Map;)V

    .line 266
    .line 267
    .line 268
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 273
    .line 274
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-virtual {v0, v1}, Ll/afm;->w1(Landroid/graphics/Bitmap;)V

    .line 279
    .line 280
    .line 281
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 286
    .line 287
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {v0, v1}, Ll/afm;->s1(Landroid/graphics/Bitmap;)V

    .line 292
    .line 293
    .line 294
    goto :goto_2

    .line 295
    :cond_5
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_THIRD:Lcom/idv/identity/ocr/OcrType;

    .line 296
    .line 297
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 298
    .line 299
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    if-ne v0, v1, :cond_9

    .line 304
    .line 305
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {v0}, Ll/afm;->P()Ljava/util/Map;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    if-eqz p1, :cond_8

    .line 314
    .line 315
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    :cond_6
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 324
    .line 325
    .line 326
    move-result v2

    .line 327
    if-eqz v2, :cond_8

    .line 328
    .line 329
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    check-cast v2, Ljava/util/Map$Entry;

    .line 334
    .line 335
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v3

    .line 343
    if-eqz v3, :cond_7

    .line 344
    .line 345
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    check-cast v3, Ljava/lang/String;

    .line 354
    .line 355
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    if-eqz v3, :cond_6

    .line 360
    .line 361
    :cond_7
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    check-cast v3, Ljava/lang/String;

    .line 366
    .line 367
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object v2

    .line 371
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    goto :goto_1

    .line 375
    :cond_8
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    invoke-virtual {v1, v0}, Ll/afm;->o1(Ljava/util/Map;)V

    .line 380
    .line 381
    .line 382
    :cond_9
    :goto_2
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 386
    .line 387
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 388
    .line 389
    invoke-virtual {p0, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 390
    .line 391
    .line 392
    return-void

    .line 393
    :cond_a
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isOCRTypeError()Z

    .line 394
    .line 395
    .line 396
    move-result v5

    .line 397
    if-eqz v5, :cond_b

    .line 398
    .line 399
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 400
    .line 401
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 402
    .line 403
    invoke-virtual {p0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 404
    .line 405
    .line 406
    return-void

    .line 407
    :cond_b
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isOCRError()Z

    .line 408
    .line 409
    .line 410
    move-result v4

    .line 411
    if-eqz v4, :cond_c

    .line 412
    .line 413
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 414
    .line 415
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 416
    .line 417
    invoke-virtual {p0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 418
    .line 419
    .line 420
    return-void

    .line 421
    :cond_c
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isOCRPictureQualityNotGood()Z

    .line 422
    .line 423
    .line 424
    move-result v0

    .line 425
    if-eqz v0, :cond_d

    .line 426
    .line 427
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 428
    .line 429
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 430
    .line 431
    invoke-virtual {p0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 432
    .line 433
    .line 434
    return-void

    .line 435
    :cond_d
    new-instance p0, Ljava/lang/StringBuilder;

    .line 436
    .line 437
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object p0

    .line 447
    const-string p1, "TAG"

    .line 448
    .line 449
    invoke-static {p1, p0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    return-void

    .line 453
    :cond_e
    const-class v0, Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 454
    .line 455
    invoke-static {p1, v0}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    check-cast v0, Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 460
    .line 461
    if-eqz v0, :cond_13

    .line 462
    .line 463
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isOCRSuccess()Z

    .line 464
    .line 465
    .line 466
    move-result v6

    .line 467
    if-eqz v6, :cond_13

    .line 468
    .line 469
    new-instance p1, Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 470
    .line 471
    invoke-direct {p1}, Lcom/idv/identity/platform/api/IdentityOcrInfo;-><init>()V

    .line 472
    .line 473
    .line 474
    iput-object v0, p1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 475
    .line 476
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 477
    .line 478
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 479
    .line 480
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 481
    .line 482
    .line 483
    move-result-object v1

    .line 484
    if-ne v0, v1, :cond_f

    .line 485
    .line 486
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {v0, p1}, Ll/afm;->y1(Lcom/idv/identity/platform/api/IdentityOcrInfo;)V

    .line 491
    .line 492
    .line 493
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 494
    .line 495
    .line 496
    move-result-object p1

    .line 497
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 498
    .line 499
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    invoke-virtual {p1, v0}, Ll/afm;->E1(Landroid/graphics/Bitmap;)V

    .line 504
    .line 505
    .line 506
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 507
    .line 508
    .line 509
    move-result-object p1

    .line 510
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 511
    .line 512
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    invoke-virtual {p1, v0}, Ll/afm;->A1(Landroid/graphics/Bitmap;)V

    .line 517
    .line 518
    .line 519
    goto/16 :goto_3

    .line 520
    .line 521
    :cond_f
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 522
    .line 523
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 524
    .line 525
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 526
    .line 527
    .line 528
    move-result-object v1

    .line 529
    if-ne v0, v1, :cond_10

    .line 530
    .line 531
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    invoke-virtual {v0, p1}, Ll/afm;->q1(Lcom/idv/identity/platform/api/IdentityOcrInfo;)V

    .line 536
    .line 537
    .line 538
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 539
    .line 540
    .line 541
    move-result-object p1

    .line 542
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 543
    .line 544
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    invoke-virtual {p1, v0}, Ll/afm;->w1(Landroid/graphics/Bitmap;)V

    .line 549
    .line 550
    .line 551
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 552
    .line 553
    .line 554
    move-result-object p1

    .line 555
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 556
    .line 557
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 558
    .line 559
    .line 560
    move-result-object v0

    .line 561
    invoke-virtual {p1, v0}, Ll/afm;->s1(Landroid/graphics/Bitmap;)V

    .line 562
    .line 563
    .line 564
    goto :goto_3

    .line 565
    :cond_10
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK_3D:Lcom/idv/identity/ocr/OcrType;

    .line 566
    .line 567
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 568
    .line 569
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 570
    .line 571
    .line 572
    move-result-object v1

    .line 573
    if-ne v0, v1, :cond_11

    .line 574
    .line 575
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 576
    .line 577
    .line 578
    move-result-object v0

    .line 579
    invoke-virtual {v0, p1}, Ll/afm;->r1(Lcom/idv/identity/platform/api/IdentityOcrInfo;)V

    .line 580
    .line 581
    .line 582
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 583
    .line 584
    .line 585
    move-result-object p1

    .line 586
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 587
    .line 588
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 589
    .line 590
    .line 591
    move-result-object v0

    .line 592
    invoke-virtual {p1, v0}, Ll/afm;->x1(Landroid/graphics/Bitmap;)V

    .line 593
    .line 594
    .line 595
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 596
    .line 597
    .line 598
    move-result-object p1

    .line 599
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 600
    .line 601
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    invoke-virtual {p1, v0}, Ll/afm;->t1(Landroid/graphics/Bitmap;)V

    .line 606
    .line 607
    .line 608
    goto :goto_3

    .line 609
    :cond_11
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT_3D:Lcom/idv/identity/ocr/OcrType;

    .line 610
    .line 611
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 612
    .line 613
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 614
    .line 615
    .line 616
    move-result-object v1

    .line 617
    if-ne v0, v1, :cond_12

    .line 618
    .line 619
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 620
    .line 621
    .line 622
    move-result-object v0

    .line 623
    invoke-virtual {v0, p1}, Ll/afm;->z1(Lcom/idv/identity/platform/api/IdentityOcrInfo;)V

    .line 624
    .line 625
    .line 626
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 627
    .line 628
    .line 629
    move-result-object p1

    .line 630
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 631
    .line 632
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    invoke-virtual {p1, v0}, Ll/afm;->F1(Landroid/graphics/Bitmap;)V

    .line 637
    .line 638
    .line 639
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 640
    .line 641
    .line 642
    move-result-object p1

    .line 643
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 644
    .line 645
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;

    .line 646
    .line 647
    .line 648
    move-result-object v0

    .line 649
    invoke-virtual {p1, v0}, Ll/afm;->B1(Landroid/graphics/Bitmap;)V

    .line 650
    .line 651
    .line 652
    :cond_12
    :goto_3
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 653
    .line 654
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 655
    .line 656
    invoke-virtual {p0, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 657
    .line 658
    .line 659
    return-void

    .line 660
    :cond_13
    if-eqz v0, :cond_14

    .line 661
    .line 662
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isOCRTypeError()Z

    .line 663
    .line 664
    .line 665
    move-result v5

    .line 666
    if-eqz v5, :cond_14

    .line 667
    .line 668
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 669
    .line 670
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 671
    .line 672
    invoke-virtual {p0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 673
    .line 674
    .line 675
    return-void

    .line 676
    :cond_14
    if-eqz v0, :cond_15

    .line 677
    .line 678
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isOCRError()Z

    .line 679
    .line 680
    .line 681
    move-result v4

    .line 682
    if-eqz v4, :cond_15

    .line 683
    .line 684
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 685
    .line 686
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 687
    .line 688
    invoke-virtual {p0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 689
    .line 690
    .line 691
    return-void

    .line 692
    :cond_15
    if-eqz v0, :cond_16

    .line 693
    .line 694
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isOCRPictureQualityNotGood()Z

    .line 695
    .line 696
    .line 697
    move-result v0

    .line 698
    if-eqz v0, :cond_16

    .line 699
    .line 700
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$s;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 701
    .line 702
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 703
    .line 704
    invoke-virtual {p0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 705
    .line 706
    .line 707
    return-void

    .line 708
    :cond_16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 709
    .line 710
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 711
    .line 712
    .line 713
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 714
    .line 715
    .line 716
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 717
    .line 718
    .line 719
    move-result-object p0

    .line 720
    invoke-static {p0}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 721
    .line 722
    .line 723
    return-void
.end method
