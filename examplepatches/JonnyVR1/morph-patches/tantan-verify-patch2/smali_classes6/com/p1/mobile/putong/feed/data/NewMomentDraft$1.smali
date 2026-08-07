.class Lcom/p1/mobile/putong/feed/data/NewMomentDraft$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/NewMomentDraft;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->type:I

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 65
    .line 66
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/NewMomentDraft$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/NewMomentDraft;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;-><init>()V

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
    if-eqz v0, :cond_8

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_7

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_6

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_5

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_4

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_3

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    new-instance p1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 50
    .line 51
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 52
    .line 53
    if-nez p1, :cond_2

    .line 54
    .line 55
    new-instance p1, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 61
    .line 62
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 63
    .line 64
    if-nez p1, :cond_c

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Ljava/util/List;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Ljava/util/List;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->type:I

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 129
    .line 130
    if-nez p1, :cond_9

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 133
    .line 134
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 135
    .line 136
    if-nez p1, :cond_a

    .line 137
    .line 138
    new-instance p1, Ljava/util/ArrayList;

    .line 139
    .line 140
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .line 142
    .line 143
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 144
    .line 145
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 146
    .line 147
    if-nez p1, :cond_b

    .line 148
    .line 149
    new-instance p1, Ljava/util/ArrayList;

    .line 150
    .line 151
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .line 153
    .line 154
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 155
    .line 156
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 157
    .line 158
    if-nez p1, :cond_c

    .line 159
    .line 160
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 165
    .line 166
    :cond_c
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/NewMomentDraft$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->type:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x4

    .line 40
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const/4 p1, 0x5

    .line 48
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/NewMomentDraft$1;->serialize(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
