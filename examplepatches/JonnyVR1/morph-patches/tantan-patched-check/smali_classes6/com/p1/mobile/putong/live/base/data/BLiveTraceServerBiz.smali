.class public Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;
.super Lcom/p1/mobile/putong/data/tenum/TEnum;
.source "SourceFile"


# static fields
.field public static final Grabheadlines:Ljava/lang/String; = "Grabheadlines"

.field public static final JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;",
            ">;"
        }
    .end annotation
.end field

.field public static final PacketUnJail:Ljava/lang/String; = "PacketUnJail"

.field private static final _BLiveTraceServerBiz:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;",
            ">;"
        }
    .end annotation
.end field

.field public static final audio_pay_guide_follow_like:Ljava/lang/String; = "audio_pay_guide_follow_like"

.field public static final audio_pay_guide_follow_match:Ljava/lang/String; = "audio_pay_guide_follow_match"

.field public static final audio_pay_guide_follow_stranger:Ljava/lang/String; = "audio_pay_guide_follow_stranger"

.field public static final audio_pay_guide_key_pop:Ljava/lang/String; = "audio_pay_guide_key_pop"

.field public static final audio_pay_guide_nearby_pop:Ljava/lang/String; = "audio_pay_guide_nearby_pop"

.field public static final audio_pay_guide_not_follow_like_strategyA:Ljava/lang/String; = "audio_pay_guide_not_follow_like_strategyA"

.field public static final audio_pay_guide_not_follow_like_strategyB:Ljava/lang/String; = "audio_pay_guide_not_follow_like_strategyB"

.field public static final audio_pay_guide_not_follow_like_strategyC:Ljava/lang/String; = "audio_pay_guide_not_follow_like_strategyC"

.field public static final audio_pay_guide_not_follow_stranger_strategyA:Ljava/lang/String; = "audio_pay_guide_not_follow_stranger_strategyA"

.field public static final audio_pay_guide_not_follow_stranger_strategyB:Ljava/lang/String; = "audio_pay_guide_not_follow_stranger_strategyB"

.field public static final audio_pay_guide_not_follow_stranger_strategyC:Ljava/lang/String; = "audio_pay_guide_not_follow_stranger_strategyC"

.field public static final audio_pay_guide_profile_add:Ljava/lang/String; = "audio_pay_guide_profile_add"

.field public static final audio_pay_guide_relationship_pop:Ljava/lang/String; = "audio_pay_guide_relationship_pop"

.field public static final bulletstorm:Ljava/lang/String; = "bulletstorm"

.field public static final callCard:Ljava/lang/String; = "callCard"

.field public static final cp:Ljava/lang/String; = "cp"

.field public static final fans:Ljava/lang/String; = "fans"

.field public static final firstblood:Ljava/lang/String; = "firstblood"

.field public static final firstrecharge:Ljava/lang/String; = "firstrecharge"

.field public static final firstscreen:Ljava/lang/String; = "firstscreen"

.field public static final giftcollection:Ljava/lang/String; = "giftcollection"

.field public static final giftcombination:Ljava/lang/String; = "giftcombination"

.field public static final guard:Ljava/lang/String; = "guard"

.field private static final int_Grabheadlines:I = 0x8

.field private static final int_bulletstorm:I = 0x9

.field private static final int_fans:I = 0x0

.field private static final int_firstblood:I = 0x4

.field private static final int_firstrecharge:I = 0xa

.field private static final int_firstscreen:I = 0x5

.field private static final int_giftcombination:I = 0x2

.field private static final int_guard:I = 0x1

.field private static final int_interactivepk:I = 0x7

.field private static final int_sweetaccompany:I = 0x3

.field private static final int_unknown_:I = -0x1

.field private static final int_withyoutravel:I = 0x6

.field public static final interactivepk:Ljava/lang/String; = "interactivepk"

.field public static final sticker:Ljava/lang/String; = "sticker"

.field protected static supportEnum:Ljava/util/HashSet; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final sweetaccompany:Ljava/lang/String; = "sweetaccompany"

.field public static final topchat:Ljava/lang/String; = "topchat"

.field public static final unknown_:Ljava/lang/String; = "unknown_"

.field public static final withyoutravel:Ljava/lang/String; = "withyoutravel"


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 7
    .line 8
    new-instance v1, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz$b;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz$b;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    const-string v2, "fans"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    const-string v3, "guard"

    .line 36
    .line 37
    invoke-virtual {v0, v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    const-string v4, "giftcombination"

    .line 42
    .line 43
    invoke-virtual {v0, v4, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x3

    .line 47
    const-string v5, "sweetaccompany"

    .line 48
    .line 49
    invoke-virtual {v0, v5, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x4

    .line 53
    const-string v6, "firstblood"

    .line 54
    .line 55
    invoke-virtual {v0, v6, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    const/4 v1, 0x5

    .line 59
    const-string v7, "firstscreen"

    .line 60
    .line 61
    invoke-virtual {v0, v7, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    const-string v8, "withyoutravel"

    .line 66
    .line 67
    invoke-virtual {v0, v8, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    const-string v9, "interactivepk"

    .line 72
    .line 73
    invoke-virtual {v0, v9, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    const-string v10, "Grabheadlines"

    .line 79
    .line 80
    invoke-virtual {v0, v10, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    const/16 v1, 0x9

    .line 84
    .line 85
    const-string v11, "bulletstorm"

    .line 86
    .line 87
    invoke-virtual {v0, v11, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    const/16 v1, 0xa

    .line 91
    .line 92
    const-string v12, "firstrecharge"

    .line 93
    .line 94
    invoke-virtual {v0, v12, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 108
    .line 109
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 113
    .line 114
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 118
    .line 119
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 123
    .line 124
    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 128
    .line 129
    invoke-virtual {v0, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 133
    .line 134
    invoke-virtual {v0, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 138
    .line 139
    invoke-virtual {v0, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 143
    .line 144
    invoke-virtual {v0, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 148
    .line 149
    invoke-virtual {v0, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 153
    .line 154
    const-string v1, "topchat"

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 160
    .line 161
    const-string v1, "sticker"

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 167
    .line 168
    const-string v1, "PacketUnJail"

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 174
    .line 175
    const-string v1, "callCard"

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 181
    .line 182
    const-string v1, "cp"

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 188
    .line 189
    const-string v1, "audio_pay_guide_relationship_pop"

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 195
    .line 196
    const-string v1, "audio_pay_guide_key_pop"

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 202
    .line 203
    const-string v1, "audio_pay_guide_nearby_pop"

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 209
    .line 210
    const-string v1, "audio_pay_guide_profile_add"

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 216
    .line 217
    const-string v1, "audio_pay_guide_follow_like"

    .line 218
    .line 219
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 223
    .line 224
    const-string v1, "audio_pay_guide_follow_match"

    .line 225
    .line 226
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 230
    .line 231
    const-string v1, "audio_pay_guide_follow_stranger"

    .line 232
    .line 233
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 237
    .line 238
    const-string v1, "audio_pay_guide_not_follow_like_strategyA"

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 244
    .line 245
    const-string v1, "audio_pay_guide_not_follow_like_strategyB"

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 251
    .line 252
    const-string v1, "audio_pay_guide_not_follow_like_strategyC"

    .line 253
    .line 254
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 258
    .line 259
    const-string v1, "audio_pay_guide_not_follow_stranger_strategyA"

    .line 260
    .line 261
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 265
    .line 266
    const-string v1, "audio_pay_guide_not_follow_stranger_strategyB"

    .line 267
    .line 268
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 272
    .line 273
    const-string v1, "audio_pay_guide_not_follow_stranger_strategyC"

    .line 274
    .line 275
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

    .line 279
    .line 280
    const-string v1, "giftcollection"

    .line 281
    .line 282
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    new-instance v0, Ll/l01;

    .line 286
    .line 287
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 288
    .line 289
    .line 290
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->_BLiveTraceServerBiz:Ljava/util/Map;

    .line 295
    .line 296
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
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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

.method public static bridge synthetic a(Ljava/lang/String;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->getForData(Ljava/lang/String;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    move-result-object p0

    return-object p0
.end method

.method public static covertToOldEnumList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;",
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
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

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
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;",
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
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

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

.method private static get(I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;
    .locals 1

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    .line 41
    const-string p0, "unknown_"

    .line 42
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    move-result-object p0

    return-object p0
.end method

.method public static get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->_BLiveTraceServerBiz:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;-><init>(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v2, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-direct {v2, p0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;-><init>(Ljava/lang/String;I)V

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

.method private static getForData(Ljava/lang/String;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

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
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;",
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
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

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
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;",
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
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

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
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->equals(Ljava/lang/String;)Z

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
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->supportEnum:Ljava/util/HashSet;

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
