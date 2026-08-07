.class Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

.field final synthetic val$data:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

.field final synthetic val$user:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/os/Handler;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;->this$0:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;->val$data:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;->val$user:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 8

    .line 1
    const/4 p2, -0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;->this$0:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->I0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)Ll/dzl;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;->val$data:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {p1, p2, v1, v1, v0}, Ll/dzl;->b(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;->val$user:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    const/4 v6, 0x0

    .line 32
    const/4 v7, 0x0

    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;->this$0:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->J0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)Ll/w30;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
