.class public Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/live/eventbus/LiveEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MultiCallEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/live/eventbus/LiveEventBus;


# direct methods
.method public constructor <init>(Lcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public addWatchList()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_13"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public announcementData()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_30"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public applyData()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/util/List;",
            "Lrx/c<",
            "Ljava/util/List;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_11"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public cancelLeadRole()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/v7t;",
            "Lrx/c<",
            "Ll/v7t;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_27"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public changeTab()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_2"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public clickBottomPkIcon()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_31"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public clickPkBoard()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Landroid/util/Pair;",
            "Lrx/c<",
            "Landroid/util/Pair;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_33"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public clickPkCreateSetting()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_32"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public clickPkOver()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/util/List;",
            "Lrx/c<",
            "Ljava/util/List;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_34"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public clickPkSettingChange()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_35"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public closeAcceptDlg()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_18"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public closeMultiCallMotion()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_4"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public deputyCountChange()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_24"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public hangUpSelfCall()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_17"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public hasGetMultiCallList()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_8"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public inviteList()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/util/List;",
            "Lrx/c<",
            "Ljava/util/List;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_3"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openApplyDlg()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_7"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openCallingOperateDialog()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_5"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openManageDialog()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_1"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openMatchStayDlg()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_22"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openMultiCallWithTab()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_21"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public prepareCloseMultiCall()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_10"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public receiveInviteLeadRoleMessage()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallSwitchToLeadRoleInviteMessage;",
            "Lrx/c<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallSwitchToLeadRoleInviteMessage;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_25"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public refreshCallView()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_20"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public selfLeaveCall()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_16"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public showAnnouncementDlg()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_29"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public showAudienceApplyIcon()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_9"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public showMultiCallUpgradeEntryDlg()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_28"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public startLiveMultiCall()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/ep10;",
            "Lrx/c<",
            "Ll/ep10;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_12"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public switchDeputyCount()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_23"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public switchToLeadRole()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_26"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public switchToVideo()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_19"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public topViewVisible()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_15"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public updateMemberVolume()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_6"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public updateMultiCall()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_14"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public updateSelfCall()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "93_0"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
