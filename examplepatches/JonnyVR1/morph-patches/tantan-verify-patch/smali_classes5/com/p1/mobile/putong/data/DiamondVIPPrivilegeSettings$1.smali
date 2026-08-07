.class Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_0
    const/4 v0, 0x4

    .line 31
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    const/4 v0, 0x5

    .line 39
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    const/4 v1, 0x6

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 59
    .line 60
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_7

    .line 13
    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    if-eq v2, v3, :cond_6

    .line 17
    .line 18
    const/16 v3, 0x10

    .line 19
    .line 20
    if-eq v2, v3, :cond_5

    .line 21
    .line 22
    const/16 v3, 0x18

    .line 23
    .line 24
    if-eq v2, v3, :cond_4

    .line 25
    .line 26
    const/16 v3, 0x20

    .line 27
    .line 28
    if-eq v2, v3, :cond_3

    .line 29
    .line 30
    const/16 v3, 0x28

    .line 31
    .line 32
    if-eq v2, v3, :cond_2

    .line 33
    .line 34
    const/16 v3, 0x32

    .line 35
    .line 36
    if-eq v2, v3, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 57
    .line 58
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 59
    .line 60
    if-nez p1, :cond_9

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 80
    .line 81
    iput-object v2, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    goto :goto_0

    .line 107
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 108
    .line 109
    .line 110
    move-result-wide v2

    .line 111
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 115
    .line 116
    .line 117
    move-result-wide v2

    .line 118
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 122
    .line 123
    if-nez p1, :cond_8

    .line 124
    .line 125
    if-eqz v1, :cond_8

    .line 126
    .line 127
    sget-object p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 138
    .line 139
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 140
    .line 141
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 142
    .line 143
    if-nez p1, :cond_9

    .line 144
    .line 145
    sget-object p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 152
    .line 153
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 154
    .line 155
    :cond_9
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x4

    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x5

    .line 32
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x6

    .line 42
    sget-object v0, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$1;->serialize(Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
