.class Lcom/p1/mobile/putong/data/OMSResourceInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSResourceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSResourceInfo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSResourceInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->index:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->url:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->src:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->content:Ljava/util/List;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/4 v2, 0x5

    .line 57
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->colors:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v2, 0x6

    .line 73
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 79
    .line 80
    if-eqz v0, :cond_6

    .line 81
    .line 82
    const/4 v1, 0x7

    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 93
    .line 94
    if-eqz v0, :cond_7

    .line 95
    .line 96
    const/16 v1, 0x8

    .line 97
    .line 98
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    add-int/2addr p0, v0

    .line 105
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 106
    .line 107
    if-eqz v0, :cond_8

    .line 108
    .line 109
    const/16 v1, 0x9

    .line 110
    .line 111
    sget-object v2, Lcom/p1/mobile/putong/data/OMSResourceType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 112
    .line 113
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    add-int/2addr p0, v0

    .line 118
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 119
    .line 120
    if-eqz v0, :cond_9

    .line 121
    .line 122
    const/16 v1, 0xa

    .line 123
    .line 124
    sget-object v2, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 125
    .line 126
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 132
    .line 133
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 134
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSResourceInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSResourceInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSResourceInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSResourceInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const-string v4, ""

    .line 14
    .line 15
    sparse-switch v3, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/data/OMSResourceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->index:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->index:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/data/OMSResourceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 75
    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->url:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->url:Ljava/lang/String;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->src:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_5

    .line 87
    .line 88
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->src:Ljava/lang/String;

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->content:Ljava/util/List;

    .line 91
    .line 92
    if-nez p1, :cond_6

    .line 93
    .line 94
    new-instance p1, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->content:Ljava/util/List;

    .line 100
    .line 101
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->colors:Ljava/util/List;

    .line 102
    .line 103
    if-nez p1, :cond_7

    .line 104
    .line 105
    new-instance p1, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->colors:Ljava/util/List;

    .line 111
    .line 112
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 113
    .line 114
    if-nez p1, :cond_8

    .line 115
    .line 116
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 123
    .line 124
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 125
    .line 126
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 127
    .line 128
    if-nez p1, :cond_12

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 135
    .line 136
    return-object p0

    .line 137
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 144
    .line 145
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/data/OMSResourceType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_2
    sget-object v3, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 162
    .line 163
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    check-cast v3, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 168
    .line 169
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_4
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 184
    .line 185
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Ljava/util/List;

    .line 194
    .line 195
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->colors:Ljava/util/List;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_5
    sget-object v3, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    .line 201
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    check-cast v3, Ljava/util/List;

    .line 210
    .line 211
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->content:Ljava/util/List;

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->src:Ljava/lang/String;

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->url:Ljava/lang/String;

    .line 228
    .line 229
    goto/16 :goto_0

    .line 230
    .line 231
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->index:Ljava/lang/String;

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 250
    .line 251
    if-nez p1, :cond_9

    .line 252
    .line 253
    if-eqz v1, :cond_9

    .line 254
    .line 255
    sget-object p1, Lcom/p1/mobile/putong/data/OMSResourceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 256
    .line 257
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 266
    .line 267
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 268
    .line 269
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 270
    .line 271
    if-nez p1, :cond_a

    .line 272
    .line 273
    if-eqz v2, :cond_a

    .line 274
    .line 275
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 276
    .line 277
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 286
    .line 287
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 288
    .line 289
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->index:Ljava/lang/String;

    .line 290
    .line 291
    if-nez p1, :cond_b

    .line 292
    .line 293
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->index:Ljava/lang/String;

    .line 294
    .line 295
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 296
    .line 297
    if-nez p1, :cond_c

    .line 298
    .line 299
    sget-object p1, Lcom/p1/mobile/putong/data/OMSResourceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 300
    .line 301
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 306
    .line 307
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 308
    .line 309
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->url:Ljava/lang/String;

    .line 310
    .line 311
    if-nez p1, :cond_d

    .line 312
    .line 313
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->url:Ljava/lang/String;

    .line 314
    .line 315
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->src:Ljava/lang/String;

    .line 316
    .line 317
    if-nez p1, :cond_e

    .line 318
    .line 319
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->src:Ljava/lang/String;

    .line 320
    .line 321
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->content:Ljava/util/List;

    .line 322
    .line 323
    if-nez p1, :cond_f

    .line 324
    .line 325
    new-instance p1, Ljava/util/ArrayList;

    .line 326
    .line 327
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 328
    .line 329
    .line 330
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->content:Ljava/util/List;

    .line 331
    .line 332
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->colors:Ljava/util/List;

    .line 333
    .line 334
    if-nez p1, :cond_10

    .line 335
    .line 336
    new-instance p1, Ljava/util/ArrayList;

    .line 337
    .line 338
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 339
    .line 340
    .line 341
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->colors:Ljava/util/List;

    .line 342
    .line 343
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 344
    .line 345
    if-nez p1, :cond_11

    .line 346
    .line 347
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 348
    .line 349
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 354
    .line 355
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 356
    .line 357
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 358
    .line 359
    if-nez p1, :cond_12

    .line 360
    .line 361
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 366
    .line 367
    :cond_12
    return-object p0

    .line 368
    nop

    .line 369
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x10 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x2a -> :sswitch_5
        0x32 -> :sswitch_4
        0x38 -> :sswitch_3
        0x42 -> :sswitch_2
        0x4a -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 369
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSResourceInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSResourceInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSResourceInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->index:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->url:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->src:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->content:Ljava/util/List;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x5

    .line 48
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->colors:Ljava/util/List;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v1, 0x6

    .line 62
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 66
    .line 67
    if-eqz p0, :cond_6

    .line 68
    .line 69
    const/4 v0, 0x7

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 75
    .line 76
    .line 77
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 78
    .line 79
    if-eqz p0, :cond_7

    .line 80
    .line 81
    const/16 v0, 0x8

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 86
    .line 87
    .line 88
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->type:Lcom/p1/mobile/putong/data/OMSResourceType;

    .line 89
    .line 90
    if-eqz p0, :cond_8

    .line 91
    .line 92
    const/16 v0, 0x9

    .line 93
    .line 94
    sget-object v1, Lcom/p1/mobile/putong/data/OMSResourceType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 100
    .line 101
    if-eqz p0, :cond_9

    .line 102
    .line 103
    const/16 p1, 0xa

    .line 104
    .line 105
    sget-object v0, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 108
    .line 109
    .line 110
    :cond_9
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSResourceInfo$1;->serialize(Lcom/p1/mobile/putong/data/OMSResourceInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
