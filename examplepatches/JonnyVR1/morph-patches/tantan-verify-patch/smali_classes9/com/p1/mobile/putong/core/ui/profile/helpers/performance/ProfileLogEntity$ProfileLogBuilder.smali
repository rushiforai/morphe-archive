.class public Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;
.super Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProfileLogBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder<",
        "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;",
        "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;
    .locals 0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;->build()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->build()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logDescription:Ljava/lang/String;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logName:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;->description()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logDescription:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;->newInstance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;

    move-result-object p0

    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
