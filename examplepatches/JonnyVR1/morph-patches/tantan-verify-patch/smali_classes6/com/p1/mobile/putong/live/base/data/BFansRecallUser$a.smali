.class public Lcom/p1/mobile/putong/live/base/data/BFansRecallUser$a;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;",
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
.method public a(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

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
    const/4 v0, 0x5

    .line 43
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->following:Z

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
    const/4 v0, 0x6

    .line 51
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->followed:Z

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    const/4 v0, 0x7

    .line 59
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->fanbaseGrade:I

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    const/16 v0, 0x8

    .line 67
    .line 68
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->grade:I

    .line 69
    .line 70
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/2addr p0, v0

    .line 75
    const/16 v0, 0x9

    .line 76
    .line 77
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isOnline:Z

    .line 78
    .line 79
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    const/16 v0, 0xa

    .line 85
    .line 86
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isRecalled:Z

    .line 87
    .line 88
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 94
    .line 95
    return p0
.end method

.method public b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_6

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

    .line 38
    .line 39
    return-object p0

    .line 40
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isRecalled:Z

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isOnline:Z

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->grade:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->fanbaseGrade:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->followed:Z

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->following:Z

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 111
    .line 112
    if-nez p1, :cond_3

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 115
    .line 116
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

    .line 117
    .line 118
    if-nez p1, :cond_4

    .line 119
    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

    .line 121
    .line 122
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

    .line 127
    .line 128
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

    .line 129
    .line 130
    if-nez p1, :cond_6

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

    .line 133
    .line 134
    :cond_6
    return-object p0

    .line 135
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x28 -> :sswitch_5
        0x30 -> :sswitch_4
        0x38 -> :sswitch_3
        0x40 -> :sswitch_2
        0x48 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

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
    const/4 p0, 0x5

    .line 34
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->following:Z

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x6

    .line 40
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->followed:Z

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x7

    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->fanbaseGrade:I

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x8

    .line 52
    .line 53
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->grade:I

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x9

    .line 59
    .line 60
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isOnline:Z

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 63
    .line 64
    .line 65
    const/16 p0, 0xa

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isRecalled:Z

    .line 68
    .line 69
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser$a;->a(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser$a;->b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser$a;->c(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
