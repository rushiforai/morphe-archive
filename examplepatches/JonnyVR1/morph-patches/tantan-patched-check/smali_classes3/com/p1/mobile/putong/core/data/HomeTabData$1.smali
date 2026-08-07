.class Lcom/p1/mobile/putong/core/data/HomeTabData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HomeTabData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HomeTabData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeTabData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->type:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->showUsers:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    const/4 v0, 0x4

    .line 43
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->userCount:I

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 63
    .line 64
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeTabData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeTabData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeTabData;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HomeTabData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HomeTabData;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    if-eqz v2, :cond_8

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_7

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_6

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_5

    .line 27
    .line 28
    const/16 v4, 0x20

    .line 29
    .line 30
    if-eq v2, v4, :cond_4

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_3

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->type:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->type:Ljava/lang/String;

    .line 75
    .line 76
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->showUsers:Ljava/util/List;

    .line 77
    .line 78
    if-nez p1, :cond_c

    .line 79
    .line 80
    new-instance p1, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->showUsers:Ljava/util/List;

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 95
    .line 96
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    iput v2, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->userCount:I

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Ljava/util/List;

    .line 117
    .line 118
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->showUsers:Ljava/util/List;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->type:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 139
    .line 140
    if-nez p1, :cond_9

    .line 141
    .line 142
    if-eqz v1, :cond_9

    .line 143
    .line 144
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 157
    .line 158
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 159
    .line 160
    if-nez p1, :cond_a

    .line 161
    .line 162
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 169
    .line 170
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 171
    .line 172
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->type:Ljava/lang/String;

    .line 173
    .line 174
    if-nez p1, :cond_b

    .line 175
    .line 176
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->type:Ljava/lang/String;

    .line 177
    .line 178
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->showUsers:Ljava/util/List;

    .line 179
    .line 180
    if-nez p1, :cond_c

    .line 181
    .line 182
    new-instance p1, Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .line 186
    .line 187
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabData;->showUsers:Ljava/util/List;

    .line 188
    .line 189
    :cond_c
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeTabData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeTabData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HomeTabData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->type:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->showUsers:Ljava/util/List;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x3

    .line 32
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    const/4 p0, 0x4

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->userCount:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabData;->id:Lcom/p1/mobile/putong/core/data/HomeTabModuleId;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    const/4 p1, 0x5

    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleId;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HomeTabData$1;->serialize(Lcom/p1/mobile/putong/core/data/HomeTabData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
