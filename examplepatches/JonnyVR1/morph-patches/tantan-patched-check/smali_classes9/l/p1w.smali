.class public Ll/p1w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dxl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/p1w$a;
    }
.end annotation


# static fields
.field public static j:Ljava/lang/String; = "-1"


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Ll/zod;

.field public d:Ll/p2w;

.field public e:Ll/kcg0;

.field public f:Ll/kcg0;

.field public g:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ll/l2w;

.field public i:Ll/cxl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cxl<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/l2w;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "msg_from_send_gift_hint"

    .line 5
    .line 6
    iput-object v0, p0, Ll/p1w;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/p1w;->g:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance v0, Ll/cxl;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/cxl;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/p1w;->i:Ll/cxl;

    .line 20
    .line 21
    iput-object p1, p0, Ll/p1w;->h:Ll/l2w;

    .line 22
    .line 23
    return-void
.end method

.method private B(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/p1w;->a:Z

    .line 3
    .line 4
    invoke-virtual/range {p0 .. p5}, Ll/p1w;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-direct/range {p0 .. p5}, Ll/p1w;->q(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(ZLcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/v710;->d()Ll/v710;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "msg_from_request_"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p1, p0}, Ll/f7t;->y(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object p1, Ll/p1w;->j:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "live.chat.msg"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, p0, p1}, Ll/v710;->c(Ljava/lang/String;Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic d(Ll/p1w;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Ll/p1w;->o(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Connector;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 4
    .line 5
    const-string v0, "live long live data is null"

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->yk:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "[live][longlink]"

    .line 13
    .line 14
    const-string v1, "long link data is fail"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic g(Ll/p1w;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Connector;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Ll/p1w;->p(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Connector;)V

    return-void
.end method

.method private h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l2w;->g()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/p1w;->d:Ll/p2w;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/p1w;->h:Ll/l2w;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/l2w;->g()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/p2w;->h(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/p1w;->d:Ll/p2w;

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private synthetic o(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    if-eqz p6, :cond_0

    .line 2
    .line 3
    invoke-virtual {p6}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p6

    .line 7
    if-eqz p6, :cond_0

    .line 8
    .line 9
    iget-object p6, p0, Ll/p1w;->d:Ll/p2w;

    .line 10
    .line 11
    if-nez p6, :cond_0

    .line 12
    .line 13
    invoke-virtual/range {p0 .. p5}, Ll/p1w;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic p(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Connector;)V
    .locals 11

    .line 1
    const-string v0, "[live][longlink]"

    .line 2
    .line 3
    const-string v1, "long link data is right"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p1w;->d:Ll/p2w;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Ll/p1w;->h()V

    .line 13
    .line 14
    .line 15
    :cond_0
    move-object/from16 v5, p6

    .line 16
    .line 17
    iget-object v0, v5, Lcom/p1/mobile/putong/data/Connector;->tcp_addr_list:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    new-instance v1, Ll/gtf0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/gtf0;-><init>(Ll/dxl;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/p1w;->d:Ll/p2w;

    .line 31
    .line 32
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v0, p0, Ll/p1w;->h:Ll/l2w;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/l2w;->e()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/oo2;->C0()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/l2w;->g()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-object v7, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 55
    .line 56
    move-object v2, p1

    .line 57
    move v4, p2

    .line 58
    move-object v8, p3

    .line 59
    move-object v9, p4

    .line 60
    move-object/from16 v10, p5

    .line 61
    .line 62
    invoke-virtual/range {v1 .. v10}, Ll/p2w;->g(Ljava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Connector;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    const-string p0, "tcp_addr_list is empty"

    .line 67
    .line 68
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private q(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/p1w;->f:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/m1w;

    .line 15
    .line 16
    move-object v2, p0

    .line 17
    move v3, p1

    .line 18
    move-object v4, p2

    .line 19
    move-object v5, p3

    .line 20
    move-object v6, p4

    .line 21
    move-object v7, p5

    .line 22
    invoke-direct/range {v1 .. v7}, Ll/m1w;-><init>(Ll/p1w;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, v2, Ll/p1w;->f:Ll/kcg0;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public A(ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    move-object v0, p0

    .line 2
    move v1, p1

    .line 3
    move-object v2, p2

    .line 4
    move-object v3, p4

    .line 5
    move-object v4, p5

    .line 6
    move-object v5, p6

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/p1w;->B(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p3}, Ll/p1w;->w(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/p1w;->a:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/p1w;->h:Ll/l2w;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l2w;->b()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/y3w;->e()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/p1w;->e:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/p1w;->f:Ll/kcg0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ll/p1w;->h()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/p1w;->e:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/p1w;->h:Ll/l2w;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l2w;->e()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/oo2;->C0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    iget-object v0, p0, Ll/p1w;->h:Ll/l2w;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/l2w;->g()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 23
    .line 24
    move-object v1, p2

    .line 25
    move-object v2, p3

    .line 26
    move-object v3, p4

    .line 27
    move-object v4, p5

    .line 28
    invoke-static/range {v1 .. v6}, Ll/z1w;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    new-instance p3, Ll/j1w;

    .line 33
    .line 34
    invoke-direct {p3}, Ll/j1w;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    new-instance v0, Ll/k1w;

    .line 42
    .line 43
    move-object v5, v3

    .line 44
    move-object v6, v4

    .line 45
    move v3, p1

    .line 46
    move-object v4, v2

    .line 47
    move-object v2, v1

    .line 48
    move-object v1, p0

    .line 49
    invoke-direct/range {v0 .. v6}, Ll/k1w;-><init>(Ll/p1w;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Ll/l1w;

    .line 53
    .line 54
    invoke-direct {p0}, Ll/l1w;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iput-object p0, v1, Ll/p1w;->e:Ll/kcg0;

    .line 66
    .line 67
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p1w;->g:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2w;->c()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j()Ll/p1w$a;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/p1w;->d:Ll/p2w;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/p1w$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/p1w$a;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v0, "init"

    .line 11
    .line 12
    iput-object v0, p0, Ll/p1w$a;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/p1w$a;->d:J

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/p2w;->e()Ll/p1w$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public k()Lrx/c;
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
    iget-object p0, p0, Ll/p1w;->g:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2w;->f()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()Lcom/p1/mobile/putong/data/Followship;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2w;->f()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/Followship;

    .line 12
    .line 13
    return-object p0
.end method

.method public n()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2w;->h()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r()Ll/aj1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2w;->d()Ll/aj1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public s(ZLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/p1w;->t(ZLjava/util/List;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public t(ZLjava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l2w;->e()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/oo2;->C0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "room"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, p1, v0}, Ll/vwt;->Y4(ZZ)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/n1w;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/n1w;-><init>(Ll/p1w;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    new-instance p0, Ll/o1w;

    .line 36
    .line 37
    invoke-direct {p0, p3}, Ll/o1w;-><init>(Z)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, p0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public u(Lcom/google/protobuf/q;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/v710;->d()Ll/v710;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/p1w;->b:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "live.chat.msg"

    .line 8
    .line 9
    sget-object v2, Ll/p1w;->j:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0, v1, p1, v2}, Ll/v710;->c(Ljava/lang/String;Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public v(I)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->setId(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 14
    .line 15
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 16
    .line 17
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->e2:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "[live]live_room_message"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/v710;->d()Ll/v710;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "live.client.local.system"

    .line 54
    .line 55
    sget-object v2, Ll/p1w;->j:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, v0, v1, p0, v2}, Ll/v710;->c(Ljava/lang/String;Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final w(Z)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/p1w;->c:Ll/zod;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/l2w;->e()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ll/zod;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Ll/p1w;->h:Ll/l2w;

    .line 22
    .line 23
    invoke-static {p1}, Ll/y3w;->a(Ll/l2w;)Ll/m500;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/zod;

    .line 28
    .line 29
    iget-object v1, p0, Ll/p1w;->h:Ll/l2w;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/l2w;->e()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0}, Ll/p1w;->r()Ll/aj1;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v2, v2, Ll/aj1;->a:Lrx/subjects/b;

    .line 44
    .line 45
    iget-object v3, p0, Ll/p1w;->i:Ll/cxl;

    .line 46
    .line 47
    invoke-direct {v0, v1, p1, v2, v3}, Ll/zod;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/m500;Lrx/subjects/b;Ll/cxl;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/p1w;->c:Ll/zod;

    .line 51
    .line 52
    invoke-static {p0}, Ll/y3w;->c(Ll/p1w;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p1w;->d:Ll/p2w;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/p2w;->f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;J)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p1, "send Message Ack error\uff0cseq is "

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "[live][longlink]"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public y(Lrx/subjects/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p1w;->h:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l2w;->l(Lrx/subjects/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p1w;->c:Ll/zod;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zod;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
