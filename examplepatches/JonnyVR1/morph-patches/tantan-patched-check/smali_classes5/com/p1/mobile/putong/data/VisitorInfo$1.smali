.class Lcom/p1/mobile/putong/data/VisitorInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VisitorInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VisitorInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VisitorInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/AllVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/NewVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/RecommendVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/4 v2, 0x4

    .line 49
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    const/4 v1, 0x5

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/data/NewVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    const/4 v1, 0x6

    .line 71
    sget-object v2, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 79
    .line 80
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/data/VisitorInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VisitorInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VisitorInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VisitorInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VisitorInfo;-><init>()V

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
    if-eqz v0, :cond_b

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_a

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_9

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_8

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_7

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_6

    .line 31
    .line 32
    const/16 v1, 0x32

    .line 33
    .line 34
    if-eq v0, v1, :cond_5

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/data/AllVisitors;->new_()Lcom/p1/mobile/putong/data/AllVisitors;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 47
    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/data/NewVisitors;->new_()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendVisitors;->new_()Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 65
    .line 66
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 67
    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    new-instance p1, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 76
    .line 77
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 78
    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/data/NewVisitors;->new_()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 86
    .line 87
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 88
    .line 89
    if-nez p1, :cond_11

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->new_()Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/data/NewVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/data/NewVisitors;

    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Ljava/util/List;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/data/RecommendVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/data/NewVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/data/NewVisitors;

    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/data/AllVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/p1/mobile/putong/data/AllVisitors;

    .line 167
    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 173
    .line 174
    if-nez p1, :cond_c

    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/data/AllVisitors;->new_()Lcom/p1/mobile/putong/data/AllVisitors;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 181
    .line 182
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 183
    .line 184
    if-nez p1, :cond_d

    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/data/NewVisitors;->new_()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 191
    .line 192
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 193
    .line 194
    if-nez p1, :cond_e

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendVisitors;->new_()Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 201
    .line 202
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 203
    .line 204
    if-nez p1, :cond_f

    .line 205
    .line 206
    new-instance p1, Ljava/util/ArrayList;

    .line 207
    .line 208
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .line 210
    .line 211
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 212
    .line 213
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 214
    .line 215
    if-nez p1, :cond_10

    .line 216
    .line 217
    invoke-static {}, Lcom/p1/mobile/putong/data/NewVisitors;->new_()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 222
    .line 223
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 224
    .line 225
    if-nez p1, :cond_11

    .line 226
    .line 227
    invoke-static {}, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->new_()Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 232
    .line 233
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

    .line 234
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VisitorInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VisitorInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VisitorInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/AllVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/NewVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/data/RecommendVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x4

    .line 42
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x5

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/NewVisitors;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 56
    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    const/4 p1, 0x6

    .line 60
    sget-object v0, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 63
    .line 64
    .line 65
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

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/VisitorInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VisitorInfo$1;->serialize(Lcom/p1/mobile/putong/data/VisitorInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
