.class final Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$ProtoAdapter_ShapeArgs;
.super Lcom/squareup/wire/ProtoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProtoAdapter_ShapeArgs"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/ProtoAdapter<",
        "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/squareup/wire/FieldEncoding;->LENGTH_DELIMITED:Lcom/squareup/wire/FieldEncoding;

    .line 2
    .line 3
    const-class v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/squareup/wire/ProtoAdapter;-><init>(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public decode(Lcom/squareup/wire/ProtoReader;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/squareup/wire/ProtoReader;->beginMessage()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    :goto_0
    invoke-virtual {p1}, Lcom/squareup/wire/ProtoReader;->nextTag()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, -0x1

    .line 15
    if-eq v2, v3, :cond_1

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-eq v2, v3, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/squareup/wire/ProtoReader;->peekFieldEncoding()Lcom/squareup/wire/FieldEncoding;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Lcom/squareup/wire/FieldEncoding;->rawProtoAdapter()Lcom/squareup/wire/ProtoAdapter;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v4, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {p0, v2, v3, v4}, Lcom/squareup/wire/Message$Builder;->addUnknownField(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)Lcom/squareup/wire/Message$Builder;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->STRING:Lcom/squareup/wire/ProtoAdapter;

    .line 37
    .line 38
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;->d(Ljava/lang/String;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p1, v0, v1}, Lcom/squareup/wire/ProtoReader;->endMessage(J)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public bridge synthetic decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$ProtoAdapter_ShapeArgs;->decode(Lcom/squareup/wire/ProtoReader;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    move-result-object p0

    return-object p0
.end method

.method public encode(Lcom/squareup/wire/ProtoWriter;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;->d:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->STRING:Lcom/squareup/wire/ProtoAdapter;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p2}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lcom/squareup/wire/ProtoWriter;->writeBytes(Lokio/ByteString;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic encode(Lcom/squareup/wire/ProtoWriter;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    check-cast p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$ProtoAdapter_ShapeArgs;->encode(Lcom/squareup/wire/ProtoWriter;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;)V

    return-void
.end method

.method public encodedSize(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;->d:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->STRING:Lcom/squareup/wire/ProtoAdapter;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    add-int/2addr p0, p1

    .line 23
    return p0
.end method

.method public bridge synthetic encodedSize(Ljava/lang/Object;)I
    .locals 0

    .line 24
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$ProtoAdapter_ShapeArgs;->encodedSize(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;)I

    move-result p0

    return p0
.end method

.method public redact(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;->newBuilder()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/squareup/wire/Message$Builder;->clearUnknownFields()Lcom/squareup/wire/Message$Builder;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public bridge synthetic redact(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 13
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$ProtoAdapter_ShapeArgs;->redact(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    move-result-object p0

    return-object p0
.end method
