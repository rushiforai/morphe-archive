.class Lcom/p1/mobile/putong/core/data/ChatHeat$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatHeat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ChatHeat;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ChatHeat;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    const/16 v0, 0x33

    .line 19
    .line 20
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/2addr p0, v0

    .line 27
    const/16 v0, 0x34

    .line 28
    .line 29
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/16 v0, 0x35

    .line 37
    .line 38
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/2addr p0, v0

    .line 45
    const/16 v0, 0x36

    .line 46
    .line 47
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/16 v0, 0x37

    .line 55
    .line 56
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    add-int/2addr p0, v0

    .line 63
    const/16 v0, 0x38

    .line 64
    .line 65
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 66
    .line 67
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    const/16 v0, 0x39

    .line 73
    .line 74
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 75
    .line 76
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    const/16 v0, 0x3a

    .line 82
    .line 83
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 84
    .line 85
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr p0, v0

    .line 90
    const/16 v0, 0x3b

    .line 91
    .line 92
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 93
    .line 94
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 100
    .line 101
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 102
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatHeat$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ChatHeat;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat;-><init>()V

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
    return-object p0

    .line 14
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 89
    .line 90
    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_a
        0x12 -> :sswitch_9
        0x199 -> :sswitch_8
        0x1a0 -> :sswitch_7
        0x1a8 -> :sswitch_6
        0x1b1 -> :sswitch_5
        0x1b9 -> :sswitch_4
        0x1c1 -> :sswitch_3
        0x1c9 -> :sswitch_2
        0x1d0 -> :sswitch_1
        0x1d9 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatHeat$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ChatHeat;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/16 p0, 0x33

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x34

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x35

    .line 30
    .line 31
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x36

    .line 37
    .line 38
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x37

    .line 44
    .line 45
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x38

    .line 51
    .line 52
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 55
    .line 56
    .line 57
    const/16 p0, 0x39

    .line 58
    .line 59
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 60
    .line 61
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 62
    .line 63
    .line 64
    const/16 p0, 0x3a

    .line 65
    .line 66
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 69
    .line 70
    .line 71
    const/16 p0, 0x3b

    .line 72
    .line 73
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 76
    .line 77
    .line 78
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatHeat$1;->serialize(Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
