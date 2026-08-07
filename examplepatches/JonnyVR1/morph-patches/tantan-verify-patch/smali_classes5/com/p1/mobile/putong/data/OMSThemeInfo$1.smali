.class Lcom/p1/mobile/putong/data/OMSThemeInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSThemeInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSThemeInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSThemeInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/4 v2, 0x6

    .line 65
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_6
    const/16 v0, 0x8

    .line 81
    .line 82
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 83
    .line 84
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    const/16 v0, 0x9

    .line 90
    .line 91
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 92
    .line 93
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    const/16 v0, 0xa

    .line 99
    .line 100
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 101
    .line 102
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p0, v0

    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 108
    .line 109
    if-eqz v0, :cond_7

    .line 110
    .line 111
    const/16 v1, 0xb

    .line 112
    .line 113
    sget-object v2, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    add-int/2addr p0, v0

    .line 120
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 121
    .line 122
    if-eqz v0, :cond_8

    .line 123
    .line 124
    const/16 v1, 0xc

    .line 125
    .line 126
    sget-object v2, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    add-int/2addr p0, v0

    .line 133
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz v0, :cond_9

    .line 136
    .line 137
    const/16 v1, 0xd

    .line 138
    .line 139
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    add-int/2addr p0, v0

    .line 144
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 145
    .line 146
    if-eqz v0, :cond_a

    .line 147
    .line 148
    const/16 v1, 0xe

    .line 149
    .line 150
    sget-object v2, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    add-int/2addr p0, v0

    .line 157
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz v0, :cond_b

    .line 160
    .line 161
    const/16 v1, 0xf

    .line 162
    .line 163
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    add-int/2addr p0, v0

    .line 168
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 169
    .line 170
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 171
    check-cast p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSThemeInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSThemeInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSThemeInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSThemeInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 56
    .line 57
    if-nez p1, :cond_6

    .line 58
    .line 59
    new-instance p1, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 65
    .line 66
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_7

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 71
    .line 72
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 73
    .line 74
    if-nez p1, :cond_8

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 81
    .line 82
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 83
    .line 84
    if-nez p1, :cond_9

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 91
    .line 92
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 93
    .line 94
    if-nez p1, :cond_a

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 101
    .line 102
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 103
    .line 104
    if-nez p1, :cond_16

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 107
    .line 108
    return-object p0

    .line 109
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 123
    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 141
    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    check-cast v0, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 153
    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    .line 192
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    check-cast v0, Ljava/util/List;

    .line 201
    .line 202
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    check-cast v0, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 237
    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :sswitch_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 251
    .line 252
    if-nez p1, :cond_b

    .line 253
    .line 254
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 255
    .line 256
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 257
    .line 258
    if-nez p1, :cond_c

    .line 259
    .line 260
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 265
    .line 266
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 267
    .line 268
    if-nez p1, :cond_d

    .line 269
    .line 270
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 271
    .line 272
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 273
    .line 274
    if-nez p1, :cond_e

    .line 275
    .line 276
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 277
    .line 278
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 279
    .line 280
    if-nez p1, :cond_f

    .line 281
    .line 282
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 283
    .line 284
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 285
    .line 286
    if-nez p1, :cond_10

    .line 287
    .line 288
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 289
    .line 290
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 291
    .line 292
    if-nez p1, :cond_11

    .line 293
    .line 294
    new-instance p1, Ljava/util/ArrayList;

    .line 295
    .line 296
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .line 298
    .line 299
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 300
    .line 301
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 302
    .line 303
    if-nez p1, :cond_12

    .line 304
    .line 305
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 306
    .line 307
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 308
    .line 309
    if-nez p1, :cond_13

    .line 310
    .line 311
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 316
    .line 317
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 318
    .line 319
    if-nez p1, :cond_14

    .line 320
    .line 321
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 326
    .line 327
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 328
    .line 329
    if-nez p1, :cond_15

    .line 330
    .line 331
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 336
    .line 337
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 338
    .line 339
    if-nez p1, :cond_16

    .line 340
    .line 341
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 342
    .line 343
    :cond_16
    return-object p0

    .line 344
    nop

    .line 345
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_f
        0xa -> :sswitch_e
        0x12 -> :sswitch_d
        0x1a -> :sswitch_c
        0x22 -> :sswitch_b
        0x2a -> :sswitch_a
        0x32 -> :sswitch_9
        0x3a -> :sswitch_8
        0x40 -> :sswitch_7
        0x48 -> :sswitch_6
        0x50 -> :sswitch_5
        0x5a -> :sswitch_4
        0x62 -> :sswitch_3
        0x6a -> :sswitch_2
        0x72 -> :sswitch_1
        0x7a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 345
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSThemeInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSThemeInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSThemeInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_5

    .line 46
    .line 47
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x6

    .line 54
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_6
    const/16 p0, 0x8

    .line 66
    .line 67
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 68
    .line 69
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 70
    .line 71
    .line 72
    const/16 p0, 0x9

    .line 73
    .line 74
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 77
    .line 78
    .line 79
    const/16 p0, 0xa

    .line 80
    .line 81
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 82
    .line 83
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 87
    .line 88
    if-eqz p0, :cond_7

    .line 89
    .line 90
    const/16 v0, 0xb

    .line 91
    .line 92
    sget-object v1, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 98
    .line 99
    if-eqz p0, :cond_8

    .line 100
    .line 101
    const/16 v0, 0xc

    .line 102
    .line 103
    sget-object v1, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 106
    .line 107
    .line 108
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz p0, :cond_9

    .line 111
    .line 112
    const/16 v0, 0xd

    .line 113
    .line 114
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 118
    .line 119
    if-eqz p0, :cond_a

    .line 120
    .line 121
    const/16 v0, 0xe

    .line 122
    .line 123
    sget-object v1, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 126
    .line 127
    .line 128
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_b

    .line 131
    .line 132
    const/16 p1, 0xf

    .line 133
    .line 134
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
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

    .line 138
    check-cast p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSThemeInfo$1;->serialize(Lcom/p1/mobile/putong/data/OMSThemeInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
