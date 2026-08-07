.class public Ll/ou40;
.super Ll/dw40;
.source "SourceFile"

# interfaces
.implements Ll/v91;


# instance fields
.field public final H:Ljava/lang/String;

.field public I:Ljava/lang/String;

.field public J:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public K:Z

.field public L:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

.field public M:Z

.field public N:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

.field public final O:Ll/bjt;

.field public P:Z

.field public Q:Z


# direct methods
.method public constructor <init>(Ll/ew40;Ll/ajt;Ll/bjt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dw40;-><init>(Ll/ew40;Ll/ajt;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/ou40;->J:Lrx/subjects/b;

    .line 9
    .line 10
    iput-object p3, p0, Ll/ou40;->O:Ll/bjt;

    .line 11
    .line 12
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/ou40;->H:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic G2(Lrx/Notification;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lrx/Notification;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/jfv;

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/jfv;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Lrx/Notification;->j()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 32
    .line 33
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ll/jfv;

    .line 38
    .line 39
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/jfv;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method


# virtual methods
.method public H2()V
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hiv;->e()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public I2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ")",
            "Lrx/c<",
            "Ll/ugd0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/oo2;->y:Ll/ugd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/oo2;->y:Ll/ugd0;

    .line 18
    .line 19
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "-1"

    .line 35
    .line 36
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->X4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->g5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public J2()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ou40;->N:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/ou40;->N:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/ou40;->N:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 17
    .line 18
    return-object p0
.end method

.method public K2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ou40;->P:Z

    .line 2
    .line 3
    return p0
.end method

.method public L2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ou40;->Q:Z

    .line 2
    .line 3
    return p0
.end method

.method public M2(Ll/ugd0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ugd0;",
            ")",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ll/nu40;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/nu40;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public N2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ou40;->P:Z

    .line 2
    .line 3
    return-void
.end method

.method public O2(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->isOldDataValid()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-object p1, p0, Ll/ou40;->L:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Ll/ou40;->L:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 15
    .line 16
    return-void
.end method

.method public P2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ou40;->Q:Z

    .line 2
    .line 3
    return-void
.end method

.method public Q2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ou40;->N:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ou40;->K:Z

    .line 2
    .line 3
    return-void
.end method

.method public b()Ll/bjt;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ou40;->O:Ll/bjt;

    .line 2
    .line 3
    return-object p0
.end method

.method public c0(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/oo2;->c0(Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/ou40;->M:Z

    .line 6
    .line 7
    iget-object p1, p0, Ll/ou40;->J:Lrx/subjects/b;

    .line 8
    .line 9
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Ll/ou40;->L:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 16
    .line 17
    invoke-static {}, Ll/vrv;->x()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oo2;->v:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-boolean v0, p0, Ll/ou40;->K:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-boolean v0, p0, Ll/ou40;->M:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0, p2}, Ll/dw40;->O1(ZLjava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Ll/ou40;->M:Z

    .line 34
    .line 35
    :cond_0
    return-void

    .line 36
    :cond_1
    invoke-super {p0, p1, p2}, Ll/oo2;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public exit()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/qfu;->b:Ll/qfu;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/dw40;->B2()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/ou40;->H:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v2, p0, Ll/ou40;->H:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/vp20;->x()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->F5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0, v1}, Ll/vp20;->h(Ll/jsv;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, v0}, Ll/ou40;->c0(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public y0()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ou40;->L:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 2
    .line 3
    return-object p0
.end method
