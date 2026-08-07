.class Lcom/alibaba/fastjson/JSONPath$IntOpSegement;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/JSONPath$Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IntOpSegement"
.end annotation


# instance fields
.field private final op:Lcom/alibaba/fastjson/JSONPath$Operator;

.field private final propertyName:Ljava/lang/String;

.field private final propertyNameHash:J

.field private final value:J

.field private valueDecimal:Ljava/math/BigDecimal;

.field private valueDouble:Ljava/lang/Double;

.field private valueFloat:Ljava/lang/Float;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLcom/alibaba/fastjson/JSONPath$Operator;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->propertyName:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iput-wide v0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->propertyNameHash:J

    .line 11
    .line 12
    iput-wide p2, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 13
    .line 14
    iput-object p4, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->propertyName:Ljava/lang/String;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->propertyNameHash:J

    .line 4
    .line 5
    invoke-virtual {p1, p4, p2, v0, v1}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 p2, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return p2

    .line 13
    :cond_0
    instance-of p3, p1, Ljava/lang/Number;

    .line 14
    .line 15
    if-nez p3, :cond_1

    .line 16
    .line 17
    return p2

    .line 18
    :cond_1
    instance-of p3, p1, Ljava/math/BigDecimal;

    .line 19
    .line 20
    const/4 p4, 0x1

    .line 21
    if-eqz p3, :cond_9

    .line 22
    .line 23
    iget-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueDecimal:Ljava/math/BigDecimal;

    .line 24
    .line 25
    if-nez p3, :cond_2

    .line 26
    .line 27
    iget-wide v0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 28
    .line 29
    invoke-static {v0, v1}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    iput-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueDecimal:Ljava/math/BigDecimal;

    .line 34
    .line 35
    :cond_2
    iget-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueDecimal:Ljava/math/BigDecimal;

    .line 36
    .line 37
    check-cast p1, Ljava/math/BigDecimal;

    .line 38
    .line 39
    invoke-virtual {p3, p1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    sget-object p3, Lcom/alibaba/fastjson/JSONPath$1;->$SwitchMap$com$alibaba$fastjson$JSONPath$Operator:[I

    .line 44
    .line 45
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    aget p0, p3, p0

    .line 52
    .line 53
    packed-switch p0, :pswitch_data_0

    .line 54
    .line 55
    .line 56
    return p2

    .line 57
    :pswitch_0
    if-lez p1, :cond_3

    .line 58
    .line 59
    return p4

    .line 60
    :cond_3
    return p2

    .line 61
    :pswitch_1
    if-ltz p1, :cond_4

    .line 62
    .line 63
    return p4

    .line 64
    :cond_4
    return p2

    .line 65
    :pswitch_2
    if-gez p1, :cond_5

    .line 66
    .line 67
    return p4

    .line 68
    :cond_5
    return p2

    .line 69
    :pswitch_3
    if-gtz p1, :cond_6

    .line 70
    .line 71
    return p4

    .line 72
    :cond_6
    return p2

    .line 73
    :pswitch_4
    if-eqz p1, :cond_7

    .line 74
    .line 75
    return p4

    .line 76
    :cond_7
    return p2

    .line 77
    :pswitch_5
    if-nez p1, :cond_8

    .line 78
    .line 79
    return p4

    .line 80
    :cond_8
    return p2

    .line 81
    :cond_9
    instance-of p3, p1, Ljava/lang/Float;

    .line 82
    .line 83
    if-eqz p3, :cond_11

    .line 84
    .line 85
    iget-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueFloat:Ljava/lang/Float;

    .line 86
    .line 87
    if-nez p3, :cond_a

    .line 88
    .line 89
    iget-wide v0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 90
    .line 91
    long-to-float p3, v0

    .line 92
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 93
    .line 94
    .line 95
    move-result-object p3

    .line 96
    iput-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueFloat:Ljava/lang/Float;

    .line 97
    .line 98
    :cond_a
    iget-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueFloat:Ljava/lang/Float;

    .line 99
    .line 100
    check-cast p1, Ljava/lang/Float;

    .line 101
    .line 102
    invoke-virtual {p3, p1}, Ljava/lang/Float;->compareTo(Ljava/lang/Float;)I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    sget-object p3, Lcom/alibaba/fastjson/JSONPath$1;->$SwitchMap$com$alibaba$fastjson$JSONPath$Operator:[I

    .line 107
    .line 108
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    aget p0, p3, p0

    .line 115
    .line 116
    packed-switch p0, :pswitch_data_1

    .line 117
    .line 118
    .line 119
    return p2

    .line 120
    :pswitch_6
    if-lez p1, :cond_b

    .line 121
    .line 122
    return p4

    .line 123
    :cond_b
    return p2

    .line 124
    :pswitch_7
    if-ltz p1, :cond_c

    .line 125
    .line 126
    return p4

    .line 127
    :cond_c
    return p2

    .line 128
    :pswitch_8
    if-gez p1, :cond_d

    .line 129
    .line 130
    return p4

    .line 131
    :cond_d
    return p2

    .line 132
    :pswitch_9
    if-gtz p1, :cond_e

    .line 133
    .line 134
    return p4

    .line 135
    :cond_e
    return p2

    .line 136
    :pswitch_a
    if-eqz p1, :cond_f

    .line 137
    .line 138
    return p4

    .line 139
    :cond_f
    return p2

    .line 140
    :pswitch_b
    if-nez p1, :cond_10

    .line 141
    .line 142
    return p4

    .line 143
    :cond_10
    return p2

    .line 144
    :cond_11
    instance-of p3, p1, Ljava/lang/Double;

    .line 145
    .line 146
    if-eqz p3, :cond_19

    .line 147
    .line 148
    iget-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueDouble:Ljava/lang/Double;

    .line 149
    .line 150
    if-nez p3, :cond_12

    .line 151
    .line 152
    iget-wide v0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 153
    .line 154
    long-to-double v0, v0

    .line 155
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    iput-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueDouble:Ljava/lang/Double;

    .line 160
    .line 161
    :cond_12
    iget-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->valueDouble:Ljava/lang/Double;

    .line 162
    .line 163
    check-cast p1, Ljava/lang/Double;

    .line 164
    .line 165
    invoke-virtual {p3, p1}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    sget-object p3, Lcom/alibaba/fastjson/JSONPath$1;->$SwitchMap$com$alibaba$fastjson$JSONPath$Operator:[I

    .line 170
    .line 171
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 172
    .line 173
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    aget p0, p3, p0

    .line 178
    .line 179
    packed-switch p0, :pswitch_data_2

    .line 180
    .line 181
    .line 182
    return p2

    .line 183
    :pswitch_c
    if-lez p1, :cond_13

    .line 184
    .line 185
    return p4

    .line 186
    :cond_13
    return p2

    .line 187
    :pswitch_d
    if-ltz p1, :cond_14

    .line 188
    .line 189
    return p4

    .line 190
    :cond_14
    return p2

    .line 191
    :pswitch_e
    if-gez p1, :cond_15

    .line 192
    .line 193
    return p4

    .line 194
    :cond_15
    return p2

    .line 195
    :pswitch_f
    if-gtz p1, :cond_16

    .line 196
    .line 197
    return p4

    .line 198
    :cond_16
    return p2

    .line 199
    :pswitch_10
    if-eqz p1, :cond_17

    .line 200
    .line 201
    return p4

    .line 202
    :cond_17
    return p2

    .line 203
    :pswitch_11
    if-nez p1, :cond_18

    .line 204
    .line 205
    return p4

    .line 206
    :cond_18
    return p2

    .line 207
    :cond_19
    check-cast p1, Ljava/lang/Number;

    .line 208
    .line 209
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->longExtractValue(Ljava/lang/Number;)J

    .line 210
    .line 211
    .line 212
    move-result-wide v0

    .line 213
    sget-object p1, Lcom/alibaba/fastjson/JSONPath$1;->$SwitchMap$com$alibaba$fastjson$JSONPath$Operator:[I

    .line 214
    .line 215
    iget-object p3, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 216
    .line 217
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 218
    .line 219
    .line 220
    move-result p3

    .line 221
    aget p1, p1, p3

    .line 222
    .line 223
    packed-switch p1, :pswitch_data_3

    .line 224
    .line 225
    .line 226
    return p2

    .line 227
    :pswitch_12
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 228
    .line 229
    cmp-long p0, v0, p0

    .line 230
    .line 231
    if-gez p0, :cond_1a

    .line 232
    .line 233
    return p4

    .line 234
    :cond_1a
    return p2

    .line 235
    :pswitch_13
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 236
    .line 237
    cmp-long p0, v0, p0

    .line 238
    .line 239
    if-gtz p0, :cond_1b

    .line 240
    .line 241
    return p4

    .line 242
    :cond_1b
    return p2

    .line 243
    :pswitch_14
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 244
    .line 245
    cmp-long p0, v0, p0

    .line 246
    .line 247
    if-lez p0, :cond_1c

    .line 248
    .line 249
    return p4

    .line 250
    :cond_1c
    return p2

    .line 251
    :pswitch_15
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 252
    .line 253
    cmp-long p0, v0, p0

    .line 254
    .line 255
    if-ltz p0, :cond_1d

    .line 256
    .line 257
    return p4

    .line 258
    :cond_1d
    return p2

    .line 259
    :pswitch_16
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 260
    .line 261
    cmp-long p0, v0, p0

    .line 262
    .line 263
    if-eqz p0, :cond_1e

    .line 264
    .line 265
    return p4

    .line 266
    :cond_1e
    return p2

    .line 267
    :pswitch_17
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 268
    .line 269
    cmp-long p0, v0, p0

    .line 270
    .line 271
    if-nez p0, :cond_1f

    .line 272
    .line 273
    return p4

    .line 274
    :cond_1f
    return p2

    .line 275
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

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
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
    .end packed-switch
.end method
