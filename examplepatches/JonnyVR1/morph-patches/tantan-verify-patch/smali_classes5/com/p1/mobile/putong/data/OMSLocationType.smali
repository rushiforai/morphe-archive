.class public Lcom/p1/mobile/putong/data/OMSLocationType;
.super Lcom/p1/mobile/putong/data/tenum/TEnum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/data/OMSLocationType$constants;
    }
.end annotation


# static fields
.field public static final JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter<",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;"
        }
    .end annotation
.end field

.field private static final _OMSLocationType:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;"
        }
    .end annotation
.end field

.field public static final g_bottom:Ljava/lang/String; = "g_bottom"

.field public static final g_center:Ljava/lang/String; = "g_center"

.field public static final g_center_horizontal:Ljava/lang/String; = "g_center_horizontal"

.field public static final g_center_vertical:Ljava/lang/String; = "g_center_vertical"

.field public static final g_end:Ljava/lang/String; = "g_end"

.field public static final g_start:Ljava/lang/String; = "g_start"

.field public static final g_top:Ljava/lang/String; = "g_top"

.field private static final int_g_bottom:I = 0x1

.field private static final int_g_center:I = 0x4

.field private static final int_g_center_horizontal:I = 0x6

.field private static final int_g_center_vertical:I = 0x5

.field private static final int_g_end:I = 0x3

.field private static final int_g_start:I = 0x2

.field private static final int_g_top:I = 0x0

.field private static final int_r_above:I = 0x9

.field private static final int_r_align_baseline:I = 0xb

.field private static final int_r_align_bottom:I = 0xf

.field private static final int_r_align_end:I = 0x1a

.field private static final int_r_align_left:I = 0xc

.field private static final int_r_align_parent_bottom:I = 0x13

.field private static final int_r_align_parent_end:I = 0x1c

.field private static final int_r_align_parent_left:I = 0x10

.field private static final int_r_align_parent_right:I = 0x12

.field private static final int_r_align_parent_start:I = 0x1b

.field private static final int_r_align_parent_top:I = 0x11

.field private static final int_r_align_right:I = 0xd

.field private static final int_r_align_start:I = 0x19

.field private static final int_r_align_top:I = 0xe

.field private static final int_r_below:I = 0xa

.field private static final int_r_center_horizontal:I = 0x16

.field private static final int_r_center_in_parent:I = 0x14

.field private static final int_r_center_vertical:I = 0x15

.field private static final int_r_end_of:I = 0x18

.field private static final int_r_left_of:I = 0x7

.field private static final int_r_right_of:I = 0x8

.field private static final int_r_start_of:I = 0x17

.field private static final int_unknown_:I = -0x1

.field public static final r_above:Ljava/lang/String; = "r_above"

.field public static final r_align_baseline:Ljava/lang/String; = "r_align_baseline"

.field public static final r_align_bottom:Ljava/lang/String; = "r_align_bottom"

.field public static final r_align_end:Ljava/lang/String; = "r_align_end"

.field public static final r_align_left:Ljava/lang/String; = "r_align_left"

.field public static final r_align_parent_bottom:Ljava/lang/String; = "r_align_parent_bottom"

.field public static final r_align_parent_end:Ljava/lang/String; = "r_align_parent_end"

.field public static final r_align_parent_left:Ljava/lang/String; = "r_align_parent_left"

.field public static final r_align_parent_right:Ljava/lang/String; = "r_align_parent_right"

.field public static final r_align_parent_start:Ljava/lang/String; = "r_align_parent_start"

.field public static final r_align_parent_top:Ljava/lang/String; = "r_align_parent_top"

.field public static final r_align_right:Ljava/lang/String; = "r_align_right"

.field public static final r_align_start:Ljava/lang/String; = "r_align_start"

.field public static final r_align_top:Ljava/lang/String; = "r_align_top"

.field public static final r_below:Ljava/lang/String; = "r_below"

.field public static final r_center_horizontal:Ljava/lang/String; = "r_center_horizontal"

.field public static final r_center_in_parent:Ljava/lang/String; = "r_center_in_parent"

.field public static final r_center_vertical:Ljava/lang/String; = "r_center_vertical"

.field public static final r_end_of:Ljava/lang/String; = "r_end_of"

.field public static final r_left_of:Ljava/lang/String; = "r_left_of"

.field public static final r_right_of:Ljava/lang/String; = "r_right_of"

.field public static final r_start_of:Ljava/lang/String; = "r_start_of"

.field protected static supportEnum:Ljava/util/HashSet; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final unknown_:Ljava/lang/String; = "unknown_"


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSLocationType$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSLocationType$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 7
    .line 8
    new-instance v1, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/data/OMSLocationType$2;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/OMSLocationType$2;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 21
    .line 22
    const-string v1, "unknown_"

    .line 23
    .line 24
    const/4 v2, -0x1

    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    const-string v2, "g_top"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    const-string v3, "g_bottom"

    .line 36
    .line 37
    invoke-virtual {v0, v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    const-string v4, "g_start"

    .line 42
    .line 43
    invoke-virtual {v0, v4, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x3

    .line 47
    const-string v5, "g_end"

    .line 48
    .line 49
    invoke-virtual {v0, v5, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x4

    .line 53
    const-string v6, "g_center"

    .line 54
    .line 55
    invoke-virtual {v0, v6, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    const/4 v1, 0x5

    .line 59
    const-string v7, "g_center_vertical"

    .line 60
    .line 61
    invoke-virtual {v0, v7, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    const-string v8, "g_center_horizontal"

    .line 66
    .line 67
    invoke-virtual {v0, v8, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    const-string v9, "r_left_of"

    .line 72
    .line 73
    invoke-virtual {v0, v9, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    const-string v10, "r_right_of"

    .line 79
    .line 80
    invoke-virtual {v0, v10, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    const/16 v1, 0x9

    .line 84
    .line 85
    const-string v11, "r_above"

    .line 86
    .line 87
    invoke-virtual {v0, v11, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    const/16 v1, 0xa

    .line 91
    .line 92
    const-string v12, "r_below"

    .line 93
    .line 94
    invoke-virtual {v0, v12, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    const/16 v1, 0xb

    .line 98
    .line 99
    const-string v13, "r_align_baseline"

    .line 100
    .line 101
    invoke-virtual {v0, v13, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    const/16 v1, 0xc

    .line 105
    .line 106
    const-string v14, "r_align_left"

    .line 107
    .line 108
    invoke-virtual {v0, v14, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    const/16 v1, 0xd

    .line 112
    .line 113
    const-string v15, "r_align_right"

    .line 114
    .line 115
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 116
    .line 117
    .line 118
    const/16 v1, 0xe

    .line 119
    .line 120
    move-object/from16 v16, v15

    .line 121
    .line 122
    const-string v15, "r_align_top"

    .line 123
    .line 124
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 125
    .line 126
    .line 127
    const/16 v1, 0xf

    .line 128
    .line 129
    move-object/from16 v17, v15

    .line 130
    .line 131
    const-string v15, "r_align_bottom"

    .line 132
    .line 133
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 134
    .line 135
    .line 136
    const/16 v1, 0x10

    .line 137
    .line 138
    move-object/from16 v18, v15

    .line 139
    .line 140
    const-string v15, "r_align_parent_left"

    .line 141
    .line 142
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    const/16 v1, 0x11

    .line 146
    .line 147
    move-object/from16 v19, v15

    .line 148
    .line 149
    const-string v15, "r_align_parent_top"

    .line 150
    .line 151
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 152
    .line 153
    .line 154
    const/16 v1, 0x12

    .line 155
    .line 156
    move-object/from16 v20, v15

    .line 157
    .line 158
    const-string v15, "r_align_parent_right"

    .line 159
    .line 160
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 161
    .line 162
    .line 163
    const/16 v1, 0x13

    .line 164
    .line 165
    move-object/from16 v21, v15

    .line 166
    .line 167
    const-string v15, "r_align_parent_bottom"

    .line 168
    .line 169
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 170
    .line 171
    .line 172
    const/16 v1, 0x14

    .line 173
    .line 174
    move-object/from16 v22, v15

    .line 175
    .line 176
    const-string v15, "r_center_in_parent"

    .line 177
    .line 178
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 179
    .line 180
    .line 181
    const/16 v1, 0x15

    .line 182
    .line 183
    move-object/from16 v23, v15

    .line 184
    .line 185
    const-string v15, "r_center_vertical"

    .line 186
    .line 187
    invoke-virtual {v0, v15, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 188
    .line 189
    .line 190
    const-string v1, "r_center_horizontal"

    .line 191
    .line 192
    move-object/from16 v24, v15

    .line 193
    .line 194
    const/16 v15, 0x16

    .line 195
    .line 196
    invoke-virtual {v0, v1, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 197
    .line 198
    .line 199
    const-string v1, "r_start_of"

    .line 200
    .line 201
    const/16 v15, 0x17

    .line 202
    .line 203
    invoke-virtual {v0, v1, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 204
    .line 205
    .line 206
    const-string v1, "r_end_of"

    .line 207
    .line 208
    const/16 v15, 0x18

    .line 209
    .line 210
    invoke-virtual {v0, v1, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 211
    .line 212
    .line 213
    const-string v1, "r_align_start"

    .line 214
    .line 215
    const/16 v15, 0x19

    .line 216
    .line 217
    invoke-virtual {v0, v1, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 218
    .line 219
    .line 220
    const-string v1, "r_align_end"

    .line 221
    .line 222
    const/16 v15, 0x1a

    .line 223
    .line 224
    invoke-virtual {v0, v1, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 225
    .line 226
    .line 227
    const-string v1, "r_align_parent_start"

    .line 228
    .line 229
    const/16 v15, 0x1b

    .line 230
    .line 231
    invoke-virtual {v0, v1, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 232
    .line 233
    .line 234
    const-string v1, "r_align_parent_end"

    .line 235
    .line 236
    const/16 v15, 0x1c

    .line 237
    .line 238
    invoke-virtual {v0, v1, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 239
    .line 240
    .line 241
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 242
    .line 243
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 247
    .line 248
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 252
    .line 253
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 257
    .line 258
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 262
    .line 263
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 267
    .line 268
    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 272
    .line 273
    invoke-virtual {v0, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 277
    .line 278
    invoke-virtual {v0, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 282
    .line 283
    invoke-virtual {v0, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 287
    .line 288
    invoke-virtual {v0, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 292
    .line 293
    invoke-virtual {v0, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 297
    .line 298
    invoke-virtual {v0, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 302
    .line 303
    invoke-virtual {v0, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 307
    .line 308
    move-object/from16 v1, v16

    .line 309
    .line 310
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 314
    .line 315
    move-object/from16 v1, v17

    .line 316
    .line 317
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 321
    .line 322
    move-object/from16 v1, v18

    .line 323
    .line 324
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 328
    .line 329
    move-object/from16 v1, v19

    .line 330
    .line 331
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 335
    .line 336
    move-object/from16 v1, v20

    .line 337
    .line 338
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 342
    .line 343
    move-object/from16 v1, v21

    .line 344
    .line 345
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 349
    .line 350
    move-object/from16 v1, v22

    .line 351
    .line 352
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 353
    .line 354
    .line 355
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 356
    .line 357
    move-object/from16 v1, v23

    .line 358
    .line 359
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 360
    .line 361
    .line 362
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 363
    .line 364
    move-object/from16 v1, v24

    .line 365
    .line 366
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 370
    .line 371
    const-string v1, "r_center_horizontal"

    .line 372
    .line 373
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 377
    .line 378
    const-string v1, "r_start_of"

    .line 379
    .line 380
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 384
    .line 385
    const-string v1, "r_end_of"

    .line 386
    .line 387
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 391
    .line 392
    const-string v1, "r_align_start"

    .line 393
    .line 394
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 398
    .line 399
    const-string v1, "r_align_end"

    .line 400
    .line 401
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 405
    .line 406
    const-string v1, "r_align_parent_start"

    .line 407
    .line 408
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 412
    .line 413
    const-string v1, "r_align_parent_end"

    .line 414
    .line 415
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    new-instance v0, Ll/l01;

    .line 419
    .line 420
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 421
    .line 422
    .line 423
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    sput-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->_OMSLocationType:Ljava/util/Map;

    .line 428
    .line 429
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnum;->name:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 17
    .line 18
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getString(Ljava/lang/Integer;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/data/tenum/TEnum;->name:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    const-string p1, "unknown_"

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/data/tenum/TEnum;->name:Ljava/lang/String;

    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public static bridge synthetic a(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/OMSLocationType;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/OMSLocationType;->getForData(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/OMSLocationType;

    move-result-object p0

    return-object p0
.end method

.method public static covertToOldEnumList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-object v0
.end method

.method public static covertToOldEnumMap(Ljava/util/Map;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l01;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

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
    check-cast v1, Ljava/util/Map$Entry;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return-object v0
.end method

.method private static get(I)Lcom/p1/mobile/putong/data/OMSLocationType;
    .locals 1

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    .line 41
    const-string p0, "unknown_"

    .line 42
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/data/OMSLocationType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSLocationType;

    move-result-object p0

    return-object p0
.end method

.method public static get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSLocationType;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->_OMSLocationType:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/data/OMSLocationType;-><init>(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v2, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-direct {v2, p0, v1}, Lcom/p1/mobile/putong/data/OMSLocationType;-><init>(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    move-object v1, v2

    .line 36
    :goto_0
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_1
    return-object v1
.end method

.method private static getForData(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/OMSLocationType;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getString(Ljava/lang/Integer;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/data/OMSLocationType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static oldEnumCovertList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/Integer;

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    const/4 v1, -0x1

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/data/OMSLocationType;->get(I)Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-object v0
.end method

.method public static oldEnumCovertMap(Ljava/util/Map;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l01;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

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
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/util/Map$Entry;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    const/4 v2, -0x1

    .line 33
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v1, v2}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/data/OMSLocationType;->get(I)Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isUnknownType()Z
    .locals 2

    .line 1
    const-string v0, "unknown_"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/OMSLocationType;->equals(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->supportEnum:Ljava/util/HashSet;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnum;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    xor-int/2addr p0, v1

    .line 20
    return p0
.end method
