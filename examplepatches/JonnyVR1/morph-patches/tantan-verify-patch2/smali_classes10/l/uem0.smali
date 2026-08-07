.class public Ll/uem0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tam;


# instance fields
.field public a:Ll/rmp0;

.field public b:Ll/zmo0;

.field public c:J

.field public d:Z

.field public final e:Ll/x3m;

.field public f:Ll/hti;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hti<",
            "Ll/rwn0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/uem0;->c:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/uem0;->d:Z

    .line 10
    .line 11
    new-instance v0, Ll/uem0$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/uem0$a;-><init>(Ll/uem0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/uem0;->e:Ll/x3m;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic b(Ll/uem0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/uem0;->d:Z

    return-void
.end method

.method private c()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/app/Activity;

    .line 20
    .line 21
    :goto_0
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    instance-of v1, v0, Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->o(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, ""

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {p0, v3, v3, v2}, Ll/uem0;->K1(ZZLjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/pn0;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_1
    return-void
.end method

.method private d(Ll/oo2;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/uem0;->f:Ll/hti;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/hti;->c()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/uem0;->f:Ll/hti;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/hti;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->B(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {v2, p1}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const/high16 v0, 0x10000000

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    const-string v1, ""

    .line 55
    .line 56
    invoke-virtual {p0, v0, v0, v1}, Ll/uem0;->K1(ZZLjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public B0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zmo0;->i0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rmp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uem0;->e(Ll/rmp0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zmo0;->n0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public K0(ZZ)V
    .locals 1

    .line 1
    const-string v0, "other"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/uem0;->K1(ZZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K1(ZZLjava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "dismiss:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "[live][voiceWindow]"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/wrv;->v()Ll/nam;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-interface {v0, v1}, Ll/nam;->g(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/rmp0;->l()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 44
    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {v0, p1, p2}, Ll/zmo0;->k0(ZZ)V

    .line 49
    .line 50
    .line 51
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 52
    .line 53
    iget-object p2, p0, Ll/uem0;->e:Ll/x3m;

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ll/wrv;->C0(Ll/x3m;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/uem0;->a:Ll/rmp0;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/rmp0;->destroy()V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    iput-object p1, p0, Ll/uem0;->a:Ll/rmp0;

    .line 65
    .line 66
    iput-object p1, p0, Ll/uem0;->b:Ll/zmo0;

    .line 67
    .line 68
    iput-object p1, p0, Ll/uem0;->f:Ll/hti;

    .line 69
    .line 70
    iput-boolean v1, p0, Ll/uem0;->d:Z

    .line 71
    .line 72
    const-string p0, "close_type"

    .line 73
    .line 74
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    filled-new-array {p0}, [Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string p1, "e_audio_room_end_floating_bubble"

    .line 83
    .line 84
    const-string p2, ""

    .line 85
    .line 86
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method public a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zmo0;->C()Z

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

.method public e(Ll/rmp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uem0;->a:Ll/rmp0;

    .line 2
    .line 3
    return-void
.end method

.method public f()Ll/rwn0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zmo0;->B()Ll/rwn0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public g()Ll/uam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rmp0;->k()Ll/uam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const/4 p1, 0x3

    .line 8
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/rmp0;->v()Z

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-boolean p1, p0, Ll/uem0;->d:Z

    .line 21
    .line 22
    if-nez p1, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/rmp0;->v()Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {v0}, Ll/rmp0;->j()V

    .line 31
    .line 32
    .line 33
    :cond_2
    return-void
.end method

.method public i()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zmo0;->E()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, ""

    .line 17
    .line 18
    return-object p0
.end method

.method public isShowing()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rmp0;->l()Z

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
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public bridge synthetic j()Ll/oo2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uem0;->f()Ll/rwn0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/hti;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hti<",
            "Ll/rwn0;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/uem0;->f:Ll/hti;

    .line 2
    .line 3
    iget-object v0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rmp0;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Ll/uem0;->a:Ll/rmp0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/rmp0;->v()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return v2

    .line 23
    :cond_1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/wrv;->v()Ll/nam;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0, v1}, Ll/nam;->g(Z)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/zmo0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Ll/rwn0;

    .line 39
    .line 40
    invoke-direct {v0, p0, p1}, Ll/zmo0;-><init>(Ll/uem0;Ll/rwn0;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/zmo0;->K()V

    .line 46
    .line 47
    .line 48
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 49
    .line 50
    iget-object v0, p0, Ll/uem0;->e:Ll/x3m;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/wrv;->g0(Ll/x3m;)V

    .line 53
    .line 54
    .line 55
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/wrv;->Q()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0, v2}, Ll/uem0;->h(Z)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return v1
.end method

.method public q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    invoke-virtual {v0}, Ll/rwn0;->F3()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/o5c;->a()Ll/o5c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, v0}, Ll/o5c;->c(Ll/oo2;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "openBigWindow.roomState:"

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "[live][voiceWindow]"

    .line 42
    .line 43
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ll/rwn0;->q()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-direct {p0}, Ll/uem0;->c()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    invoke-direct {p0, v0}, Ll/uem0;->d(Ll/oo2;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public v0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/rwn0;->q()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    :cond_0
    iget-object p0, p0, Ll/uem0;->b:Ll/zmo0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/jsv;->a()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    const/4 v0, 0x2

    .line 54
    if-ne p0, v0, :cond_1

    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_1
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public y1(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/uem0;->c:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/uem0;->c:J

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/uem0;->q()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
