.class public final Lcom/tantan/library/svga/compose/parser/ImageDataParser;
.super Lcom/tantan/library/svga/compose/parser/DataParser;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/compose/parser/DataParser<",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "+",
        "Landroid/graphics/Bitmap;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u00002\u001a\u0012\u0004\u0012\u00020\u0002\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00030\u0001B\u001d\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0002\u0010\u000bJ\u001c\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00032\u0006\u0010\u0010\u001a\u00020\u0002H\u0016J\u001d\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0014\u001a\u00020\tH\u0000\u00a2\u0006\u0002\u0008\u0015R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000c\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\rR\u0012\u0010\u000e\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\r\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/tantan/library/svga/compose/parser/ImageDataParser;",
        "Lcom/tantan/library/svga/compose/parser/DataParser;",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
        "",
        "",
        "Landroid/graphics/Bitmap;",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "originWidth",
        "",
        "originHeight",
        "(Lcom/tantan/library/svga/ResourceKey;II)V",
        "realHeight",
        "Ljava/lang/Integer;",
        "realWidth",
        "onParser",
        "data",
        "resetSize",
        "",
        "width",
        "height",
        "resetSize$svga_lib_release",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final key:Lcom/tantan/library/svga/ResourceKey;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final originHeight:I

.field private final originWidth:I

.field private realHeight:Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private realWidth:Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/ResourceKey;II)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tantan/library/svga/compose/parser/DataParser;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 8
    .line 9
    iput p2, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->originWidth:I

    .line 10
    .line 11
    iput p3, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->originHeight:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic onParser(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 270
    check-cast p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->onParser(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public onParser(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/Map;
    .locals 7
    .param p1    # Lcom/tantan/library/svga/compose/proto/MovieEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;->images:Ljava/util/Map;

    .line 10
    .line 11
    if-eqz p1, :cond_6

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_6

    .line 18
    .line 19
    check-cast p1, Ljava/lang/Iterable;

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_6

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/util/Map$Entry;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lokio/ByteString;

    .line 42
    .line 43
    invoke-virtual {v2}, Lokio/ByteString;->toByteArray()[B

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    array-length v3, v2

    .line 51
    const/4 v4, 0x4

    .line 52
    if-ge v3, v4, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    new-instance v3, Lkotlin/ranges/IntRange;

    .line 56
    .line 57
    const/4 v4, 0x3

    .line 58
    const/4 v5, 0x0

    .line 59
    invoke-direct {v3, v5, v4}, Lkotlin/ranges/IntRange;-><init>(II)V

    .line 60
    .line 61
    .line 62
    invoke-static {v2, v3}, Lkotlin/collections/ArraysKt;->slice([BLkotlin/ranges/IntRange;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Ljava/lang/Number;

    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/lang/Number;->byteValue()B

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    const/16 v5, 0x49

    .line 77
    .line 78
    if-ne v4, v5, :cond_2

    .line 79
    .line 80
    const/4 v4, 0x1

    .line 81
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ljava/lang/Number;

    .line 86
    .line 87
    invoke-virtual {v4}, Ljava/lang/Number;->byteValue()B

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    const/16 v5, 0x44

    .line 92
    .line 93
    if-ne v4, v5, :cond_2

    .line 94
    .line 95
    const/4 v4, 0x2

    .line 96
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Ljava/lang/Number;

    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    const/16 v4, 0x33

    .line 107
    .line 108
    if-ne v3, v4, :cond_2

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    :try_start_0
    sget-object v3, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;->Companion:Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Companion;

    .line 112
    .line 113
    invoke-virtual {v3}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Companion;->get()Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    new-instance v4, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    iget-object v5, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 123
    .line 124
    invoke-virtual {v5}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    check-cast v5, Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {v3, v4}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    if-eqz v3, :cond_3

    .line 149
    .line 150
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 155
    .line 156
    .line 157
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :catchall_0
    move-exception v1

    .line 163
    goto :goto_3

    .line 164
    :cond_3
    sget-object v3, Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;->INSTANCE:Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;

    .line 165
    .line 166
    iget-object v4, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->realWidth:Ljava/lang/Integer;

    .line 167
    .line 168
    if-eqz v4, :cond_4

    .line 169
    .line 170
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    goto :goto_1

    .line 175
    :cond_4
    iget v4, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->originWidth:I

    .line 176
    .line 177
    :goto_1
    iget-object v5, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 178
    .line 179
    invoke-virtual {v5}, Lcom/tantan/library/svga/ResourceKey;->getInSampleSize$svga_lib_release()I

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    div-int/2addr v4, v5

    .line 184
    iget-object v5, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->realHeight:Ljava/lang/Integer;

    .line 185
    .line 186
    if-eqz v5, :cond_5

    .line 187
    .line 188
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    goto :goto_2

    .line 193
    :cond_5
    iget v5, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->originHeight:I

    .line 194
    .line 195
    :goto_2
    iget-object v6, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 196
    .line 197
    invoke-virtual {v6}, Lcom/tantan/library/svga/ResourceKey;->getInSampleSize$svga_lib_release()I

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    div-int/2addr v5, v6

    .line 202
    invoke-virtual {v3, v2, v4, v5}, Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;->decodeBitmapFrom(Ljava/lang/Object;II)Landroid/graphics/Bitmap;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    if-eqz v2, :cond_0

    .line 207
    .line 208
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 213
    .line 214
    .line 215
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :goto_3
    sget-object v2, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    .line 221
    .line 222
    invoke-virtual {v2}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;->get$svga_lib_release()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    if-eqz v2, :cond_0

    .line 227
    .line 228
    iget-object v3, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 229
    .line 230
    invoke-virtual {v3}, Lcom/tantan/library/svga/ResourceKey;->get()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    new-instance v4, Lcom/tantan/library/svga/exception/SVGAException;

    .line 235
    .line 236
    new-instance v5, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    const-string v6, "\u89e3\u6790SVGA-Bitmap\u8d44\u6e90("

    .line 239
    .line 240
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    iget-object v6, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 244
    .line 245
    invoke-virtual {v6}, Lcom/tantan/library/svga/ResourceKey;->get()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v6

    .line 249
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    const-string v6, ")\u5931\u8d25\uff01"

    .line 253
    .line 254
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    invoke-direct {v4, v5, v1}, Lcom/tantan/library/svga/exception/SVGAException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v2, v3, v4}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->onFailed(Ljava/lang/String;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 265
    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :cond_6
    return-object v0
.end method

.method public final resetSize$svga_lib_release(II)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->realWidth:Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/tantan/library/svga/compose/parser/ImageDataParser;->realHeight:Ljava/lang/Integer;

    .line 12
    .line 13
    return-void
.end method
