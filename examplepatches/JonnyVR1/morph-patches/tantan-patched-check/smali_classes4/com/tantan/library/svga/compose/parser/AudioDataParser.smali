.class public final Lcom/tantan/library/svga/compose/parser/AudioDataParser;
.super Lcom/tantan/library/svga/compose/parser/DataParser;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/compose/parser/DataParser<",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
        "Ljava/util/Map<",
        "Ljava/io/File;",
        "+",
        "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u001a\u0012\u0004\u0012\u00020\u0002\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00030\u0001B\r\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0008J\u0018\u0010\r\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u0010H\u0002J,\u0010\u0011\u001a\u001e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00040\u0012j\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u0004`\u00142\u0006\u0010\u0006\u001a\u00020\u0002H\u0002J,\u0010\u0015\u001a\u001e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00100\u0012j\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u0010`\u00142\u0006\u0010\u0006\u001a\u00020\u0002H\u0002J\u001c\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00032\u0006\u0010\u0017\u001a\u00020\u0002H\u0016J0\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u0017\u001a\u00020\u00022\u001e\u0010\u001a\u001a\u001a\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003\u0012\u0004\u0012\u00020\u00190\u001bH\u0016R\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/tantan/library/svga/compose/parser/AudioDataParser;",
        "Lcom/tantan/library/svga/compose/parser/DataParser;",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
        "",
        "Ljava/io/File;",
        "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
        "entity",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V",
        "audioMap",
        "",
        "soundCallback",
        "Lcom/tantan/library/svga/SoundCallBack;",
        "generateAudioFile",
        "audioCache",
        "value",
        "",
        "generateAudioFileMap",
        "Ljava/util/HashMap;",
        "",
        "Lkotlin/collections/HashMap;",
        "generateAudioMap",
        "onParser",
        "data",
        "parser",
        "",
        "onReady",
        "Lkotlin/Function1;",
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
.field private final audioMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/io/File;",
            "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private soundCallback:Lcom/tantan/library/svga/SoundCallBack;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/compose/SVGAVideoEntity;
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
    iput-object p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 8
    .line 9
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->audioMap:Ljava/util/Map;

    .line 15
    .line 16
    return-void
.end method

.method public static final synthetic access$getAudioMap$p(Lcom/tantan/library/svga/compose/parser/AudioDataParser;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->audioMap:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getEntity$p(Lcom/tantan/library/svga/compose/parser/AudioDataParser;)Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method private final generateAudioFile(Ljava/io/File;[B)Ljava/io/File;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/ByteBufferUtil;->INSTANCE:Lcom/tantan/library/svga/utils/ByteBufferUtil;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2, p1}, Lcom/tantan/library/svga/utils/ByteBufferUtil;->toFile(Ljava/nio/ByteBuffer;Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method private final generateAudioFileMap(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/HashMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->generateAudioMap(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/HashMap;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ljava/util/Map$Entry;

    .line 38
    .line 39
    new-instance v3, Ljava/io/File;

    .line 40
    .line 41
    sget-object v4, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/tantan/library/svga/utils/SVGASoundManager;->getCacheDir()Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    new-instance v5, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    check-cast v6, Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v6, ".mp3"

    .line 62
    .line 63
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-eqz v5, :cond_0

    .line 82
    .line 83
    move-object v5, v3

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    const/4 v5, 0x0

    .line 86
    :goto_1
    if-nez v5, :cond_1

    .line 87
    .line 88
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, [B

    .line 93
    .line 94
    invoke-direct {p0, v3, v2}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->generateAudioFile(Ljava/io/File;[B)Ljava/io/File;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    :cond_1
    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 102
    .line 103
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_2
    return-object v0
.end method

.method private final generateAudioMap(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/HashMap;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;->images:Ljava/util/Map;

    .line 7
    .line 8
    if-eqz p1, :cond_3

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    check-cast p1, Ljava/lang/Iterable;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/util/Map$Entry;

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lokio/ByteString;

    .line 45
    .line 46
    invoke-virtual {v0}, Lokio/ByteString;->toByteArray()[B

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    array-length v2, v0

    .line 54
    const/4 v3, 0x4

    .line 55
    if-ge v2, v3, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    new-instance v2, Lkotlin/ranges/IntRange;

    .line 59
    .line 60
    const/4 v3, 0x3

    .line 61
    const/4 v4, 0x0

    .line 62
    invoke-direct {v2, v4, v3}, Lkotlin/ranges/IntRange;-><init>(II)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v2}, Lkotlin/collections/ArraysKt;->slice([BLkotlin/ranges/IntRange;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Ljava/lang/Number;

    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    const/16 v5, 0x49

    .line 80
    .line 81
    const/4 v6, 0x2

    .line 82
    const/4 v7, 0x1

    .line 83
    if-ne v3, v5, :cond_2

    .line 84
    .line 85
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    check-cast v3, Ljava/lang/Number;

    .line 90
    .line 91
    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    const/16 v5, 0x44

    .line 96
    .line 97
    if-ne v3, v5, :cond_2

    .line 98
    .line 99
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    check-cast v3, Ljava/lang/Number;

    .line 104
    .line 105
    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    const/16 v5, 0x33

    .line 110
    .line 111
    if-ne v3, v5, :cond_2

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    check-cast v3, Ljava/lang/Number;

    .line 125
    .line 126
    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    const/4 v4, -0x1

    .line 131
    if-ne v3, v4, :cond_0

    .line 132
    .line 133
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    check-cast v3, Ljava/lang/Number;

    .line 138
    .line 139
    invoke-virtual {v3}, Ljava/lang/Number;->byteValue()B

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    const/4 v4, -0x5

    .line 144
    if-ne v3, v4, :cond_0

    .line 145
    .line 146
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Ljava/lang/Number;

    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/Number;->byteValue()B

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    const/16 v3, -0x6c

    .line 157
    .line 158
    if-ne v2, v3, :cond_0

    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    .line 162
    .line 163
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :cond_3
    return-object p0
.end method


# virtual methods
.method public bridge synthetic onParser(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 133
    check-cast p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->onParser(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public onParser(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/Map;
    .locals 8
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
            "Ljava/io/File;",
            "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
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
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->generateAudioFileMap(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/HashMap;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, -0x1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->soundCallback:Lcom/tantan/library/svga/SoundCallBack;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-interface {p1, v2}, Lcom/tantan/library/svga/SoundCallBack;->onComplete(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->audioMap:Ljava/util/Map;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    iget-object v1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->audioMap:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;->audios:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    check-cast p1, Ljava/lang/Iterable;

    .line 36
    .line 37
    new-instance v1, Ljava/util/ArrayList;

    .line 38
    .line 39
    const/16 v3, 0xa

    .line 40
    .line 41
    invoke-static {p1, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_3

    .line 57
    .line 58
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/tantan/library/svga/compose/proto/AudioEntity;

    .line 63
    .line 64
    iget-object v4, v3, Lcom/tantan/library/svga/compose/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Ljava/io/File;

    .line 71
    .line 72
    if-eqz v4, :cond_2

    .line 73
    .line 74
    new-instance v5, Lcom/tantan/library/svga/compose/entities/SVGAAudio;

    .line 75
    .line 76
    invoke-direct {v5, v3}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;-><init>(Lcom/tantan/library/svga/compose/proto/AudioEntity;)V

    .line 77
    .line 78
    .line 79
    sget-object v3, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 80
    .line 81
    iget-object v6, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->soundCallback:Lcom/tantan/library/svga/SoundCallBack;

    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3, v6, v7}, Lcom/tantan/library/svga/utils/SVGASoundManager;->load$svga_lib_release(Lcom/tantan/library/svga/SoundCallBack;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v5, v3}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->setSoundID(Ljava/lang/Integer;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->audioMap:Ljava/util/Map;

    .line 102
    .line 103
    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Lcom/tantan/library/svga/compose/entities/SVGAAudio;

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    const/4 v3, 0x0

    .line 111
    :goto_1
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_3
    iget-object p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->audioMap:Ljava/util/Map;

    .line 116
    .line 117
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_4

    .line 122
    .line 123
    iget-object p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->soundCallback:Lcom/tantan/library/svga/SoundCallBack;

    .line 124
    .line 125
    if-eqz p1, :cond_4

    .line 126
    .line 127
    invoke-interface {p1, v2}, Lcom/tantan/library/svga/SoundCallBack;->onComplete(I)V

    .line 128
    .line 129
    .line 130
    :cond_4
    iget-object p0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->audioMap:Ljava/util/Map;

    .line 131
    .line 132
    return-object p0
.end method

.method public parser(Lcom/tantan/library/svga/compose/proto/MovieEntity;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .param p1    # Lcom/tantan/library/svga/compose/proto/MovieEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Ljava/io/File;",
            "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
            ">;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p2}, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;-><init>(Lcom/tantan/library/svga/compose/parser/AudioDataParser;Lkotlin/jvm/functions/Function1;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->soundCallback:Lcom/tantan/library/svga/SoundCallBack;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->onParser(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic parser(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 18
    check-cast p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->parser(Lcom/tantan/library/svga/compose/proto/MovieEntity;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
