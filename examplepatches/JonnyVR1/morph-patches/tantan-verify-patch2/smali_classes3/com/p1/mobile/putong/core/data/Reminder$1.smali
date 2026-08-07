.class Lcom/p1/mobile/putong/core/data/Reminder$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Reminder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Reminder;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Reminder;)I
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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p0, v0

    .line 29
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x34

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/16 v1, 0x35

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/core/data/ReminderReference;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/2addr p0, v0

    .line 53
    :cond_3
    const/16 v0, 0x36

    .line 54
    .line 55
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/16 v0, 0x37

    .line 63
    .line 64
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 65
    .line 66
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-int/2addr p0, v0

    .line 71
    const/16 v0, 0x38

    .line 72
    .line 73
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 74
    .line 75
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    const/16 v1, 0x39

    .line 85
    .line 86
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 92
    .line 93
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/data/Reminder;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Reminder$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Reminder;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Reminder;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Reminder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Reminder;-><init>()V

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
    const/16 v2, 0x8

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
    const/16 v2, 0x19a

    .line 23
    .line 24
    if-eq v0, v2, :cond_8

    .line 25
    .line 26
    const/16 v2, 0x1a2

    .line 27
    .line 28
    if-eq v0, v2, :cond_7

    .line 29
    .line 30
    const/16 v2, 0x1aa

    .line 31
    .line 32
    if-eq v0, v2, :cond_6

    .line 33
    .line 34
    const/16 v2, 0x1b0

    .line 35
    .line 36
    if-eq v0, v2, :cond_5

    .line 37
    .line 38
    const/16 v2, 0x1b9

    .line 39
    .line 40
    if-eq v0, v2, :cond_4

    .line 41
    .line 42
    const/16 v2, 0x1c0

    .line 43
    .line 44
    if-eq v0, v2, :cond_3

    .line 45
    .line 46
    const/16 v2, 0x1ca

    .line 47
    .line 48
    if-eq v0, v2, :cond_2

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 63
    .line 64
    if-nez p1, :cond_e

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ReminderReference;->new_()Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/ReminderReference;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 134
    .line 135
    .line 136
    move-result-wide v0

    .line 137
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 142
    .line 143
    if-nez p1, :cond_c

    .line 144
    .line 145
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 146
    .line 147
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 148
    .line 149
    if-nez p1, :cond_d

    .line 150
    .line 151
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 152
    .line 153
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 154
    .line 155
    if-nez p1, :cond_e

    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ReminderReference;->new_()Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 162
    .line 163
    :cond_e
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 164
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Reminder$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Reminder;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Reminder;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 v0, 0x34

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/16 v0, 0x35

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/data/ReminderReference;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    const/16 p0, 0x36

    .line 45
    .line 46
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x37

    .line 52
    .line 53
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x38

    .line 59
    .line 60
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    const/16 p1, 0x39

    .line 70
    .line 71
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/core/data/Reminder;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Reminder$1;->serialize(Lcom/p1/mobile/putong/core/data/Reminder;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
