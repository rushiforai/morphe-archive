.class final Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;
.super Lcom/squareup/wire/ProtoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProtoAdapter_ShapeStyle"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/ProtoAdapter<",
        "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;",
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
    const-class v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/squareup/wire/ProtoAdapter;-><init>(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public decode(Lcom/squareup/wire/ProtoReader;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;-><init>()V

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
    if-eq v2, v3, :cond_0

    .line 16
    .line 17
    packed-switch v2, :pswitch_data_0

    .line 18
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
    :pswitch_0
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 37
    .line 38
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ljava/lang/Float;

    .line 43
    .line 44
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashIII(Ljava/lang/Float;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :pswitch_1
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 49
    .line 50
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ljava/lang/Float;

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashII(Ljava/lang/Float;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :pswitch_2
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 61
    .line 62
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Ljava/lang/Float;

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashI(Ljava/lang/Float;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :pswitch_3
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 73
    .line 74
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Ljava/lang/Float;

    .line 79
    .line 80
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->miterLimit(Ljava/lang/Float;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :pswitch_4
    :try_start_0
    sget-object v3, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 85
    .line 86
    invoke-virtual {v3, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 91
    .line 92
    invoke-virtual {p0, v3}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineJoin(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    :try_end_0
    .catch Lcom/squareup/wire/ProtoAdapter$EnumConstantNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :catch_0
    move-exception v3

    .line 97
    sget-object v4, Lcom/squareup/wire/FieldEncoding;->VARINT:Lcom/squareup/wire/FieldEncoding;

    .line 98
    .line 99
    iget v3, v3, Lcom/squareup/wire/ProtoAdapter$EnumConstantNotFoundException;->value:I

    .line 100
    .line 101
    int-to-long v5, v3

    .line 102
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {p0, v2, v4, v3}, Lcom/squareup/wire/Message$Builder;->addUnknownField(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)Lcom/squareup/wire/Message$Builder;

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :pswitch_5
    :try_start_1
    sget-object v3, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 111
    .line 112
    invoke-virtual {v3, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 117
    .line 118
    invoke-virtual {p0, v3}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineCap(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    :try_end_1
    .catch Lcom/squareup/wire/ProtoAdapter$EnumConstantNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :catch_1
    move-exception v3

    .line 123
    sget-object v4, Lcom/squareup/wire/FieldEncoding;->VARINT:Lcom/squareup/wire/FieldEncoding;

    .line 124
    .line 125
    iget v3, v3, Lcom/squareup/wire/ProtoAdapter$EnumConstantNotFoundException;->value:I

    .line 126
    .line 127
    int-to-long v5, v3

    .line 128
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {p0, v2, v4, v3}, Lcom/squareup/wire/Message$Builder;->addUnknownField(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)Lcom/squareup/wire/Message$Builder;

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :pswitch_6
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 137
    .line 138
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Ljava/lang/Float;

    .line 143
    .line 144
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->strokeWidth(Ljava/lang/Float;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 145
    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :pswitch_7
    sget-object v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 150
    .line 151
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 156
    .line 157
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->stroke(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 158
    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :pswitch_8
    sget-object v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 163
    .line 164
    invoke-virtual {v2, p1}, Lcom/squareup/wire/ProtoAdapter;->decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    check-cast v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 169
    .line 170
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->fill(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 171
    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_0
    invoke-virtual {p1, v0, v1}, Lcom/squareup/wire/ProtoReader;->endMessage(J)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    return-object p0

    .line 183
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
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

.method public bridge synthetic decode(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;->decode(Lcom/squareup/wire/ProtoReader;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    move-result-object p0

    return-object p0
.end method

.method public encode(Lcom/squareup/wire/ProtoWriter;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 26
    .line 27
    const/4 v1, 0x3

    .line 28
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 36
    .line 37
    const/4 v1, 0x4

    .line 38
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 46
    .line 47
    const/4 v1, 0x5

    .line 48
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 56
    .line 57
    const/4 v1, 0x6

    .line 58
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 66
    .line 67
    const/4 v1, 0x7

    .line 68
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 76
    .line 77
    const/16 v1, 0x8

    .line 78
    .line 79
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :cond_7
    iget-object p0, p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 83
    .line 84
    if-eqz p0, :cond_8

    .line 85
    .line 86
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 87
    .line 88
    const/16 v1, 0x9

    .line 89
    .line 90
    invoke-virtual {v0, p1, v1, p0}, Lcom/squareup/wire/ProtoAdapter;->encodeWithTag(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    invoke-virtual {p2}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p1, p0}, Lcom/squareup/wire/ProtoWriter;->writeBytes(Lokio/ByteString;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public bridge synthetic encode(Lcom/squareup/wire/ProtoWriter;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    check-cast p2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;->encode(Lcom/squareup/wire/ProtoWriter;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;)V

    return-void
.end method

.method public encodedSize(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

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
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    sget-object v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v1, v0

    .line 28
    :goto_1
    add-int/2addr p0, v1

    .line 29
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    move v1, v0

    .line 42
    :goto_2
    add-int/2addr p0, v1

    .line 43
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 44
    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    sget-object v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 48
    .line 49
    const/4 v3, 0x4

    .line 50
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    goto :goto_3

    .line 55
    :cond_3
    move v1, v0

    .line 56
    :goto_3
    add-int/2addr p0, v1

    .line 57
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 58
    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    sget-object v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 62
    .line 63
    const/4 v3, 0x5

    .line 64
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v0

    .line 70
    :goto_4
    add-int/2addr p0, v1

    .line 71
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 76
    .line 77
    const/4 v3, 0x6

    .line 78
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    goto :goto_5

    .line 83
    :cond_5
    move v1, v0

    .line 84
    :goto_5
    add-int/2addr p0, v1

    .line 85
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 86
    .line 87
    if-eqz v1, :cond_6

    .line 88
    .line 89
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 90
    .line 91
    const/4 v3, 0x7

    .line 92
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    goto :goto_6

    .line 97
    :cond_6
    move v1, v0

    .line 98
    :goto_6
    add-int/2addr p0, v1

    .line 99
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    sget-object v2, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 104
    .line 105
    const/16 v3, 0x8

    .line 106
    .line 107
    invoke-virtual {v2, v3, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_7

    .line 112
    :cond_7
    move v1, v0

    .line 113
    :goto_7
    add-int/2addr p0, v1

    .line 114
    iget-object v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 115
    .line 116
    if-eqz v1, :cond_8

    .line 117
    .line 118
    sget-object v0, Lcom/squareup/wire/ProtoAdapter;->FLOAT:Lcom/squareup/wire/ProtoAdapter;

    .line 119
    .line 120
    const/16 v2, 0x9

    .line 121
    .line 122
    invoke-virtual {v0, v2, v1}, Lcom/squareup/wire/ProtoAdapter;->encodedSizeWithTag(ILjava/lang/Object;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    :cond_8
    add-int/2addr p0, v0

    .line 127
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    add-int/2addr p0, p1

    .line 136
    return p0
.end method

.method public bridge synthetic encodedSize(Ljava/lang/Object;)I
    .locals 0

    .line 137
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;->encodedSize(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;)I

    move-result p0

    return p0
.end method

.method public redact(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->newBuilder()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/squareup/wire/ProtoAdapter;->redact(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/squareup/wire/Message$Builder;->clearUnknownFields()Lcom/squareup/wire/Message$Builder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

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
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;->redact(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    move-result-object p0

    return-object p0
.end method
