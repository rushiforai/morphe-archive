.class public Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private abandoned:Z

.field public autoDismissTab:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private autoDismissedTab:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private hasRenderByCard:Z

.field private hasRenderByMsg:Z

.field private hasReportExposure:Z

.field private hasReportSvipDlgShow:Z

.field private isFake:Z

.field private isTrack:Z

.field public mediaList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

.field private showTabs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;"
        }
    .end annotation
.end field

.field public startTime:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/util/List;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PushMessageCustom;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasRenderByCard:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasRenderByMsg:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasReportSvipDlgShow:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->abandoned:Z

    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->autoDismissedTab:Ljava/util/List;

    .line 19
    .line 20
    new-instance v1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->autoDismissTab:Ljava/util/List;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->isFake:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->isTrack:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasReportExposure:Z

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->showTabs:Ljava/util/List;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 41
    .line 42
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->mediaList:Ljava/util/List;

    .line 43
    .line 44
    iput-wide p3, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->startTime:J

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public getShowTabs()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->showTabs:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasReportDlg()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasReportSvipDlgShow:Z

    .line 2
    .line 3
    return p0
.end method

.method public hasReportExposure()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasReportExposure:Z

    .line 2
    .line 3
    return p0
.end method

.method public isAbandoned()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->abandoned:Z

    .line 2
    .line 3
    return p0
.end method

.method public isActiveMsg()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    return v1
.end method

.method public isFake()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->isFake:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHasAutoDismissed(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->autoDismissedTab:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isHasRenderByCard()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasRenderByCard:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHasRenderByMsg()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasRenderByMsg:Z

    .line 2
    .line 3
    return p0
.end method

.method public isTabShowed(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->showTabs:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isTrack()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->isTrack:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAbandoned()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->abandoned:Z

    .line 3
    .line 4
    return-void
.end method

.method public setAutoDismissed(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->autoDismissedTab:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setFake(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->isFake:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHasRenderByCard()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasRenderByCard:Z

    .line 3
    .line 4
    return-void
.end method

.method public setHasRenderByMsg()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasRenderByMsg:Z

    .line 3
    .line 4
    return-void
.end method

.method public setReportExposure(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasReportExposure:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSvipDlgShow()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->hasReportSvipDlgShow:Z

    .line 3
    .line 4
    return-void
.end method

.method public setTabShow(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->showTabs:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTrack(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->isTrack:Z

    .line 2
    .line 3
    return-void
.end method
