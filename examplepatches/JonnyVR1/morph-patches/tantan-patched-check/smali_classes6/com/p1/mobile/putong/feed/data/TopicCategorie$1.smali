.class Lcom/p1/mobile/putong/feed/data/TopicCategorie$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/TopicCategorie;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->icon:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const/4 v2, 0x5

    .line 53
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->status:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/TopicCategorie$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/TopicCategorie;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/TopicCategorie;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->id:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->id:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->icon:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->icon:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->type:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->type:Ljava/lang/String;

    .line 61
    .line 62
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 63
    .line 64
    if-nez p1, :cond_4

    .line 65
    .line 66
    new-instance p1, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 72
    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->status:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_11

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->status:Ljava/lang/String;

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->status:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_6
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Ljava/util/List;

    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->type:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->icon:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->id:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->id:Ljava/lang/String;

    .line 131
    .line 132
    if-nez p1, :cond_c

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->id:Ljava/lang/String;

    .line 135
    .line 136
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

    .line 137
    .line 138
    if-nez p1, :cond_d

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

    .line 141
    .line 142
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->icon:Ljava/lang/String;

    .line 143
    .line 144
    if-nez p1, :cond_e

    .line 145
    .line 146
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->icon:Ljava/lang/String;

    .line 147
    .line 148
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->type:Ljava/lang/String;

    .line 149
    .line 150
    if-nez p1, :cond_f

    .line 151
    .line 152
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->type:Ljava/lang/String;

    .line 153
    .line 154
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 155
    .line 156
    if-nez p1, :cond_10

    .line 157
    .line 158
    new-instance p1, Ljava/util/ArrayList;

    .line 159
    .line 160
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .line 162
    .line 163
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 164
    .line 165
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->status:Ljava/lang/String;

    .line 166
    .line 167
    if-nez p1, :cond_11

    .line 168
    .line 169
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->status:Ljava/lang/String;

    .line 170
    .line 171
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

    .line 172
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/TopicCategorie$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/TopicCategorie;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->icon:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->topicIds:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x5

    .line 44
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->status:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 p1, 0x6

    .line 52
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/TopicCategorie$1;->serialize(Lcom/p1/mobile/putong/feed/data/TopicCategorie;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
