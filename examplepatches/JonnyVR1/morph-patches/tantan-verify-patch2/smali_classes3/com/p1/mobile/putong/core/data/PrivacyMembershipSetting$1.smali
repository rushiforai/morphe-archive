.class Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x5

    .line 63
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 73
    .line 74
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;-><init>()V

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
    if-eqz v0, :cond_9

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_8

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    if-eq v0, v1, :cond_7

    .line 19
    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    if-eq v0, v1, :cond_6

    .line 23
    .line 24
    const/16 v1, 0x20

    .line 25
    .line 26
    if-eq v0, v1, :cond_5

    .line 27
    .line 28
    const/16 v1, 0x28

    .line 29
    .line 30
    if-eq v0, v1, :cond_4

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 49
    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 63
    .line 64
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 65
    .line 66
    if-nez p1, :cond_e

    .line 67
    .line 68
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 129
    .line 130
    if-nez p1, :cond_a

    .line 131
    .line 132
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 133
    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 135
    .line 136
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 137
    .line 138
    if-nez p1, :cond_b

    .line 139
    .line 140
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 143
    .line 144
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 145
    .line 146
    if-nez p1, :cond_c

    .line 147
    .line 148
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 149
    .line 150
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 151
    .line 152
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 153
    .line 154
    if-nez p1, :cond_d

    .line 155
    .line 156
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 157
    .line 158
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 159
    .line 160
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 161
    .line 162
    if-nez p1, :cond_e

    .line 163
    .line 164
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 165
    .line 166
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 167
    .line 168
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

    .line 169
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 p1, 0x5

    .line 54
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 59
    .line 60
    .line 61
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

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting$1;->serialize(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
