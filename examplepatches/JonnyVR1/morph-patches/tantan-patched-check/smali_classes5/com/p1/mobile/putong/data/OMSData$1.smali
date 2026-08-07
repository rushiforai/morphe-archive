.class Lcom/p1/mobile/putong/data/OMSData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->omsMetas:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/OMSMetasData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x2

    .line 29
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->documents:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDocumentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x3

    .line 45
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->launchPages:Ljava/util/List;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x4

    .line 61
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->emitters:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    sget-object v1, Lcom/p1/mobile/putong/data/OMSEmitterInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const/4 v2, 0x5

    .line 77
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->widgets:Ljava/util/List;

    .line 83
    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    sget-object v1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const/4 v2, 0x6

    .line 93
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 99
    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const/4 v2, 0x7

    .line 109
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 115
    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const/16 v2, 0x8

    .line 125
    .line 126
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 132
    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    sget-object v1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    const/16 v2, 0x9

    .line 142
    .line 143
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    add-int/2addr p0, v0

    .line 148
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 149
    .line 150
    if-eqz v0, :cond_9

    .line 151
    .line 152
    sget-object v1, Lcom/p1/mobile/putong/data/OMSSlotsInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    const/16 v2, 0xa

    .line 159
    .line 160
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/2addr p0, v0

    .line 165
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 166
    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    sget-object v1, Lcom/p1/mobile/putong/data/SwipeExcites;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/16 v2, 0xb

    .line 176
    .line 177
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 183
    .line 184
    if-eqz v0, :cond_b

    .line 185
    .line 186
    sget-object v1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    const/16 v2, 0xc

    .line 193
    .line 194
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    add-int/2addr p0, v0

    .line 199
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 200
    .line 201
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 202
    check-cast p1, Lcom/p1/mobile/putong/data/OMSData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->omsMetas:Ljava/util/List;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->omsMetas:Ljava/util/List;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->documents:Ljava/util/List;

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->documents:Ljava/util/List;

    .line 45
    .line 46
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->launchPages:Ljava/util/List;

    .line 47
    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    new-instance p1, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->launchPages:Ljava/util/List;

    .line 56
    .line 57
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->emitters:Ljava/util/List;

    .line 58
    .line 59
    if-nez p1, :cond_4

    .line 60
    .line 61
    new-instance p1, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->emitters:Ljava/util/List;

    .line 67
    .line 68
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->widgets:Ljava/util/List;

    .line 69
    .line 70
    if-nez p1, :cond_5

    .line 71
    .line 72
    new-instance p1, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->widgets:Ljava/util/List;

    .line 78
    .line 79
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 80
    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    new-instance p1, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 89
    .line 90
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 91
    .line 92
    if-nez p1, :cond_7

    .line 93
    .line 94
    new-instance p1, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 100
    .line 101
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 102
    .line 103
    if-nez p1, :cond_8

    .line 104
    .line 105
    new-instance p1, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 111
    .line 112
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 113
    .line 114
    if-nez p1, :cond_9

    .line 115
    .line 116
    new-instance p1, Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 122
    .line 123
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 124
    .line 125
    if-nez p1, :cond_a

    .line 126
    .line 127
    new-instance p1, Ljava/util/ArrayList;

    .line 128
    .line 129
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .line 131
    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 133
    .line 134
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 135
    .line 136
    if-nez p1, :cond_16

    .line 137
    .line 138
    new-instance p1, Ljava/util/ArrayList;

    .line 139
    .line 140
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .line 142
    .line 143
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 144
    .line 145
    return-object p0

    .line 146
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Ljava/util/List;

    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/SwipeExcites;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Ljava/util/List;

    .line 173
    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Ljava/util/List;

    .line 189
    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    .line 196
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    check-cast v0, Ljava/util/List;

    .line 205
    .line 206
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 207
    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Ljava/util/List;

    .line 221
    .line 222
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    check-cast v0, Ljava/util/List;

    .line 253
    .line 254
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->widgets:Ljava/util/List;

    .line 255
    .line 256
    goto/16 :goto_0

    .line 257
    .line 258
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/OMSEmitterInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    check-cast v0, Ljava/util/List;

    .line 269
    .line 270
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->emitters:Ljava/util/List;

    .line 271
    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 275
    .line 276
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    check-cast v0, Ljava/util/List;

    .line 285
    .line 286
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->launchPages:Ljava/util/List;

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDocumentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 291
    .line 292
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    check-cast v0, Ljava/util/List;

    .line 301
    .line 302
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->documents:Ljava/util/List;

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 307
    .line 308
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    check-cast v0, Ljava/util/List;

    .line 317
    .line 318
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 319
    .line 320
    goto/16 :goto_0

    .line 321
    .line 322
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/data/OMSMetasData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 323
    .line 324
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    check-cast v0, Ljava/util/List;

    .line 333
    .line 334
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSData;->omsMetas:Ljava/util/List;

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->omsMetas:Ljava/util/List;

    .line 339
    .line 340
    if-nez p1, :cond_b

    .line 341
    .line 342
    new-instance p1, Ljava/util/ArrayList;

    .line 343
    .line 344
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 345
    .line 346
    .line 347
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->omsMetas:Ljava/util/List;

    .line 348
    .line 349
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 350
    .line 351
    if-nez p1, :cond_c

    .line 352
    .line 353
    new-instance p1, Ljava/util/ArrayList;

    .line 354
    .line 355
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 356
    .line 357
    .line 358
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 359
    .line 360
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->documents:Ljava/util/List;

    .line 361
    .line 362
    if-nez p1, :cond_d

    .line 363
    .line 364
    new-instance p1, Ljava/util/ArrayList;

    .line 365
    .line 366
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 367
    .line 368
    .line 369
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->documents:Ljava/util/List;

    .line 370
    .line 371
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->launchPages:Ljava/util/List;

    .line 372
    .line 373
    if-nez p1, :cond_e

    .line 374
    .line 375
    new-instance p1, Ljava/util/ArrayList;

    .line 376
    .line 377
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 378
    .line 379
    .line 380
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->launchPages:Ljava/util/List;

    .line 381
    .line 382
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->emitters:Ljava/util/List;

    .line 383
    .line 384
    if-nez p1, :cond_f

    .line 385
    .line 386
    new-instance p1, Ljava/util/ArrayList;

    .line 387
    .line 388
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 389
    .line 390
    .line 391
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->emitters:Ljava/util/List;

    .line 392
    .line 393
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->widgets:Ljava/util/List;

    .line 394
    .line 395
    if-nez p1, :cond_10

    .line 396
    .line 397
    new-instance p1, Ljava/util/ArrayList;

    .line 398
    .line 399
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 400
    .line 401
    .line 402
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->widgets:Ljava/util/List;

    .line 403
    .line 404
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 405
    .line 406
    if-nez p1, :cond_11

    .line 407
    .line 408
    new-instance p1, Ljava/util/ArrayList;

    .line 409
    .line 410
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 411
    .line 412
    .line 413
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 414
    .line 415
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 416
    .line 417
    if-nez p1, :cond_12

    .line 418
    .line 419
    new-instance p1, Ljava/util/ArrayList;

    .line 420
    .line 421
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 422
    .line 423
    .line 424
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 425
    .line 426
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 427
    .line 428
    if-nez p1, :cond_13

    .line 429
    .line 430
    new-instance p1, Ljava/util/ArrayList;

    .line 431
    .line 432
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 433
    .line 434
    .line 435
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 436
    .line 437
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 438
    .line 439
    if-nez p1, :cond_14

    .line 440
    .line 441
    new-instance p1, Ljava/util/ArrayList;

    .line 442
    .line 443
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 444
    .line 445
    .line 446
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 447
    .line 448
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 449
    .line 450
    if-nez p1, :cond_15

    .line 451
    .line 452
    new-instance p1, Ljava/util/ArrayList;

    .line 453
    .line 454
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 455
    .line 456
    .line 457
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 458
    .line 459
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 460
    .line 461
    if-nez p1, :cond_16

    .line 462
    .line 463
    new-instance p1, Ljava/util/ArrayList;

    .line 464
    .line 465
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 466
    .line 467
    .line 468
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 469
    .line 470
    :cond_16
    return-object p0

    .line 471
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
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

    .line 471
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->omsMetas:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/OMSMetasData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x2

    .line 26
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->documents:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDocumentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x3

    .line 40
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->launchPages:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x4

    .line 54
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->emitters:Ljava/util/List;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/data/OMSEmitterInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/4 v1, 0x5

    .line 68
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->widgets:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_5

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x6

    .line 82
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 86
    .line 87
    if-eqz p0, :cond_6

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/4 v1, 0x7

    .line 96
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 100
    .line 101
    if-eqz p0, :cond_7

    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const/16 v1, 0x8

    .line 110
    .line 111
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 112
    .line 113
    .line 114
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_8

    .line 117
    .line 118
    sget-object v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const/16 v1, 0x9

    .line 125
    .line 126
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 127
    .line 128
    .line 129
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 130
    .line 131
    if-eqz p0, :cond_9

    .line 132
    .line 133
    sget-object v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const/16 v1, 0xa

    .line 140
    .line 141
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 142
    .line 143
    .line 144
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 145
    .line 146
    if-eqz p0, :cond_a

    .line 147
    .line 148
    sget-object v0, Lcom/p1/mobile/putong/data/SwipeExcites;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const/16 v1, 0xb

    .line 155
    .line 156
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 157
    .line 158
    .line 159
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 160
    .line 161
    if-eqz p0, :cond_b

    .line 162
    .line 163
    sget-object p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    const/16 v0, 0xc

    .line 170
    .line 171
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSData$1;->serialize(Lcom/p1/mobile/putong/data/OMSData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
