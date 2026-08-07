.class public Ll/yh2;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Long;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Long;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/zh2;

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/yh2;->j:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/yh2;->n:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 26
    .line 27
    .line 28
    new-instance p2, Ll/igk0;

    .line 29
    .line 30
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;

    .line 35
    .line 36
    invoke-direct {p2, p1, v0}, Ll/igk0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2}, Ll/oo2;->A0()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const-string v0, "live"

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_0

    .line 57
    .line 58
    new-instance p2, Ll/n3j0;

    .line 59
    .line 60
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 65
    .line 66
    invoke-direct {p2, p1, v0}, Ll/n3j0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method private synthetic C4(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yh2;->s4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/oo2;->Y()Ll/cxl;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/cxl;->b()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x1

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    new-instance v0, Ll/xh2;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/xh2;-><init>(Ll/yh2;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    move p1, v1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    :goto_0
    iget-object v0, p0, Ll/yh2;->j:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Ll/yh2;->j:Ljava/util/List;

    .line 47
    .line 48
    new-instance v0, Ll/xh2;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/xh2;-><init>(Ll/yh2;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/yh2;->j:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v1, p1

    .line 63
    :goto_1
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/yh2;->I4()V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 71
    .line 72
    iget-object p0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->setNewData(Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_2
    return-void
.end method

.method private synthetic E4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->E()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic F4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->J()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic G4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->getLiveDragonListViewHelper()Ll/p9s;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Ll/p9s;->f(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic J3(Ll/yh2;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yh2;->G4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic K3(Ll/yh2;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yh2;->C4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/gvn0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->applyCallId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gvn0;->f()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic M3(Ll/yh2;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yh2;->D4(Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isFollowForbidden()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic O3(Ll/yh2;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yh2;->E4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic P3(Ll/yh2;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yh2;->A4(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Ll/yh2;Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yh2;->w4(Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic S3(Ll/yh2;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yh2;->l4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ll/yh2;Ljava/lang/String;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yh2;->z4(Ljava/lang/String;Ll/qcj;)V

    return-void
.end method

.method public static synthetic U3()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L4:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic V3(Ll/yh2;Ll/a5s;ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/yh2;->B4(Ll/a5s;ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic W3(Ljava/lang/String;Ll/rmd0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/rmd0;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic X3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y3(Ll/yh2;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yh2;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic Z3(Ll/yh2;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yh2;->F4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic a4(Ll/yh2;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yh2;->y4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    return-void
.end method

.method public static synthetic b4(Ll/yh2;Ljava/lang/String;Ll/qcj;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yh2;->x4(Ljava/lang/String;Ll/qcj;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    return-void
.end method


# virtual methods
.method public final synthetic A4(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 9

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Ll/yh2;->q4()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    const/4 v3, 0x1

    .line 32
    move-object v8, p1

    .line 33
    move-object v2, p2

    .line 34
    invoke-virtual/range {v0 .. v8}, Ll/wrv;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public final synthetic B4(Ll/a5s;ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ll/a5s;->h(Z)V

    .line 3
    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1, p4}, Ll/oo2;->U(Lcom/p1/mobile/putong/data/Followship;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2}, Ll/oo2;->j0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, p4}, Ll/oo2;->U(Lcom/p1/mobile/putong/data/Followship;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 43
    .line 44
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->M(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 45
    .line 46
    .line 47
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L4:I

    .line 48
    .line 49
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic D4(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 2
    .line 3
    const-string v1, "following"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 13
    .line 14
    const-string v0, "matched"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p1, "fansClub"

    .line 24
    .line 25
    invoke-virtual {p0, p1, v1}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    :goto_0
    const-string p1, "follow"

    .line 30
    .line 31
    invoke-virtual {p0, p1, v1}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 32
    .line 33
    .line 34
    const-string p1, "voiceFollow"

    .line 35
    .line 36
    invoke-virtual {p0, p1, v1}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public H4(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public I4()V
    .locals 0

    .line 1
    return-void
.end method

.method public J4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/i35;->i(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K4(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 3

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const-string v0, "jumpTopRoom"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, -0x1

    .line 12
    sparse-switch p2, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :sswitch_0
    const-string p2, "joinLotteryGiftRedPacket"

    .line 18
    .line 19
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :cond_0
    const/16 v2, 0x11

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :sswitch_1
    const-string p2, "multiCallApply"

    .line 32
    .line 33
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-nez p2, :cond_1

    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :cond_1
    const/16 v2, 0x10

    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :sswitch_2
    const-string p2, "approveChatGroupApply"

    .line 46
    .line 47
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-nez p2, :cond_2

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_2
    const/16 v2, 0xf

    .line 56
    .line 57
    goto/16 :goto_0

    .line 58
    .line 59
    :sswitch_3
    const-string p2, "jumpToSetting"

    .line 60
    .line 61
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_3

    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :cond_3
    const/16 v2, 0xe

    .line 70
    .line 71
    goto/16 :goto_0

    .line 72
    .line 73
    :sswitch_4
    const-string p2, "createChatGroup"

    .line 74
    .line 75
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-nez p2, :cond_4

    .line 80
    .line 81
    goto/16 :goto_0

    .line 82
    .line 83
    :cond_4
    const/16 v2, 0xd

    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :sswitch_5
    const-string p2, "gift"

    .line 88
    .line 89
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_5

    .line 94
    .line 95
    goto/16 :goto_0

    .line 96
    .line 97
    :cond_5
    const/16 v2, 0xc

    .line 98
    .line 99
    goto/16 :goto_0

    .line 100
    .line 101
    :sswitch_6
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-nez p2, :cond_6

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_6
    const/16 v2, 0xb

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string p2, "schemaJump"

    .line 114
    .line 115
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-nez p2, :cond_7

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_7
    const/16 v2, 0xa

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string p2, "jumpToVote"

    .line 128
    .line 129
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-nez p2, :cond_8

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/16 v2, 0x9

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string p2, "jumpToFansbasePanel"

    .line 142
    .line 143
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-nez p2, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v2, 0x8

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string p2, "callApply"

    .line 156
    .line 157
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-nez p2, :cond_a

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_a
    const/4 v2, 0x7

    .line 165
    goto :goto_0

    .line 166
    :sswitch_b
    const-string p2, "multiCallApprove"

    .line 167
    .line 168
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p2

    .line 172
    if-nez p2, :cond_b

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_b
    const/4 v2, 0x6

    .line 176
    goto :goto_0

    .line 177
    :sswitch_c
    const-string p2, "jumpToMagicFinger"

    .line 178
    .line 179
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    if-nez p2, :cond_c

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_c
    const/4 v2, 0x5

    .line 187
    goto :goto_0

    .line 188
    :sswitch_d
    const-string p2, "jumpToSendMessage"

    .line 189
    .line 190
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-nez p2, :cond_d

    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_d
    const/4 v2, 0x4

    .line 198
    goto :goto_0

    .line 199
    :sswitch_e
    const-string p2, "follow"

    .line 200
    .line 201
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    if-nez p2, :cond_e

    .line 206
    .line 207
    goto :goto_0

    .line 208
    :cond_e
    const/4 v2, 0x3

    .line 209
    goto :goto_0

    .line 210
    :sswitch_f
    const-string p2, "surpriseGiftBox"

    .line 211
    .line 212
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result p2

    .line 216
    if-nez p2, :cond_f

    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_f
    const/4 v2, 0x2

    .line 220
    goto :goto_0

    .line 221
    :sswitch_10
    const-string p2, "followUser"

    .line 222
    .line 223
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    if-nez p2, :cond_10

    .line 228
    .line 229
    goto :goto_0

    .line 230
    :cond_10
    const/4 v2, 0x1

    .line 231
    goto :goto_0

    .line 232
    :sswitch_11
    const-string p2, "shootGame"

    .line 233
    .line 234
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result p2

    .line 238
    if-nez p2, :cond_11

    .line 239
    .line 240
    goto :goto_0

    .line 241
    :cond_11
    move v2, v1

    .line 242
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 243
    .line 244
    .line 245
    goto/16 :goto_1

    .line 246
    .line 247
    :pswitch_0
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 248
    .line 249
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->scheme:Ljava/lang/String;

    .line 250
    .line 251
    invoke-virtual {p0, p1}, Ll/yh2;->r4(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-static {p0}, Ll/i35;->e(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :pswitch_1
    invoke-virtual {p0, p4, p1}, Ll/yh2;->f4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/a5s;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :pswitch_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveVoiceChatGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;

    .line 271
    .line 272
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;->approveChatGroupApply()Ll/v3f$d;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 277
    .line 278
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :pswitch_3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 287
    .line 288
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->openSettingDialog()Ll/v3f$c;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :pswitch_4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveVoiceChatGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;

    .line 301
    .line 302
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;->openCreateGroupDialog()Ll/v3f$d;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 307
    .line 308
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 309
    .line 310
    .line 311
    return-void

    .line 312
    :pswitch_5
    invoke-virtual {p0}, Ll/yh2;->L4()V

    .line 313
    .line 314
    .line 315
    return-void

    .line 316
    :pswitch_6
    if-eqz p4, :cond_12

    .line 317
    .line 318
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 319
    .line 320
    if-eqz p1, :cond_12

    .line 321
    .line 322
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->roomId:Ljava/lang/String;

    .line 323
    .line 324
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->liveId:Ljava/lang/String;

    .line 325
    .line 326
    invoke-virtual {p0, p2, p1, v0}, Ll/yh2;->u4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    return-void

    .line 330
    :pswitch_7
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->h5Url:Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {p0, p1}, Ll/yh2;->r4(Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->traceJson:Ljava/lang/String;

    .line 336
    .line 337
    if-eqz p1, :cond_12

    .line 338
    .line 339
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    if-nez p1, :cond_12

    .line 344
    .line 345
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->traceJson:Ljava/lang/String;

    .line 346
    .line 347
    invoke-virtual {p0, p1}, Ll/yh2;->N4(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    return-void

    .line 351
    :pswitch_8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 352
    .line 353
    .line 354
    move-result-object p2

    .line 355
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 356
    .line 357
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->showVoteResultDialog()Ll/v3f$d;

    .line 358
    .line 359
    .line 360
    move-result-object p2

    .line 361
    iget-object p3, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 362
    .line 363
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->voteRecordId:Ljava/lang/String;

    .line 364
    .line 365
    invoke-virtual {p2, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {p1, v1}, Ll/a5s;->h(Z)V

    .line 369
    .line 370
    .line 371
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 372
    .line 373
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 374
    .line 375
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->M(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 376
    .line 377
    .line 378
    return-void

    .line 379
    :pswitch_9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 380
    .line 381
    .line 382
    move-result-object p0

    .line 383
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 384
    .line 385
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;->showFansGroupPanel()Ll/v3f$d;

    .line 386
    .line 387
    .line 388
    move-result-object p0

    .line 389
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 390
    .line 391
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 392
    .line 393
    .line 394
    return-void

    .line 395
    :pswitch_a
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 400
    .line 401
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCallAudience()Ll/v3f$c;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 406
    .line 407
    .line 408
    return-void

    .line 409
    :pswitch_b
    iget-object p2, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 410
    .line 411
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->applyCallId:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {p0, p4, p2, p1}, Ll/yh2;->c4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/lang/String;Ll/a5s;)V

    .line 414
    .line 415
    .line 416
    return-void

    .line 417
    :pswitch_c
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 418
    .line 419
    .line 420
    move-result-object p0

    .line 421
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 422
    .line 423
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showDialog()Ll/v3f$d;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    const-string p1, "magicGesture"

    .line 428
    .line 429
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 434
    .line 435
    .line 436
    return-void

    .line 437
    :pswitch_d
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 438
    .line 439
    invoke-virtual {p1}, Ll/wrv;->c0()V

    .line 440
    .line 441
    .line 442
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 443
    .line 444
    .line 445
    move-result-object p1

    .line 446
    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 447
    .line 448
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 449
    .line 450
    .line 451
    move-result-object p0

    .line 452
    iget-object p3, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 453
    .line 454
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->toUserId:Ljava/lang/String;

    .line 455
    .line 456
    invoke-virtual {p2, p0, p3, v1, v1}, Ll/wrv;->z0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 457
    .line 458
    .line 459
    move-result-object p0

    .line 460
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 461
    .line 462
    .line 463
    return-void

    .line 464
    :pswitch_e
    invoke-virtual {p0}, Ll/yh2;->m4()V

    .line 465
    .line 466
    .line 467
    return-void

    .line 468
    :pswitch_f
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 469
    .line 470
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->scheme:Ljava/lang/String;

    .line 471
    .line 472
    invoke-virtual {p0, p1}, Ll/yh2;->r4(Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    return-void

    .line 476
    :pswitch_10
    if-eqz p4, :cond_12

    .line 477
    .line 478
    iget-object p2, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 479
    .line 480
    if-eqz p2, :cond_12

    .line 481
    .line 482
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 483
    .line 484
    if-eqz p2, :cond_12

    .line 485
    .line 486
    invoke-virtual {p0, p4, p1, v1}, Ll/yh2;->n4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/a5s;Z)V

    .line 487
    .line 488
    .line 489
    :cond_12
    :goto_1
    return-void

    .line 490
    :pswitch_11
    invoke-virtual {p1}, Ll/a5s;->b()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object p1

    .line 494
    invoke-static {p1}, Ll/swk;->b(Ljava/lang/String;)Ll/px50;

    .line 495
    .line 496
    .line 497
    move-result-object p1

    .line 498
    invoke-virtual {p0, p1}, Ll/yh2;->P4(Ll/px50;)V

    .line 499
    .line 500
    .line 501
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    invoke-static {p0}, Ll/i35;->f(Ljava/lang/String;)V

    .line 506
    .line 507
    .line 508
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x7e05e34f -> :sswitch_11
        -0x78d1a4e4 -> :sswitch_10
        -0x589ae8ae -> :sswitch_f
        -0x4ba2c44f -> :sswitch_e
        -0x48e5fbaa -> :sswitch_d
        -0x478d5793 -> :sswitch_c
        -0x43501fea -> :sswitch_b
        -0x40021c50 -> :sswitch_a
        -0x21338ed6 -> :sswitch_9
        -0x211a5a2d -> :sswitch_8
        -0x1ac11a91 -> :sswitch_7
        -0xcfc83e -> :sswitch_6
        0x306930 -> :sswitch_5
        0x7e9a46b -> :sswitch_4
        0x16a166c7 -> :sswitch_3
        0x2c8a7a54 -> :sswitch_2
        0x4d72fe77 -> :sswitch_1
        0x73239caa -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
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

.method public L4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/lx50;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/lx50;-><init>()V

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x64

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/lx50;->i(I)Ll/lx50;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public M4()V
    .locals 0

    .line 1
    return-void
.end method

.method public final N4(Ljava/lang/String;)V
    .locals 7

    .line 1
    const-string p0, "eid"

    .line 2
    .line 3
    const-string v0, "pid"

    .line 4
    .line 5
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    new-instance v3, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-eqz v5, :cond_2

    .line 32
    .line 33
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-nez v6, :cond_0

    .line 44
    .line 45
    invoke-static {v5, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    if-eqz v6, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-static {v2, p1, v3}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    :catch_0
    return-void
.end method

.method public O4(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public P4(Ll/px50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Q4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;JZ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Ll/j35;->j(Ll/i6t;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;JZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/lang/String;Ll/a5s;)V
    .locals 1

    .line 1
    sget-object v0, Ll/cd10;->w:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->H3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v0, Ll/kh2;

    .line 12
    .line 13
    invoke-direct {v0, p0, p3, p1}, Ll/kh2;-><init>(Ll/yh2;Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/lh2;

    .line 21
    .line 22
    invoke-direct {p2, p0}, Ll/lh2;-><init>(Ll/yh2;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/z2e0;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public d4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
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
    iget-object p0, p0, Ll/yh2;->j:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/yh2;->j:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final f4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/a5s;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bf10;->B(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->O7:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openApplyDlg()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p2, v0}, Ll/a5s;->h(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->M(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final g4(Ll/gvn0;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {p1, p0}, Ll/gvn0;->a(Z)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public h4(Ll/gvn0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/yh2;->g4(Ll/gvn0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/oh2;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/oh2;-><init>(Ll/gvn0;)V

    .line 10
    .line 11
    .line 12
    const-string p1, "voiceCallApply"

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final i4(Ljava/lang/String;Ll/qcj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/tz40;->h(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yh2;->n:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/fh2;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2}, Ll/fh2;-><init>(Ll/yh2;Ljava/lang/String;Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/yh2;->n:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/yh2;->n:Ljava/util/List;

    .line 28
    .line 29
    new-instance p2, Ll/gh2;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ll/gh2;-><init>(Ll/yh2;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 40
    .line 41
    iget-object p0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 42
    .line 43
    const/4 p2, 0x1

    .line 44
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->K(Ljava/util/List;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public init()V
    .locals 0

    .line 1
    return-void
.end method

.method public j4(Ljava/lang/String;Ll/qcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wh2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/wh2;-><init>(Ll/yh2;Ljava/lang/String;Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/ThreadUtil;->i(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public k4(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final l4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yh2;->o4()Ll/zh2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/bkj0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/yh2;->i:Ljava/util/List;

    .line 8
    .line 9
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->getChatRecyclerViewVisiblePosition()Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-direct {v1, p1, v2, v3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/zh2;->g(Ll/bkj0;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/yh2;->J4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 30
    .line 31
    return-object p0
.end method

.method public m4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/mh2;

    .line 10
    .line 11
    invoke-direct {v2}, Ll/mh2;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const-string v4, "liveMessage"

    .line 16
    .line 17
    invoke-virtual {v0, v3, v1, v4, v2}, Ll/oo2;->e0(ZLjava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Ll/j35;->k(Ll/i6t;)V

    .line 21
    .line 22
    .line 23
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
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->y()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/yh2;->j:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Ll/yh2;->k:Ll/pf60;

    .line 23
    .line 24
    iput-object v0, p0, Ll/yh2;->l:Ll/pf60;

    .line 25
    .line 26
    iget-object p0, p0, Ll/yh2;->n:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public n4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/a5s;Z)V
    .locals 3

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    const-string v0, "audio_message"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "liveMessage"

    .line 7
    .line 8
    :goto_0
    if-eqz p3, :cond_1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/j35;->m(Ll/i6t;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 11
    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    invoke-static {p0, p1}, Ll/j35;->l(Ll/i6t;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 15
    .line 16
    .line 17
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ll/hh2;

    .line 38
    .line 39
    invoke-direct {v2, p0, v0}, Ll/hh2;-><init>(Ll/yh2;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/ih2;

    .line 47
    .line 48
    invoke-direct {v1, p0, p2, p3, p1}, Ll/ih2;-><init>(Ll/yh2;Ll/a5s;ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Ll/jh2;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/jh2;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public o4()Ll/zh2;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/yh2;->m:Ll/zh2;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ll/o2f;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/o2f;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/m90;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Ll/oo2;->F0()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, 0x0

    .line 25
    const/4 v5, 0x1

    .line 26
    const/4 v6, 0x2

    .line 27
    if-ne v3, v6, :cond_0

    .line 28
    .line 29
    move v3, v5

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v3, v4

    .line 32
    :goto_0
    invoke-direct {v1, v2, v3}, Ll/m90;-><init>(ZZ)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/atc0;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/atc0;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v3, Ll/v3c;

    .line 41
    .line 42
    invoke-direct {v3}, Ll/v3c;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v7, Ll/b5f0;

    .line 46
    .line 47
    invoke-direct {v7}, Ll/b5f0;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v8, Ll/o1f;

    .line 51
    .line 52
    invoke-direct {v8}, Ll/o1f;-><init>()V

    .line 53
    .line 54
    .line 55
    const/4 v9, 0x6

    .line 56
    new-array v9, v9, [Ll/vr4;

    .line 57
    .line 58
    aput-object v0, v9, v4

    .line 59
    .line 60
    aput-object v1, v9, v5

    .line 61
    .line 62
    aput-object v2, v9, v6

    .line 63
    .line 64
    const/4 v0, 0x3

    .line 65
    aput-object v3, v9, v0

    .line 66
    .line 67
    const/4 v0, 0x4

    .line 68
    aput-object v7, v9, v0

    .line 69
    .line 70
    const/4 v0, 0x5

    .line 71
    aput-object v8, v9, v0

    .line 72
    .line 73
    invoke-static {v9}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Ll/vr4;->a(Ljava/util/List;)Ll/vr4;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/zh2;

    .line 82
    .line 83
    iput-object v0, p0, Ll/yh2;->m:Ll/zh2;

    .line 84
    .line 85
    :cond_1
    iget-object p0, p0, Ll/yh2;->m:Ll/zh2;

    .line 86
    .line 87
    return-object p0
.end method

.method public p4()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/j35;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "liveRoom"

    .line 2
    .line 3
    return-object p0
.end method

.method public r4(Ljava/lang/String;)V
    .locals 2

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
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/bae0$a;

    .line 18
    .line 19
    const/16 v1, 0x64

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

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
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public s4()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->r()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yh2;->init()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/eh2;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/eh2;-><init>(Ll/yh2;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/ph2;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/ph2;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/oo2;->t0()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/qh2;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/qh2;-><init>(Ll/yh2;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->refreshChatList()Ll/v3f$c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Lrx/c;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/rh2;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/rh2;-><init>(Ll/yh2;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->scrollToEnd()Ll/v3f$c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lrx/c;

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v1, Ll/sh2;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/sh2;-><init>(Ll/yh2;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->addNotificationItem()Ll/v3f$d;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Lrx/c;

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v1, Ll/th2;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Ll/th2;-><init>(Ll/yh2;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->addDragonInfoMsg()Ll/v3f$d;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Lrx/c;

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    new-instance v1, Ll/uh2;

    .line 195
    .line 196
    invoke-direct {v1, p0}, Ll/uh2;-><init>(Ll/yh2;)V

    .line 197
    .line 198
    .line 199
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->openDragonPushMsg()Ll/v3f$d;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Lrx/c;

    .line 221
    .line 222
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    new-instance v1, Ll/vh2;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Ll/vh2;-><init>(Ll/yh2;)V

    .line 229
    .line 230
    .line 231
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public t4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public u4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->L0:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 91
    .line 92
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final synthetic v4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->addWatchList()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic w4(Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-virtual {p1, p3}, Ll/a5s;->h(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->M(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic x4(Ljava/lang/String;Ll/qcj;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 3

    .line 1
    const-string v0, "follow"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p3}, Ll/tz40;->f(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/yh2;->n:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v0, "fansClub"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-static {p3}, Ll/tz40;->e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Ll/yh2;->n:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    if-eqz p2, :cond_2

    .line 42
    .line 43
    invoke-interface {p2, p3}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    iget-object p2, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 57
    .line 58
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_3

    .line 63
    .line 64
    :goto_0
    return-void

    .line 65
    :cond_3
    iget-object p2, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    check-cast p2, Landroid/text/SpannableStringBuilder;

    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const-class v2, Ll/rmd0;

    .line 79
    .line 80
    invoke-virtual {p2, v0, v1, v2}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    check-cast p2, [Ll/rmd0;

    .line 85
    .line 86
    new-instance v1, Ll/nh2;

    .line 87
    .line 88
    invoke-direct {v1, p1}, Ll/nh2;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p2, v1}, Ll/jyb;->s([Ljava/lang/Object;Ll/qcj;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    check-cast p2, Ll/rmd0;

    .line 96
    .line 97
    if-eqz p2, :cond_4

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Ll/rmd0;->setVisible(Z)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 103
    .line 104
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 105
    .line 106
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->M(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    invoke-virtual {p0, p1, p3}, Ll/yh2;->k4(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final synthetic y4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z4(Ljava/lang/String;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yh2;->i4(Ljava/lang/String;Ll/qcj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
