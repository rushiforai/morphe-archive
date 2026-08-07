.class Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p0, v0

    .line 29
    :cond_1
    const/16 v0, 0x34

    .line 30
    .line 31
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    const/16 v0, 0x35

    .line 39
    .line 40
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 41
    .line 42
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    add-int/2addr p0, v0

    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    const/16 v1, 0x36

    .line 52
    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_2
    const/16 v0, 0x37

    .line 59
    .line 60
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 61
    .line 62
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    add-int/2addr p0, v0

    .line 67
    const/16 v0, 0x38

    .line 68
    .line 69
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 70
    .line 71
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    const/16 v0, 0x39

    .line 77
    .line 78
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 79
    .line 80
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 86
    .line 87
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;-><init>()V

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
    const/16 v2, 0x19a

    .line 23
    .line 24
    if-eq v0, v2, :cond_7

    .line 25
    .line 26
    const/16 v2, 0x1a1

    .line 27
    .line 28
    if-eq v0, v2, :cond_6

    .line 29
    .line 30
    const/16 v2, 0x1a9

    .line 31
    .line 32
    if-eq v0, v2, :cond_5

    .line 33
    .line 34
    const/16 v2, 0x1b2

    .line 35
    .line 36
    if-eq v0, v2, :cond_4

    .line 37
    .line 38
    const/16 v2, 0x1b8

    .line 39
    .line 40
    if-eq v0, v2, :cond_3

    .line 41
    .line 42
    const/16 v2, 0x1c0

    .line 43
    .line 44
    if-eq v0, v2, :cond_2

    .line 45
    .line 46
    const/16 v2, 0x1c8

    .line 47
    .line 48
    if-eq v0, v2, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_c

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 78
    .line 79
    .line 80
    move-result-wide v0

    .line 81
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 92
    .line 93
    .line 94
    move-result-wide v0

    .line 95
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 99
    .line 100
    .line 101
    move-result-wide v0

    .line 102
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 120
    .line 121
    .line 122
    move-result-wide v0

    .line 123
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 127
    .line 128
    if-nez p1, :cond_b

    .line 129
    .line 130
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 131
    .line 132
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 133
    .line 134
    if-nez p1, :cond_c

    .line 135
    .line 136
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 137
    .line 138
    :cond_c
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/16 p0, 0x34

    .line 25
    .line 26
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 29
    .line 30
    .line 31
    const/16 p0, 0x35

    .line 32
    .line 33
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 34
    .line 35
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    const/16 v0, 0x36

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    const/16 p0, 0x37

    .line 48
    .line 49
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 52
    .line 53
    .line 54
    const/16 p0, 0x38

    .line 55
    .line 56
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0x39

    .line 62
    .line 63
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 64
    .line 65
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$1;->serialize(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
