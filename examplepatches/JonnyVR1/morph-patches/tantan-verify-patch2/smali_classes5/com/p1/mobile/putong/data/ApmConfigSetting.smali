.class public Lcom/p1/mobile/putong/data/ApmConfigSetting;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/ApmConfigSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/ApmConfigSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "apmconfigsetting"


# instance fields
.field public configName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public cpuModuleInterval:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public cpuModuleStartDelay:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public cpuSamplingMaxTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public enableCpuReport:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public enableMemoryReport:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public memoryModuleInterval:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public memoryModuleStartDelay:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public memorySamplingMaxTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/ApmConfigSetting$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ApmConfigSetting$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/ApmConfigSetting$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ApmConfigSetting$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/ApmConfigSetting;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ApmConfigSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/ApmConfigSetting;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ApmConfigSetting;->clone()Lcom/p1/mobile/putong/data/ApmConfigSetting;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/ApmConfigSetting;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ApmConfigSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 37
    .line 38
    iget p0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 39
    .line 40
    iput p0, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 41
    .line 42
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ApmConfigSetting;->clone()Lcom/p1/mobile/putong/data/ApmConfigSetting;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 38
    .line 39
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 40
    .line 41
    cmp-long v1, v3, v5

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 46
    .line 47
    iget v3, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 52
    .line 53
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 58
    .line 59
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 60
    .line 61
    cmp-long v1, v3, v5

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 66
    .line 67
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 68
    .line 69
    cmp-long v1, v3, v5

    .line 70
    .line 71
    if-nez v1, :cond_2

    .line 72
    .line 73
    iget p0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 74
    .line 75
    iget p1, p1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 76
    .line 77
    if-ne p0, p1, :cond_2

    .line 78
    .line 79
    return v0

    .line 80
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "apmconfigsetting"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :goto_0
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x29

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 21
    .line 22
    const/16 v2, 0x4d5

    .line 23
    .line 24
    const/16 v3, 0x4cf

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    move v1, v3

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 35
    .line 36
    const/16 v1, 0x20

    .line 37
    .line 38
    ushr-long v6, v4, v1

    .line 39
    .line 40
    xor-long/2addr v4, v6

    .line 41
    long-to-int v4, v4

    .line 42
    add-int/2addr v0, v4

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 46
    .line 47
    ushr-long v6, v4, v1

    .line 48
    .line 49
    xor-long/2addr v4, v6

    .line 50
    long-to-int v4, v4

    .line 51
    add-int/2addr v0, v4

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget v4, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 55
    .line 56
    add-int/2addr v0, v4

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-boolean v4, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 60
    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    move v2, v3

    .line 64
    :cond_2
    add-int/2addr v0, v2

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 68
    .line 69
    ushr-long v4, v2, v1

    .line 70
    .line 71
    xor-long/2addr v2, v4

    .line 72
    long-to-int v2, v2

    .line 73
    add-int/2addr v0, v2

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 77
    .line 78
    ushr-long v4, v2, v1

    .line 79
    .line 80
    xor-long v1, v2, v4

    .line 81
    .line 82
    long-to-int v1, v1

    .line 83
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 87
    .line 88
    add-int/2addr v0, v1

    .line 89
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 90
    .line 91
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
