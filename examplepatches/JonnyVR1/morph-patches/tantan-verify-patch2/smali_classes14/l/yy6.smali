.class public Ll/yy6;
.super Ll/jf00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jf00<",
        "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
        ">;"
    }
.end annotation


# static fields
.field public static d:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/ovb0<",
            "Ll/rcj<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public volatile c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-static {}, Ll/yy6;->M()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jf00;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/yy6;->c:Z

    .line 6
    .line 7
    return-void
.end method

.method public static H(Lcom/p1/mobile/putong/core/data/SpecialCard;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/a0;->m(Lcom/p1/mobile/putong/core/data/SpecialCard;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static J(Ljava/util/List;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p1}, Ll/bsj0;->x(Ljava/lang/String;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x1

    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    return v2

    .line 29
    :cond_1
    new-instance v0, Ll/xy6;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/xy6;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    return v2

    .line 41
    :cond_2
    :goto_0
    return v1
.end method

.method public static L(Lcom/p1/mobile/putong/core/data/MissMatch;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->v8(Lcom/p1/mobile/putong/core/data/MissMatch;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static M()V
    .locals 6

    .line 1
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    new-instance v1, Ll/sy6;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/sy6;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "\u5723\u8bde"

    .line 14
    .line 15
    const-string v3, "christmas"

    .line 16
    .line 17
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v4, "animations/christmas/config.xml"

    .line 26
    .line 27
    const-string v5, "animations/christmas/pic"

    .line 28
    .line 29
    invoke-static {v1, v2, v4, v5}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 37
    .line 38
    new-instance v1, Ll/ty6;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/ty6;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "\u4f60\u597d"

    .line 44
    .line 45
    const-string v3, "hello"

    .line 46
    .line 47
    const-string v4, "hi"

    .line 48
    .line 49
    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v3, "animations/hi/config.xml"

    .line 58
    .line 59
    const-string v5, "animations/hi/pic"

    .line 60
    .line 61
    invoke-static {v1, v2, v3, v5}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v4, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 69
    .line 70
    new-instance v1, Ll/ty6;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/ty6;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v2, "\u4e0d\u662f"

    .line 76
    .line 77
    const-string v3, "no"

    .line 78
    .line 79
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v4, "animations/no/config.xml"

    .line 88
    .line 89
    const-string v5, "animations/no/pic"

    .line 90
    .line 91
    invoke-static {v1, v2, v4, v5}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 99
    .line 100
    new-instance v1, Ll/sy6;

    .line 101
    .line 102
    invoke-direct {v1}, Ll/sy6;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v2, "\u5355\u8eab\u72d7"

    .line 106
    .line 107
    filled-new-array {v2}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    const-string v3, "animations/singleDog/config.xml"

    .line 116
    .line 117
    const-string v4, "animations/singleDog/pic"

    .line 118
    .line 119
    invoke-static {v1, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const-string v2, "singleDog"

    .line 124
    .line 125
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 129
    .line 130
    new-instance v1, Ll/uy6;

    .line 131
    .line 132
    invoke-direct {v1}, Ll/uy6;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v2, "\u4ec0\u4e48\u5462\uff1f"

    .line 136
    .line 137
    const-string v3, "\u4ec0\u4e48\u5462"

    .line 138
    .line 139
    const-string v4, "\u4ec0\u4e48"

    .line 140
    .line 141
    const-string v5, "\u4ec0\u4e48\uff1f"

    .line 142
    .line 143
    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    const-string v3, "animations/what/config.xml"

    .line 152
    .line 153
    const-string v4, "animations/what/pic"

    .line 154
    .line 155
    invoke-static {v1, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const-string v2, "what"

    .line 160
    .line 161
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 165
    .line 166
    new-instance v1, Ll/sy6;

    .line 167
    .line 168
    invoke-direct {v1}, Ll/sy6;-><init>()V

    .line 169
    .line 170
    .line 171
    const-string v2, "[\u5927\u7b11]"

    .line 172
    .line 173
    const-string v3, "[laugh]"

    .line 174
    .line 175
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    const-string v3, "animations/smile/config.xml"

    .line 184
    .line 185
    const-string v4, "animations/smile/pic"

    .line 186
    .line 187
    invoke-static {v1, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v2, "smile"

    .line 192
    .line 193
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 197
    .line 198
    new-instance v1, Ll/sy6;

    .line 199
    .line 200
    invoke-direct {v1}, Ll/sy6;-><init>()V

    .line 201
    .line 202
    .line 203
    const-string v2, "[\u5931\u671b]"

    .line 204
    .line 205
    const-string v3, "[disappointed]"

    .line 206
    .line 207
    const-string v4, "[crying]"

    .line 208
    .line 209
    const-string v5, "[\u54ed]"

    .line 210
    .line 211
    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    const-string v3, "animations/cry/config.xml"

    .line 220
    .line 221
    const-string v4, "animations/cry/pic"

    .line 222
    .line 223
    invoke-static {v1, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    const-string v2, "cry"

    .line 228
    .line 229
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 233
    .line 234
    new-instance v1, Ll/sy6;

    .line 235
    .line 236
    invoke-direct {v1}, Ll/sy6;-><init>()V

    .line 237
    .line 238
    .line 239
    const-string v2, "[\u5410\u820c]"

    .line 240
    .line 241
    const-string v3, "[tongue]"

    .line 242
    .line 243
    const-string v4, "[\u8c03\u76ae]"

    .line 244
    .line 245
    const-string v5, "[naughty]"

    .line 246
    .line 247
    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    const-string v3, "animations/yeah/config.xml"

    .line 256
    .line 257
    const-string v4, "animations/yeah/pic"

    .line 258
    .line 259
    invoke-static {v1, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    const-string v2, "yeah"

    .line 264
    .line 265
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)Lcom/p1/mobile/putong/core/data/MissMatch;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)Lcom/p1/mobile/putong/core/data/SpecialCard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic o(ZLcom/p1/mobile/putong/core/data/CoreAssetsSettings;)Ljava/util/List;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AnonymityImg;->female:Lcom/p1/mobile/putong/core/data/AnonymityImgSet;

    .line 6
    .line 7
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AnonymityImgSet;->items:Ljava/util/List;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AnonymityImg;->male:Lcom/p1/mobile/putong/core/data/AnonymityImgSet;

    .line 13
    .line 14
    goto :goto_0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-lt p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->android:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/data/AnonymityAsset;)Lcom/p1/mobile/putong/data/Anonymity;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Anonymity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Anonymity;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AnonymityAsset;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Anonymity;->id:Ljava/util/List;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AnonymityAsset;->identifier:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Anonymity;->identifier:Ljava/util/List;

    .line 21
    .line 22
    return-object v0
.end method

.method public static synthetic s(Ll/rcj;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1, p2}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    return-object p0
.end method

.method public static u(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    sget-object v0, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/lang/String;

    .line 30
    .line 31
    sget-object v3, Ll/yy6;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ll/ovb0;

    .line 38
    .line 39
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_1

    .line 44
    .line 45
    iget-object v4, v3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v4, Ll/rcj;

    .line 48
    .line 49
    iget-object v3, v3, Ll/ovb0;->b:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v3, Ljava/util/ArrayList;

    .line 52
    .line 53
    new-instance v5, Ll/oy6;

    .line 54
    .line 55
    invoke-direct {v5, v4, p0}, Ll/oy6;-><init>(Ll/rcj;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v3, v5}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_1

    .line 63
    .line 64
    return-object v2

    .line 65
    :cond_2
    return-object v1
.end method

.method public static v(Lcom/p1/mobile/putong/core/data/ThirdPartySticker;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->whiteList:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->whiteList:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->whiteMap:Ljava/util/Map;

    .line 26
    .line 27
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public A()J
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 6
    .line 7
    const-wide/32 v0, 0xea60

    .line 8
    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-wide v0

    .line 13
    :cond_0
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    cmp-long p0, v2, v4

    .line 18
    .line 19
    if-gtz p0, :cond_1

    .line 20
    .line 21
    return-wide v0

    .line 22
    :cond_1
    const-wide/16 v0, 0x3e8

    .line 23
    .line 24
    mul-long/2addr v2, v0

    .line 25
    return-wide v2
.end method

.method public B(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/yy6;->C(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public C(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 6
    .line 7
    iget-object p0, p0, Ll/cza;->U:Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 15
    .line 16
    :goto_0
    if-nez p0, :cond_1

    .line 17
    .line 18
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p3, "zh-CN"

    .line 22
    .line 23
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    const-string v0, "female"

    .line 28
    .line 29
    if-eqz p3, :cond_3

    .line 30
    .line 31
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhCN:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 42
    .line 43
    goto/16 :goto_1

    .line 44
    .line 45
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhCN:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 48
    .line 49
    goto/16 :goto_1

    .line 50
    .line 51
    :cond_3
    const-string p3, "zh-TW"

    .line 52
    .line 53
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    if-eqz p3, :cond_5

    .line 58
    .line 59
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 64
    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhTW:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhTW:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_5
    const-string p3, "ja-JP"

    .line 78
    .line 79
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    if-eqz p3, :cond_7

    .line 84
    .line 85
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 90
    .line 91
    if-eqz p1, :cond_6

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->jaJP:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->jaJP:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_7
    const-string p3, "ko-KR"

    .line 104
    .line 105
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-eqz p3, :cond_9

    .line 110
    .line 111
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 116
    .line 117
    if-eqz p1, :cond_8

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->koKR:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->koKR:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_9
    const-string p3, "id-ID"

    .line 130
    .line 131
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    if-eqz p2, :cond_b

    .line 136
    .line 137
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 142
    .line 143
    if-eqz p1, :cond_a

    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->idID:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_a
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->idID:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_b
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 160
    .line 161
    if-eqz p1, :cond_c

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->enUS:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_c
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->enUS:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 171
    .line 172
    :goto_1
    new-instance p1, Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 182
    .line 183
    .line 184
    move-result p2

    .line 185
    if-eqz p2, :cond_d

    .line 186
    .line 187
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    check-cast p2, Ljava/lang/String;

    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/data/LetterWrapper;->new_()Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 194
    .line 195
    .line 196
    move-result-object p3

    .line 197
    iput-object p2, p3, Lcom/p1/mobile/putong/data/LetterWrapper;->letter:Ljava/lang/String;

    .line 198
    .line 199
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_d
    return-object p1
.end method

.method public D(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 6
    .line 7
    if-eqz p0, :cond_d

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    const-string v0, "zh-CN"

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v1, "female"

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhCN:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhCN:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :cond_2
    const-string v0, "zh-TW"

    .line 46
    .line 47
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 58
    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhTW:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->zhTW:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    const-string v0, "ja-JP"

    .line 72
    .line 73
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_6

    .line 78
    .line 79
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 84
    .line 85
    if-eqz p1, :cond_5

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->jaJP:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->jaJP:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_6
    const-string v0, "ko-KR"

    .line 98
    .line 99
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 110
    .line 111
    if-eqz p1, :cond_7

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->koKR:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->koKR:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_8
    const-string v0, "id-ID"

    .line 124
    .line 125
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-eqz p2, :cond_a

    .line 130
    .line 131
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 136
    .line 137
    if-eqz p1, :cond_9

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->idID:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->idID:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_a
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 154
    .line 155
    if-eqz p1, :cond_b

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->enUS:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->female:Ljava/util/List;

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_b
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->enUS:Lcom/p1/mobile/putong/core/data/LetterLibrary;

    .line 163
    .line 164
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LetterLibrary;->male:Ljava/util/List;

    .line 165
    .line 166
    :goto_0
    new-instance p1, Ljava/util/ArrayList;

    .line 167
    .line 168
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-eqz p2, :cond_c

    .line 180
    .line 181
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    check-cast p2, Ljava/lang/String;

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/data/LetterWrapper;->new_()Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iput-object p2, v0, Lcom/p1/mobile/putong/data/LetterWrapper;->letter:Ljava/lang/String;

    .line 192
    .line 193
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_c
    return-object p1

    .line 198
    :cond_d
    :goto_2
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 199
    .line 200
    return-object p0
.end method

.method public E()Lcom/p1/mobile/putong/core/data/MissMatch;
    .locals 2

    .line 1
    new-instance v0, Ll/wy6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wy6;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/jf00;->f(Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 12
    .line 13
    return-object p0
.end method

.method public F()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->androidReleaseVersion:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    return-object p0
.end method

.method public G()Lcom/p1/mobile/putong/core/data/SpecialCard;
    .locals 2

    .line 1
    new-instance v0, Ll/vy6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vy6;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/jf00;->f(Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 12
    .line 13
    return-object p0
.end method

.method public I()Z
    .locals 2

    .line 1
    new-instance v0, Ll/ny6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ny6;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/jf00;->f(Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public K(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const-string p0, "\u9a8c\u8bc1\u7801"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public N()Z
    .locals 2

    .line 1
    new-instance v0, Ll/ry6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ry6;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/jf00;->f(Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public O()Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->name:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_4

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->startTime:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_4

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->endTime:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_4

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->entranceUrl:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 50
    .line 51
    const-string v2, "yyyy-MM-dd HH:mm:ss"

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->startTime:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->endTime:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 73
    .line 74
    .line 75
    move-result-wide v4
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 79
    .line 80
    .line 81
    move-result-wide v6

    .line 82
    cmp-long p0, v6, v2

    .line 83
    .line 84
    if-ltz p0, :cond_3

    .line 85
    .line 86
    cmp-long p0, v6, v4

    .line 87
    .line 88
    if-gtz p0, :cond_3

    .line 89
    .line 90
    const/4 p0, 0x1

    .line 91
    return p0

    .line 92
    :cond_3
    return v0

    .line 93
    :catch_0
    move-exception p0

    .line 94
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_0
    return v0
.end method

.method public bridge synthetic h(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yy6;->w(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()Lcom/tantanapp/common/data/JsonAdapter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->keywords:Ljava/util/List;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    return-object v0
.end method

.method public w(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/jf00;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-static {p0}, Ll/yy6;->v(Lcom/p1/mobile/putong/core/data/ThirdPartySticker;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-static {p0}, Ll/yy6;->L(Lcom/p1/mobile/putong/core/data/MissMatch;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 61
    .line 62
    invoke-static {p0}, Ll/yy6;->H(Lcom/p1/mobile/putong/core/data/SpecialCard;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_3

    .line 72
    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 84
    .line 85
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Nq(Z)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method

.method public x(Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Anonymity;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/py6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/py6;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, v0, p1}, Ll/jf00;->f(Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    new-instance p1, Ll/qy6;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/qy6;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public y()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->enable:Z

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public z()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->androidBaseVersion:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    return-object p0
.end method
