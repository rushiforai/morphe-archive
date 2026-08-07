.class Lcom/p1/mobile/putong/data/TriggerProperty$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/TriggerProperty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/TriggerProperty;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/TriggerProperty;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/data/OMSSwipeAction;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const/4 v1, 0x3

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/OMSSwipeAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/4 v2, 0x4

    .line 57
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x5

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/data/OMSSwipeMoment;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 75
    .line 76
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/TriggerProperty;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/TriggerProperty$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/TriggerProperty;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/TriggerProperty;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/TriggerProperty;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/TriggerProperty;-><init>()V

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
    if-eqz v3, :cond_9

    .line 16
    .line 17
    const/16 v5, 0xa

    .line 18
    .line 19
    if-eq v3, v5, :cond_8

    .line 20
    .line 21
    const/16 v5, 0x10

    .line 22
    .line 23
    if-eq v3, v5, :cond_7

    .line 24
    .line 25
    const/16 v5, 0x1a

    .line 26
    .line 27
    if-eq v3, v5, :cond_6

    .line 28
    .line 29
    const/16 v5, 0x22

    .line 30
    .line 31
    if-eq v3, v5, :cond_5

    .line 32
    .line 33
    const/16 v5, 0x2a

    .line 34
    .line 35
    if-eq v3, v5, :cond_4

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 38
    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-static {v1}, Lcom/p1/mobile/putong/data/OMSSwipeAction;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 48
    .line 49
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 50
    .line 51
    if-nez p1, :cond_1

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 68
    .line 69
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 70
    .line 71
    if-nez p1, :cond_2

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 79
    .line 80
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 81
    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 93
    .line 94
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 95
    .line 96
    if-nez p1, :cond_e

    .line 97
    .line 98
    iput-object v4, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/data/OMSSwipeMoment;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 108
    .line 109
    iput-object v3, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_5
    sget-object v3, Lcom/p1/mobile/putong/data/OMSSwipeAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Ljava/util/List;

    .line 123
    .line 124
    iput-object v3, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    iput-object v3, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {p1, v1}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    check-cast v1, Ljava/util/List;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 159
    .line 160
    if-nez p1, :cond_a

    .line 161
    .line 162
    if-eqz v1, :cond_a

    .line 163
    .line 164
    invoke-static {v1}, Lcom/p1/mobile/putong/data/OMSSwipeAction;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 169
    .line 170
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 171
    .line 172
    if-nez p1, :cond_b

    .line 173
    .line 174
    if-eqz v2, :cond_b

    .line 175
    .line 176
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    check-cast p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 187
    .line 188
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 189
    .line 190
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 191
    .line 192
    if-nez p1, :cond_c

    .line 193
    .line 194
    new-instance p1, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .line 198
    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 200
    .line 201
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 202
    .line 203
    if-nez p1, :cond_d

    .line 204
    .line 205
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    check-cast p1, Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 212
    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 214
    .line 215
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 216
    .line 217
    if-nez p1, :cond_e

    .line 218
    .line 219
    iput-object v4, p0, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 220
    .line 221
    :cond_e
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 222
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/TriggerProperty$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/TriggerProperty;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/TriggerProperty;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/data/OMSSwipeAction;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x3

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->action:Ljava/util/List;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/data/OMSSwipeAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x4

    .line 50
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/TriggerProperty;->moment:Lcom/p1/mobile/putong/data/OMSSwipeMoment;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const/4 p1, 0x5

    .line 58
    sget-object v0, Lcom/p1/mobile/putong/data/OMSSwipeMoment;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/TriggerProperty;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/TriggerProperty$1;->serialize(Lcom/p1/mobile/putong/data/TriggerProperty;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
