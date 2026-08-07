.class Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageItemButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageItemTarget;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 69
    .line 70
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;-><init>()V

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
    if-eqz v0, :cond_b

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_a

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_9

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_8

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_7

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_6

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_5

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageItemButton;->new_()Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 65
    .line 66
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 67
    .line 68
    if-nez p1, :cond_4

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageItemTarget;->new_()Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 77
    .line 78
    if-nez p1, :cond_11

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->new_()Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageItemTarget;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageItemButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

    .line 143
    .line 144
    if-nez p1, :cond_c

    .line 145
    .line 146
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

    .line 147
    .line 148
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

    .line 149
    .line 150
    if-nez p1, :cond_d

    .line 151
    .line 152
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

    .line 153
    .line 154
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

    .line 155
    .line 156
    if-nez p1, :cond_e

    .line 157
    .line 158
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

    .line 159
    .line 160
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 161
    .line 162
    if-nez p1, :cond_f

    .line 163
    .line 164
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageItemButton;->new_()Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 169
    .line 170
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 171
    .line 172
    if-nez p1, :cond_10

    .line 173
    .line 174
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageItemTarget;->new_()Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 179
    .line 180
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 181
    .line 182
    if-nez p1, :cond_11

    .line 183
    .line 184
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->new_()Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 189
    .line 190
    :cond_11
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageItemButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->target:Lcom/p1/mobile/putong/core/data/MessageItemTarget;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageItemTarget;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const/4 p1, 0x6

    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick$1;->serialize(Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
