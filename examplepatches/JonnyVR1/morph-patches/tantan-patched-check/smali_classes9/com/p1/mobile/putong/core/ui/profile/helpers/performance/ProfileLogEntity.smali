.class public Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;
.super Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;,
        Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity<",
        "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;",
        ">;"
    }
.end annotation


# instance fields
.field public durationBegin:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "durationBegin"
    .end annotation
.end field

.field public durationLast:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "durationLast"
    .end annotation
.end field

.field public durationTrace:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "durationTrace"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationLast:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationTrace:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationBegin:J

    .line 11
    .line 12
    return-void
.end method

.method public static builder()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LOG{, logName="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logName:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", type="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->type:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", traceHash="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->traceHash:I

    .line 29
    .line 30
    shr-int/lit8 v1, v1, 0x10

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", bindHash="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->bindHash:I

    .line 41
    .line 42
    shr-int/lit8 v1, v1, 0x10

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, ", durTrace="

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationTrace:J

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v1, ", durLast="

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationLast:J

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, ", durBegin="

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationBegin:J

    .line 73
    .line 74
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, ", des=\'"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logDescription:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string p0, "\'}"

    .line 88
    .line 89
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0
.end method
