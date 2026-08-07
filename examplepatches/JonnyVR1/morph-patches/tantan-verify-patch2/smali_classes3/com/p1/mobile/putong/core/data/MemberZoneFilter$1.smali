.class Lcom/p1/mobile/putong/core/data/MemberZoneFilter$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MemberZoneFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MemberZoneFilter;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x6

    .line 41
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

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
    const/4 v0, 0x7

    .line 49
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    const/16 v0, 0x8

    .line 57
    .line 58
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 59
    .line 60
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    add-int/2addr p0, v0

    .line 65
    const/16 v0, 0x9

    .line 66
    .line 67
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 68
    .line 69
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    const/16 v0, 0xa

    .line 75
    .line 76
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 77
    .line 78
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 84
    .line 85
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;-><init>()V

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
    const/16 v1, 0x8

    .line 11
    .line 12
    if-eq v0, v1, :cond_9

    .line 13
    .line 14
    const/16 v1, 0x10

    .line 15
    .line 16
    if-eq v0, v1, :cond_8

    .line 17
    .line 18
    const/16 v1, 0x18

    .line 19
    .line 20
    if-eq v0, v1, :cond_7

    .line 21
    .line 22
    const/16 v1, 0x20

    .line 23
    .line 24
    if-eq v0, v1, :cond_6

    .line 25
    .line 26
    const/16 v1, 0x28

    .line 27
    .line 28
    if-eq v0, v1, :cond_5

    .line 29
    .line 30
    const/16 v1, 0x30

    .line 31
    .line 32
    if-eq v0, v1, :cond_4

    .line 33
    .line 34
    const/16 v1, 0x38

    .line 35
    .line 36
    if-eq v0, v1, :cond_3

    .line 37
    .line 38
    const/16 v1, 0x40

    .line 39
    .line 40
    if-eq v0, v1, :cond_2

    .line 41
    .line 42
    const/16 v1, 0x48

    .line 43
    .line 44
    if-eq v0, v1, :cond_1

    .line 45
    .line 46
    const/16 v1, 0x50

    .line 47
    .line 48
    if-eq v0, v1, :cond_0

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 119
    .line 120
    goto :goto_0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x6

    .line 32
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x7

    .line 38
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x8

    .line 44
    .line 45
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x9

    .line 51
    .line 52
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 55
    .line 56
    .line 57
    const/16 p0, 0xa

    .line 58
    .line 59
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 60
    .line 61
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter$1;->serialize(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
