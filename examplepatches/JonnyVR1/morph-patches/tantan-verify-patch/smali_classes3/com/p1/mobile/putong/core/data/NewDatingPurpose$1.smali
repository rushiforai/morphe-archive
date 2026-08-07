.class Lcom/p1/mobile/putong/core/data/NewDatingPurpose$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/NewDatingPurpose;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/NewDatingPurpose;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NewDatingPurpose;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    const/4 v0, 0x3

    .line 27
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    const/4 v0, 0x4

    .line 35
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    const/4 v0, 0x5

    .line 43
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 78
    .line 79
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    const/16 v1, 0xa

    .line 89
    .line 90
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 96
    .line 97
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NewDatingPurpose;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NewDatingPurpose;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 31
    .line 32
    return-object p0

    .line 33
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :sswitch_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ljava/util/List;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 112
    .line 113
    if-nez p1, :cond_1

    .line 114
    .line 115
    new-instance p1, Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 121
    .line 122
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p1, :cond_2

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 127
    .line 128
    :cond_2
    return-object p0

    .line 129
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x10 -> :sswitch_8
        0x18 -> :sswitch_7
        0x20 -> :sswitch_6
        0x28 -> :sswitch_5
        0x30 -> :sswitch_4
        0x38 -> :sswitch_3
        0x40 -> :sswitch_2
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

    .line 129
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/NewDatingPurpose;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x3

    .line 22
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x4

    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x5

    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x6

    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x7

    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x8

    .line 52
    .line 53
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x9

    .line 59
    .line 60
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    const/16 p1, 0xa

    .line 70
    .line 71
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
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

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose$1;->serialize(Lcom/p1/mobile/putong/core/data/NewDatingPurpose;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
