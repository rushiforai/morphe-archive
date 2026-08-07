.class public Lcom/p1/mobile/putong/core/data/ConversationType;
.super Lcom/p1/mobile/putong/data/tenum/TEnum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/data/ConversationType$constants;
    }
.end annotation


# static fields
.field public static final JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
            ">;"
        }
    .end annotation
.end field

.field private static final _ConversationType:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
            ">;"
        }
    .end annotation
.end field

.field public static final compliment:Ljava/lang/String; = "compliment"

.field public static final default_:Ljava/lang/String; = "default"

.field public static final fakeIntlReceiveLikeGuideSVip:Ljava/lang/String; = "fakeIntlReceiveLikeGuideSVip"

.field public static final fakeReceiveLikeGuideSVip:Ljava/lang/String; = "fakeReceiveLikeGuideSVip"

.field public static final fake_one_side:Ljava/lang/String; = "fake_one_side"

.field public static final fake_one_side_no_match:Ljava/lang/String; = "fake_one_side_no_match"

.field public static final feedinteraction:Ljava/lang/String; = "feedinteraction"

.field public static final feedstate:Ljava/lang/String; = "feedstate"

.field public static final free_see_match:Ljava/lang/String; = "free_see_match"

.field public static final friendmoment:Ljava/lang/String; = "friendmoment"

.field public static final greetset:Ljava/lang/String; = "greetset"

.field public static final heartbeatMatch:Ljava/lang/String; = "heartbeatMatch"

.field private static final int_default_:I = 0x0

.field private static final int_greetset:I = 0x4

.field private static final int_qianshou:I = 0x3

.field private static final int_quickchat:I = 0x6

.field private static final int_shuoshuo:I = 0x2

.field private static final int_soulmate:I = 0x1

.field private static final int_svipad:I = 0x5

.field private static final int_unknown_:I = -0x1

.field public static final intlBoostMatch:Ljava/lang/String; = "intlBoostMatch"

.field public static final intlSeeChatRequest:Ljava/lang/String; = "intlSeeChatRequest"

.field public static final liaoliao:Ljava/lang/String; = "liaoliao"

.field public static final liveactivites:Ljava/lang/String; = "liveactivites"

.field public static final local_instant_chat_guide:Ljava/lang/String; = "local_instant_chat_guide"

.field public static final lovebuzz:Ljava/lang/String; = "lovebuzz"

.field public static final lovescript:Ljava/lang/String; = "lovescript"

.field public static final marriage:Ljava/lang/String; = "marriage"

.field public static final qianshou:Ljava/lang/String; = "qianshou"

.field public static final quickchat:Ljava/lang/String; = "quickchat"

.field public static final shuoshuo:Ljava/lang/String; = "shuoshuo"

.field public static final soulmate:Ljava/lang/String; = "soulmate"

.field protected static supportEnum:Ljava/util/HashSet; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final svipad:Ljava/lang/String; = "svipad"

.field public static final swiper:Ljava/lang/String; = "swiper"

.field public static final unknown_:Ljava/lang/String; = "unknown_"

.field public static final virtualvoice:Ljava/lang/String; = "virtualvoice"


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationType$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationType$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 7
    .line 8
    new-instance v1, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/core/data/ConversationType$2;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ConversationType$2;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/p1/mobile/putong/core/data/ConversationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    const-string v2, "default"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    const-string v3, "soulmate"

    .line 36
    .line 37
    invoke-virtual {v0, v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    const-string v4, "shuoshuo"

    .line 42
    .line 43
    invoke-virtual {v0, v4, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x3

    .line 47
    const-string v5, "qianshou"

    .line 48
    .line 49
    invoke-virtual {v0, v5, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x4

    .line 53
    const-string v6, "greetset"

    .line 54
    .line 55
    invoke-virtual {v0, v6, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    const/4 v1, 0x5

    .line 59
    const-string v7, "svipad"

    .line 60
    .line 61
    invoke-virtual {v0, v7, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    const-string v8, "quickchat"

    .line 66
    .line 67
    invoke-virtual {v0, v8, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->addExtJsonValue(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 81
    .line 82
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 86
    .line 87
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 91
    .line 92
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 96
    .line 97
    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 101
    .line 102
    invoke-virtual {v0, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 106
    .line 107
    const-string v1, "feedstate"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 113
    .line 114
    const-string v1, "liaoliao"

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 120
    .line 121
    const-string v1, "feedinteraction"

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 127
    .line 128
    const-string v1, "intlBoostMatch"

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 134
    .line 135
    const-string v1, "lovebuzz"

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 141
    .line 142
    const-string v1, "virtualvoice"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 148
    .line 149
    const-string v1, "lovescript"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 155
    .line 156
    const-string v1, "friendmoment"

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 162
    .line 163
    const-string v1, "fake_one_side_no_match"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 169
    .line 170
    const-string v1, "fakeReceiveLikeGuideSVip"

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 176
    .line 177
    const-string v1, "liveactivites"

    .line 178
    .line 179
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 183
    .line 184
    const-string v1, "fake_one_side"

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 190
    .line 191
    const-string v1, "marriage"

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 197
    .line 198
    const-string v1, "fakeIntlReceiveLikeGuideSVip"

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 204
    .line 205
    const-string v1, "free_see_match"

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 211
    .line 212
    const-string v1, "local_instant_chat_guide"

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 218
    .line 219
    const-string v1, "heartbeatMatch"

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 225
    .line 226
    const-string v1, "intlSeeChatRequest"

    .line 227
    .line 228
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 232
    .line 233
    const-string v1, "compliment"

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

    .line 239
    .line 240
    const-string v1, "swiper"

    .line 241
    .line 242
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    new-instance v0, Ll/l01;

    .line 246
    .line 247
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 248
    .line 249
    .line 250
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->_ConversationType:Ljava/util/Map;

    .line 255
    .line 256
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
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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

.method public static bridge synthetic a(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/data/ConversationType;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationType;->getForData(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/data/ConversationType;

    move-result-object p0

    return-object p0
.end method

.method public static covertToOldEnumList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
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
    check-cast v1, Lcom/p1/mobile/putong/core/data/ConversationType;

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
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
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
    check-cast v1, Lcom/p1/mobile/putong/core/data/ConversationType;

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

.method private static get(I)Lcom/p1/mobile/putong/core/data/ConversationType;
    .locals 1

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    .line 41
    const-string p0, "unknown_"

    .line 42
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ConversationType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ConversationType;

    move-result-object p0

    return-object p0
.end method

.method public static get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ConversationType;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->_ConversationType:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    new-instance v1, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/core/data/ConversationType;-><init>(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v2, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-direct {v2, p0, v1}, Lcom/p1/mobile/putong/core/data/ConversationType;-><init>(Ljava/lang/String;I)V

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

.method private static getForData(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/data/ConversationType;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ConversationType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ConversationType;

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
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ConversationType;->get(I)Lcom/p1/mobile/putong/core/data/ConversationType;

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
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ConversationType;->get(I)Lcom/p1/mobile/putong/core/data/ConversationType;

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
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ConversationType;->equals(Ljava/lang/String;)Z

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
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->supportEnum:Ljava/util/HashSet;

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
