.class final Lcom/tantan/library/svga/compose/proto/ShapeEntity$ProtoAdapter_ShapeEntity;
.super Lcom/squareup/wire/ProtoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/compose/proto/ShapeEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProtoAdapter_ShapeEntity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/ProtoAdapter<",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity;",
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
    const-class v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/squareup/wire/ProtoAdapter;-><init>(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public decode(Lcom/squareup/wire/ProtoReader;)Lcom/tantan/library/svga/compose/proto/ShapeEntity;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;-><init>()V

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
    if-eq v2, v3, :cond_6

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-eq v2, v3, :cond_5

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    if-eq v2, v3, :cond_4

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    if-eq v2, v3, :cond_3

    .line 25
    .line 26
    const/4 v3, 0x4

    .line 27
    if-eq v2, v3, :cond_2

    .line 28
    .line 29
    const/16 v3, 0xa

    .line 30
    .line 31
    if-eq v2, v3, :cond_1

    .line 32
    .line 33
    const/16 v3, 0xb

    .line 34
    .line 35
    if-eq v2, v3, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/squareup/wire/ProtoReader;->peekFieldEncoding()Lcom/squareup/wire/FieldEncoding;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Lcom/squareup/wire/FieldEncoding;->rawProtoAdapter()Lcom/squareup/wire/ProtoAdapter;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {p0, v2, v3, v4}, Lcom/squareup/wire/Message$Builder;->addUnknownField(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)Lcom/squareup/wire/Message$Builder;

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sget-object v2, Lcom/tantan/library/svga/compose/proto/Transform;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 54
    .line 55
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lcom/tantan/library/svga/compose/proto/Transform;

    .line 60
    .line 61
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->transform(Lcom/tantan/library/svga/compose/proto/Transform;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    sget-object v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 66
    .line 67
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 72
    .line 73
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->styles(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    sget-object v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 78
    .line 79
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 84
    .line 85
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->ellipse(Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    sget-object v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 90
    .line 91
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 96
    .line 97
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->rect(Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    sget-object v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 102
    .line 103
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 108
    .line 109
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->shape(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    :try_start_0
    sget-object v3, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 114
    .line 115
    invoke-virtual {v3, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 120
    .line 121
    invoke-virtual {p0, v3}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->type(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
    :try_end_0
    .catch Lcom/squareup/wire/ProtoAdapter$EnumConstantNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :catch_0
    move-exception v3

    .line 126
    sget-object v4, Lcom/squareup/wire/FieldEncoding;->VARINT:Lcom/squareup/wire/FieldEncoding;

    .line 127
    .line 128
    iget v3, v3, Lcom/squareup/wire/ProtoAdapter$EnumConstantNotFoundException;->value:I

    .line 129
    .line 130
    int-to-long v5, v3

    .line 131
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {p0, v2, v4, v3}, Lcom/squareup/wire/Message$Builder;->addUnknownField(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)Lcom/squareup/wire/Message$Builder;

    .line 136
    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_6
    invoke-virtual {p1, v0, v1}, Lcom/squareup/wire/ProtoReader;->endMessage(J)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->build()Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    return-object p0
.end method

.method public bridge synthetic decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 148
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ProtoAdapter_ShapeEntity;->decode(Lcom/squareup/wire/ProtoReader;)Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    move-result-object p0

    return-object p0
.end method

.method public encode(Lcom/squareup/wire/ProtoWriter;Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p2, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p2, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 16
    .line 17
    const/16 v1, 0xa

    .line 18
    .line 19
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p0, p2, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    sget-object v0, Lcom/tantan/library/svga/compose/proto/Transform;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 27
    .line 28
    const/16 v1, 0xb

    .line 29
    .line 30
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p2, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object p0, p2, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 48
    .line 49
    const/4 v1, 0x3

    .line 50
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p2, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 58
    .line 59
    const/4 v1, 0x4

    .line 60
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_5
    invoke-virtual {p2}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Lcom/squareup/wire/ProtoWriter;->writeBytes(Lokio/ByteString;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public bridge synthetic encode(Lcom/squareup/wire/ProtoWriter;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    check-cast p2, Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ProtoAdapter_ShapeEntity;->encode(Lcom/squareup/wire/ProtoWriter;Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V

    return-void
.end method

.method public encodedSize(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    sget-object v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {v1, v2, p0}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move p0, v0

    .line 15
    :goto_0
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    sget-object v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 20
    .line 21
    const/16 v3, 0xa

    .line 22
    .line 23
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v1, v0

    .line 29
    :goto_1
    add-int/2addr p0, v1

    .line 30
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    sget-object v2, Lcom/tantan/library/svga/compose/proto/Transform;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 35
    .line 36
    const/16 v3, 0xb

    .line 37
    .line 38
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v0

    .line 44
    :goto_2
    add-int/2addr p0, v1

    .line 45
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    sget-object v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 50
    .line 51
    const/4 v3, 0x2

    .line 52
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v0

    .line 58
    :goto_3
    add-int/2addr p0, v1

    .line 59
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 60
    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    sget-object v2, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 64
    .line 65
    const/4 v3, 0x3

    .line 66
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_4

    .line 71
    :cond_4
    move v1, v0

    .line 72
    :goto_4
    add-int/2addr p0, v1

    .line 73
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 78
    .line 79
    const/4 v2, 0x4

    .line 80
    invoke-virtual {v0, v2, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    :cond_5
    add-int/2addr p0, v0

    .line 85
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    add-int/2addr p0, p1

    .line 94
    return p0
.end method

.method public bridge synthetic encodedSize(Ljava/lang/Object;)I
    .locals 0

    .line 95
    check-cast p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ProtoAdapter_ShapeEntity;->encodedSize(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)I

    move-result p0

    return p0
.end method

.method public redact(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)Lcom/tantan/library/svga/compose/proto/ShapeEntity;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->newBuilder()Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/tantan/library/svga/compose/proto/Transform;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/tantan/library/svga/compose/proto/Transform;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 46
    .line 47
    :cond_2
    iget-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 48
    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 60
    .line 61
    :cond_3
    iget-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 74
    .line 75
    :cond_4
    invoke-virtual {p0}, Lcom/squareup/wire/Message$Builder;->clearUnknownFields()Lcom/squareup/wire/Message$Builder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->build()Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public bridge synthetic redact(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 83
    check-cast p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ProtoAdapter_ShapeEntity;->redact(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    move-result-object p0

    return-object p0
.end method
