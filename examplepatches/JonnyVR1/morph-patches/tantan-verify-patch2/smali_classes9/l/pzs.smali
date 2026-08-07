.class public Ll/pzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k3m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/k3m<",
        "Ll/tzs;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/tzs;

.field public b:Ll/qid0;

.field public c:Ll/jxd0;

.field public d:Ll/m8t;

.field public e:F

.field public f:Ll/kwr;

.field public g:Ll/hti;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hti<",
            "*>;"
        }
    .end annotation
.end field

.field public h:Ll/kcg0;

.field public i:Ll/eti;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/pzs;->e:F

    .line 6
    .line 7
    new-instance v0, Ll/kwr;

    .line 8
    .line 9
    new-instance v1, Ll/jzs;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/jzs;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/kwr;-><init>(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/pzs;->f:Ll/kwr;

    .line 18
    .line 19
    new-instance v0, Ll/pzs$e;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/pzs$e;-><init>(Ll/pzs;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/pzs;->i:Ll/eti;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic b(Ll/pzs;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzs;->v(Z)V

    return-void
.end method

.method public static synthetic c(Ll/pzs;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzs;->t()V

    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/pzs;Ll/nsf0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzs;->u(Ll/nsf0$a;)V

    return-void
.end method

.method public static synthetic f(Ll/nsf0$a;)Ljava/lang/Float;
    .locals 0

    .line 1
    iget p0, p0, Ll/nsf0$a;->a:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static bridge synthetic g(Ll/pzs;)Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzs;->c:Ll/jxd0;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/pzs;)Ll/qid0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzs;->b:Ll/qid0;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/pzs;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzs;->o(Z)V

    return-void
.end method

.method public static bridge synthetic l(Ll/pzs;ZZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pzs;->r(ZZZ)V

    return-void
.end method

.method public static bridge synthetic m(Ll/pzs;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzs;->w(Z)V

    return-void
.end method


# virtual methods
.method public G1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzs;->f:Ll/kwr;

    .line 2
    .line 3
    invoke-static {p0}, Ll/lwr;->f(Ll/ga1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K0(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/pzs;->r(ZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n(Ll/tzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pzs;->a:Ll/tzs;

    .line 2
    .line 3
    return-void
.end method

.method public final o(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/ozs;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/ozs;-><init>(Ll/pzs;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Ll/pzs;->a:Ll/tzs;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/tzs;->k()Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pzs;->b:Ll/qid0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/qid0;->L()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/o5c;->a()Ll/o5c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, v0}, Ll/o5c;->c(Ll/oo2;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "openBigWindow.roomState:"

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "live_float_window"

    .line 36
    .line 37
    invoke-static {v2, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Ll/pzs;->b:Ll/qid0;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/qid0;->J()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v2, p0, Ll/pzs;->b:Ll/qid0;

    .line 51
    .line 52
    invoke-virtual {v2}, Ll/qid0;->H()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-virtual {p0, v3, v3}, Ll/pzs;->K0(ZZ)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v3, 0x1

    .line 71
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->B(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {p0, v0}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/high16 v0, 0x10000000

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final r(ZZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pzs;->h:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "dismiss:"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "live_float_window"

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/pzs;->b:Ll/qid0;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-static {}, Ll/lwr;->a()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/pzs;->b:Ll/qid0;

    .line 40
    .line 41
    xor-int/lit8 v2, p3, 0x1

    .line 42
    .line 43
    invoke-virtual {v0, p1, p2, v2}, Ll/qid0;->w0(ZZZ)V

    .line 44
    .line 45
    .line 46
    if-nez p3, :cond_0

    .line 47
    .line 48
    invoke-static {}, Ll/iti;->c()Ll/iti;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/iti;->b()V

    .line 53
    .line 54
    .line 55
    :cond_0
    iput-object v1, p0, Ll/pzs;->b:Ll/qid0;

    .line 56
    .line 57
    :cond_1
    invoke-static {}, Ll/iti;->c()Ll/iti;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, p3}, Ll/iti;->d(Z)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/pzs;->d:Ll/m8t;

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/m8t;->d()V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Ll/pzs;->d:Ll/m8t;

    .line 72
    .line 73
    :cond_2
    iget-object p1, p0, Ll/pzs;->a:Ll/tzs;

    .line 74
    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/tzs;->destroy()V

    .line 78
    .line 79
    .line 80
    iput-object v1, p0, Ll/pzs;->a:Ll/tzs;

    .line 81
    .line 82
    :cond_3
    iput-object v1, p0, Ll/pzs;->g:Ll/hti;

    .line 83
    .line 84
    return-void
.end method

.method public s()F
    .locals 0

    .line 1
    iget p0, p0, Ll/pzs;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic t()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzs;->a:Ll/tzs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tzs;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic u(Ll/nsf0$a;)V
    .locals 2

    .line 1
    iget p1, p1, Ll/nsf0$a;->a:F

    .line 2
    .line 3
    iput p1, p0, Ll/pzs;->e:F

    .line 4
    .line 5
    invoke-static {p1}, Ll/vti;->a(F)[I

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/pzs;->a:Ll/tzs;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    aget v0, p1, v0

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    aget p1, p1, v1

    .line 16
    .line 17
    invoke-virtual {p0, v0, p1}, Ll/tzs;->l(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final v(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/pzs;->b:Ll/qid0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/qid0;->K()Ll/qwl;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/pzs;->a:Ll/tzs;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Ll/tzs;->c(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/pzs;->b:Ll/qid0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/qid0;->K()Ll/qwl;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Ll/pzs;->a:Ll/tzs;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/tzs;->e()Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;->getPlayerContainer()Landroid/widget/FrameLayout;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p1, p0}, Ll/qwl;->d(Landroid/widget/FrameLayout;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object v0, p0, Ll/pzs;->g:Ll/hti;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {p1, v0, v1}, Ll/pzm;->f(Ll/hti;Z)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p0, p0, Ll/pzs;->a:Ll/tzs;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ll/tzs;->c(Z)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public final w(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzs;->a:Ll/tzs;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/pzs;->f:Ll/kwr;

    .line 9
    .line 10
    invoke-static {v0}, Ll/lwr;->h(Ll/ga1;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    invoke-virtual {p0, p1}, Ll/pzs;->o(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/pzs;->b:Ll/qid0;

    .line 17
    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    if-eqz p1, :cond_3

    .line 21
    .line 22
    iget-object p0, p0, Ll/pzs;->c:Ll/jxd0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    const/4 p0, 0x0

    .line 38
    goto :goto_1

    .line 39
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 40
    :goto_1
    invoke-virtual {v0, p0}, Ll/qid0;->y0(Z)V

    .line 41
    .line 42
    .line 43
    :cond_4
    :goto_2
    return-void
.end method

.method public x(Ll/hti;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hti<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/pzs;->g:Ll/hti;

    .line 2
    .line 3
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/ifv;

    .line 10
    .line 11
    iget-object v0, v0, Ll/ifv;->t:Ll/jxd0;

    .line 12
    .line 13
    iput-object v0, p0, Ll/pzs;->c:Ll/jxd0;

    .line 14
    .line 15
    iget-object v0, p0, Ll/pzs;->a:Ll/tzs;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/tzs;->i()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v1, "live_float_window"

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string p0, "float has shown in app"

    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p1}, Ll/hti;->g()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/pzs;->e:F

    .line 36
    .line 37
    iget-object v0, p0, Ll/pzs;->a:Ll/tzs;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/tzs;->k()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    const-string p0, "show float fail in app"

    .line 46
    .line 47
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    const-string v0, "show float success in app"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Ll/nsf0;

    .line 57
    .line 58
    invoke-direct {v0}, Ll/nsf0;-><init>()V

    .line 59
    .line 60
    .line 61
    new-instance v1, Ll/qid0;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    new-instance v3, Ll/ngj0;

    .line 68
    .line 69
    iget-object v4, p0, Ll/pzs;->a:Ll/tzs;

    .line 70
    .line 71
    invoke-virtual {v4}, Ll/tzs;->e()Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    iget-object v5, p0, Ll/pzs;->c:Ll/jxd0;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/hti;->c()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-virtual {p1}, Ll/hti;->a()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    invoke-direct {v3, v4, v5, v6, v7}, Ll/ngj0;-><init>(Landroid/view/View;Ll/jxd0;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    new-instance v4, Ll/kzs;

    .line 89
    .line 90
    invoke-direct {v4, p0}, Ll/kzs;-><init>(Ll/pzs;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {v1, v0, v2, v3, v4}, Ll/qid0;-><init>(Ll/nsf0;Ll/oo2;Ll/ngj0;Ll/z20;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Ll/pzs;->b:Ll/qid0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/nsf0;->a()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/lzs;

    .line 103
    .line 104
    invoke-direct {v1}, Ll/lzs;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/mzs;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/mzs;-><init>(Ll/pzs;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/pzs;->f:Ll/kwr;

    .line 124
    .line 125
    new-instance v1, Ll/pzs$a;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Ll/pzs$a;-><init>(Ll/pzs;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ll/kwr;->f(Ll/a30;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/pzs;->f:Ll/kwr;

    .line 134
    .line 135
    new-instance v1, Ll/pzs$b;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/pzs$b;-><init>(Ll/pzs;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ll/kwr;->e(Ll/z20;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/pzs;->f:Ll/kwr;

    .line 144
    .line 145
    new-instance v1, Ll/pzs$c;

    .line 146
    .line 147
    invoke-direct {v1, p0}, Ll/pzs$c;-><init>(Ll/pzs;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ll/kwr;->g(Ll/z20;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Ll/pzs;->b:Ll/qid0;

    .line 154
    .line 155
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {v0, p1}, Ll/qid0;->O(Ll/qwl;)V

    .line 160
    .line 161
    .line 162
    new-instance p1, Ll/m8t;

    .line 163
    .line 164
    new-instance v0, Ll/pzs$d;

    .line 165
    .line 166
    invoke-direct {v0, p0}, Ll/pzs$d;-><init>(Ll/pzs;)V

    .line 167
    .line 168
    .line 169
    invoke-direct {p1, v0}, Ll/m8t;-><init>(Ll/v120;)V

    .line 170
    .line 171
    .line 172
    iput-object p1, p0, Ll/pzs;->d:Ll/m8t;

    .line 173
    .line 174
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    new-instance v0, Ll/nzs;

    .line 183
    .line 184
    invoke-direct {v0, p0}, Ll/nzs;-><init>(Ll/pzs;)V

    .line 185
    .line 186
    .line 187
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iput-object p1, p0, Ll/pzs;->h:Ll/kcg0;

    .line 196
    .line 197
    return-void
.end method
