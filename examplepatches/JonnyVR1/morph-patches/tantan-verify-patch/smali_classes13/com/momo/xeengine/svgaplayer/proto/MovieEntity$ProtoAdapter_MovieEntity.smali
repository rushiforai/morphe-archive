.class final Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;
.super Lcom/squareup/wire/ProtoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProtoAdapter_MovieEntity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/ProtoAdapter<",
        "Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;",
        ">;"
    }
.end annotation


# instance fields
.field private final images:Lcom/squareup/wire/ProtoAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/wire/ProtoAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lokio/ByteString;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/squareup/wire/FieldEncoding;->LENGTH_DELIMITED:Lcom/squareup/wire/FieldEncoding;

    .line 2
    .line 3
    const-class v1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/squareup/wire/ProtoAdapter;-><init>(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->STRING:Lcom/squareup/wire/ProtoAdapter;

    .line 9
    .line 10
    sget-object v1, Lcom/squareup/wire/ProtoAdapter;->BYTES:Lcom/squareup/wire/ProtoAdapter;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/squareup/wire/ProtoAdapter;->newMapAdapter(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoAdapter;)Lcom/squareup/wire/ProtoAdapter;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->images:Lcom/squareup/wire/ProtoAdapter;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public decode(Lcom/squareup/wire/ProtoReader;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/squareup/wire/ProtoReader;->beginMessage()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    :goto_0
    invoke-virtual {p1}, Lcom/squareup/wire/ProtoReader;->nextTag()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, -0x1

    .line 15
    if-eq v3, v4, :cond_5

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    if-eq v3, v4, :cond_4

    .line 19
    .line 20
    const/4 v4, 0x2

    .line 21
    if-eq v3, v4, :cond_3

    .line 22
    .line 23
    const/4 v4, 0x3

    .line 24
    if-eq v3, v4, :cond_2

    .line 25
    .line 26
    const/4 v4, 0x4

    .line 27
    if-eq v3, v4, :cond_1

    .line 28
    .line 29
    const/4 v4, 0x5

    .line 30
    if-eq v3, v4, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/squareup/wire/ProtoReader;->peekFieldEncoding()Lcom/squareup/wire/FieldEncoding;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Lcom/squareup/wire/FieldEncoding;->rawProtoAdapter()Lcom/squareup/wire/ProtoAdapter;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v5, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v0, v3, v4, v5}, Lcom/squareup/wire/Message$Builder;->addUnknownField(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)Lcom/squareup/wire/Message$Builder;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v3, v0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 49
    .line 50
    sget-object v4, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 51
    .line 52
    invoke-virtual {v4, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;

    .line 57
    .line 58
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v3, v0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 63
    .line 64
    sget-object v4, Lcom/momo/xeengine/svgaplayer/proto/SpriteEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 65
    .line 66
    invoke-virtual {v4, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Lcom/momo/xeengine/svgaplayer/proto/SpriteEntity;

    .line 71
    .line 72
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object v3, v0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->images:Ljava/util/Map;

    .line 77
    .line 78
    iget-object v4, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->images:Lcom/squareup/wire/ProtoAdapter;

    .line 79
    .line 80
    invoke-virtual {v4, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    check-cast v4, Ljava/util/Map;

    .line 85
    .line 86
    invoke-interface {v3, v4}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    sget-object v3, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 91
    .line 92
    invoke-virtual {v3, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->params(Lcom/momo/xeengine/svgaplayer/proto/MovieParams;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    sget-object v3, Lcom/squareup/wire/ProtoAdapter;->STRING:Lcom/squareup/wire/ProtoAdapter;

    .line 103
    .line 104
    invoke-virtual {v3, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v3}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->version(Ljava/lang/String;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_5
    invoke-virtual {p1, v1, v2}, Lcom/squareup/wire/ProtoReader;->endMessage(J)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0
.end method

.method public bridge synthetic decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->decode(Lcom/squareup/wire/ProtoReader;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    move-result-object p0

    return-object p0
.end method

.method public encode(Lcom/squareup/wire/ProtoWriter;Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p2, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->version:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Lcom/squareup/wire/ProtoAdapter;->STRING:Lcom/squareup/wire/ProtoAdapter;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v1, p1, v2, v0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p2, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->params:Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    invoke-virtual {v1, p1, v2, v0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->images:Lcom/squareup/wire/ProtoAdapter;

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    iget-object v1, p2, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->images:Ljava/util/Map;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0, v1}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/SpriteEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/squareup/wire/ProtoAdapter;->asRepeated()Lcom/squareup/wire/ProtoAdapter;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v0, 0x4

    .line 36
    iget-object v1, p2, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->sprites:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p0, p1, v0, v1}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/squareup/wire/ProtoAdapter;->asRepeated()Lcom/squareup/wire/ProtoAdapter;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 v0, 0x5

    .line 48
    iget-object v1, p2, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->audios:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p0, p1, v0, v1}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lcom/squareup/wire/ProtoWriter;->writeBytes(Lokio/ByteString;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public bridge synthetic encode(Lcom/squareup/wire/ProtoWriter;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    check-cast p2, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->encode(Lcom/squareup/wire/ProtoWriter;Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;)V

    return-void
.end method

.method public encodedSize(Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;)I
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->version:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->STRING:Lcom/squareup/wire/ProtoAdapter;

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v2, v3, v0}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v0, v1

    .line 15
    :goto_0
    iget-object v2, p1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->params:Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-virtual {v1, v3, v2}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    :cond_1
    add-int/2addr v0, v1

    .line 27
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->images:Lcom/squareup/wire/ProtoAdapter;

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    iget-object v2, p1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->images:Ljava/util/Map;

    .line 31
    .line 32
    invoke-virtual {p0, v1, v2}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    add-int/2addr v0, p0

    .line 37
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/SpriteEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/squareup/wire/ProtoAdapter;->asRepeated()Lcom/squareup/wire/ProtoAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v1, 0x4

    .line 44
    iget-object v2, p1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->sprites:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p0, v1, v2}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    add-int/2addr v0, p0

    .line 51
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/squareup/wire/ProtoAdapter;->asRepeated()Lcom/squareup/wire/ProtoAdapter;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 v1, 0x5

    .line 58
    iget-object v2, p1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->audios:Ljava/util/List;

    .line 59
    .line 60
    invoke-virtual {p0, v1, v2}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    add-int/2addr v0, p0

    .line 65
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lokio/ByteString;->size()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    add-int/2addr v0, p0

    .line 74
    return v0
.end method

.method public bridge synthetic encodedSize(Ljava/lang/Object;)I
    .locals 0

    .line 75
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->encodedSize(Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;)I

    move-result p0

    return p0
.end method

.method public redact(Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->newBuilder()Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->params:Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->params:Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 20
    .line 21
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/SpriteEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 22
    .line 23
    invoke-static {p1, v0}, Lcom/squareup/wire/internal/Internal;->redactElements(Ljava/util/List;Lcom/squareup/wire/ProtoAdapter;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 27
    .line 28
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 29
    .line 30
    invoke-static {p1, v0}, Lcom/squareup/wire/internal/Internal;->redactElements(Ljava/util/List;Lcom/squareup/wire/ProtoAdapter;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/squareup/wire/Message$Builder;->clearUnknownFields()Lcom/squareup/wire/Message$Builder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public bridge synthetic redact(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 41
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$ProtoAdapter_MovieEntity;->redact(Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    move-result-object p0

    return-object p0
.end method
