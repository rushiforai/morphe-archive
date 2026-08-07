.class public final Ll/vy5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001d\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\n\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u0004H\u0003\u00a2\u0006\u0004\u0008\n\u0010\u000bJ#\u0010\u0011\u001a\u0004\u0018\u00010\u00102\u0006\u0010\r\u001a\u00020\u000c2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0007\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u001b\u0010\u0018\u001a\u00020\u00138FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/vy5;",
        "",
        "<init>",
        "()V",
        "Landroid/graphics/Bitmap;",
        "bitmap",
        "Lrx/c;",
        "",
        "e",
        "(Landroid/graphics/Bitmap;)Lrx/c;",
        "f",
        "(Landroid/graphics/Bitmap;)Z",
        "Landroid/content/Context;",
        "act",
        "Lcom/p1/mobile/putong/data/ProfileZodiac;",
        "zodiac",
        "Lcom/p1/mobile/putong/core/data/ConstellationData;",
        "c",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/data/ProfileZodiac;)Lcom/p1/mobile/putong/core/data/ConstellationData;",
        "",
        "a",
        "Lkotlin/Lazy;",
        "d",
        "()I",
        "swipeCount",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/vy5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vy5;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vy5;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vy5;->INSTANCE:Ll/vy5;

    .line 7
    .line 8
    new-instance v0, Ll/ty5;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/ty5;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/vy5;->a:Lkotlin/Lazy;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/graphics/Bitmap;Ll/gcg0;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/oki;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/vy5;->f(Landroid/graphics/Bitmap;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static b()I
    .locals 1

    .line 1
    sget v0, Ll/d79;->p:I

    .line 2
    .line 3
    return v0
.end method

.method public static final c(Landroid/content/Context;Lcom/p1/mobile/putong/data/ProfileZodiac;)Lcom/p1/mobile/putong/core/data/ConstellationData;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/data/ProfileZodiac;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/data/ConstellationData;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ConstellationData;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sparse-switch v2, :sswitch_data_0

    .line 22
    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :sswitch_0
    const-string v2, "sagittarius"

    .line 27
    .line 28
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_1
    const-string p1, "https://auto.tancdn.com/v1/raw/5601024c-afee-4f42-92af-c2151a38bd6a12.webp"

    .line 37
    .line 38
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 39
    .line 40
    const-string p1, "https://auto.tancdn.com/v1/raw/da7b4006-725d-4112-b605-8d9c32b93a6412.webp"

    .line 41
    .line 42
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 43
    .line 44
    sget p1, Lcom/p1/mobile/putong/core/R$string;->xa:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 51
    .line 52
    const-string p1, "#CE67FF"

    .line 53
    .line 54
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 59
    .line 60
    sget p1, Lcom/p1/mobile/putong/core/R$string;->za:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 67
    .line 68
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ya:I

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 75
    .line 76
    return-object v1

    .line 77
    :sswitch_1
    const-string v2, "scorpio"

    .line 78
    .line 79
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_2

    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :cond_2
    const-string p1, "https://auto.tancdn.com/v1/raw/1e652821-d4ff-460d-95bd-478fe18d53c612.webp"

    .line 88
    .line 89
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 90
    .line 91
    const-string p1, "https://auto.tancdn.com/v1/raw/80b5f805-9877-4fec-b770-c3243d61cf6f13.webp"

    .line 92
    .line 93
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 94
    .line 95
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Aa:I

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 102
    .line 103
    const-string p1, "#7552FF"

    .line 104
    .line 105
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 110
    .line 111
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ca:I

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 118
    .line 119
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ba:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 126
    .line 127
    return-object v1

    .line 128
    :sswitch_2
    const-string v2, "virgo"

    .line 129
    .line 130
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-nez p1, :cond_3

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_3
    const-string p1, "https://auto.tancdn.com/v1/raw/7b44b83a-6427-40d6-a8e2-9f72bbb6174612.webp"

    .line 139
    .line 140
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 141
    .line 142
    const-string p1, "https://auto.tancdn.com/v1/raw/3266a101-713e-4680-957d-85166d4dff3613.webp"

    .line 143
    .line 144
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 145
    .line 146
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ga:I

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 153
    .line 154
    const-string p1, "#52E0FF"

    .line 155
    .line 156
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 161
    .line 162
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ia:I

    .line 163
    .line 164
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 169
    .line 170
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ha:I

    .line 171
    .line 172
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 177
    .line 178
    return-object v1

    .line 179
    :sswitch_3
    const-string v2, "libra"

    .line 180
    .line 181
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-nez p1, :cond_4

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :cond_4
    const-string p1, "https://auto.tancdn.com/v1/raw/7ebbb4f6-9427-439c-92c4-d303a5ee02d112.webp"

    .line 190
    .line 191
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 192
    .line 193
    const-string p1, "https://auto.tancdn.com/v1/raw/9cfb6e32-bb8f-4996-b45d-36972350ca4b12.webp"

    .line 194
    .line 195
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 196
    .line 197
    sget p1, Lcom/p1/mobile/putong/core/R$string;->qa:I

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 204
    .line 205
    const-string p1, "#5297FF"

    .line 206
    .line 207
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 212
    .line 213
    sget p1, Lcom/p1/mobile/putong/core/R$string;->sa:I

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 220
    .line 221
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ra:I

    .line 222
    .line 223
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 228
    .line 229
    return-object v1

    .line 230
    :sswitch_4
    const-string v2, "aries"

    .line 231
    .line 232
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    if-nez p1, :cond_5

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :cond_5
    const-string p1, "https://auto.tancdn.com/v1/raw/43d7e1ae-b4fc-4d67-9e75-43a9fe32cebe13.webp"

    .line 241
    .line 242
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 243
    .line 244
    const-string p1, "https://auto.tancdn.com/v1/raw/40208eee-e386-4006-a543-d2ea3be7b1e812.webp"

    .line 245
    .line 246
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 247
    .line 248
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ba:I

    .line 249
    .line 250
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 255
    .line 256
    const-string p1, "#FF6868"

    .line 257
    .line 258
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 263
    .line 264
    sget p1, Lcom/p1/mobile/putong/core/R$string;->da:I

    .line 265
    .line 266
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 271
    .line 272
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ca:I

    .line 273
    .line 274
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 279
    .line 280
    return-object v1

    .line 281
    :sswitch_5
    const-string v2, "leo"

    .line 282
    .line 283
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    if-nez p1, :cond_6

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_6
    const-string p1, "https://auto.tancdn.com/v1/raw/c6a93f5e-1985-4b4c-9b05-f59817c415e313.webp"

    .line 292
    .line 293
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 294
    .line 295
    const-string p1, "https://auto.tancdn.com/v1/raw/30a1e90e-9406-4518-8074-31d65ce2d20412.webp"

    .line 296
    .line 297
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 298
    .line 299
    sget p1, Lcom/p1/mobile/putong/core/R$string;->na:I

    .line 300
    .line 301
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 306
    .line 307
    const-string p1, "#52FFD5"

    .line 308
    .line 309
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 314
    .line 315
    sget p1, Lcom/p1/mobile/putong/core/R$string;->pa:I

    .line 316
    .line 317
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 322
    .line 323
    sget p1, Lcom/p1/mobile/putong/core/R$string;->oa:I

    .line 324
    .line 325
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 330
    .line 331
    return-object v1

    .line 332
    :sswitch_6
    const-string v2, "taurus"

    .line 333
    .line 334
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    if-nez p1, :cond_7

    .line 339
    .line 340
    goto/16 :goto_0

    .line 341
    .line 342
    :cond_7
    const-string p1, "https://auto.tancdn.com/v1/raw/2eec4eeb-dfde-489d-9c7a-0e042d9f425313.webp"

    .line 343
    .line 344
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 345
    .line 346
    const-string p1, "https://auto.tancdn.com/v1/raw/6c73f475-e88a-4121-a343-56d7aadc6eaf12.webp"

    .line 347
    .line 348
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 349
    .line 350
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Da:I

    .line 351
    .line 352
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 357
    .line 358
    const-string p1, "#FFF067"

    .line 359
    .line 360
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 361
    .line 362
    .line 363
    move-result p1

    .line 364
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 365
    .line 366
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Fa:I

    .line 367
    .line 368
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object p1

    .line 372
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 373
    .line 374
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ea:I

    .line 375
    .line 376
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 381
    .line 382
    return-object v1

    .line 383
    :sswitch_7
    const-string v2, "pisces"

    .line 384
    .line 385
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    move-result p1

    .line 389
    if-nez p1, :cond_8

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :cond_8
    const-string p1, "https://auto.tancdn.com/v1/raw/081b57a3-8df5-457b-86f1-72b576a3b3a613.webp"

    .line 394
    .line 395
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 396
    .line 397
    const-string p1, "https://auto.tancdn.com/v1/raw/1b45f909-dc4d-478a-8a02-1f9d1f29ef5e13.webp"

    .line 398
    .line 399
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 400
    .line 401
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ta:I

    .line 402
    .line 403
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 408
    .line 409
    const-string p1, "#F64545"

    .line 410
    .line 411
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 412
    .line 413
    .line 414
    move-result p1

    .line 415
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 416
    .line 417
    sget p1, Lcom/p1/mobile/putong/core/R$string;->va:I

    .line 418
    .line 419
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object p1

    .line 423
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 424
    .line 425
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ua:I

    .line 426
    .line 427
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object p0

    .line 431
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 432
    .line 433
    return-object v1

    .line 434
    :sswitch_8
    const-string v2, "gemini"

    .line 435
    .line 436
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result p1

    .line 440
    if-nez p1, :cond_9

    .line 441
    .line 442
    goto/16 :goto_0

    .line 443
    .line 444
    :cond_9
    const-string p1, "https://auto.tancdn.com/v1/raw/358f0bf7-5490-44ad-9560-ecc1cca94dfe13.webp"

    .line 445
    .line 446
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 447
    .line 448
    const-string p1, "https://auto.tancdn.com/v1/raw/f25de113-9d72-447b-a7b0-8664c93ca27513.webp"

    .line 449
    .line 450
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 451
    .line 452
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ka:I

    .line 453
    .line 454
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 459
    .line 460
    const-string p1, "#AAFF67"

    .line 461
    .line 462
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 463
    .line 464
    .line 465
    move-result p1

    .line 466
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 467
    .line 468
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ma:I

    .line 469
    .line 470
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object p1

    .line 474
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 475
    .line 476
    sget p1, Lcom/p1/mobile/putong/core/R$string;->la:I

    .line 477
    .line 478
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object p0

    .line 482
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 483
    .line 484
    return-object v1

    .line 485
    :sswitch_9
    const-string v2, "cancer"

    .line 486
    .line 487
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    move-result p1

    .line 491
    if-nez p1, :cond_a

    .line 492
    .line 493
    goto :goto_0

    .line 494
    :cond_a
    const-string p1, "https://auto.tancdn.com/v1/raw/4321f18c-257f-43e9-91cb-4318f10aead812.webp"

    .line 495
    .line 496
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 497
    .line 498
    const-string p1, "https://auto.tancdn.com/v1/raw/db195102-45a9-4046-94f7-35bf3010c72b12.webp"

    .line 499
    .line 500
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 501
    .line 502
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ea:I

    .line 503
    .line 504
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object p1

    .line 508
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 509
    .line 510
    const-string p1, "#67FF9B"

    .line 511
    .line 512
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 513
    .line 514
    .line 515
    move-result p1

    .line 516
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 517
    .line 518
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ga:I

    .line 519
    .line 520
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object p1

    .line 524
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 525
    .line 526
    sget p1, Lcom/p1/mobile/putong/core/R$string;->fa:I

    .line 527
    .line 528
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 529
    .line 530
    .line 531
    move-result-object p0

    .line 532
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 533
    .line 534
    return-object v1

    .line 535
    :sswitch_a
    const-string v2, "capricorn"

    .line 536
    .line 537
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 538
    .line 539
    .line 540
    move-result p1

    .line 541
    if-nez p1, :cond_b

    .line 542
    .line 543
    goto :goto_0

    .line 544
    :cond_b
    const-string p1, "https://auto.tancdn.com/v1/raw/898c2f60-9906-409d-a6d6-d5db330de10f12.webp"

    .line 545
    .line 546
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 547
    .line 548
    const-string p1, "https://auto.tancdn.com/v1/raw/8901a14b-48da-480f-a551-f52b95e5461212.webp"

    .line 549
    .line 550
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 551
    .line 552
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ha:I

    .line 553
    .line 554
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 555
    .line 556
    .line 557
    move-result-object p1

    .line 558
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 559
    .line 560
    const-string p1, "#FF67E7"

    .line 561
    .line 562
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 563
    .line 564
    .line 565
    move-result p1

    .line 566
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 567
    .line 568
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ja:I

    .line 569
    .line 570
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object p1

    .line 574
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 575
    .line 576
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ia:I

    .line 577
    .line 578
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object p0

    .line 582
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 583
    .line 584
    return-object v1

    .line 585
    :sswitch_b
    const-string v2, "aquarius"

    .line 586
    .line 587
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 588
    .line 589
    .line 590
    move-result p1

    .line 591
    if-nez p1, :cond_c

    .line 592
    .line 593
    :goto_0
    return-object v0

    .line 594
    :cond_c
    const-string p1, "https://auto.tancdn.com/v1/raw/1c4be06e-1bfc-445d-a93d-0950387b6c8813.webp"

    .line 595
    .line 596
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 597
    .line 598
    const-string p1, "https://auto.tancdn.com/v1/raw/db1e0bd7-294a-417d-9886-dd6e332bdad513.webp"

    .line 599
    .line 600
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->cardBg:Ljava/lang/String;

    .line 601
    .line 602
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Y9:I

    .line 603
    .line 604
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 609
    .line 610
    const-string p1, "#FF6782"

    .line 611
    .line 612
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 613
    .line 614
    .line 615
    move-result p1

    .line 616
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 617
    .line 618
    sget p1, Lcom/p1/mobile/putong/core/R$string;->aa:I

    .line 619
    .line 620
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object p1

    .line 624
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 625
    .line 626
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Z9:I

    .line 627
    .line 628
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object p0

    .line 632
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 633
    .line 634
    return-object v1

    .line 635
    :sswitch_data_0
    .sparse-switch
        -0x7cda842f -> :sswitch_b
        -0x5ffe5b4f -> :sswitch_a
        -0x5185d180 -> :sswitch_9
        -0x4a7a6dcb -> :sswitch_8
        -0x3ae3cf89 -> :sswitch_7
        -0x34800618 -> :sswitch_6
        0x1a216 -> :sswitch_5
        0x58c5106 -> :sswitch_4
        0x6232374 -> :sswitch_3
        0x6b04947 -> :sswitch_2
        0x72ae1883 -> :sswitch_1
        0x79458ec6 -> :sswitch_0
    .end sparse-switch
.end method

.method public static final e(Landroid/graphics/Bitmap;)Lrx/c;
    .locals 1
    .param p0    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uy5;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/uy5;-><init>(Landroid/graphics/Bitmap;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public static final f(Landroid/graphics/Bitmap;)Z
    .locals 8
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-string v0, "file://"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    sget-object v2, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v2}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v4, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, "Tantan"

    .line 28
    .line 29
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v4, Ljava/io/File;

    .line 37
    .line 38
    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v5

    .line 45
    new-instance v7, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v5, ".png"

    .line 54
    .line 55
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-nez v6, :cond_0

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-nez v6, :cond_1

    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-eqz v6, :cond_1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_1

    .line 83
    :cond_0
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    new-instance v3, Ljava/io/File;

    .line 99
    .line 100
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance v4, Ljava/io/FileOutputStream;

    .line 104
    .line 105
    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    .line 107
    .line 108
    :try_start_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 109
    .line 110
    const/16 v3, 0x64

    .line 111
    .line 112
    invoke-virtual {p0, v1, v3, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 113
    .line 114
    .line 115
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 127
    .line 128
    new-instance v1, Landroid/content/Intent;

    .line 129
    .line 130
    const-string v2, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    .line 131
    .line 132
    invoke-direct {v1, v2, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 136
    .line 137
    .line 138
    move-object v1, v4

    .line 139
    :cond_1
    if-eqz v1, :cond_2

    .line 140
    .line 141
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 142
    .line 143
    .line 144
    :catch_0
    :cond_2
    const/4 p0, 0x1

    .line 145
    return p0

    .line 146
    :catchall_1
    move-exception p0

    .line 147
    move-object v1, v4

    .line 148
    goto :goto_1

    .line 149
    :catch_1
    move-object v1, v4

    .line 150
    goto :goto_2

    .line 151
    :goto_1
    if-eqz v1, :cond_3

    .line 152
    .line 153
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 154
    .line 155
    .line 156
    :catch_2
    :cond_3
    throw p0

    .line 157
    :catch_3
    :goto_2
    if-eqz v1, :cond_4

    .line 158
    .line 159
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 160
    .line 161
    .line 162
    :catch_4
    :cond_4
    const/4 p0, 0x0

    .line 163
    return p0
.end method


# virtual methods
.method public final d()I
    .locals 0

    .line 1
    sget-object p0, Ll/vy5;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
