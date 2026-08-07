.class Lcom/p1/mobile/putong/data/Notifications$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Notifications;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Notifications;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Notifications;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x5

    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    const/4 v1, 0x6

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_0
    const/4 v0, 0x7

    .line 51
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

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
    const/16 v0, 0x8

    .line 59
    .line 60
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 61
    .line 62
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    add-int/2addr p0, v0

    .line 67
    const/16 v0, 0x9

    .line 68
    .line 69
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 70
    .line 71
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 77
    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    const/16 v1, 0xa

    .line 81
    .line 82
    sget-object v2, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_1
    const/16 v0, 0xb

    .line 90
    .line 91
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 92
    .line 93
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 99
    .line 100
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 101
    check-cast p1, Lcom/p1/mobile/putong/data/Notifications;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Notifications$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Notifications;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Notifications;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Notifications;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Notifications;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 22
    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->new_()Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 30
    .line 31
    return-object p0

    .line 32
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 114
    .line 115
    if-nez p1, :cond_1

    .line 116
    .line 117
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 118
    .line 119
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 120
    .line 121
    if-nez p1, :cond_2

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->new_()Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 128
    .line 129
    :cond_2
    return-object p0

    .line 130
    nop

    .line 131
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0x8 -> :sswitch_a
        0x10 -> :sswitch_9
        0x18 -> :sswitch_8
        0x20 -> :sswitch_7
        0x28 -> :sswitch_6
        0x32 -> :sswitch_5
        0x38 -> :sswitch_4
        0x40 -> :sswitch_3
        0x48 -> :sswitch_2
        0x52 -> :sswitch_1
        0x58 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Notifications$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Notifications;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Notifications;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 v0, 0x6

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    const/4 p0, 0x7

    .line 40
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 43
    .line 44
    .line 45
    const/16 p0, 0x8

    .line 46
    .line 47
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 48
    .line 49
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 50
    .line 51
    .line 52
    const/16 p0, 0x9

    .line 53
    .line 54
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 55
    .line 56
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    const/16 v0, 0xa

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    const/16 p0, 0xb

    .line 71
    .line 72
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 73
    .line 74
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/data/Notifications;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Notifications$1;->serialize(Lcom/p1/mobile/putong/data/Notifications;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
