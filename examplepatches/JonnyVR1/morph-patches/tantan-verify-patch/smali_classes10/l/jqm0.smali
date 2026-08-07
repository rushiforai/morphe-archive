.class public Ll/jqm0;
.super Ll/rwn0;
.source "SourceFile"

# interfaces
.implements Ll/v91;


# instance fields
.field public e0:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

.field public f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

.field public g0:J

.field public final h0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/szn0;Ll/ajt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/rwn0;-><init>(Ll/szn0;Ll/ajt;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/jqm0;->h0:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic T3(Ll/jqm0;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jqm0;->d4(Ll/ugd0;)V

    return-void
.end method


# virtual methods
.method public F0()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rwn0;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0}, Ll/oo2;->F0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public I3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->autoJoinGame:Z

    .line 4
    .line 5
    return-void
.end method

.method public L2()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->needAutoApplySettle:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->needAutoApplySettle:Z

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    return v1
.end method

.method public M2()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->needShowRoomInfoDialog:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->needShowRoomInfoDialog:Z

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    return v1
.end method

.method public N2()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->autoJoinGame:Z

    .line 4
    .line 5
    return p0
.end method

.method public R2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->source:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public U3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getVoiceBusinessType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public V3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getVoiceBusinessProvider()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public W3()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jqm0;->h0:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public X3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getVoicePushUrl()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Y3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getRoomId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Z3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;
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
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getLiveInfo(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rwn0;->Q:Z

    .line 2
    .line 3
    return-void
.end method

.method public a4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->simpleChat:Z

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public b()Ll/bjt;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

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
    iput-object v0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 17
    .line 18
    return-object p0
.end method

.method public c0(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/rwn0;->c0(Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/jqm0;->e0:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 6
    .line 7
    iget-object p1, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x3

    .line 12
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->clearQuickInfo()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public c4()Z
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vwt;->w7()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/jqm0;->Y3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/jqm0;->V3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/jqm0;->U3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/jqm0;->X3()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_0

    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_0
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public final synthetic d4(Ll/ugd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oo2;->y:Ll/ugd0;

    .line 2
    .line 3
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
    iget-boolean v0, p0, Ll/rwn0;->Q:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-boolean v0, p0, Ll/rwn0;->S:Z

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
    invoke-virtual {p0, p1, v0, p2}, Ll/rwn0;->O1(ZLjava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Ll/rwn0;->S:Z

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

.method public e4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/jqm0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance p2, Ll/iqm0;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/iqm0;-><init>(Ll/jqm0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public exit()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/rwn0;->l3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/vp20;->x()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getOutRoom(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    sget-object v0, Ll/qfu;->b:Ll/qfu;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/vp20;->h(Ll/jsv;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Ll/jqm0;->c0(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public f4(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
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
    iput-object p1, p0, Ll/jqm0;->e0:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Ll/jqm0;->e0:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 15
    .line 16
    return-void
.end method

.method public g4(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jqm0;->f0:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 2
    .line 3
    return-void
.end method

.method public y0()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm0;->e0:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 2
    .line 3
    return-object p0
.end method
