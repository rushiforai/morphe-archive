.class public Lcom/p1/mobile/putong/live/LiveServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "LiveService\u670d\u52a1"
    path = "/live_service/service"
.end annotation


# instance fields
.field public a:Ll/yfh0;

.field public b:Ll/e4h;

.field public c:Ll/cvu;

.field public d:Ll/xwk;

.field public volatile e:Ll/ftn0;

.field public volatile f:Ll/j4n0;

.field public volatile g:Ll/ano0;

.field public volatile h:Ll/c8m0;

.field public i:Ll/nam;

.field public j:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/qam;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/g1t;

.field public l:Ll/s1u;

.field public m:Ll/n2t;

.field public n:Ll/ceo;

.field public o:Ll/csp;

.field public p:Ll/m2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nqr;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/nqr;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->p:Ll/m2;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSchema;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->tip:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->schema:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/live/LiveServiceImpl;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->S(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V

    return-void
.end method

.method public static synthetic J(Ll/pf60;)Ll/pf60;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/tantanapp/common/data/ValueObject;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/tantanapp/common/data/ValueObject;

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic K(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/R$string;->d:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic L(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 13
    .line 14
    const v1, 0xa067

    .line 15
    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/R$string;->a:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic M(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;)V
    .locals 1

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;->canEnterTab:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p2, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->KEY_VIDEO_CHAT_PAGE_SOURCE:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p2, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "live_video_chat"

    .line 16
    .line 17
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;->enterFailTip:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static N(Z)Z
    .locals 0

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/android/app/App;->f()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method


# virtual methods
.method public Bq()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->z6()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public C8()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->D6()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public Dr(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "onlive"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Ei(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ep()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->notifyEntryMainPager()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public F8(Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->m(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->l(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p0, p1, p2}, Ll/j6t;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public Fr()V
    .locals 0

    .line 1
    const-string p0, "\u4e3a\u5475\u62a4\u672a\u6210\u5e74\u4eba\u5065\u5eb7\u6210\u957f\uff0c\u63a2\u63a2\u7279\u522b\u63a8\u51fa\u9752\u5c11\u5e74\u6a21\u5f0f\uff0c\u8be5\u6a21\u5f0f\u4e0b\u90e8\u5206\u529f\u80fd\u65e0\u6cd5\u4f7f\u7528\u3002\u8bf7\u76d1\u62a4\u4eba\u4e3b\u52a8\u9009\u62e9\uff0c\u5e76\u8bbe\u7f6e\u76d1\u62a4\u5bc6\u7801"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->X1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Gj(IZ)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/vwt;->r5(IZ)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Gr(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;)Landroid/content/Intent;
    .locals 1
    .param p2    # Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance p0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const-string v0, "live_setting_frag_arg"

    .line 9
    .line 10
    invoke-virtual {p0, v0, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const-string p2, "live_setting_page"

    .line 14
    .line 15
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public He(Ljava/util/HashMap;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">;",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ")V"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/live/base/data/LiveCommonData;

    .line 2
    .line 3
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/LiveCommonData;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/data/LiveCommonData;->profileLiveRooms:Ljava/util/List;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveCommonData;->profileVoiceRooms:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->anchorId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 64
    .line 65
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p2, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    return-void
.end method

.method public Hh()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->e5()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public I6()Ll/j4n0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->f:Ll/j4n0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/k4n0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/k4n0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->f:Ll/j4n0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->f:Ll/j4n0;

    .line 13
    .line 14
    return-object p0
.end method

.method public Ii(Landroid/content/Intent;)Z
    .locals 1

    .line 1
    const-string p0, "tt_live_flag_extra"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public Ir(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->livePushPGCReport(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Kb()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->F6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public L7()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/wya0;->b()Ll/wya0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/wya0;->a()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Lh()Ll/qam;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->j:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x3

    .line 12
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    new-instance v1, Ll/qan0;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/qan0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->j:Ljava/lang/ref/WeakReference;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    new-instance v1, Ll/san0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/san0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->j:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->j:Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Ll/qam;

    .line 50
    .line 51
    return-object p0
.end method

.method public M6()Ll/ftn0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->e:Ll/ftn0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/live/LiveServiceImpl;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->e:Ll/ftn0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/itn0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/itn0;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->e:Ll/ftn0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->e:Ll/ftn0;

    .line 27
    .line 28
    return-object p0
.end method

.method public M7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Ms(Lcom/p1/mobile/android/app/Act;Ll/dq1;)Ll/csp;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->o:Ll/csp;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;-><init>(Lcom/p1/mobile/android/app/Act;Ll/dq1;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->o:Ll/csp;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->o:Ll/csp;

    .line 13
    .line 14
    return-object p0
.end method

.method public Ok()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/bk3;

    .line 14
    .line 15
    iget-object p0, p0, Ll/bk3;->a:Ll/jxd0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    xor-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public Om()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->y6()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/mfd0;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->B5()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public Qc()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->v6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public Qj()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->H6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public final R()Z
    .locals 2

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->x6()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/vwt;->G6()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move p0, v1

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    move p0, v0

    .line 23
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_3

    .line 28
    .line 29
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/vwt;->n7()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_2
    return v1

    .line 39
    :cond_3
    :goto_2
    return v0
.end method

.method public Rh()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->pb()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic S(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xc352

    .line 6
    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getCode()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const p1, 0xc351

    .line 19
    .line 20
    .line 21
    if-ne p0, p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getMsg()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/R$string;->c:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public S8(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/tantanapp/common/data/ValueObject;",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/external/module/api/MyRoomInProfileNewApi;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/api/MyRoomInProfileNewApi;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/MyRoomInProfileNewApi;->getMyRoomInProfileNew(Ljava/lang/String;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ll/xnt;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/xnt;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public Sf()V
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->J()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/uec0;->a:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v2, Ll/idc0;->a:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;

    .line 30
    .line 31
    invoke-direct {v2, p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;-><init>(Lcom/p1/mobile/putong/live/LiveServiceImpl;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;Lcom/p1/mobile/android/app/Dialog;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget p2, Ll/idc0;->b:I

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Lcom/p1/mobile/putong/live/LiveServiceImpl$b;

    .line 48
    .line 49
    invoke-direct {p2, p0, v0}, Lcom/p1/mobile/putong/live/LiveServiceImpl$b;-><init>(Lcom/p1/mobile/putong/live/LiveServiceImpl;Lcom/p1/mobile/android/app/Dialog;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    .line 60
    .line 61
    const/4 p2, 0x0

    .line 62
    invoke-direct {p1, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget p1, Ll/ldc0;->R1:I

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Lv/VText;

    .line 79
    .line 80
    const/4 p1, 0x0

    .line 81
    const/4 p2, 0x1

    .line 82
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public Tc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/jwk0;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Uf(Landroid/content/Context;)Ll/g1t;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->k:Ll/g1t;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->k:Ll/g1t;

    .line 11
    .line 12
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public Vm(Lcom/tantanapp/common/data/ValueObject;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->status:Ljava/lang/String;

    .line 8
    .line 9
    const-string p1, "onlive"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public Xh(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/Intent;
    .locals 2

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->J(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveSchema:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->K(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p0, p1, p2}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public Y8(Lcom/p1/mobile/android/app/Act;ZILl/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->n(Lcom/p1/mobile/android/app/Act;ZILl/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Yk(Ljava/lang/String;)Z
    .locals 2

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->Z4()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p0, :cond_3

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_2
    return v0

    .line 42
    :cond_3
    :goto_0
    const-string p0, "live"

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    xor-int/2addr p0, v0

    .line 49
    return p0
.end method

.method public Ys()Ll/lc3;
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->t()Ll/lc3;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Z8(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/y6u;->x(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Zl(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VoiceLiveState;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/fk3;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Zo()Ll/nam;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->i:Ll/nam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/hrm0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/hrm0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->i:Ll/nam;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->i:Ll/nam;

    .line 13
    .line 14
    return-object p0
.end method

.method public Zr()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->C6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public a()Ll/hbs;
    .locals 0

    .line 1
    invoke-static {}, Ll/ibs;->g()Ll/ibs;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public a7()Ljava/lang/String;
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_2

    .line 7
    .line 8
    sget-object p0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 9
    .line 10
    const-string v0, "taiwan"

    .line 11
    .line 12
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    sget-object p0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 19
    .line 20
    const-string v0, "indonesia"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/vwt;->G4()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    :goto_0
    sget p0, Lcom/p1/mobile/putong/live/R$string;->b:I

    .line 37
    .line 38
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_2
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/vwt;->G4()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public ao(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Ll/mqr;->c()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    sget-object p0, Ll/txp;->Companion:Ll/txp$a;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/txp$a;->c(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public b7()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    new-instance p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public bl()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/f7s;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/gm3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/gm3;->h()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/ynt;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/ynt;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public buildLiveSquareFrag()Landroidx/fragment/app/Fragment;
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 p0, 0x2

    .line 10
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    new-instance p0, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareHomeFragDomestic;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareHomeFragDomestic;-><init>()V

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public c8()I
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->A5()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public ce()Ll/f7s;
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/gm3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/gm3;->h()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 18
    .line 19
    invoke-static {p0}, Ll/erf;->d(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)Ll/f7s;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public co()Ll/ano0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->g:Ll/ano0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/bno0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/bno0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->g:Ll/ano0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->g:Ll/ano0;

    .line 13
    .line 14
    return-object p0
.end method

.method public ek(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p2, v0}, Ll/sfg;->b(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/znt;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/znt;-><init>(Lcom/p1/mobile/putong/live/LiveServiceImpl;Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/aot;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/aot;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public es()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->w6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public feedEntry()Ll/e4h;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->b:Ll/e4h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/f4h;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/f4h;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->b:Ll/e4h;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->b:Ll/e4h;

    .line 13
    .line 14
    return-object p0
.end method

.method public g6(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p0}, Ll/v5k0;->k(Ljava/lang/String;Ll/z20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public g9()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->E6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public ga(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VoiceVirtualApi;->getLiveSchemaStatus(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p2, Ll/bot;

    .line 10
    .line 11
    invoke-direct {p2, p1}, Ll/bot;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/cot;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/cot;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p2, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public getAbHooker()Ll/m2;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->p:Ll/m2;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBubbleConfig()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LiveBubbleConfig;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->j()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/unt;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/unt;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getH5PageApi()Ll/xwk;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->d:Ll/xwk;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ywk;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ywk;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->d:Ll/xwk;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->d:Ll/xwk;

    .line 13
    .line 14
    return-object p0
.end method

.method public getHomeLiveTabPosition()I
    .locals 1

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->R()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, -0x1

    .line 16
    return p0
.end method

.method public getLiveCardText()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->w3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLiveFakeTitle()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vwt;->m4()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public getLiveVerification()Ll/cvu;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->c:Ll/cvu;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/jvu;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/jvu;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->c:Ll/cvu;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->c:Ll/cvu;

    .line 13
    .line 14
    return-object p0
.end method

.method public getTopShowingPageId(Landroidx/fragment/app/Fragment;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->isLiveSquareHome(Landroidx/fragment/app/Fragment;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;->M4()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method public getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qhk0$a;->a(Ll/qhk0;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getUserByIdInModule(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/fk3;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/fk3;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/j6t;->k(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :cond_0
    return-object p0

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public getUserLiveId(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/fk3;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getUserVirtualVoiceId(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/fk3;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public gg()I
    .locals 0

    .line 1
    sget p0, Ll/uec0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public gj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public hasLiveSettingEntry()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->yn()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    invoke-static {}, Ll/mqr;->l()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vwt;->u7()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/mqr;->l()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/vwt;->E3()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    :cond_1
    invoke-static {}, Ll/mqr;->h()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    :cond_2
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_3
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public ih()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->O4()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public isLiveAct(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public isLiveSquareHome(Landroidx/fragment/app/Fragment;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;

    .line 2
    .line 3
    return p0
.end method

.method public isLiving()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/app/Activity;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/j6t;->m(Landroid/app/Activity;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-ne p0, v0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public liveShowMomentLikesAndComments()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->ob()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public lp()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->u6()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public lt(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveState;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/fk3;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveState;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public mg()Ll/s1u;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->l:Ll/s1u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/u1u;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/u1u;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->l:Ll/s1u;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->l:Ll/s1u;

    .line 13
    .line 14
    return-object p0
.end method

.method public ne()V
    .locals 2

    .line 1
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fm3;

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/fm3;->g(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public nf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ll/jwu;->G(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/vnt;

    .line 10
    .line 11
    invoke-direct {v0, p2, p1}, Ll/vnt;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/wnt;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/wnt;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public oj(Landroid/view/View;Ll/bkj0;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/bkj0<",
            "Lcom/tantanapp/common/data/ValueObject;",
            "Lcom/tantanapp/common/data/ValueObject;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;

    .line 6
    .line 7
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->l(Ll/bkj0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public oo()Ll/wfh0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->a:Ll/yfh0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/yfh0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/yfh0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->a:Ll/yfh0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->a:Ll/yfh0;

    .line 13
    .line 14
    return-object p0
.end method

.method public p8()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->B6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public putLiveState(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/fk3;->K(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public qs()Ll/ceo;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->n:Ll/ceo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/beo;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/beo;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->n:Ll/ceo;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->n:Ll/ceo;

    .line 13
    .line 14
    return-object p0
.end method

.method public r9()Ll/c8m0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->h:Ll/c8m0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/j8m0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/j8m0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->h:Ll/c8m0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->h:Ll/c8m0;

    .line 13
    .line 14
    return-object p0
.end method

.method public rb()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->v3()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->b:Ll/e4h;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->c:Ll/cvu;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->j:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->i:Ll/nam;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->k:Ll/g1t;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->n:Ll/ceo;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ll/ceo;->release()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->n:Ll/ceo;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->o:Ll/csp;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ll/csp;->release()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->o:Ll/csp;

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public rh(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const-string p0, "live"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/mbs;->r(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "navigation_live_intent"

    .line 17
    .line 18
    const-string v2, "voice-live"

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "extra_new_main_bundle"

    .line 24
    .line 25
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public rk(Lcom/p1/mobile/putong/data/LiveRegionTag;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/yw0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/tbs;->n(Lcom/p1/mobile/putong/data/LiveRegionTag;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/j6t;->r(Lcom/p1/mobile/putong/data/LiveRegionTag;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public sd()J
    .locals 2

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->w()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public sj()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/R$string;->e:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public startAudienceLive(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)V
    .locals 2

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->live:Lcom/p1/mobile/putong/data/Live;

    .line 8
    .line 9
    invoke-static {v1}, Ll/erf;->e(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveSchema:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->M(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p0, p1, p2}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 53
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v0

    .line 55
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 56
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 57
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    move-result-object p2

    .line 59
    invoke-virtual {p0, p1, p2}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public startLiveVerificationPage(Landroid/content/Context;)V
    .locals 0

    .line 1
    sget-object p0, Ll/efv;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t7()Ll/n2t;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->m:Ll/n2t;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/o2t;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/o2t;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->m:Ll/n2t;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl;->m:Ll/n2t;

    .line 13
    .line 14
    return-object p0
.end method

.method public ub(Lcom/tantanapp/common/data/ValueObject;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->status:Ljava/lang/String;

    .line 8
    .line 9
    const-string p1, "onlive"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public ue(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->M4(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/MyRoomInProfileNewFrag;->M4(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public updateLiveMemberUser(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/fk3;

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Ll/fk3;->S(Lcom/p1/mobile/putong/data/User;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public updateUser(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    return-void
.end method

.method public uq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/jwk0;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public vf(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string p0, "tt_live_flag_extra"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    return-object p1
.end method

.method public wc(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->livePushShown(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public wd(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/j6t;->o(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public yn()Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->A6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->N(Z)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public zn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method
