.class Lcom/p1/mobile/putong/feed/data/Extra$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/Extra;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/Extra;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/Extra;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    :cond_0
    const/4 v0, 0x3

    .line 21
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    const/4 v0, 0x4

    .line 29
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    const/4 v1, 0x6

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_2
    const/4 v0, 0x7

    .line 57
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 58
    .line 59
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    const/16 v1, 0x8

    .line 69
    .line 70
    sget-object v2, Lcom/p1/mobile/putong/feed/data/ShowAudit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    :cond_3
    const/16 v0, 0x9

    .line 78
    .line 79
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/16 v2, 0xa

    .line 97
    .line 98
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 104
    .line 105
    if-eqz v0, :cond_5

    .line 106
    .line 107
    const/16 v1, 0xb

    .line 108
    .line 109
    sget-object v2, Lcom/p1/mobile/putong/feed/data/StateGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/2addr p0, v0

    .line 116
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz v0, :cond_6

    .line 119
    .line 120
    const/16 v1, 0xc

    .line 121
    .line 122
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_6
    const/16 v0, 0xd

    .line 128
    .line 129
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 130
    .line 131
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr p0, v0

    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 137
    .line 138
    if-eqz v0, :cond_7

    .line 139
    .line 140
    const/16 v1, 0xe

    .line 141
    .line 142
    sget-object v2, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 150
    .line 151
    if-eqz v0, :cond_8

    .line 152
    .line 153
    const/16 v1, 0xf

    .line 154
    .line 155
    sget-object v2, Lcom/p1/mobile/putong/feed/data/StateWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    add-int/2addr p0, v0

    .line 162
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 163
    .line 164
    if-eqz v0, :cond_9

    .line 165
    .line 166
    const/16 v1, 0x10

    .line 167
    .line 168
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    add-int/2addr p0, v0

    .line 175
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 176
    .line 177
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 178
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Extra;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Extra$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/Extra;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/Extra;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/Extra;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/Extra;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentMedia;->new_()Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ShowAudit;->new_()Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 48
    .line 49
    if-nez p1, :cond_4

    .line 50
    .line 51
    new-instance p1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 57
    .line 58
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 59
    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateGuide;->new_()Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 67
    .line 68
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_6

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 73
    .line 74
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 75
    .line 76
    if-nez p1, :cond_7

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateWindow;->new_()Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 83
    .line 84
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 85
    .line 86
    if-nez p1, :cond_10

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->new_()Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 93
    .line 94
    return-object p0

    .line 95
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/StateWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 113
    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 124
    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/feed/data/StateGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    check-cast v0, Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 151
    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/feed/data/StateEmotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Ljava/util/List;

    .line 167
    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/feed/data/ShowAudit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 187
    .line 188
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 189
    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 233
    .line 234
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 239
    .line 240
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 241
    .line 242
    goto/16 :goto_0

    .line 243
    .line 244
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 253
    .line 254
    if-nez p1, :cond_8

    .line 255
    .line 256
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentMedia;->new_()Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 261
    .line 262
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 263
    .line 264
    if-nez p1, :cond_9

    .line 265
    .line 266
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 267
    .line 268
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 269
    .line 270
    if-nez p1, :cond_a

    .line 271
    .line 272
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 273
    .line 274
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 275
    .line 276
    if-nez p1, :cond_b

    .line 277
    .line 278
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ShowAudit;->new_()Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 283
    .line 284
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 285
    .line 286
    if-nez p1, :cond_c

    .line 287
    .line 288
    new-instance p1, Ljava/util/ArrayList;

    .line 289
    .line 290
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 291
    .line 292
    .line 293
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 294
    .line 295
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 296
    .line 297
    if-nez p1, :cond_d

    .line 298
    .line 299
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateGuide;->new_()Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 304
    .line 305
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 306
    .line 307
    if-nez p1, :cond_e

    .line 308
    .line 309
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 310
    .line 311
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 312
    .line 313
    if-nez p1, :cond_f

    .line 314
    .line 315
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateWindow;->new_()Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 320
    .line 321
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 322
    .line 323
    if-nez p1, :cond_10

    .line 324
    .line 325
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->new_()Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 330
    .line 331
    :cond_10
    return-object p0

    .line 332
    nop

    .line 333
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0x8 -> :sswitch_f
        0x12 -> :sswitch_e
        0x18 -> :sswitch_d
        0x20 -> :sswitch_c
        0x2a -> :sswitch_b
        0x32 -> :sswitch_a
        0x38 -> :sswitch_9
        0x42 -> :sswitch_8
        0x48 -> :sswitch_7
        0x52 -> :sswitch_6
        0x5a -> :sswitch_5
        0x62 -> :sswitch_4
        0x68 -> :sswitch_3
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

    .line 333
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Extra$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/Extra;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/Extra;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x3

    .line 18
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x6

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    const/4 p0, 0x7

    .line 46
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 52
    .line 53
    if-eqz p0, :cond_3

    .line 54
    .line 55
    const/16 v0, 0x8

    .line 56
    .line 57
    sget-object v1, Lcom/p1/mobile/putong/feed/data/ShowAudit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    const/16 p0, 0x9

    .line 63
    .line 64
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 70
    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/feed/data/StateEmotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/16 v1, 0xa

    .line 80
    .line 81
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 82
    .line 83
    .line 84
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 85
    .line 86
    if-eqz p0, :cond_5

    .line 87
    .line 88
    const/16 v0, 0xb

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/feed/data/StateGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 93
    .line 94
    .line 95
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz p0, :cond_6

    .line 98
    .line 99
    const/16 v0, 0xc

    .line 100
    .line 101
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_6
    const/16 p0, 0xd

    .line 105
    .line 106
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 107
    .line 108
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 112
    .line 113
    if-eqz p0, :cond_7

    .line 114
    .line 115
    const/16 v0, 0xe

    .line 116
    .line 117
    sget-object v1, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 123
    .line 124
    if-eqz p0, :cond_8

    .line 125
    .line 126
    const/16 v0, 0xf

    .line 127
    .line 128
    sget-object v1, Lcom/p1/mobile/putong/feed/data/StateWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    .line 130
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 131
    .line 132
    .line 133
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 134
    .line 135
    if-eqz p0, :cond_9

    .line 136
    .line 137
    const/16 p1, 0x10

    .line 138
    .line 139
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 142
    .line 143
    .line 144
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

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Extra;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/Extra$1;->serialize(Lcom/p1/mobile/putong/feed/data/Extra;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
