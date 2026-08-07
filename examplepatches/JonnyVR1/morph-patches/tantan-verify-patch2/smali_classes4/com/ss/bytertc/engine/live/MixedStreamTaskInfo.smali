.class public Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private targetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

.field private taskId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->taskId:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->PUSH_TO_CDN:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->targetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 11
    .line 12
    return-void
.end method

.method public static from(Ljava/lang/String;I)Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eq p1, v1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->PUSH_TO_CDN:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->setTargetType(Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;)Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object p1, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->PUSH_TO_WTN:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->setTargetType(Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;)Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object p1, Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;->PUSH_TO_CDN:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->setTargetType(Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;)Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->setTaskId(Ljava/lang/String;)Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;

    .line 29
    .line 30
    .line 31
    return-object v0
.end method


# virtual methods
.method public getTargetType()Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->targetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTaskId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->taskId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTargetType(Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;)Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->targetType:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTaskId(Ljava/lang/String;)Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;->taskId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
