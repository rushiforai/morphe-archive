.class public Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public afterEnable:Z

.field public afterVideoIndex:I

.field public beforeEnable:Z

.field public beforeVideoIndex:I

.field public isScreen:Z

.field public reason:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

.field public uid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->uid:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->uid:Ljava/lang/String;

    .line 7
    .line 8
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->beforeVideoIndex:I

    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->beforeVideoIndex:I

    .line 11
    .line 12
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->afterVideoIndex:I

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->afterVideoIndex:I

    .line 15
    .line 16
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->beforeEnable:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->beforeEnable:Z

    .line 19
    .line 20
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->afterEnable:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->afterEnable:Z

    .line 23
    .line 24
    iget p1, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->reason:I

    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->getFallbackOrRecoverReason(I)Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->reason:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 31
    .line 32
    return-void
.end method

.method private getFallbackOrRecoverReason(I)Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_UNKNOWN:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_PUBLISH_RECOVER_BY_PERFORMANCE:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_PUBLISH_RECOVER_BY_BANDWIDTH:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_PUBLISH_FALLBACK_BY_PERFORMANCE:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_PUBLISH_FALLBACK_BY_BANDWIDTH:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_SUBSCRIBE_RECOVER_BY_PERFORMANCE:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_SUBSCRIBE_RECOVER_BY_BANDWIDTH:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_SUBSCRIBE_FALLBACK_BY_PERFORMANCE:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_7
    sget-object p0, Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;->FALLBACK_OR_RECOVER_REASON_SUBSCRIBE_FALLBACK_BY_BANDWIDTH:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RemoteStreamSwitch{uid=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->uid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', isScreen=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->isScreen:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', before_video_index=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->beforeVideoIndex:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', after_video_index=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->afterVideoIndex:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', before_enable=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->beforeEnable:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', after_enable=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->afterEnable:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', reason=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;->reason:Lcom/ss/bytertc/engine/type/FallbackOrRecoverReason;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p0, "\'}"

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method
