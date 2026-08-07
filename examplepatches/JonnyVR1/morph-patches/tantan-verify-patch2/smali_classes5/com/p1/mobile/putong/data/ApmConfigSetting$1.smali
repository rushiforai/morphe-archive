.class Lcom/p1/mobile/putong/data/ApmConfigSetting$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/ApmConfigSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/ApmConfigSetting;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/ApmConfigSetting;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    const/4 v0, 0x2

    .line 13
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    const/4 v0, 0x3

    .line 21
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 22
    .line 23
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    const/4 v0, 0x4

    .line 29
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/4 v0, 0x5

    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    const/4 v0, 0x6

    .line 45
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    const/4 v0, 0x7

    .line 53
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 54
    .line 55
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    const/16 v0, 0x8

    .line 61
    .line 62
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 63
    .line 64
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/2addr p0, v0

    .line 69
    const/16 v0, 0x9

    .line 70
    .line 71
    iget v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 72
    .line 73
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 79
    .line 80
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/ApmConfigSetting$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/ApmConfigSetting;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/ApmConfigSetting;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/ApmConfigSetting;-><init>()V

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
    const/16 v2, 0xa

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
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_3

    .line 37
    .line 38
    const/16 v2, 0x38

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
    const/16 v2, 0x48

    .line 47
    .line 48
    if-eq v0, v2, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_a

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 100
    .line 101
    .line 102
    move-result-wide v0

    .line 103
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 121
    .line 122
    if-nez p1, :cond_a

    .line 123
    .line 124
    iput-object v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 125
    .line 126
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

    .line 127
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/ApmConfigSetting$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/ApmConfigSetting;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/ApmConfigSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 p0, 0x2

    .line 10
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x4

    .line 22
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x5

    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x6

    .line 34
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x7

    .line 40
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 43
    .line 44
    .line 45
    const/16 p0, 0x8

    .line 46
    .line 47
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 48
    .line 49
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 50
    .line 51
    .line 52
    const/16 p0, 0x9

    .line 53
    .line 54
    iget p1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 55
    .line 56
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/ApmConfigSetting$1;->serialize(Lcom/p1/mobile/putong/data/ApmConfigSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
