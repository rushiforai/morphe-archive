.class Lcom/p1/mobile/putong/data/OMSDialogInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSDialogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDialogInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    const/4 v0, 0x3

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    const/4 v0, 0x4

    .line 31
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const/4 v1, 0x5

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/data/OMSTriggerRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    sget-object v1, Lcom/p1/mobile/putong/data/TriggerEvent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v2, 0x7

    .line 73
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 79
    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    const/16 v1, 0x8

    .line 83
    .line 84
    sget-object v2, Lcom/p1/mobile/putong/data/OMSPositionInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_5
    const/16 v0, 0x9

    .line 92
    .line 93
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 94
    .line 95
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    const/16 v0, 0xa

    .line 101
    .line 102
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 103
    .line 104
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 110
    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    const/16 v1, 0xb

    .line 114
    .line 115
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    :cond_6
    const/16 v0, 0xc

    .line 123
    .line 124
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 125
    .line 126
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 132
    .line 133
    if-eqz v0, :cond_7

    .line 134
    .line 135
    const/16 v1, 0xd

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    add-int/2addr p0, v0

    .line 146
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 147
    .line 148
    if-eqz v0, :cond_8

    .line 149
    .line 150
    const/16 v1, 0xe

    .line 151
    .line 152
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDialogContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 153
    .line 154
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    add-int/2addr p0, v0

    .line 159
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 160
    .line 161
    if-eqz v0, :cond_9

    .line 162
    .line 163
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    const/16 v2, 0xf

    .line 170
    .line 171
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    add-int/2addr p0, v0

    .line 176
    :cond_9
    const/16 v0, 0x10

    .line 177
    .line 178
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 179
    .line 180
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    add-int/2addr p0, v0

    .line 185
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 186
    .line 187
    if-eqz v0, :cond_a

    .line 188
    .line 189
    const/16 v1, 0x11

    .line 190
    .line 191
    sget-object v2, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 192
    .line 193
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    add-int/2addr p0, v0

    .line 198
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 199
    .line 200
    if-eqz v0, :cond_b

    .line 201
    .line 202
    const/16 v1, 0x12

    .line 203
    .line 204
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDialogType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 205
    .line 206
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    add-int/2addr p0, v0

    .line 211
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 212
    .line 213
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 214
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDialogInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDialogInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDialogInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSDialogInfo;-><init>()V

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
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/OMSDialogType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 58
    .line 59
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 60
    .line 61
    if-nez p1, :cond_4

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSTriggerRule;->new_()Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 68
    .line 69
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 70
    .line 71
    if-nez p1, :cond_5

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 79
    .line 80
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 81
    .line 82
    if-nez p1, :cond_6

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSPositionInfo;->new_()Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 89
    .line 90
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 91
    .line 92
    if-nez p1, :cond_7

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 99
    .line 100
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 101
    .line 102
    if-nez p1, :cond_8

    .line 103
    .line 104
    sget-object p1, Lcom/p1/mobile/putong/data/OMSDialogType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 111
    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 113
    .line 114
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 115
    .line 116
    if-nez p1, :cond_9

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDialogContent;->new_()Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 123
    .line 124
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 125
    .line 126
    if-nez p1, :cond_a

    .line 127
    .line 128
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 131
    .line 132
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 133
    .line 134
    if-nez p1, :cond_16

    .line 135
    .line 136
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->new_()Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 141
    .line 142
    return-object p0

    .line 143
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDialogType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 144
    .line 145
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 150
    .line 151
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    check-cast v2, Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 162
    .line 163
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :sswitch_3
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    check-cast v2, Ljava/util/Map;

    .line 186
    .line 187
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDialogContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 192
    .line 193
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    check-cast v2, Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 198
    .line 199
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_7
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    check-cast v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 228
    .line 229
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :sswitch_a
    sget-object v2, Lcom/p1/mobile/putong/data/OMSPositionInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 250
    .line 251
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    check-cast v2, Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 256
    .line 257
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/data/TriggerEvent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 262
    .line 263
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    check-cast v2, Ljava/util/List;

    .line 272
    .line 273
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :sswitch_c
    sget-object v2, Lcom/p1/mobile/putong/data/OMSTriggerRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 278
    .line 279
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    check-cast v2, Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 284
    .line 285
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 286
    .line 287
    goto/16 :goto_0

    .line 288
    .line 289
    :sswitch_d
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 290
    .line 291
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    check-cast v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 296
    .line 297
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    iput v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 322
    .line 323
    goto/16 :goto_0

    .line 324
    .line 325
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :sswitch_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 334
    .line 335
    if-nez p1, :cond_b

    .line 336
    .line 337
    if-eqz v1, :cond_b

    .line 338
    .line 339
    sget-object p1, Lcom/p1/mobile/putong/data/OMSDialogType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 340
    .line 341
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 350
    .line 351
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 352
    .line 353
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 354
    .line 355
    if-nez p1, :cond_c

    .line 356
    .line 357
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 358
    .line 359
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 360
    .line 361
    if-nez p1, :cond_d

    .line 362
    .line 363
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 364
    .line 365
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 366
    .line 367
    if-nez p1, :cond_e

    .line 368
    .line 369
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 370
    .line 371
    .line 372
    move-result-object p1

    .line 373
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 374
    .line 375
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 376
    .line 377
    if-nez p1, :cond_f

    .line 378
    .line 379
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSTriggerRule;->new_()Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 384
    .line 385
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 386
    .line 387
    if-nez p1, :cond_10

    .line 388
    .line 389
    new-instance p1, Ljava/util/ArrayList;

    .line 390
    .line 391
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 392
    .line 393
    .line 394
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 395
    .line 396
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 397
    .line 398
    if-nez p1, :cond_11

    .line 399
    .line 400
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSPositionInfo;->new_()Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 405
    .line 406
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 407
    .line 408
    if-nez p1, :cond_12

    .line 409
    .line 410
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 411
    .line 412
    .line 413
    move-result-object p1

    .line 414
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 415
    .line 416
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 417
    .line 418
    if-nez p1, :cond_13

    .line 419
    .line 420
    sget-object p1, Lcom/p1/mobile/putong/data/OMSDialogType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 421
    .line 422
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 423
    .line 424
    .line 425
    move-result-object p1

    .line 426
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 427
    .line 428
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 429
    .line 430
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 431
    .line 432
    if-nez p1, :cond_14

    .line 433
    .line 434
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDialogContent;->new_()Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 435
    .line 436
    .line 437
    move-result-object p1

    .line 438
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 439
    .line 440
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 441
    .line 442
    if-nez p1, :cond_15

    .line 443
    .line 444
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 445
    .line 446
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 447
    .line 448
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 449
    .line 450
    if-nez p1, :cond_16

    .line 451
    .line 452
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->new_()Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 457
    .line 458
    :cond_16
    return-object p0

    .line 459
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_12
        0xa -> :sswitch_11
        0x12 -> :sswitch_10
        0x18 -> :sswitch_f
        0x20 -> :sswitch_e
        0x2a -> :sswitch_d
        0x32 -> :sswitch_c
        0x3a -> :sswitch_b
        0x42 -> :sswitch_a
        0x48 -> :sswitch_9
        0x50 -> :sswitch_8
        0x5a -> :sswitch_7
        0x60 -> :sswitch_6
        0x68 -> :sswitch_5
        0x72 -> :sswitch_4
        0x7a -> :sswitch_3
        0x80 -> :sswitch_2
        0x8a -> :sswitch_1
        0x92 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 459
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDialogInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSDialogInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    const/4 p0, 0x3

    .line 18
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/data/OMSTriggerRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/data/TriggerEvent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x7

    .line 60
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 64
    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    const/16 v0, 0x8

    .line 68
    .line 69
    sget-object v1, Lcom/p1/mobile/putong/data/OMSPositionInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 72
    .line 73
    .line 74
    :cond_5
    const/16 p0, 0x9

    .line 75
    .line 76
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 77
    .line 78
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 79
    .line 80
    .line 81
    const/16 p0, 0xa

    .line 82
    .line 83
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 84
    .line 85
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 89
    .line 90
    if-eqz p0, :cond_6

    .line 91
    .line 92
    const/16 v0, 0xb

    .line 93
    .line 94
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    const/16 p0, 0xc

    .line 100
    .line 101
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 102
    .line 103
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 107
    .line 108
    if-eqz p0, :cond_7

    .line 109
    .line 110
    const/16 v0, 0xd

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 117
    .line 118
    .line 119
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 120
    .line 121
    if-eqz p0, :cond_8

    .line 122
    .line 123
    const/16 v0, 0xe

    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDialogContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 131
    .line 132
    if-eqz p0, :cond_9

    .line 133
    .line 134
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const/16 v1, 0xf

    .line 141
    .line 142
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 143
    .line 144
    .line 145
    :cond_9
    const/16 p0, 0x10

    .line 146
    .line 147
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 148
    .line 149
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 153
    .line 154
    if-eqz p0, :cond_a

    .line 155
    .line 156
    const/16 v0, 0x11

    .line 157
    .line 158
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 161
    .line 162
    .line 163
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 164
    .line 165
    if-eqz p0, :cond_b

    .line 166
    .line 167
    const/16 p1, 0x12

    .line 168
    .line 169
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialogType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 172
    .line 173
    .line 174
    :cond_b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSDialogInfo$1;->serialize(Lcom/p1/mobile/putong/data/OMSDialogInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
