.class Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    const/4 v0, 0x5

    .line 41
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x6

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    const/4 v0, 0x7

    .line 59
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 67
    .line 68
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;-><init>()V

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
    if-eqz v0, :cond_a

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_9

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_8

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_7

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_6

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_5

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_4

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_3

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->new_()Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_e

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 125
    .line 126
    if-nez p1, :cond_b

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 129
    .line 130
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 131
    .line 132
    if-nez p1, :cond_c

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 135
    .line 136
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 137
    .line 138
    if-nez p1, :cond_d

    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->new_()Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 145
    .line 146
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 147
    .line 148
    if-nez p1, :cond_e

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 151
    .line 152
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

    .line 153
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    const/4 p0, 0x5

    .line 34
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

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
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 49
    .line 50
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 51
    .line 52
    .line 53
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
