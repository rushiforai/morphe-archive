.class public Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;
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
            "Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivepacketsystemcommentstatus"


# instance fields
.field public process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public show:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public canCountdown()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->show:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->start:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->show:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->show:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 29
    .line 30
    :cond_1
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->show:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->show:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivepacketsystemcommentstatus"

    .line 2
    .line 3
    return-object p0
.end method

.method public getCountdownProgress(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->totalDurationMs:I

    .line 4
    .line 5
    if-le p1, p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    if-nez p0, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    int-to-float p1, p1

    .line 15
    int-to-float p0, p0

    .line 16
    div-float/2addr p1, p0

    .line 17
    return p1
.end method

.method public getCountdownText()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->start:Z

    .line 4
    .line 5
    const-string v2, "s"

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 15
    .line 16
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->durationMs:I

    .line 17
    .line 18
    div-int/lit16 p0, p0, 0x3e8

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->durationMs:I

    .line 32
    .line 33
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->totalDurationMs:I

    .line 34
    .line 35
    if-gt v1, v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->durationMs:I

    .line 45
    .line 46
    div-int/lit16 p0, p0, 0x3e8

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    const-string p0, "0s"

    .line 60
    .line 61
    return-object p0
.end method

.method public getCurrentCountdownProgress()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->durationMs:I

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->totalDurationMs:I

    .line 6
    .line 7
    if-le v0, p0, :cond_0

    .line 8
    .line 9
    const/high16 p0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    if-nez p0, :cond_1

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    int-to-float v0, v0

    .line 17
    int-to-float p0, p0

    .line 18
    div-float/2addr v0, p0

    .line 19
    return v0
.end method

.method public getCurrentScoreProgress()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->goal:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->current:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    int-to-float v0, v0

    .line 13
    div-float/2addr p0, v0

    .line 14
    return p0
.end method

.method public getCurrentScoreString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 7
    .line 8
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->current:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "/"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->goal:I

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public getResetCountdownText()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->totalDurationMs:I

    .line 9
    .line 10
    div-int/lit16 p0, p0, 0x3e8

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "s"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getResetScoreString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "0/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->goal:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public hashCode()I
    .locals 3

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->show:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0x4cf

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v1, 0x4d5

    .line 15
    .line 16
    :goto_0
    add-int/2addr v0, v1

    .line 17
    mul-int/lit8 v0, v0, 0x29

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v1, v2

    .line 30
    :goto_1
    add-int/2addr v0, v1

    .line 31
    mul-int/lit8 v0, v0, 0x29

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    :cond_2
    add-int/2addr v0, v2

    .line 42
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 43
    .line 44
    :cond_3
    return v0
.end method

.method public isReachRewards()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->current:I

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->goal:I

    .line 6
    .line 7
    if-lt v0, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->ticker:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusTicker;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->process:Lcom/p1/mobile/putong/live/base/data/BLivePacketStatusProgress;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
