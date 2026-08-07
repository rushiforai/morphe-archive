.class public Ll/agd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/p5m;

.field public b:Ll/o5m;

.field public c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public d:Ll/v5m;

.field public final e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/ajt;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ajt;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/agd0;->e:Lrx/subjects/a;

    .line 9
    .line 10
    iput-object p1, p0, Ll/agd0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 11
    .line 12
    iput-object p3, p0, Ll/agd0;->f:Ll/ajt;

    .line 13
    .line 14
    iget-object p1, p3, Ll/ajt;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Ll/agd0;->l(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/g9f0;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    iput-object p3, p0, Ll/agd0;->d:Ll/v5m;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Ll/agd0;->k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/p5m;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iput-object p3, p0, Ll/agd0;->a:Ll/p5m;

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/agd0;->j(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/o5m;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/agd0;->b:Ll/o5m;

    .line 33
    .line 34
    instance-of p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ll/agd0;->u(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic b(Ll/agd0;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/agd0;->w(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic e(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/yfd0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/yfd0;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ll/agd0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/agd0;->x(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h(Ljava/util/List;Ll/j7u;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/j7u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 2
    .line 3
    const-string v1, "onlive"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Ll/j7u;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/agd0;->b:Ll/o5m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/o5m;->h()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/agd0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/agd0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/util/List;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/wfd0;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/wfd0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/xfd0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/xfd0;-><init>(Ll/agd0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public B(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/agd0;->b:Ll/o5m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/o5m;->h()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/zfd0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/zfd0;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/agd0;->b:Ll/o5m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/o5m;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/agd0;->d:Ll/v5m;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/v5m;->b()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/agd0;->l(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/g9f0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/agd0;->d:Ll/v5m;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Ll/agd0;->k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/p5m;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/agd0;->a:Ll/p5m;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Ll/agd0;->j(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/o5m;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/agd0;->b:Ll/o5m;

    .line 28
    .line 29
    return-void
.end method

.method public final i(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->on:Z

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->conditions:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;

    .line 13
    .line 14
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;->continousUnwatchDays:I

    .line 15
    .line 16
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;->onlyOneWatchContinousDays:I

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 20
    .line 21
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wj:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

    .line 30
    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showDefaultTitle:Z

    .line 32
    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 34
    .line 35
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 36
    .line 37
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Rb:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultTitle:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0
.end method

.method public final j(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/o5m;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/agd0;->f:Ll/ajt;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Ll/ajt;->v(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ll/zro0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/agd0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->subSource:Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1, p2}, Ll/zro0;-><init>(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    iput-object p1, p0, Ll/agd0;->g:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v0, Ll/bkt;

    .line 29
    .line 30
    iget-object p0, p0, Ll/agd0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->subSource:Ljava/lang/String;

    .line 33
    .line 34
    invoke-direct {v0, p0, p1, p2}, Ll/bkt;-><init>(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public final k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/p5m;
    .locals 0

    .line 1
    new-instance p1, Ll/km5;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/km5;-><init>(Ll/agd0;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p2}, Ll/p5m;->f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method public final l(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/g9f0;
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/vwt;->E4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/agd0;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 16
    .line 17
    new-instance p1, Ll/g9f0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/agd0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->subSource:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {p1, v1, v0, p2}, Ll/g9f0;-><init>(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/agd0;->f:Ll/ajt;

    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-virtual {p0, v0, v1}, Ll/ajt;->u(J)V

    .line 33
    .line 34
    .line 35
    return-object p1
.end method

.method public m(Ll/ugd0;)V
    .locals 3
    .annotation build Landroidx/annotation/UiThread;
    .end annotation

    .line 1
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/agd0;->a:Ll/p5m;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/p5m;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v2, p1, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 56
    .line 57
    const-string v1, "-1"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    :cond_2
    iget-object v0, p0, Ll/agd0;->a:Ll/p5m;

    .line 66
    .line 67
    iget-object v1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 68
    .line 69
    invoke-interface {v0, v1}, Ll/p5m;->f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/agd0;->b:Ll/o5m;

    .line 73
    .line 74
    invoke-interface {v0, p1}, Ll/o5m;->e(Ll/ugd0;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    invoke-virtual {p0}, Ll/agd0;->n()V

    .line 78
    .line 79
    .line 80
    :cond_4
    :goto_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/agd0;->b:Ll/o5m;

    .line 2
    .line 3
    iget-object v1, p0, Ll/agd0;->a:Ll/p5m;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/p5m;->d()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {v0, v1}, Ll/o5m;->c(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/agd0;->d:Ll/v5m;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/v5m;->a()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public o()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/agd0;->e:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/ufd0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/ufd0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/vfd0;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/vfd0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public p()Ll/o5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agd0;->b:Ll/o5m;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ll/p5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agd0;->a:Ll/p5m;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/agd0;->e:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    return-object p0
.end method

.method public final s(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/util/List;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Ll/j7u;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->queryCurrentLivesInfo(Ljava/util/List;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/agd0;->v()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->I6(Ljava/util/List;Z)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public t()Ll/v5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agd0;->d:Ll/v5m;

    .line 2
    .line 3
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/agd0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    const-wide/16 v1, 0x1e

    .line 4
    .line 5
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/sfd0;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/sfd0;-><init>(Ll/agd0;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Ll/tfd0;

    .line 33
    .line 34
    invoke-direct {p0}, Ll/tfd0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final v()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6s;->G0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/agd0;->A(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/agd0;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/rgd0;->k()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->i()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/agd0;->d:Ll/v5m;

    .line 25
    .line 26
    invoke-interface {p0}, Ll/v5m;->i()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic x(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/agd0;->a:Ll/p5m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/p5m;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/agd0;->b:Ll/o5m;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/o5m;->b(Ljava/util/Collection;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public y(Ll/ugd0;Z)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/agd0;->e:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/agd0;->b:Ll/o5m;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ll/o5m;->i(Ll/ugd0;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/agd0;->b:Ll/o5m;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/o5m;->d(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getJumpRoomType()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->USER_SWIPE:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 11
    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getJumpRoomType()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->END_SUGGEST:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 19
    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/agd0;->q()Ll/p5m;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ll/p5m;->f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getJumpRoomType()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->END_SUGGEST:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 38
    .line 39
    if-ne v0, v1, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Ll/agd0;->d:Ll/v5m;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLiveIdNeedToRemove()Ljava/util/HashSet;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-interface {p0, p1}, Ll/v5m;->d(Ljava/util/Collection;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method
