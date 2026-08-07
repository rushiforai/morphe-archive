.class Lcom/p1/mobile/putong/feed/data/MusicCategory$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/MusicCategory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/MusicCategory;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MusicCategory;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/16 v1, 0x34

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->icon:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/16 v1, 0x35

    .line 29
    .line 30
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    add-int/2addr p0, v0

    .line 35
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    const/16 v1, 0x36

    .line 40
    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->type:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/16 v1, 0x37

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p0, v0

    .line 57
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 58
    .line 59
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MusicCategory$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MusicCategory;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MusicCategory;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MusicCategory;-><init>()V

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
    const/16 v2, 0x19a

    .line 15
    .line 16
    if-eq v0, v2, :cond_8

    .line 17
    .line 18
    const/16 v2, 0x1a2

    .line 19
    .line 20
    if-eq v0, v2, :cond_7

    .line 21
    .line 22
    const/16 v2, 0x1aa

    .line 23
    .line 24
    if-eq v0, v2, :cond_6

    .line 25
    .line 26
    const/16 v2, 0x1b2

    .line 27
    .line 28
    if-eq v0, v2, :cond_5

    .line 29
    .line 30
    const/16 v2, 0x1ba

    .line 31
    .line 32
    if-eq v0, v2, :cond_4

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->id:Ljava/lang/String;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->id:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->icon:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->icon:Ljava/lang/String;

    .line 51
    .line 52
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 57
    .line 58
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->type:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_e

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->type:Ljava/lang/String;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->type:Ljava/lang/String;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->icon:Ljava/lang/String;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->id:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->id:Ljava/lang/String;

    .line 101
    .line 102
    if-nez p1, :cond_a

    .line 103
    .line 104
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->id:Ljava/lang/String;

    .line 105
    .line 106
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 107
    .line 108
    if-nez p1, :cond_b

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 111
    .line 112
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->icon:Ljava/lang/String;

    .line 113
    .line 114
    if-nez p1, :cond_c

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->icon:Ljava/lang/String;

    .line 117
    .line 118
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 119
    .line 120
    if-nez p1, :cond_d

    .line 121
    .line 122
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 123
    .line 124
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->type:Ljava/lang/String;

    .line 125
    .line 126
    if-nez p1, :cond_e

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->type:Ljava/lang/String;

    .line 129
    .line 130
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

    .line 131
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MusicCategory$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MusicCategory;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/MusicCategory;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/16 v0, 0x34

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->icon:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/16 v0, 0x35

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const/16 v0, 0x36

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->type:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/16 p1, 0x37

    .line 42
    .line 43
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 44
    .line 45
    .line 46
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

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MusicCategory$1;->serialize(Lcom/p1/mobile/putong/feed/data/MusicCategory;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
