.class Lcom/p1/mobile/putong/feed/data/RawFeed$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/RawFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/RawFeed;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/RawFeed;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/16 v1, 0x34

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    const/16 v0, 0x35

    .line 25
    .line 26
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/2addr p0, v0

    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/16 v1, 0x36

    .line 38
    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/16 v1, 0x37

    .line 49
    .line 50
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/2addr p0, v0

    .line 55
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    const/16 v1, 0x38

    .line 60
    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    const/16 v1, 0x39

    .line 71
    .line 72
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    :cond_5
    const/16 v0, 0x3a

    .line 78
    .line 79
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v0, :cond_6

    .line 89
    .line 90
    const/16 v1, 0x3b

    .line 91
    .line 92
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 98
    .line 99
    if-eqz v0, :cond_7

    .line 100
    .line 101
    sget-object v1, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const/16 v2, 0x3c

    .line 108
    .line 109
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz v0, :cond_8

    .line 117
    .line 118
    const/16 v1, 0x3d

    .line 119
    .line 120
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr p0, v0

    .line 125
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 126
    .line 127
    if-eqz v0, :cond_9

    .line 128
    .line 129
    const/16 v1, 0x3e

    .line 130
    .line 131
    sget-object v2, Lcom/p1/mobile/putong/feed/data/InteractionReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_9
    const/16 v0, 0x3f

    .line 139
    .line 140
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 141
    .line 142
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    add-int/2addr p0, v0

    .line 147
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 148
    .line 149
    if-eqz v0, :cond_a

    .line 150
    .line 151
    const/16 v1, 0x40

    .line 152
    .line 153
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    :cond_a
    const/16 v0, 0x41

    .line 159
    .line 160
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 161
    .line 162
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    add-int/2addr p0, v0

    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v0, :cond_b

    .line 170
    .line 171
    const/16 v1, 0x42

    .line 172
    .line 173
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    add-int/2addr p0, v0

    .line 178
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v0, :cond_c

    .line 181
    .line 182
    const/16 v1, 0x43

    .line 183
    .line 184
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    add-int/2addr p0, v0

    .line 189
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz v0, :cond_d

    .line 192
    .line 193
    const/16 v1, 0x44

    .line 194
    .line 195
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    add-int/2addr p0, v0

    .line 200
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 201
    .line 202
    if-eqz v0, :cond_e

    .line 203
    .line 204
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 205
    .line 206
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    const/16 v2, 0x45

    .line 211
    .line 212
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    add-int/2addr p0, v0

    .line 217
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 218
    .line 219
    if-eqz v0, :cond_f

    .line 220
    .line 221
    const/16 v1, 0x46

    .line 222
    .line 223
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentExpose;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 224
    .line 225
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    add-int/2addr p0, v0

    .line 230
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 231
    .line 232
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 233
    check-cast p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/RawFeed$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/RawFeed;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/RawFeed;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/RawFeed;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    new-instance p1, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 67
    .line 68
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_8

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 73
    .line 74
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 75
    .line 76
    if-nez p1, :cond_9

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/InteractionReason;->new_()Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 83
    .line 84
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_a

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 89
    .line 90
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 91
    .line 92
    if-nez p1, :cond_b

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 95
    .line 96
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 97
    .line 98
    if-nez p1, :cond_c

    .line 99
    .line 100
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 101
    .line 102
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 103
    .line 104
    if-nez p1, :cond_d

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 107
    .line 108
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 109
    .line 110
    if-nez p1, :cond_e

    .line 111
    .line 112
    new-instance p1, Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 118
    .line 119
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 120
    .line 121
    if-nez p1, :cond_1e

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentExpose;->new_()Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 128
    .line 129
    return-object p0

    .line 130
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentExpose;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 137
    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_1
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    check-cast v0, Ljava/util/List;

    .line 153
    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/feed/data/InteractionReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 213
    .line 214
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 227
    .line 228
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    check-cast v0, Ljava/util/List;

    .line 237
    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    .line 255
    .line 256
    goto/16 :goto_0

    .line 257
    .line 258
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 271
    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :sswitch_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 315
    .line 316
    if-nez p1, :cond_f

    .line 317
    .line 318
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 319
    .line 320
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 321
    .line 322
    if-nez p1, :cond_10

    .line 323
    .line 324
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 325
    .line 326
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 327
    .line 328
    if-nez p1, :cond_11

    .line 329
    .line 330
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 331
    .line 332
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 333
    .line 334
    if-nez p1, :cond_12

    .line 335
    .line 336
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 337
    .line 338
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 339
    .line 340
    if-nez p1, :cond_13

    .line 341
    .line 342
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 343
    .line 344
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 345
    .line 346
    if-nez p1, :cond_14

    .line 347
    .line 348
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 349
    .line 350
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 351
    .line 352
    if-nez p1, :cond_15

    .line 353
    .line 354
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 355
    .line 356
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 357
    .line 358
    if-nez p1, :cond_16

    .line 359
    .line 360
    new-instance p1, Ljava/util/ArrayList;

    .line 361
    .line 362
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 363
    .line 364
    .line 365
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 366
    .line 367
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 368
    .line 369
    if-nez p1, :cond_17

    .line 370
    .line 371
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 372
    .line 373
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 374
    .line 375
    if-nez p1, :cond_18

    .line 376
    .line 377
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/InteractionReason;->new_()Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 382
    .line 383
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 384
    .line 385
    if-nez p1, :cond_19

    .line 386
    .line 387
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 388
    .line 389
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 390
    .line 391
    if-nez p1, :cond_1a

    .line 392
    .line 393
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 394
    .line 395
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 396
    .line 397
    if-nez p1, :cond_1b

    .line 398
    .line 399
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 400
    .line 401
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 402
    .line 403
    if-nez p1, :cond_1c

    .line 404
    .line 405
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 406
    .line 407
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 408
    .line 409
    if-nez p1, :cond_1d

    .line 410
    .line 411
    new-instance p1, Ljava/util/ArrayList;

    .line 412
    .line 413
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 414
    .line 415
    .line 416
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 417
    .line 418
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 419
    .line 420
    if-nez p1, :cond_1e

    .line 421
    .line 422
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentExpose;->new_()Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 423
    .line 424
    .line 425
    move-result-object p1

    .line 426
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 427
    .line 428
    :cond_1e
    return-object p0

    .line 429
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_14
        0x19a -> :sswitch_13
        0x1a2 -> :sswitch_12
        0x1a8 -> :sswitch_11
        0x1b2 -> :sswitch_10
        0x1ba -> :sswitch_f
        0x1c2 -> :sswitch_e
        0x1ca -> :sswitch_d
        0x1d0 -> :sswitch_c
        0x1da -> :sswitch_b
        0x1e2 -> :sswitch_a
        0x1ea -> :sswitch_9
        0x1f2 -> :sswitch_8
        0x1f8 -> :sswitch_7
        0x202 -> :sswitch_6
        0x208 -> :sswitch_5
        0x212 -> :sswitch_4
        0x21a -> :sswitch_3
        0x222 -> :sswitch_2
        0x22a -> :sswitch_1
        0x232 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 429
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/RawFeed$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/16 v0, 0x34

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const/16 p0, 0x35

    .line 20
    .line 21
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const/16 v0, 0x36

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/16 v0, 0x37

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const/16 v0, 0x38

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/16 v0, 0x39

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    const/16 p0, 0x3a

    .line 63
    .line 64
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    const/16 v0, 0x3b

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 79
    .line 80
    if-eqz p0, :cond_7

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const/16 v1, 0x3c

    .line 89
    .line 90
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz p0, :cond_8

    .line 96
    .line 97
    const/16 v0, 0x3d

    .line 98
    .line 99
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 103
    .line 104
    if-eqz p0, :cond_9

    .line 105
    .line 106
    const/16 v0, 0x3e

    .line 107
    .line 108
    sget-object v1, Lcom/p1/mobile/putong/feed/data/InteractionReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_9
    const/16 p0, 0x3f

    .line 114
    .line 115
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 116
    .line 117
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz p0, :cond_a

    .line 123
    .line 124
    const/16 v0, 0x40

    .line 125
    .line 126
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_a
    const/16 p0, 0x41

    .line 130
    .line 131
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 132
    .line 133
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz p0, :cond_b

    .line 139
    .line 140
    const/16 v0, 0x42

    .line 141
    .line 142
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz p0, :cond_c

    .line 148
    .line 149
    const/16 v0, 0x43

    .line 150
    .line 151
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz p0, :cond_d

    .line 157
    .line 158
    const/16 v0, 0x44

    .line 159
    .line 160
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 164
    .line 165
    if-eqz p0, :cond_e

    .line 166
    .line 167
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 168
    .line 169
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const/16 v1, 0x45

    .line 174
    .line 175
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 176
    .line 177
    .line 178
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 179
    .line 180
    if-eqz p0, :cond_f

    .line 181
    .line 182
    const/16 p1, 0x46

    .line 183
    .line 184
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentExpose;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 187
    .line 188
    .line 189
    :cond_f
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    check-cast p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/RawFeed$1;->serialize(Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
