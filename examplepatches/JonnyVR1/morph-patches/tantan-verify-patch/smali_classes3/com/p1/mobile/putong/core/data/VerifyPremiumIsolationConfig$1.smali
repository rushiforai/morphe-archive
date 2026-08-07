.class Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x6

    .line 51
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    const/4 v1, 0x7

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_1
    const/16 v0, 0x8

    .line 67
    .line 68
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 69
    .line 70
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/2addr p0, v0

    .line 75
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 76
    .line 77
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;-><init>()V

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
    if-eqz v0, :cond_9

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_8

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_7

    .line 21
    .line 22
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_6

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_5

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_4

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_3

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_2

    .line 41
    .line 42
    const/16 v2, 0x40

    .line 43
    .line 44
    if-eq v0, v2, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    new-instance p1, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 56
    .line 57
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_b

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ljava/util/List;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 129
    .line 130
    if-nez p1, :cond_a

    .line 131
    .line 132
    new-instance p1, Ljava/util/ArrayList;

    .line 133
    .line 134
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .line 136
    .line 137
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 138
    .line 139
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 140
    .line 141
    if-nez p1, :cond_b

    .line 142
    .line 143
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 144
    .line 145
    :cond_b
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x6

    .line 42
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const/4 v0, 0x7

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    const/16 p0, 0x8

    .line 54
    .line 55
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 56
    .line 57
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
