.class Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 48
    .line 49
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_4
    const/4 v0, 0x6

    .line 55
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->swipeLimit:I

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/4 v0, 0x7

    .line 63
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    const/16 v0, 0x8

    .line 71
    .line 72
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->intervalHours:I

    .line 73
    .line 74
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 80
    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const/16 v2, 0x9

    .line 90
    .line 91
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 97
    .line 98
    if-eqz v0, :cond_6

    .line 99
    .line 100
    const/16 v1, 0xa

    .line 101
    .line 102
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    const/16 v1, 0xb

    .line 114
    .line 115
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    add-int/2addr p0, v0

    .line 120
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz v0, :cond_8

    .line 123
    .line 124
    const/16 v1, 0xc

    .line 125
    .line 126
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz v0, :cond_9

    .line 134
    .line 135
    const/16 v1, 0xd

    .line 136
    .line 137
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 143
    .line 144
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, ""

    .line 11
    .line 12
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 52
    .line 53
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 54
    .line 55
    if-nez p1, :cond_5

    .line 56
    .line 57
    new-instance p1, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 63
    .line 64
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_6

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 69
    .line 70
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_7

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 75
    .line 76
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_10

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 81
    .line 82
    return-object p0

    .line 83
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Ljava/util/List;

    .line 126
    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->intervalHours:I

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->swipeLimit:I

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->id:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->id:Ljava/lang/String;

    .line 199
    .line 200
    if-nez p1, :cond_8

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->id:Ljava/lang/String;

    .line 203
    .line 204
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 205
    .line 206
    if-nez p1, :cond_9

    .line 207
    .line 208
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 209
    .line 210
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 211
    .line 212
    if-nez p1, :cond_a

    .line 213
    .line 214
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 215
    .line 216
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 217
    .line 218
    if-nez p1, :cond_b

    .line 219
    .line 220
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 221
    .line 222
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 223
    .line 224
    if-nez p1, :cond_c

    .line 225
    .line 226
    sget-object p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 227
    .line 228
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 233
    .line 234
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 235
    .line 236
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 237
    .line 238
    if-nez p1, :cond_d

    .line 239
    .line 240
    new-instance p1, Ljava/util/ArrayList;

    .line 241
    .line 242
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 243
    .line 244
    .line 245
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 246
    .line 247
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p1, :cond_e

    .line 250
    .line 251
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 252
    .line 253
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p1, :cond_f

    .line 256
    .line 257
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 258
    .line 259
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_10

    .line 262
    .line 263
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 264
    .line 265
    :cond_10
    return-object p0

    .line 266
    nop

    .line 267
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x30 -> :sswitch_7
        0x38 -> :sswitch_6
        0x40 -> :sswitch_5
        0x4a -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
        0x6a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    const/4 p0, 0x6

    .line 44
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->swipeLimit:I

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x7

    .line 50
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 53
    .line 54
    .line 55
    const/16 p0, 0x8

    .line 56
    .line 57
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->intervalHours:I

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 63
    .line 64
    if-eqz p0, :cond_5

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/16 v1, 0x9

    .line 73
    .line 74
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 78
    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    const/16 v0, 0xa

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 86
    .line 87
    .line 88
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz p0, :cond_7

    .line 91
    .line 92
    const/16 v0, 0xb

    .line 93
    .line 94
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz p0, :cond_8

    .line 100
    .line 101
    const/16 v0, 0xc

    .line 102
    .line 103
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz p0, :cond_9

    .line 109
    .line 110
    const/16 p1, 0xd

    .line 111
    .line 112
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 113
    .line 114
    .line 115
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

    .line 116
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow$1;->serialize(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
