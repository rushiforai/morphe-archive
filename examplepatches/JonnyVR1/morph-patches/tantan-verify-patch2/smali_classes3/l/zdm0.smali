.class public Ll/zdm0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/atm0<",
        "Ll/odm0<",
        "TD;>;TD;>;"
    }
.end annotation


# static fields
.field public static p:Ljava/lang/String; = "source_top_manager"

.field public static q:Ljava/lang/String; = "source_more_func"


# instance fields
.field public k:Ll/q1d0;

.field public l:Ll/fko0;

.field public m:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/vak0;

.field public o:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/zdm0;->p:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Ll/zdm0;->o:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Ll/odm0;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/odm0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic Q4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private T4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "@"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, " "

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sget v2, Ll/ix4;->E:I

    .line 38
    .line 39
    if-le v1, v2, :cond_1

    .line 40
    .line 41
    add-int/lit8 v2, v2, -0x4

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "... "

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/vv4;

    .line 65
    .line 66
    const/4 v3, 0x1

    .line 67
    invoke-direct {v2, v3, v0}, Ll/vv4;-><init>(ZLjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 71
    .line 72
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v2, p0}, Ll/vv4;->a(Ljava/lang/String;)Ll/vv4;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string v0, "3"

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/vv4;->b(Ljava/lang/String;)Ll/vv4;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic l4(Ll/zdm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdm0;->J4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m4(Ll/zdm0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdm0;->P4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic n4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    const-string p0, "\u5df2\u9080\u8bf7,\u7b49\u5f85\u5bf9\u65b9\u540c\u610f"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o4(Ll/zdm0;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zdm0;->K4(Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p4(Ll/zdm0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zdm0;->O4(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q4(Ll/zdm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdm0;->M4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r4(Ll/zdm0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zdm0;->Q4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s4(Ll/zdm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdm0;->L4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t4(Ll/zdm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdm0;->N4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u4(Ll/zdm0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdm0;->b5(Ljava/lang/String;)V

    return-void
.end method

.method private x4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zdm0;->k:Ll/q1d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q1d0;->h()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/zdm0;->l:Ll/fko0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fko0;->j()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method


# virtual methods
.method public A4(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/zdm0;->p:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/zdm0;->H4()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/zdm0;->n:Ll/vak0;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object v1, Ll/zdm0;->q:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/zdm0;->I4()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Ll/zdm0;->n:Ll/vak0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const/4 p1, 0x0

    .line 53
    :goto_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    new-instance v1, Ll/udm0;

    .line 60
    .line 61
    invoke-direct {v1, p0, v0}, Ll/udm0;-><init>(Ll/zdm0;Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-object v0
.end method

.method public final B4()Ll/k8p0;
    .locals 2

    .line 1
    new-instance v0, Ll/x5o0;

    .line 2
    .line 3
    const/16 v1, 0xed8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/x5o0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/util/List;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v1, Ll/ydm0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/ydm0;-><init>(Ll/zdm0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const-string p0, "\u64a4\u9500\u7ba1\u7406\u5458"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ih:I

    .line 31
    .line 32
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :goto_0
    new-instance v0, Ll/k8p0;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method

.method public final C4()Ll/k8p0;
    .locals 5

    .line 1
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jfv;

    .line 8
    .line 9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 24
    .line 25
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/vwt;->R5()J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    cmp-long p0, v1, v3

    .line 34
    .line 35
    if-gez p0, :cond_0

    .line 36
    .line 37
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yb:I

    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/k8p0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public final D4()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/i9o0;->g(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "anchor"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string p0, "manager"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/u3m0;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Ll/u3m0;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    const-string p0, "member"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_2
    const-string p0, "passerby"

    .line 46
    .line 47
    return-object p0
.end method

.method public E4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/vak0;->o()Ll/nsv;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v1, 0x5

    .line 34
    invoke-static {v0, v1}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "\u6210\u4e3a\u7ba1\u7406\u5458\u540e\uff0c\u5bf9\u65b9\u53ef\u5e2e\u4f60\u7ba1\u7406\u9ea6\u4f4d\u53ca\u5165\u9a7b\u6210\u5458\u3002\u786e\u8ba4\u9080\u8bf7 %s \u4e3a\u7ba1\u7406\u5458\u5417\uff1f"

    .line 39
    .line 40
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 49
    .line 50
    invoke-direct {v2, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-ltz v1, :cond_0

    .line 58
    .line 59
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 60
    .line 61
    const/4 v4, 0x1

    .line 62
    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr v0, v1

    .line 70
    const/16 v4, 0x21

    .line 71
    .line 72
    invoke-virtual {v2, v3, v1, v0, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 73
    .line 74
    .line 75
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    const-string v1, "\u9080\u4e3a\u7ba1\u7406\u5458"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "\u786e\u8ba4"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ll/xdm0;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/xdm0;-><init>(Ll/zdm0;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string v0, "\u53d6\u6d88"

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onInviteUserBecomeManager()Ll/v3f$d;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public final F4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->h6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ll/tdm0;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/tdm0;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/z2e0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/z2e0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public G4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final H4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final I4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic J4(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onCancelManager()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vak0;->o()Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/pf60;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ll/rwn0;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "anchorId"

    .line 43
    .line 44
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/pf60;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Ll/rwn0;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "liveId"

    .line 60
    .line 61
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/pf60;

    .line 65
    .line 66
    const-string v3, "confirm_type"

    .line 67
    .line 68
    const-string v4, "revoke_manager"

    .line 69
    .line 70
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    new-instance v3, Ll/pf60;

    .line 74
    .line 75
    const-string v4, "user_type"

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/zdm0;->D4()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-direct {v3, v4, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string v0, "e_audio_room_pop_confirm_button"

    .line 89
    .line 90
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic K4(Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zdm0;->v4(Ljava/util/List;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 4
    .line 5
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic M4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onInviteUserBecomeManager()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic N4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 4
    .line 5
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic O4(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdm0;->Z4(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/pf60;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "anchorId"

    .line 18
    .line 19
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/pf60;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ll/rwn0;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "liveId"

    .line 35
    .line 36
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/pf60;

    .line 40
    .line 41
    const-string v3, "confirm_type"

    .line 42
    .line 43
    const-string v4, "remove_member"

    .line 44
    .line 45
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    new-instance v3, Ll/pf60;

    .line 49
    .line 50
    const-string v4, "user_type"

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/zdm0;->D4()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-direct {v3, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "e_audio_room_pop_confirm_button"

    .line 64
    .line 65
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    const-string p1, "\u5df2\u79fb\u9664\u8be5\u7528\u6237\u7684\u6210\u5458\u8eab\u4efd"

    .line 69
    .line 70
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->refreshListData()Ll/v3f$d;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const/4 v0, 0x1

    .line 84
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/zdm0;->l:Ll/fko0;

    .line 92
    .line 93
    if-eqz p1, :cond_0

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/fko0;->m()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_0

    .line 100
    .line 101
    iget-object p1, p0, Ll/zdm0;->l:Ll/fko0;

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/fko0;->j()V

    .line 104
    .line 105
    .line 106
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final R4()Ll/k8p0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/zdm0;->m:Ll/nsv;

    .line 21
    .line 22
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x1

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 38
    .line 39
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ll/vak0;->c(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_1

    .line 50
    .line 51
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D8:I

    .line 52
    .line 53
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gh:I

    .line 59
    .line 60
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/4 v1, 0x0

    .line 65
    goto :goto_0

    .line 66
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->qi:I

    .line 67
    .line 68
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    :goto_0
    new-instance v0, Ll/k8p0;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ll/k8p0;->d(Z)V

    .line 78
    .line 79
    .line 80
    return-object v0

    .line 81
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 82
    return-object p0
.end method

.method public final S4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->unMuteWords()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->forbiddenWords()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->forbiddenWords()Ll/v3f$d;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public U4(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/odm0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/odm0;->e()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-string v1, "report"

    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    sparse-switch v0, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_0
    const-string v0, "realNamePrivateChat"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    const/16 v2, 0x9

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_1
    const-string v0, "invite-settle"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_2
    const/16 v2, 0x8

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :sswitch_2
    const-string v0, "remSettle"

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_3

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    const/4 v2, 0x7

    .line 65
    goto :goto_0

    .line 66
    :sswitch_3
    const-string v0, "voice"

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const/4 v2, 0x6

    .line 76
    goto :goto_0

    .line 77
    :sswitch_4
    const-string v0, "jail"

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_5

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    const/4 v2, 0x5

    .line 87
    goto :goto_0

    .line 88
    :sswitch_5
    const-string v0, "at"

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_6

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_6
    const/4 v2, 0x4

    .line 98
    goto :goto_0

    .line 99
    :sswitch_6
    const-string v0, "kickRoom"

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_7

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_7
    const/4 v2, 0x3

    .line 109
    goto :goto_0

    .line 110
    :sswitch_7
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_8

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_8
    const/4 v2, 0x2

    .line 118
    goto :goto_0

    .line 119
    :sswitch_8
    const-string v0, "managerInvite"

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-nez p1, :cond_9

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_9
    const/4 v2, 0x1

    .line 129
    goto :goto_0

    .line 130
    :sswitch_9
    const-string v0, "sayHello"

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-nez p1, :cond_a

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_a
    const/4 v2, 0x0

    .line 140
    :goto_0
    const-string p1, "liveId"

    .line 141
    .line 142
    const-string v0, "anchorId"

    .line 143
    .line 144
    packed-switch v2, :pswitch_data_0

    .line 145
    .line 146
    .line 147
    goto/16 :goto_1

    .line 148
    .line 149
    :pswitch_0
    iget-object v1, p0, Ll/zdm0;->m:Ll/nsv;

    .line 150
    .line 151
    if-eqz v1, :cond_b

    .line 152
    .line 153
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 156
    .line 157
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {p0, v1}, Ll/zdm0;->W4(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    goto/16 :goto_1

    .line 163
    .line 164
    :pswitch_1
    iget-object v1, p0, Ll/zdm0;->m:Ll/nsv;

    .line 165
    .line 166
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 169
    .line 170
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {p0, v1}, Ll/zdm0;->F4(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    const-string v1, "invite_settle"

    .line 176
    .line 177
    goto/16 :goto_2

    .line 178
    .line 179
    :pswitch_2
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 180
    .line 181
    iget-object v2, p0, Ll/zdm0;->m:Ll/nsv;

    .line 182
    .line 183
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 186
    .line 187
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {p0, v1, v2}, Ll/zdm0;->Y4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    const-string v1, "remove_member"

    .line 193
    .line 194
    goto :goto_2

    .line 195
    :pswitch_3
    invoke-virtual {p0}, Ll/zdm0;->a5()V

    .line 196
    .line 197
    .line 198
    goto :goto_1

    .line 199
    :pswitch_4
    invoke-virtual {p0}, Ll/zdm0;->S4()V

    .line 200
    .line 201
    .line 202
    const-string v1, "block"

    .line 203
    .line 204
    goto :goto_2

    .line 205
    :pswitch_5
    invoke-direct {p0}, Ll/zdm0;->T4()V

    .line 206
    .line 207
    .line 208
    goto :goto_1

    .line 209
    :pswitch_6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 214
    .line 215
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->kickOff()Ll/v3f$d;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iget-object v2, p0, Ll/zdm0;->m:Ll/nsv;

    .line 220
    .line 221
    invoke-virtual {v1, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    const-string v1, "kick_user"

    .line 225
    .line 226
    goto :goto_2

    .line 227
    :pswitch_7
    iget-object v2, p0, Ll/zdm0;->m:Ll/nsv;

    .line 228
    .line 229
    invoke-virtual {p0, v2}, Ll/zdm0;->X4(Ll/nsv;)V

    .line 230
    .line 231
    .line 232
    goto :goto_2

    .line 233
    :pswitch_8
    invoke-virtual {p0}, Ll/zdm0;->V4()Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-eqz v1, :cond_b

    .line 238
    .line 239
    const-string v1, "revoke_manager"

    .line 240
    .line 241
    goto :goto_2

    .line 242
    :pswitch_9
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    check-cast v2, Ll/rwn0;

    .line 255
    .line 256
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    invoke-static {p1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    iget-object v3, p0, Ll/zdm0;->m:Ll/nsv;

    .line 265
    .line 266
    iget-object v3, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 267
    .line 268
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 269
    .line 270
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 271
    .line 272
    const-string v4, "receiver_user_id"

    .line 273
    .line 274
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    const-string v2, "e_audio_greeting"

    .line 283
    .line 284
    const-string v3, "p_audio_profile"

    .line 285
    .line 286
    invoke-static {v2, v3, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 287
    .line 288
    .line 289
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 290
    .line 291
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 292
    .line 293
    iget-object v3, p0, Ll/zdm0;->m:Ll/nsv;

    .line 294
    .line 295
    iget-object v3, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 296
    .line 297
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 298
    .line 299
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {v1, v2, v3}, Ll/wrv;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    :cond_b
    :goto_1
    const-string v1, ""

    .line 305
    .line 306
    :goto_2
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    new-instance v3, Ll/pf60;

    .line 311
    .line 312
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    check-cast v4, Ll/rwn0;

    .line 317
    .line 318
    invoke-virtual {v4}, Ll/oo2;->j0()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v4

    .line 322
    invoke-direct {v3, v0, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    new-instance v0, Ll/pf60;

    .line 326
    .line 327
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    check-cast v4, Ll/rwn0;

    .line 332
    .line 333
    invoke-virtual {v4}, Ll/vp20;->k()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    invoke-direct {v0, p1, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 338
    .line 339
    .line 340
    new-instance p1, Ll/pf60;

    .line 341
    .line 342
    const-string v4, "button_type"

    .line 343
    .line 344
    invoke-direct {p1, v4, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 345
    .line 346
    .line 347
    new-instance v1, Ll/pf60;

    .line 348
    .line 349
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    check-cast v4, Ll/rwn0;

    .line 354
    .line 355
    invoke-virtual {v4}, Ll/vp20;->o()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v4

    .line 359
    const-string v5, "roomId"

    .line 360
    .line 361
    invoke-direct {v1, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 362
    .line 363
    .line 364
    new-instance v4, Ll/pf60;

    .line 365
    .line 366
    const-string v5, "user_type"

    .line 367
    .line 368
    invoke-virtual {p0}, Ll/zdm0;->D4()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    invoke-direct {v4, v5, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 373
    .line 374
    .line 375
    filled-new-array {v3, v0, p1, v1, v4}, [Ll/pf60;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    const-string p1, "e_audio_user_manegment_memu"

    .line 380
    .line 381
    invoke-static {p1, v2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 382
    .line 383
    .line 384
    return-void

    .line 385
    :sswitch_data_0
    .sparse-switch
        -0x77fbd859 -> :sswitch_9
        -0x49110aea -> :sswitch_8
        -0x37b3aacc -> :sswitch_7
        -0x337963bf -> :sswitch_6
        0xc33 -> :sswitch_5
        0x31a89a -> :sswitch_4
        0x6b2e132 -> :sswitch_3
        0x1bbf5a85 -> :sswitch_2
        0x36f1008f -> :sswitch_1
        0x42fe9a72 -> :sswitch_0
    .end sparse-switch

    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    :pswitch_data_0
    .packed-switch 0x0
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

.method public final V4()Z
    .locals 2

    .line 1
    new-instance v0, Ll/x5o0;

    .line 2
    .line 3
    const/16 v1, 0xed8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/x5o0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/util/List;

    .line 13
    .line 14
    new-instance v1, Ll/sdm0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/sdm0;-><init>(Ll/zdm0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/zdm0;->w4()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/zdm0;->E4()V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public W4(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, p0, p1, v2, v2}, Ll/wrv;->z0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public X4(Ll/nsv;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x1

    .line 22
    const-string v4, "indonesia"

    .line 23
    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    sget-object v2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 27
    .line 28
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    move-object/from16 v6, p1

    .line 45
    .line 46
    iget-object v4, v6, Ll/nsv;->a:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v2, v4}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const/4 v3, 0x0

    .line 60
    :goto_0
    iget-object v2, v0, Ll/zdm0;->l:Ll/fko0;

    .line 61
    .line 62
    if-nez v2, :cond_1

    .line 63
    .line 64
    new-instance v2, Ll/fko0;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/fko0;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v2, v0, Ll/zdm0;->l:Ll/fko0;

    .line 70
    .line 71
    :cond_1
    iget-object v4, v0, Ll/zdm0;->l:Ll/fko0;

    .line 72
    .line 73
    iget-object v5, v0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Ll/rwn0;

    .line 80
    .line 81
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Ll/rwn0;

    .line 90
    .line 91
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    invoke-virtual {v0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 100
    .line 101
    .line 102
    move-result-wide v10

    .line 103
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ll/rwn0;

    .line 110
    .line 111
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v12

    .line 121
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 122
    .line 123
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Li:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v13

    .line 129
    sget-object v1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 132
    .line 133
    .line 134
    move-result v14

    .line 135
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Ll/rwn0;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v15, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 146
    .line 147
    move-object v7, v6

    .line 148
    move v6, v3

    .line 149
    invoke-virtual/range {v4 .. v15}, Ll/fko0;->p(Lcom/p1/mobile/android/app/Act;ZLl/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ll/atm0;->i0(Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-eqz v2, :cond_4

    .line 164
    .line 165
    sget-object v2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 166
    .line 167
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_3

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_3
    new-instance v1, Landroid/content/Intent;

    .line 175
    .line 176
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    const-class v4, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;

    .line 181
    .line 182
    invoke-direct {v1, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 183
    .line 184
    .line 185
    const-string v2, "url"

    .line 186
    .line 187
    sget-object v4, Ll/efv;->v:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 190
    .line 191
    .line 192
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 193
    .line 194
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 195
    .line 196
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const-string v4, "title"

    .line 201
    .line 202
    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    .line 204
    .line 205
    const-string v2, "hideNavigationBar"

    .line 206
    .line 207
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 222
    .line 223
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_4
    :goto_1
    iget-object v2, v0, Ll/zdm0;->k:Ll/q1d0;

    .line 232
    .line 233
    if-nez v2, :cond_5

    .line 234
    .line 235
    new-instance v2, Ll/q1d0;

    .line 236
    .line 237
    invoke-direct {v2}, Ll/q1d0;-><init>()V

    .line 238
    .line 239
    .line 240
    iput-object v2, v0, Ll/zdm0;->k:Ll/q1d0;

    .line 241
    .line 242
    :cond_5
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    check-cast v2, Ll/rwn0;

    .line 247
    .line 248
    invoke-virtual {v2}, Ll/rwn0;->A0()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    const-string v3, "live"

    .line 253
    .line 254
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    if-eqz v2, :cond_6

    .line 259
    .line 260
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->video:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 261
    .line 262
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    :goto_2
    move v13, v2

    .line 267
    goto :goto_3

    .line 268
    :cond_6
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 269
    .line 270
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    goto :goto_2

    .line 275
    :goto_3
    iget-object v4, v0, Ll/zdm0;->k:Ll/q1d0;

    .line 276
    .line 277
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    check-cast v2, Ll/rwn0;

    .line 286
    .line 287
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    check-cast v2, Ll/rwn0;

    .line 296
    .line 297
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v8

    .line 301
    invoke-virtual {v0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 306
    .line 307
    .line 308
    move-result-wide v9

    .line 309
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    check-cast v0, Ll/rwn0;

    .line 316
    .line 317
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v11

    .line 327
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {v0}, Ll/vwt;->j5()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v12

    .line 335
    move-object/from16 v6, p1

    .line 336
    .line 337
    invoke-virtual/range {v4 .. v13}, Ll/q1d0;->q(Lcom/p1/mobile/android/app/Act;Ll/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;I)V

    .line 338
    .line 339
    .line 340
    return-void
.end method

.method public final Y4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u786e\u5b9a\u8981\u79fb\u9664\u5165\u9a7b\uff1f"

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "\u79fb\u9664\u540e\uff0c\u5bf9\u65b9\u4e0d\u518d\u662f\u672c\u623f\u95f4\u7684\u6210\u5458"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "\u53d6\u6d88"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "\u786e\u8ba4\u79fb\u9664"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/rdm0;

    .line 36
    .line 37
    invoke-direct {v0, p0, p2}, Ll/rdm0;-><init>(Ll/zdm0;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final Z4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->W6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/wdm0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/wdm0;-><init>(Ll/zdm0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/wnt;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/wnt;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public a5()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Ll/vak0;->c:Ll/nsv;

    .line 16
    .line 17
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/rwn0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/rwn0;->p()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/zdm0;->G4()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_4

    .line 50
    .line 51
    :cond_0
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ll/rwn0;

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/rwn0;->p()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 69
    .line 70
    iget-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 71
    .line 72
    if-nez v2, :cond_2

    .line 73
    .line 74
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 75
    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    const/4 v0, 0x0

    .line 81
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Ll/rwn0;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iget-object v3, v3, Ll/vak0;->c:Ll/nsv;

    .line 92
    .line 93
    iget-object v3, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    const-string v2, "voice-manager"

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    const-string v2, ""

    .line 109
    .line 110
    :goto_1
    invoke-static {p0, v1, v0, v2}, Ll/ydn0;->p(Ll/i6t;Ljava/lang/String;ZLjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    :goto_2
    return-void
.end method

.method public final b5(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/zdm0;->o:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Ll/odm0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/zdm0;->A4(Ljava/lang/String;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/odm0;->k(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j4(Ll/vak0;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Ll/zdm0;->n:Ll/vak0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/vak0;->c:Ll/nsv;

    .line 7
    .line 8
    iput-object p1, p0, Ll/zdm0;->m:Ll/nsv;

    .line 9
    .line 10
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/odm0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/odm0;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/odm0;

    .line 23
    .line 24
    iget-object v0, p0, Ll/zdm0;->o:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/zdm0;->A4(Ljava/lang/String;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Ll/odm0;->j(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/zdm0;->x4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->openManageDialogWithSource()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/pdm0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/pdm0;-><init>(Ll/zdm0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->setJailed()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lrx/c;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/qdm0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/qdm0;-><init>(Ll/zdm0;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final v4(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v0, "invite-settle"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    const/16 v1, 0x9

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_1
    const-string v0, "remSettle"

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    const/16 v1, 0x8

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_2
    const-string v0, "voice"

    .line 43
    .line 44
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const/4 v1, 0x7

    .line 52
    goto :goto_0

    .line 53
    :sswitch_3
    const-string v0, "jail"

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_3

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    const/4 v1, 0x6

    .line 63
    goto :goto_0

    .line 64
    :sswitch_4
    const-string v0, "call"

    .line 65
    .line 66
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    const/4 v1, 0x5

    .line 74
    goto :goto_0

    .line 75
    :sswitch_5
    const-string v0, "at"

    .line 76
    .line 77
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_5

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_5
    const/4 v1, 0x4

    .line 85
    goto :goto_0

    .line 86
    :sswitch_6
    const-string v0, "kickRoom"

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_6

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    const/4 v1, 0x3

    .line 96
    goto :goto_0

    .line 97
    :sswitch_7
    const-string v0, "report"

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_7

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_7
    const/4 v1, 0x2

    .line 107
    goto :goto_0

    .line 108
    :sswitch_8
    const-string v0, "managerInvite"

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_8

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_8
    const/4 v1, 0x1

    .line 118
    goto :goto_0

    .line 119
    :sswitch_9
    const-string v0, "sayHello"

    .line 120
    .line 121
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_9

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_9
    const/4 v1, 0x0

    .line 129
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 130
    .line 131
    .line 132
    const/4 p0, 0x0

    .line 133
    goto/16 :goto_3

    .line 134
    .line 135
    :pswitch_0
    new-instance p0, Ll/k8p0;

    .line 136
    .line 137
    const-string v0, "\u9080\u8bf7\u5165\u9a7b"

    .line 138
    .line 139
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    goto/16 :goto_3

    .line 143
    .line 144
    :pswitch_1
    new-instance p0, Ll/k8p0;

    .line 145
    .line 146
    const-string v0, "\u79fb\u9664\u5165\u9a7b"

    .line 147
    .line 148
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    goto/16 :goto_3

    .line 152
    .line 153
    :pswitch_2
    invoke-virtual {p0}, Ll/zdm0;->z4()Ll/k8p0;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    goto :goto_3

    .line 158
    :pswitch_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Ll/rwn0;

    .line 163
    .line 164
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 169
    .line 170
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eqz v0, :cond_b

    .line 175
    .line 176
    iget-object p0, p0, Ll/zdm0;->n:Ll/vak0;

    .line 177
    .line 178
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 183
    .line 184
    new-instance v0, Ll/k8p0;

    .line 185
    .line 186
    if-eqz p0, :cond_a

    .line 187
    .line 188
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->U1:I

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_a
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t9:I

    .line 192
    .line 193
    :goto_1
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :goto_2
    move-object p0, v0

    .line 201
    goto :goto_3

    .line 202
    :cond_b
    new-instance p0, Ll/k8p0;

    .line 203
    .line 204
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t9:I

    .line 205
    .line 206
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    goto :goto_3

    .line 214
    :pswitch_4
    invoke-virtual {p0}, Ll/zdm0;->R4()Ll/k8p0;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    goto :goto_3

    .line 219
    :pswitch_5
    new-instance v0, Ll/k8p0;

    .line 220
    .line 221
    invoke-virtual {p0}, Ll/zdm0;->y4()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :pswitch_6
    new-instance p0, Ll/k8p0;

    .line 230
    .line 231
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ob:I

    .line 232
    .line 233
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    goto :goto_3

    .line 241
    :pswitch_7
    invoke-virtual {p0}, Ll/zdm0;->C4()Ll/k8p0;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    goto :goto_3

    .line 246
    :pswitch_8
    invoke-virtual {p0}, Ll/zdm0;->B4()Ll/k8p0;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    goto :goto_3

    .line 251
    :pswitch_9
    new-instance p0, Ll/k8p0;

    .line 252
    .line 253
    const-string v0, "\u6253\u62db\u547c"

    .line 254
    .line 255
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    :goto_3
    if-eqz p0, :cond_c

    .line 259
    .line 260
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0, p2}, Ll/k8p0;->e(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    :cond_c
    return-void

    .line 267
    :sswitch_data_0
    .sparse-switch
        -0x77fbd859 -> :sswitch_9
        -0x49110aea -> :sswitch_8
        -0x37b3aacc -> :sswitch_7
        -0x337963bf -> :sswitch_6
        0xc33 -> :sswitch_5
        0x2e7a5e -> :sswitch_4
        0x31a89a -> :sswitch_3
        0x6b2e132 -> :sswitch_2
        0x1bbf5a85 -> :sswitch_1
        0x36f1008f -> :sswitch_0
    .end sparse-switch

    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    :pswitch_data_0
    .packed-switch 0x0
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

.method public w4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/th0$a;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    const-string v1, "\u786e\u5b9a\u8981\u64a4\u9500\u7ba1\u7406\u5458\uff1f"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "\u64a4\u9500\u540e\uff0c\u5bf9\u65b9\u5c06\u4e0d\u518d\u662f\u672c\u623f\u95f4\u7684\u7ba1\u7406\u5458"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "\u786e\u8ba4"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/vdm0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/vdm0;-><init>(Ll/zdm0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string v0, "\u53d6\u6d88"

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onCancelManager()Ll/v3f$d;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final y4()Ljava/lang/String;
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qe:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/zdm0;->m:Ll/nsv;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Se:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    return-object v0
.end method

.method public final z4()Ll/k8p0;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Ll/vak0;->c:Ll/nsv;

    .line 16
    .line 17
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Ll/atm0;->i0(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ll/rwn0;

    .line 44
    .line 45
    invoke-virtual {v2}, Ll/rwn0;->p()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    return-object v1

    .line 52
    :cond_1
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    if-nez v1, :cond_3

    .line 56
    .line 57
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 58
    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->oj:I

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    :goto_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->oi:I

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/zdm0;->G4()Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-nez v3, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Ll/rwn0;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/rwn0;->p()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    :cond_4
    iget-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 86
    .line 87
    if-eqz p0, :cond_5

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_5
    const/4 v2, 0x0

    .line 91
    :goto_1
    move p0, v1

    .line 92
    :goto_2
    new-instance v0, Ll/k8p0;

    .line 93
    .line 94
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v2}, Ll/k8p0;->d(Z)V

    .line 102
    .line 103
    .line 104
    return-object v0
.end method
