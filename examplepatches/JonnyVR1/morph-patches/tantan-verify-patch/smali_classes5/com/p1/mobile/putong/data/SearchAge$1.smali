.class Lcom/p1/mobile/putong/data/SearchAge$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/SearchAge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/SearchAge;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/SearchAge;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

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
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 59
    .line 60
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/data/SearchAge;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SearchAge$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/SearchAge;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SearchAge;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance v0, Lcom/p1/mobile/putong/data/SearchAge;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SearchAge;-><init>()V

    .line 9
    .line 10
    .line 11
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_7

    .line 16
    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    if-eq v1, v2, :cond_6

    .line 20
    .line 21
    const/16 v2, 0x10

    .line 22
    .line 23
    if-eq v1, v2, :cond_5

    .line 24
    .line 25
    const/16 v2, 0x18

    .line 26
    .line 27
    if-eq v1, v2, :cond_4

    .line 28
    .line 29
    const/16 v2, 0x20

    .line 30
    .line 31
    if-eq v1, v2, :cond_3

    .line 32
    .line 33
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 38
    .line 39
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 44
    .line 45
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 46
    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 50
    .line 51
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 52
    .line 53
    if-nez p1, :cond_b

    .line 54
    .line 55
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 103
    .line 104
    if-nez p1, :cond_8

    .line 105
    .line 106
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 107
    .line 108
    :cond_8
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 109
    .line 110
    if-nez p1, :cond_9

    .line 111
    .line 112
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 113
    .line 114
    :cond_9
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 115
    .line 116
    if-nez p1, :cond_a

    .line 117
    .line 118
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 119
    .line 120
    :cond_a
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 121
    .line 122
    if-nez p1, :cond_b

    .line 123
    .line 124
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 125
    .line 126
    :cond_b
    return-object v0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SearchAge$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SearchAge;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/SearchAge;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 p1, 0x4

    .line 42
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 47
    .line 48
    .line 49
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/data/SearchAge;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/SearchAge$1;->serialize(Lcom/p1/mobile/putong/data/SearchAge;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
