.class Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    const/16 v1, 0x8

    .line 91
    .line 92
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 100
    .line 101
    if-eqz v0, :cond_8

    .line 102
    .line 103
    const/16 v1, 0x9

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 113
    .line 114
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 115
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;-><init>()V

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
    if-eqz v0, :cond_11

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_10

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_f

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_e

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_d

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_c

    .line 31
    .line 32
    const/16 v1, 0x32

    .line 33
    .line 34
    if-eq v0, v1, :cond_b

    .line 35
    .line 36
    const/16 v1, 0x3a

    .line 37
    .line 38
    if-eq v0, v1, :cond_a

    .line 39
    .line 40
    const/16 v1, 0x42

    .line 41
    .line 42
    if-eq v0, v1, :cond_9

    .line 43
    .line 44
    const/16 v1, 0x4a

    .line 45
    .line 46
    if-eq v0, v1, :cond_8

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 57
    .line 58
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 59
    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 67
    .line 68
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 69
    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 77
    .line 78
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 79
    .line 80
    if-nez p1, :cond_3

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 87
    .line 88
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 89
    .line 90
    if-nez p1, :cond_4

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 97
    .line 98
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 99
    .line 100
    if-nez p1, :cond_5

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 107
    .line 108
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 109
    .line 110
    if-nez p1, :cond_6

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 117
    .line 118
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 119
    .line 120
    if-nez p1, :cond_7

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 127
    .line 128
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 129
    .line 130
    if-nez p1, :cond_1a

    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 146
    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 158
    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 170
    .line 171
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 182
    .line 183
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 194
    .line 195
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :cond_d
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    .line 201
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 206
    .line 207
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :cond_e
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 212
    .line 213
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 218
    .line 219
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_f
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 224
    .line 225
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 230
    .line 231
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_10
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 242
    .line 243
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 248
    .line 249
    if-nez p1, :cond_12

    .line 250
    .line 251
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 256
    .line 257
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 258
    .line 259
    if-nez p1, :cond_13

    .line 260
    .line 261
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 266
    .line 267
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 268
    .line 269
    if-nez p1, :cond_14

    .line 270
    .line 271
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 276
    .line 277
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 278
    .line 279
    if-nez p1, :cond_15

    .line 280
    .line 281
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 286
    .line 287
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 288
    .line 289
    if-nez p1, :cond_16

    .line 290
    .line 291
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 296
    .line 297
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 298
    .line 299
    if-nez p1, :cond_17

    .line 300
    .line 301
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 306
    .line 307
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 308
    .line 309
    if-nez p1, :cond_18

    .line 310
    .line 311
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 316
    .line 317
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 318
    .line 319
    if-nez p1, :cond_19

    .line 320
    .line 321
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 326
    .line 327
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 328
    .line 329
    if-nez p1, :cond_1a

    .line 330
    .line 331
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 336
    .line 337
    :cond_1a
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 338
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp1v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp2v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v1:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v2:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const/16 v0, 0x8

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->exp3v3:Lcom/p1/mobile/putong/core/data/ProfileInputOrder;

    .line 83
    .line 84
    if-eqz p0, :cond_8

    .line 85
    .line 86
    const/16 p1, 0x9

    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder$1;->serialize(Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
