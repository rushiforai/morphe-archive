.class Lcom/p1/mobile/putong/core/data/MessageFilterConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MessageFilterConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MessageFilterConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageFilterConfig;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelParams;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    const/4 v0, 0x2

    .line 19
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    const/4 v0, 0x3

    .line 27
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    const/4 v0, 0x4

    .line 35
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    const/4 v0, 0x6

    .line 51
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    const/4 v0, 0x7

    .line 59
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

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
    const/16 v0, 0x9

    .line 76
    .line 77
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 85
    .line 86
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageFilterConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageFilterConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;-><init>()V

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
    const/16 v1, 0xa

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
    const/16 v1, 0x30

    .line 33
    .line 34
    if-eq v0, v1, :cond_3

    .line 35
    .line 36
    const/16 v1, 0x38

    .line 37
    .line 38
    if-eq v0, v1, :cond_2

    .line 39
    .line 40
    const/16 v1, 0x40

    .line 41
    .line 42
    if-eq v0, v1, :cond_1

    .line 43
    .line 44
    const/16 v1, 0x48

    .line 45
    .line 46
    if-eq v0, v1, :cond_0

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 49
    .line 50
    if-nez p1, :cond_a

    .line 51
    .line 52
    new-instance p1, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelParams;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Ljava/util/List;

    .line 127
    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 132
    .line 133
    if-nez p1, :cond_a

    .line 134
    .line 135
    new-instance p1, Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 141
    .line 142
    :cond_a
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MessageFilterConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelParams;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x2

    .line 16
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x3

    .line 22
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x4

    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x5

    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x6

    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x7

    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x8

    .line 52
    .line 53
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x9

    .line 59
    .line 60
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

    .line 61
    .line 62
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/MessageFilterConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
