.class Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    const/4 v0, 0x4

    .line 35
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    const/4 v0, 0x5

    .line 43
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_3
    const/4 v0, 0x7

    .line 61
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    const/16 v1, 0x8

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    :cond_4
    const/16 v0, 0x9

    .line 80
    .line 81
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 82
    .line 83
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    const/16 v1, 0xa

    .line 93
    .line 94
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 100
    .line 101
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 102
    check-cast p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileCard;->new_()Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_a

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 54
    .line 55
    return-object p0

    .line 56
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 131
    .line 132
    if-nez p1, :cond_5

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 135
    .line 136
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 137
    .line 138
    if-nez p1, :cond_6

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 141
    .line 142
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 143
    .line 144
    if-nez p1, :cond_7

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileCard;->new_()Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 151
    .line 152
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_8

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 157
    .line 158
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_9

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 163
    .line 164
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_a

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 169
    .line 170
    :cond_a
    return-object p0

    .line 171
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x20 -> :sswitch_6
        0x28 -> :sswitch_5
        0x32 -> :sswitch_4
        0x38 -> :sswitch_3
        0x42 -> :sswitch_2
        0x48 -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    const/4 p0, 0x4

    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x5

    .line 34
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    const/4 p0, 0x7

    .line 48
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const/16 v0, 0x8

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_4
    const/16 p0, 0x9

    .line 63
    .line 64
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    const/16 p1, 0xa

    .line 74
    .line 75
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
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

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$1;->serialize(Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
