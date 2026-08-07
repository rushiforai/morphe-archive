.class public Ll/vit;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/qit;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public k:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public l:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "LiveRoomSuggestExitRetainDialog_show_time"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-wide/16 v2, 0x0

    .line 27
    .line 28
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/vit;->j:Ll/byd0;

    .line 36
    .line 37
    new-instance v0, Ll/vxd0;

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "LiveRoomSuggestExitRetainDialog_show_count"

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ll/vit;->k:Ll/vxd0;

    .line 64
    .line 65
    new-instance v0, Ll/qit;

    .line 66
    .line 67
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    invoke-direct {v0, p1, p0}, Ll/qit;-><init>(Lcom/p1/mobile/android/app/Act;Ll/vit;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static synthetic S3(Ll/vit;Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vit;->X3(Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V

    return-void
.end method

.method public static synthetic T3(Ll/vit;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vit;->Y3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic U3(Ll/vit;Ll/nfd0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vit;->Z3(Ll/nfd0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public P3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/vit;->l:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/i6t;->m3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const-string v1, ""

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/i6t;->m3()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    :goto_0
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->M5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/tit;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/tit;-><init>(Ll/vit;)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Ll/uit;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/uit;-><init>(Ll/vit;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->clickClose()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 2

    .line 1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->C(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->expendToFullLive()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const-string v0, "live-quit-popup"

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p1, p2}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->giftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->giftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;

    .line 20
    .line 21
    const-string v1, "e_live_exit_popup_toast"

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->eid:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->giftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;

    .line 30
    .line 31
    const-string v1, "p_live_exit_popup"

    .line 32
    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->pid:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CustomToastEvent:Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;->showCustomToast()Ll/v3f$d;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->giftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p0, Ll/qit;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/qit;->M(Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic Y3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 22
    .line 23
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/qit;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-virtual {p0, p1}, Ll/qit;->I(Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic Z3(Ll/nfd0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vit;->a4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public a4()Z
    .locals 9

    .line 1
    iget-boolean v0, p0, Ll/vit;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    sget-object v0, Ll/ljd0;->r:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v2, "LiveRoomSuggestExitRetainDialog"

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Ll/ljd0;->r:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/vwt;->f5()Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_9

    .line 35
    .line 36
    iget-boolean v3, v0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->on:Z

    .line 37
    .line 38
    if-nez v3, :cond_2

    .line 39
    .line 40
    goto/16 :goto_3

    .line 41
    .line 42
    :cond_2
    iget-object v3, p0, Ll/vit;->j:Ll/byd0;

    .line 43
    .line 44
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Ljava/lang/Long;

    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    iget-object v5, p0, Ll/vit;->k:Ll/vxd0;

    .line 55
    .line 56
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    invoke-static {}, Ll/pzi0;->n()J

    .line 67
    .line 68
    .line 69
    move-result-wide v6

    .line 70
    cmp-long v3, v3, v6

    .line 71
    .line 72
    const/4 v4, 0x1

    .line 73
    if-nez v3, :cond_4

    .line 74
    .line 75
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->popupLimit:I

    .line 76
    .line 77
    if-ge v5, v3, :cond_3

    .line 78
    .line 79
    move v3, v4

    .line 80
    goto :goto_0

    .line 81
    :cond_3
    const-string p0, "\u5f39\u7684\u6b21\u6570\u8d85\u4e86"

    .line 82
    .line 83
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return v1

    .line 87
    :cond_4
    move v3, v1

    .line 88
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->i()I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    iget v6, v0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->watchLiveCount:I

    .line 97
    .line 98
    if-le v5, v6, :cond_5

    .line 99
    .line 100
    const-string p0, "\u89c2\u770b\u7684\u623f\u95f4\u6570\u8d85\u4e86"

    .line 101
    .line 102
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return v1

    .line 106
    :cond_5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-virtual {v5}, Ll/oo2;->v1()J

    .line 111
    .line 112
    .line 113
    move-result-wide v5

    .line 114
    iget v7, v0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->watchLiveDuration:I

    .line 115
    .line 116
    int-to-long v7, v7

    .line 117
    cmp-long v5, v5, v7

    .line 118
    .line 119
    if-gtz v5, :cond_8

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->k(I)J

    .line 126
    .line 127
    .line 128
    move-result-wide v5

    .line 129
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->watchLiveDuration:I

    .line 130
    .line 131
    mul-int/lit16 v0, v0, 0x3e8

    .line 132
    .line 133
    int-to-long v7, v0

    .line 134
    cmp-long v0, v5, v7

    .line 135
    .line 136
    if-lez v0, :cond_6

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 140
    .line 141
    check-cast v0, Ll/qit;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 144
    .line 145
    .line 146
    sput-object v2, Ll/ljd0;->r:Ljava/lang/String;

    .line 147
    .line 148
    iget-object v0, p0, Ll/vit;->k:Ll/vxd0;

    .line 149
    .line 150
    if-eqz v3, :cond_7

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    check-cast v1, Ljava/lang/Integer;

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    add-int/2addr v1, v4

    .line 163
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_7
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    :goto_1
    iget-object p0, p0, Ll/vit;->j:Ll/byd0;

    .line 179
    .line 180
    invoke-static {}, Ll/pzi0;->n()J

    .line 181
    .line 182
    .line 183
    move-result-wide v0

    .line 184
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    return v4

    .line 192
    :cond_8
    :goto_2
    const-string p0, "\u89c2\u770b\u65f6\u95f4\u8d85\u4e86"

    .line 193
    .line 194
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    return v1

    .line 198
    :cond_9
    :goto_3
    const-string p0, "livesetting\u5f00\u5173false"

    .line 199
    .line 200
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return v1
.end method

.method public b4(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/qit;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/qit;->L(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/vit;->l:Z

    .line 6
    .line 7
    new-instance v0, Ll/sit;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/sit;-><init>(Ll/vit;)V

    .line 10
    .line 11
    .line 12
    const-class v1, Ll/nfd0;

    .line 13
    .line 14
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
