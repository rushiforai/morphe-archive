.class Lcom/p1/mobile/putong/data/CommonAssetsSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/CommonAssetsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/CommonAssetsSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/CommonAssetsSettings;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/RecommendPrefetch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/AwakeApp;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const/4 v2, 0x4

    .line 53
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    const/4 v0, 0x5

    .line 59
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    const/4 v1, 0x6

    .line 71
    sget-object v2, Lcom/p1/mobile/putong/data/TtpointDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_4
    const/4 v0, 0x7

    .line 79
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    const/16 v0, 0x8

    .line 87
    .line 88
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 89
    .line 90
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 96
    .line 97
    if-eqz v0, :cond_5

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/data/LetterContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const/16 v2, 0x9

    .line 106
    .line 107
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_5
    const/16 v0, 0xa

    .line 113
    .line 114
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 115
    .line 116
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 122
    .line 123
    if-eqz v0, :cond_6

    .line 124
    .line 125
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const/16 v2, 0xb

    .line 132
    .line 133
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 139
    .line 140
    if-eqz v0, :cond_7

    .line 141
    .line 142
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    const/16 v2, 0xc

    .line 149
    .line 150
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    add-int/2addr p0, v0

    .line 155
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 156
    .line 157
    if-eqz v0, :cond_8

    .line 158
    .line 159
    sget-object v1, Lcom/p1/mobile/putong/data/EmojiType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    const/16 v2, 0xd

    .line 166
    .line 167
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    add-int/2addr p0, v0

    .line 172
    :cond_8
    const/16 v0, 0xe

    .line 173
    .line 174
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 175
    .line 176
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    add-int/2addr p0, v0

    .line 181
    const/16 v0, 0xf

    .line 182
    .line 183
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 184
    .line 185
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    add-int/2addr p0, v0

    .line 190
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 191
    .line 192
    if-eqz v0, :cond_9

    .line 193
    .line 194
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    .line 196
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    const/16 v2, 0x10

    .line 201
    .line 202
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    add-int/2addr p0, v0

    .line 207
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 208
    .line 209
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 210
    check-cast p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/CommonAssetsSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/CommonAssetsSettings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->new_()Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendPrefetch;->new_()Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    new-instance p1, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 43
    .line 44
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 45
    .line 46
    if-nez p1, :cond_3

    .line 47
    .line 48
    new-instance p1, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 56
    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/data/TtpointDialog;->new_()Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 64
    .line 65
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 66
    .line 67
    if-nez p1, :cond_5

    .line 68
    .line 69
    new-instance p1, Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 75
    .line 76
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 86
    .line 87
    return-object p0

    .line 88
    :sswitch_0
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ljava/util/List;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/EmojiType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Ljava/util/List;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :sswitch_4
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Ljava/util/List;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ljava/util/List;

    .line 159
    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/LetterContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Ljava/util/List;

    .line 183
    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/TtpointDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 205
    .line 206
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 211
    .line 212
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 225
    .line 226
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    check-cast v0, Ljava/util/List;

    .line 235
    .line 236
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/AwakeApp;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 241
    .line 242
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Ljava/util/List;

    .line 251
    .line 252
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/data/RecommendPrefetch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 257
    .line 258
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    check-cast v0, Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 263
    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 269
    .line 270
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    check-cast v0, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 275
    .line 276
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 277
    .line 278
    goto/16 :goto_0

    .line 279
    .line 280
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 281
    .line 282
    if-nez p1, :cond_6

    .line 283
    .line 284
    invoke-static {}, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->new_()Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 289
    .line 290
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 291
    .line 292
    if-nez p1, :cond_7

    .line 293
    .line 294
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendPrefetch;->new_()Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 299
    .line 300
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 301
    .line 302
    if-nez p1, :cond_8

    .line 303
    .line 304
    new-instance p1, Ljava/util/ArrayList;

    .line 305
    .line 306
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .line 308
    .line 309
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 310
    .line 311
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 312
    .line 313
    if-nez p1, :cond_9

    .line 314
    .line 315
    new-instance p1, Ljava/util/ArrayList;

    .line 316
    .line 317
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 318
    .line 319
    .line 320
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 321
    .line 322
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 323
    .line 324
    if-nez p1, :cond_a

    .line 325
    .line 326
    invoke-static {}, Lcom/p1/mobile/putong/data/TtpointDialog;->new_()Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 331
    .line 332
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 333
    .line 334
    if-nez p1, :cond_b

    .line 335
    .line 336
    new-instance p1, Ljava/util/ArrayList;

    .line 337
    .line 338
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 339
    .line 340
    .line 341
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 342
    .line 343
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 344
    .line 345
    if-nez p1, :cond_c

    .line 346
    .line 347
    new-instance p1, Ljava/util/ArrayList;

    .line 348
    .line 349
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 350
    .line 351
    .line 352
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 353
    .line 354
    :cond_c
    return-object p0

    .line 355
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0xa -> :sswitch_f
        0x12 -> :sswitch_e
        0x1a -> :sswitch_d
        0x22 -> :sswitch_c
        0x28 -> :sswitch_b
        0x32 -> :sswitch_a
        0x38 -> :sswitch_9
        0x40 -> :sswitch_8
        0x4a -> :sswitch_7
        0x50 -> :sswitch_6
        0x5a -> :sswitch_5
        0x62 -> :sswitch_4
        0x6a -> :sswitch_3
        0x70 -> :sswitch_2
        0x78 -> :sswitch_1
        0x82 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 355
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/RecommendPrefetch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/data/AwakeApp;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x4

    .line 46
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    const/4 p0, 0x5

    .line 50
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 56
    .line 57
    if-eqz p0, :cond_4

    .line 58
    .line 59
    const/4 v0, 0x6

    .line 60
    sget-object v1, Lcom/p1/mobile/putong/data/TtpointDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_4
    const/4 p0, 0x7

    .line 66
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 69
    .line 70
    .line 71
    const/16 p0, 0x8

    .line 72
    .line 73
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 79
    .line 80
    if-eqz p0, :cond_5

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/data/LetterContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const/16 v1, 0x9

    .line 89
    .line 90
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    const/16 p0, 0xa

    .line 94
    .line 95
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 96
    .line 97
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 101
    .line 102
    if-eqz p0, :cond_6

    .line 103
    .line 104
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const/16 v1, 0xb

    .line 111
    .line 112
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 113
    .line 114
    .line 115
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 116
    .line 117
    if-eqz p0, :cond_7

    .line 118
    .line 119
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const/16 v1, 0xc

    .line 126
    .line 127
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 131
    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    sget-object v0, Lcom/p1/mobile/putong/data/EmojiType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const/16 v1, 0xd

    .line 141
    .line 142
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 143
    .line 144
    .line 145
    :cond_8
    const/16 p0, 0xe

    .line 146
    .line 147
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 148
    .line 149
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 150
    .line 151
    .line 152
    const/16 p0, 0xf

    .line 153
    .line 154
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 155
    .line 156
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 160
    .line 161
    if-eqz p0, :cond_9

    .line 162
    .line 163
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    const/16 v0, 0x10

    .line 170
    .line 171
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 172
    .line 173
    .line 174
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

    .line 175
    check-cast p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$1;->serialize(Lcom/p1/mobile/putong/data/CommonAssetsSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
