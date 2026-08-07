.class public final Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;,
        Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001\u0010B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0007\u00a2\u0006\u0004\u0008\t\u0010\nR\u0014\u0010\r\u001a\u00020\u000b8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010\u000cR\u0014\u0010\u000f\u001a\u00020\u000b8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u000c\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;",
        "",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;",
        "bitmapOperation",
        "Ll/t13;",
        "bitmapDownloadRequest",
        "Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "a",
        "(Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "Ll/tnl;",
        "Ll/tnl;",
        "standardGzipHttpUrlConnectionParams",
        "b",
        "inAppStandardHttpUrlConnectionParams",
        "HttpBitmapOperation",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final a:Ll/tnl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final b:Ll/tnl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->INSTANCE:Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;

    .line 7
    .line 8
    new-instance v1, Ll/tnl;

    .line 9
    .line 10
    const-string v0, "Accept-Encoding"

    .line 11
    .line 12
    const-string v2, "gzip, deflate"

    .line 13
    .line 14
    invoke-static {v0, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    const/16 v2, 0x3e8

    .line 23
    .line 24
    const/16 v3, 0x1388

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    const/4 v5, 0x1

    .line 28
    invoke-direct/range {v1 .. v6}, Ll/tnl;-><init>(IIZZLjava/util/Map;)V

    .line 29
    .line 30
    .line 31
    sput-object v1, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a:Ll/tnl;

    .line 32
    .line 33
    new-instance v2, Ll/tnl;

    .line 34
    .line 35
    const/16 v8, 0x10

    .line 36
    .line 37
    const/4 v9, 0x0

    .line 38
    const/16 v4, 0x3a98

    .line 39
    .line 40
    const/4 v6, 0x1

    .line 41
    const/4 v7, 0x0

    .line 42
    invoke-direct/range {v2 .. v9}, Ll/tnl;-><init>(IIZZLjava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 43
    .line 44
    .line 45
    sput-object v2, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->b:Ll/tnl;

    .line 46
    .line 47
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;
    .locals 11
    .param p0    # Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ll/t13;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    aget p0, v0, p0

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, 0x0

    .line 18
    packed-switch p0, :pswitch_data_0

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/nbr;->a()V

    .line 22
    .line 23
    .line 24
    return-object v2

    .line 25
    :pswitch_0
    new-instance p0, Ll/w13;

    .line 26
    .line 27
    new-instance v0, Ll/u13;

    .line 28
    .line 29
    new-instance v1, Ll/x13;

    .line 30
    .line 31
    sget-object v2, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a:Ll/tnl;

    .line 32
    .line 33
    new-instance v3, Ll/l23;

    .line 34
    .line 35
    const/4 v7, 0x4

    .line 36
    const/4 v8, 0x0

    .line 37
    const/4 v4, 0x1

    .line 38
    const/4 v5, 0x0

    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-direct/range {v3 .. v8}, Ll/l23;-><init>(ZZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 41
    .line 42
    .line 43
    const/4 v5, 0x4

    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-direct/range {v1 .. v6}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {v0, v1}, Ll/u13;-><init>(Ll/x13;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, v0}, Ll/w13;-><init>(Ll/lpl;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/w13;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :pswitch_1
    new-instance p0, Ll/u13;

    .line 60
    .line 61
    new-instance v0, Ll/x13;

    .line 62
    .line 63
    sget-object v1, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->b:Ll/tnl;

    .line 64
    .line 65
    new-instance v2, Ll/l23;

    .line 66
    .line 67
    const/4 v6, 0x4

    .line 68
    const/4 v7, 0x0

    .line 69
    const/4 v3, 0x1

    .line 70
    const/4 v4, 0x0

    .line 71
    const/4 v5, 0x0

    .line 72
    invoke-direct/range {v2 .. v7}, Ll/l23;-><init>(ZZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 73
    .line 74
    .line 75
    const/4 v4, 0x4

    .line 76
    const/4 v3, 0x0

    .line 77
    invoke-direct/range {v0 .. v5}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, v0}, Ll/u13;-><init>(Ll/x13;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ll/u13;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :pswitch_2
    new-instance p0, Ll/u13;

    .line 89
    .line 90
    new-instance v3, Ll/x13;

    .line 91
    .line 92
    sget-object v4, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a:Ll/tnl;

    .line 93
    .line 94
    new-instance v5, Ll/mwk;

    .line 95
    .line 96
    invoke-direct {v5, v1, v2, v0, v2}, Ll/mwk;-><init>(ZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 97
    .line 98
    .line 99
    const/4 v7, 0x4

    .line 100
    const/4 v8, 0x0

    .line 101
    const/4 v6, 0x0

    .line 102
    invoke-direct/range {v3 .. v8}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 103
    .line 104
    .line 105
    invoke-direct {p0, v3}, Ll/u13;-><init>(Ll/x13;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p1}, Ll/u13;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :pswitch_3
    new-instance p0, Ll/u13;

    .line 114
    .line 115
    new-instance v0, Ll/x13;

    .line 116
    .line 117
    sget-object v1, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->b:Ll/tnl;

    .line 118
    .line 119
    new-instance v2, Ll/l23;

    .line 120
    .line 121
    const/4 v6, 0x6

    .line 122
    const/4 v7, 0x0

    .line 123
    const/4 v3, 0x1

    .line 124
    const/4 v4, 0x0

    .line 125
    const/4 v5, 0x0

    .line 126
    invoke-direct/range {v2 .. v7}, Ll/l23;-><init>(ZZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 127
    .line 128
    .line 129
    const/4 v4, 0x4

    .line 130
    const/4 v3, 0x0

    .line 131
    invoke-direct/range {v0 .. v5}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 132
    .line 133
    .line 134
    invoke-direct {p0, v0}, Ll/u13;-><init>(Ll/x13;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, p1}, Ll/u13;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :pswitch_4
    new-instance p0, Ll/w13;

    .line 143
    .line 144
    new-instance v3, Ll/ky40;

    .line 145
    .line 146
    new-instance v4, Ll/u13;

    .line 147
    .line 148
    new-instance v5, Ll/x13;

    .line 149
    .line 150
    sget-object v6, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a:Ll/tnl;

    .line 151
    .line 152
    new-instance v7, Ll/mwk;

    .line 153
    .line 154
    invoke-direct {v7, v1, v2, v0, v2}, Ll/mwk;-><init>(ZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 155
    .line 156
    .line 157
    new-instance v0, Lkotlin/Pair;

    .line 158
    .line 159
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 160
    .line 161
    invoke-virtual {p1}, Ll/t13;->g()I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    invoke-direct {v5, v6, v7, v0}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;)V

    .line 173
    .line 174
    .line 175
    invoke-direct {v4, v5}, Ll/u13;-><init>(Ll/x13;)V

    .line 176
    .line 177
    .line 178
    invoke-direct {v3, v4}, Ll/ky40;-><init>(Ll/lpl;)V

    .line 179
    .line 180
    .line 181
    invoke-direct {p0, v3}, Ll/w13;-><init>(Ll/lpl;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, p1}, Ll/w13;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0

    .line 189
    :pswitch_5
    new-instance p0, Ll/ky40;

    .line 190
    .line 191
    new-instance v3, Ll/u13;

    .line 192
    .line 193
    new-instance v4, Ll/x13;

    .line 194
    .line 195
    sget-object v5, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a:Ll/tnl;

    .line 196
    .line 197
    new-instance v6, Ll/mwk;

    .line 198
    .line 199
    invoke-direct {v6, v1, v2, v0, v2}, Ll/mwk;-><init>(ZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 200
    .line 201
    .line 202
    new-instance v0, Lkotlin/Pair;

    .line 203
    .line 204
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 205
    .line 206
    invoke-virtual {p1}, Ll/t13;->g()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    invoke-direct {v4, v5, v6, v0}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;)V

    .line 218
    .line 219
    .line 220
    invoke-direct {v3, v4}, Ll/u13;-><init>(Ll/x13;)V

    .line 221
    .line 222
    .line 223
    invoke-direct {p0, v3}, Ll/ky40;-><init>(Ll/lpl;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0, p1}, Ll/ky40;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    return-object p0

    .line 231
    :pswitch_6
    new-instance p0, Ll/w13;

    .line 232
    .line 233
    new-instance v3, Ll/ky40;

    .line 234
    .line 235
    new-instance v4, Ll/u13;

    .line 236
    .line 237
    new-instance v5, Ll/x13;

    .line 238
    .line 239
    sget-object v6, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a:Ll/tnl;

    .line 240
    .line 241
    new-instance v7, Ll/mwk;

    .line 242
    .line 243
    invoke-direct {v7, v1, v2, v0, v2}, Ll/mwk;-><init>(ZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 244
    .line 245
    .line 246
    const/4 v9, 0x4

    .line 247
    const/4 v10, 0x0

    .line 248
    const/4 v8, 0x0

    .line 249
    invoke-direct/range {v5 .. v10}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 250
    .line 251
    .line 252
    invoke-direct {v4, v5}, Ll/u13;-><init>(Ll/x13;)V

    .line 253
    .line 254
    .line 255
    invoke-direct {v3, v4}, Ll/ky40;-><init>(Ll/lpl;)V

    .line 256
    .line 257
    .line 258
    invoke-direct {p0, v3}, Ll/w13;-><init>(Ll/lpl;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p0, p1}, Ll/w13;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    return-object p0

    .line 266
    :pswitch_7
    new-instance p0, Ll/ky40;

    .line 267
    .line 268
    new-instance v0, Ll/u13;

    .line 269
    .line 270
    new-instance v1, Ll/x13;

    .line 271
    .line 272
    sget-object v2, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a:Ll/tnl;

    .line 273
    .line 274
    new-instance v3, Ll/l23;

    .line 275
    .line 276
    const/4 v7, 0x7

    .line 277
    const/4 v8, 0x0

    .line 278
    const/4 v4, 0x0

    .line 279
    const/4 v5, 0x0

    .line 280
    const/4 v6, 0x0

    .line 281
    invoke-direct/range {v3 .. v8}, Ll/l23;-><init>(ZZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 282
    .line 283
    .line 284
    const/4 v5, 0x4

    .line 285
    const/4 v4, 0x0

    .line 286
    invoke-direct/range {v1 .. v6}, Ll/x13;-><init>(Ll/tnl;Ll/mpl;Lkotlin/Pair;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 287
    .line 288
    .line 289
    invoke-direct {v0, v1}, Ll/u13;-><init>(Ll/x13;)V

    .line 290
    .line 291
    .line 292
    invoke-direct {p0, v0}, Ll/ky40;-><init>(Ll/lpl;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {p0, p1}, Ll/ky40;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    return-object p0

    .line 300
    nop

    .line 301
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
