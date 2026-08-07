.class Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/4 v1, 0x5

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    const/4 v1, 0x6

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    const/4 v1, 0x7

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    const/16 v1, 0x8

    .line 67
    .line 68
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p0, v0

    .line 73
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    const/16 v1, 0x9

    .line 78
    .line 79
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    const/16 v1, 0xa

    .line 89
    .line 90
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v0, :cond_6

    .line 98
    .line 99
    const/16 v1, 0xb

    .line 100
    .line 101
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v0, :cond_7

    .line 109
    .line 110
    const/16 v1, 0xc

    .line 111
    .line 112
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p0, v0

    .line 117
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 118
    .line 119
    if-eqz v0, :cond_8

    .line 120
    .line 121
    const/16 v1, 0xd

    .line 122
    .line 123
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz v0, :cond_9

    .line 131
    .line 132
    const/16 v1, 0xe

    .line 133
    .line 134
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz v0, :cond_a

    .line 142
    .line 143
    const/16 v1, 0xf

    .line 144
    .line 145
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    add-int/2addr p0, v0

    .line 150
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 151
    .line 152
    if-eqz v0, :cond_b

    .line 153
    .line 154
    const/16 v1, 0x10

    .line 155
    .line 156
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 162
    .line 163
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 164
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_a

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 80
    .line 81
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_16

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 86
    .line 87
    return-object p0

    .line 88
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 207
    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 211
    .line 212
    if-nez p1, :cond_b

    .line 213
    .line 214
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 215
    .line 216
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 217
    .line 218
    if-nez p1, :cond_c

    .line 219
    .line 220
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 221
    .line 222
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 223
    .line 224
    if-nez p1, :cond_d

    .line 225
    .line 226
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 227
    .line 228
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 229
    .line 230
    if-nez p1, :cond_e

    .line 231
    .line 232
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 233
    .line 234
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 235
    .line 236
    if-nez p1, :cond_f

    .line 237
    .line 238
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 239
    .line 240
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 241
    .line 242
    if-nez p1, :cond_10

    .line 243
    .line 244
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 245
    .line 246
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 247
    .line 248
    if-nez p1, :cond_11

    .line 249
    .line 250
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 251
    .line 252
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 253
    .line 254
    if-nez p1, :cond_12

    .line 255
    .line 256
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 257
    .line 258
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 259
    .line 260
    if-nez p1, :cond_13

    .line 261
    .line 262
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 263
    .line 264
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 265
    .line 266
    if-nez p1, :cond_14

    .line 267
    .line 268
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 269
    .line 270
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_15

    .line 273
    .line 274
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 275
    .line 276
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 277
    .line 278
    if-nez p1, :cond_16

    .line 279
    .line 280
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 281
    .line 282
    :cond_16
    return-object p0

    .line 283
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0x8 -> :sswitch_f
        0x10 -> :sswitch_e
        0x18 -> :sswitch_d
        0x20 -> :sswitch_c
        0x2a -> :sswitch_b
        0x32 -> :sswitch_a
        0x3a -> :sswitch_9
        0x42 -> :sswitch_8
        0x4a -> :sswitch_7
        0x52 -> :sswitch_6
        0x5a -> :sswitch_5
        0x62 -> :sswitch_4
        0x6a -> :sswitch_3
        0x72 -> :sswitch_2
        0x7a -> :sswitch_1
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

    .line 283
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x5

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x6

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    const/4 v0, 0x7

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const/16 v0, 0x8

    .line 54
    .line 55
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz p0, :cond_4

    .line 61
    .line 62
    const/16 v0, 0x9

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    const/16 v0, 0xa

    .line 72
    .line 73
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz p0, :cond_6

    .line 79
    .line 80
    const/16 v0, 0xb

    .line 81
    .line 82
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz p0, :cond_7

    .line 88
    .line 89
    const/16 v0, 0xc

    .line 90
    .line 91
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz p0, :cond_8

    .line 97
    .line 98
    const/16 v0, 0xd

    .line 99
    .line 100
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p0, :cond_9

    .line 106
    .line 107
    const/16 v0, 0xe

    .line 108
    .line 109
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz p0, :cond_a

    .line 115
    .line 116
    const/16 v0, 0xf

    .line 117
    .line 118
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz p0, :cond_b

    .line 124
    .line 125
    const/16 p1, 0x10

    .line 126
    .line 127
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
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

    .line 131
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$1;->serialize(Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
