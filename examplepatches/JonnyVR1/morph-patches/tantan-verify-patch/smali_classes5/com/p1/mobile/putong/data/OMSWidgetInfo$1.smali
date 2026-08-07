.class Lcom/p1/mobile/putong/data/OMSWidgetInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSWidgetInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSWidgetInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSWidgetInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

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
    const/4 v0, 0x3

    .line 27
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x7

    .line 77
    sget-object v2, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v0, :cond_6

    .line 87
    .line 88
    sget-object v1, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const/16 v2, 0x8

    .line 95
    .line 96
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_7

    .line 104
    .line 105
    const/16 v1, 0x9

    .line 106
    .line 107
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 113
    .line 114
    if-eqz v0, :cond_8

    .line 115
    .line 116
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    const/16 v2, 0xa

    .line 123
    .line 124
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    add-int/2addr p0, v0

    .line 129
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 130
    .line 131
    if-eqz v0, :cond_9

    .line 132
    .line 133
    const/16 v1, 0xb

    .line 134
    .line 135
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWidgeArea;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 136
    .line 137
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 143
    .line 144
    if-eqz v0, :cond_a

    .line 145
    .line 146
    const/16 v1, 0xc

    .line 147
    .line 148
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWidgeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 149
    .line 150
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    add-int/2addr p0, v0

    .line 155
    :cond_a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 156
    .line 157
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 158
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSWidgetInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSWidgetInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSWidgetInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 75
    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 89
    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 91
    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 93
    .line 94
    if-nez p1, :cond_5

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->new_()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 101
    .line 102
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 103
    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->new_()Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 111
    .line 112
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 113
    .line 114
    if-nez p1, :cond_7

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->new_()Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 121
    .line 122
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 123
    .line 124
    if-nez p1, :cond_8

    .line 125
    .line 126
    new-instance p1, Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 132
    .line 133
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 134
    .line 135
    if-nez p1, :cond_9

    .line 136
    .line 137
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 138
    .line 139
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 140
    .line 141
    if-nez p1, :cond_14

    .line 142
    .line 143
    new-instance p1, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 149
    .line 150
    return-object p0

    .line 151
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/data/OMSWidgeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 152
    .line 153
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    check-cast v3, Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 158
    .line 159
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/data/OMSWidgeArea;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 170
    .line 171
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :sswitch_2
    sget-object v3, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    check-cast v3, Ljava/util/List;

    .line 186
    .line 187
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_4
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
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :sswitch_5
    sget-object v3, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    check-cast v3, Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 222
    .line 223
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :sswitch_6
    sget-object v3, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    .line 229
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    check-cast v3, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 234
    .line 235
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_7
    sget-object v3, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 240
    .line 241
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    check-cast v3, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 246
    .line 247
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    iput v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 284
    .line 285
    goto/16 :goto_0

    .line 286
    .line 287
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 288
    .line 289
    if-nez p1, :cond_a

    .line 290
    .line 291
    if-eqz v1, :cond_a

    .line 292
    .line 293
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 294
    .line 295
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 304
    .line 305
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 306
    .line 307
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 308
    .line 309
    if-nez p1, :cond_b

    .line 310
    .line 311
    if-eqz v2, :cond_b

    .line 312
    .line 313
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 314
    .line 315
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 324
    .line 325
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 326
    .line 327
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 328
    .line 329
    if-nez p1, :cond_c

    .line 330
    .line 331
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 332
    .line 333
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 334
    .line 335
    if-nez p1, :cond_d

    .line 336
    .line 337
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 338
    .line 339
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 344
    .line 345
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 346
    .line 347
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 348
    .line 349
    if-nez p1, :cond_e

    .line 350
    .line 351
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 352
    .line 353
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 358
    .line 359
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 360
    .line 361
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 362
    .line 363
    if-nez p1, :cond_f

    .line 364
    .line 365
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->new_()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 370
    .line 371
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 372
    .line 373
    if-nez p1, :cond_10

    .line 374
    .line 375
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->new_()Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 376
    .line 377
    .line 378
    move-result-object p1

    .line 379
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 380
    .line 381
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 382
    .line 383
    if-nez p1, :cond_11

    .line 384
    .line 385
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->new_()Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 390
    .line 391
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 392
    .line 393
    if-nez p1, :cond_12

    .line 394
    .line 395
    new-instance p1, Ljava/util/ArrayList;

    .line 396
    .line 397
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 398
    .line 399
    .line 400
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 401
    .line 402
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 403
    .line 404
    if-nez p1, :cond_13

    .line 405
    .line 406
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 407
    .line 408
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 409
    .line 410
    if-nez p1, :cond_14

    .line 411
    .line 412
    new-instance p1, Ljava/util/ArrayList;

    .line 413
    .line 414
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 415
    .line 416
    .line 417
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 418
    .line 419
    :cond_14
    return-object p0

    .line 420
    nop

    .line 421
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x10 -> :sswitch_a
        0x18 -> :sswitch_9
        0x20 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x52 -> :sswitch_2
        0x5a -> :sswitch_1
        0x62 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 421
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSWidgetInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSWidgetInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

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
    const/4 p0, 0x3

    .line 22
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x5

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 60
    .line 61
    if-eqz p0, :cond_5

    .line 62
    .line 63
    const/4 v0, 0x7

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/16 v1, 0x8

    .line 80
    .line 81
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 82
    .line 83
    .line 84
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_7

    .line 87
    .line 88
    const/16 v0, 0x9

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 94
    .line 95
    if-eqz p0, :cond_8

    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/16 v1, 0xa

    .line 104
    .line 105
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 106
    .line 107
    .line 108
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 109
    .line 110
    if-eqz p0, :cond_9

    .line 111
    .line 112
    const/16 v0, 0xb

    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/data/OMSWidgeArea;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 117
    .line 118
    .line 119
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 120
    .line 121
    if-eqz p0, :cond_a

    .line 122
    .line 123
    const/16 p1, 0xc

    .line 124
    .line 125
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_a
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSWidgetInfo$1;->serialize(Lcom/p1/mobile/putong/data/OMSWidgetInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
