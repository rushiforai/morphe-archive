.class public Ll/une0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/wne0;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/une0;->j:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance p1, Ll/wne0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/wne0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic S3(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/une0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    return-void
.end method

.method public static synthetic T3(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/une0;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;)V

    return-void
.end method

.method public static synthetic U3(Ll/une0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/une0;->j4()V

    return-void
.end method

.method public static synthetic V3(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/une0;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W3(Ll/une0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/une0;->m4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic X3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y3(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/une0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Z3(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/une0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/util/List;)V

    return-void
.end method

.method private synthetic m4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/une0;->k:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/vp20;->r()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/eb20;->b()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/une0;->n4()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public final a4()Z
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CHAT_INPUT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->FAST_RECHARGE:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 8
    .line 9
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 10
    .line 11
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT_REMINDER:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 12
    .line 13
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->MEMBER:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 14
    .line 15
    sget-object v6, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->USER_CARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 16
    .line 17
    sget-object v7, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 18
    .line 19
    sget-object v8, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->FOLLOW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 20
    .line 21
    sget-object v9, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->HOUR_LEADER_BOARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    sget-object v10, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->SIGN_IN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 24
    .line 25
    filled-new-array/range {v1 .. v10}, [Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/t8s;->l([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/vp20;->s()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const/4 p0, 0x0

    .line 47
    return p0

    .line 48
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 49
    return p0
.end method

.method public final b4(J)Z
    .locals 4

    .line 1
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/civ;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/civ;->m()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/civ;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/civ;->m()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    sub-long/2addr v0, v2

    .line 34
    cmp-long p0, v0, p1

    .line 35
    .line 36
    if-lez p0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public final c4(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final d4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/une0;->a4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, "\u548c\u5176\u4ed6\u529f\u80fd\u51b2\u7a81\u4e86\uff0c\u9001\u793c\u5f15\u5bfc\u4e0d\u5f39\u51fa"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/une0;->c4(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 38
    .line 39
    invoke-static {v0, v1, v2, v3}, Ll/aiv;->R0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/sne0;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Ll/sne0;-><init>(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/une0;->j:Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/wne0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/wne0;->isShowing()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Ll/une0;->j:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->isFromLongLink:Z

    .line 37
    .line 38
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    check-cast p0, Ll/wne0;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/wne0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    check-cast p0, Ll/wne0;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/wne0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public f4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/bae0$a;

    .line 18
    .line 19
    const/16 v2, 0xf3c

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ll/bae0$a;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Ll/une0;->r4(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/une0;->a4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, "\u548c\u5176\u4ed6\u529f\u80fd\u51b2\u7a81\u4e86\uff0c\u9001\u793c\u5f15\u5bfc\u4e0d\u5f39\u51fa"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/une0;->c4(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;->canGuide:Z

    .line 14
    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/une0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 21
    .line 22
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/civ;

    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide p1

    .line 32
    invoke-virtual {p0, p1, p2}, Ll/civ;->A(J)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const-string p1, "\u670d\u52a1\u7aef\u4e0d\u5141\u8bb8\u5f39\u51fa\u9001\u793c\u5f15\u5bfc"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/une0;->c4(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;->successText:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/une0;->q4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;->failText:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/une0;->q4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/une0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/une0;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;->displayInterval:J

    .line 4
    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    mul-long/2addr v0, v2

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/une0;->b4(J)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 20
    .line 21
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/pne0;

    .line 45
    .line 46
    invoke-direct {v1, p0, p1}, Ll/pne0;-><init>(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/wne0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/wne0;->destroy()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/une0;->l:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final n4()V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "reportType"

    .line 7
    .line 8
    const-string v2, "touchMeEnterRoomSpell"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "roomId"

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string v1, "roomType"

    .line 27
    .line 28
    const-string v2, "video"

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    const-string v1, "anchorUserId"

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o6(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public o4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->isTurboCoupon()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vp20;->p()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    const-wide/16 v4, 0x3e8

    .line 22
    .line 23
    div-long/2addr v2, v4

    .line 24
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "60"

    .line 29
    .line 30
    const-string v4, "receive-reward"

    .line 31
    .line 32
    invoke-static {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->p4(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/qne0;

    .line 41
    .line 42
    invoke-direct {v1, p0, p1}, Ll/qne0;-><init>(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/rne0;

    .line 46
    .line 47
    invoke-direct {v2, p0, p1}, Ll/rne0;-><init>(Ll/une0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public p4(II)V
    .locals 8

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/hne0$a;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    new-instance v3, Ll/une0$a;

    .line 25
    .line 26
    invoke-direct {v3, p0}, Ll/une0$a;-><init>(Ll/une0;)V

    .line 27
    .line 28
    .line 29
    const-string p1, "giftguide"

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v4, ""

    .line 36
    .line 37
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    const-string v5, "sendGiftNotice"

    .line 42
    .line 43
    const-string v6, "sendGiftNotice"

    .line 44
    .line 45
    move v4, p2

    .line 46
    invoke-virtual/range {v1 .. v7}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/4 p2, 0x0

    .line 51
    invoke-virtual {p1, p2}, Ll/hne0$a;->A(Z)Ll/hne0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ll/hne0$a;->t()Ll/hne0;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    const-string p1, "e_live_gift_guide"

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final q4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public r4(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "anchor_id"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "live_id"

    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v1, "live_category"

    .line 32
    .line 33
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "is_not_show_required"

    .line 43
    .line 44
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "mc_type"

    .line 49
    .line 50
    const-string v3, "default"

    .line 51
    .line 52
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    filled-new-array {v0, p0, p1, v1, v2}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string p1, "e_live_bottom_popup"

    .line 61
    .line 62
    const-string v0, "p_user_live_room"

    .line 63
    .line 64
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public s4(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    move-object v4, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move-object v4, v1

    .line 32
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    move-object v5, v1

    .line 59
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    move v3, p1

    .line 64
    move-object v6, p2

    .line 65
    move-object v7, p3

    .line 66
    invoke-static/range {v2 .. v7}, Ll/qzj;->t(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "live"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/oo2;->v0(Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/lne0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/lne0;-><init>(Ll/une0;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/mne0;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/mne0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/aj1;->d0()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/nne0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/nne0;-><init>(Ll/une0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    const-wide/16 v0, 0x5a

    .line 60
    .line 61
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 62
    .line 63
    invoke-static {v0, v1, v2}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/one0;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/one0;-><init>(Ll/une0;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Ll/une0;->l:Ll/kcg0;

    .line 93
    .line 94
    return-void
.end method

.method public t4(ZLjava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object v0, v1

    .line 31
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0, p1, v0, v1, p2}, Ll/qzj;->u(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public u4()V
    .locals 3

    .line 1
    new-instance v0, Ll/tne0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tne0;-><init>(Ll/une0;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x1f4

    .line 7
    .line 8
    invoke-virtual {p0, v1, v2, v0}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
