.class Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->swipe:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->titleIcon:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->desc:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatar:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatarTitle:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 67
    .line 68
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->titleIcon:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->titleIcon:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->desc:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->desc:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatar:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatar:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatarTitle:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatarTitle:Ljava/lang/String;

    .line 61
    .line 62
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->swipe:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 63
    .line 64
    if-nez p1, :cond_4

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->swipe:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 71
    .line 72
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 73
    .line 74
    if-nez p1, :cond_11

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatarTitle:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatar:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->desc:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->titleIcon:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 129
    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->swipe:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->titleIcon:Ljava/lang/String;

    .line 134
    .line 135
    if-nez p1, :cond_c

    .line 136
    .line 137
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->titleIcon:Ljava/lang/String;

    .line 138
    .line 139
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->desc:Ljava/lang/String;

    .line 140
    .line 141
    if-nez p1, :cond_d

    .line 142
    .line 143
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->desc:Ljava/lang/String;

    .line 144
    .line 145
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatar:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_e

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatar:Ljava/lang/String;

    .line 150
    .line 151
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatarTitle:Ljava/lang/String;

    .line 152
    .line 153
    if-nez p1, :cond_f

    .line 154
    .line 155
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatarTitle:Ljava/lang/String;

    .line 156
    .line 157
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->swipe:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 158
    .line 159
    if-nez p1, :cond_10

    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->swipe:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 166
    .line 167
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 168
    .line 169
    if-nez p1, :cond_11

    .line 170
    .line 171
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 176
    .line 177
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

    .line 178
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->swipe:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->titleIcon:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->desc:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatar:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;->avatarTitle:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const/4 p1, 0x6

    .line 50
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
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

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData$1;->serialize(Lcom/p1/mobile/putong/core/data/SimilarInterestsItemLanguagesData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
