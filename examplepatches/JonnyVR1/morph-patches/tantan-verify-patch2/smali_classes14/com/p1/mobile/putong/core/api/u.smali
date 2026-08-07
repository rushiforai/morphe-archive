.class public Lcom/p1/mobile/putong/core/api/u;
.super Ll/dy6;
.source "SourceFile"


# static fields
.field public static R:Ljava/util/concurrent/ConcurrentHashMap;
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
    sput-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/api/u;->a3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dy6;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a3()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
    sget-object v0, Lcom/p1/mobile/putong/core/api/u;->R:Ljava/util/concurrent/ConcurrentHashMap;

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
