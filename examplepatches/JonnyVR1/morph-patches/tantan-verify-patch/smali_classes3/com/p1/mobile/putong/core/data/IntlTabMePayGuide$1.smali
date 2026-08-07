.class Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->showBanner:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->bannerType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->membershipType:Ljava/lang/String;

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
    const/4 v0, 0x4

    .line 29
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->isUpgraded:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->text:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_2
    const/4 v0, 0x6

    .line 49
    iget v1, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->contractIntervalDays:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 57
    .line 58
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;-><init>()V

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
    if-eqz v0, :cond_8

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_7

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_6

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_5

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_4

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_3

    .line 33
    .line 34
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->bannerType:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->bannerType:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->membershipType:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->membershipType:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->text:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 51
    .line 52
    if-nez p1, :cond_b

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;->new_()Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->text:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->contractIntervalDays:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->text:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->isUpgraded:Z

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->membershipType:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->bannerType:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->showBanner:Z

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->bannerType:Ljava/lang/String;

    .line 108
    .line 109
    if-nez p1, :cond_9

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->bannerType:Ljava/lang/String;

    .line 112
    .line 113
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->membershipType:Ljava/lang/String;

    .line 114
    .line 115
    if-nez p1, :cond_a

    .line 116
    .line 117
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->membershipType:Ljava/lang/String;

    .line 118
    .line 119
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->text:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 120
    .line 121
    if-nez p1, :cond_b

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;->new_()Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->text:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 128
    .line 129
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

    .line 130
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->showBanner:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->bannerType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->membershipType:Ljava/lang/String;

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
    const/4 p0, 0x4

    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->isUpgraded:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->text:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    const/4 p0, 0x6

    .line 40
    iget p1, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->contractIntervalDays:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
