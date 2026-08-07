.class public Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;
.super Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;
.source "SourceFile"


# static fields
.field public static final m:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static n:J


# instance fields
.field public c:Z

.field public d:Z

.field public e:Ll/kcg0;

.field public f:J

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

.field public i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

.field public j:Z

.field public k:Z

.field public l:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->m:Lrx/subjects/b;

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    sput-wide v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->n:J

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->d:Z

    .line 6
    .line 7
    const-string v0, "type_normal_live"

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->g:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->j:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->k:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->q2(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->p2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->r2()V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->n2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->k2()V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->r2()V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->o2(Ll/uxj0;)V

    return-void
.end method

.method private i2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setFullSlide(Z)V

    .line 15
    .line 16
    .line 17
    :goto_0
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h2()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->m:Lrx/subjects/b;

    .line 24
    .line 25
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private k2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ere;->f()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->e:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/am2;->j()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/r230;->s()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/tantan/library/svga/SVGALoader;->clear()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 25
    .line 26
    .line 27
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    invoke-static {p0}, Ll/r230;->G(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->o0()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private synthetic n2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, p0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/cmp0;->i()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method private synthetic o2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public debugItems()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/mdc0;->D3:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->P4()V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/pvn;->b()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, v0, Landroid/content/res/Configuration;->fontScale:F

    .line 10
    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    cmpl-float v1, v1, v2

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iput v2, v0, Landroid/content/res/Configuration;->fontScale:F

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object p0
.end method

.method public final h2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "LIVE_ACT_FRAG_TAG"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroidx/fragment/app/k;->r(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-virtual {p1, p2}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->l2()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    sget p0, Ll/obc0;->e3:I

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget p0, Ll/obc0;->x3:I

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget v0, Ll/n9c0;->a:I

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->m2()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    const-string p0, "#2C2F36"

    .line 54
    .line 55
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    sget p0, Ll/obc0;->E3:I

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 66
    .line 67
    .line 68
    :goto_0
    sget p0, Ll/mdc0;->D3:I

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Landroid/view/View;->setId(I)V

    .line 71
    .line 72
    .line 73
    return-object p1
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oqr;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/oqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/pqr;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/pqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/qqr;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/qqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->m:Lrx/subjects/b;

    .line 34
    .line 35
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/rqr;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/rqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->e:Ll/kcg0;

    .line 53
    .line 54
    return-void
.end method

.method public final l2()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->liveType:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "type_normal_live"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

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

.method public final m2()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    instance-of v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->type:Ljava/lang/String;

    .line 28
    .line 29
    const-string v0, "type_voice_live"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    :cond_1
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_2
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/mdc0;->D3:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move-object v1, v0

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->o()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->o()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :goto_0
    return-void

    .line 38
    :cond_1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onLowMemory()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onLowMemory()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->f:J

    .line 9
    .line 10
    sub-long v2, v0, v2

    .line 11
    .line 12
    const-wide/16 v4, 0x4e20

    .line 13
    .line 14
    cmp-long v2, v2, v4

    .line 15
    .line 16
    if-lez v2, :cond_0

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->f:J

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ma:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onPauseLifecycle()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->j:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/ive0;->l()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v0, "V3.2"

    .line 15
    .line 16
    invoke-static {}, Ll/ive0;->d()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->l:J

    .line 31
    .line 32
    sub-long/2addr v0, v2

    .line 33
    const-wide/16 v2, 0xa

    .line 34
    .line 35
    cmp-long v0, v0, v2

    .line 36
    .line 37
    if-gtz v0, :cond_0

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->k:Z

    .line 41
    .line 42
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->l:J

    .line 47
    .line 48
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string v0, "LIVE_RESTORE_DATA"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    instance-of v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 9

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->c:Z

    .line 5
    .line 6
    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    .line 7
    .line 8
    const/16 v2, 0x1e

    .line 9
    .line 10
    const-string v3, "android.permission.READ_PHONE_STATE"

    .line 11
    .line 12
    const-string v4, "type_voice_live"

    .line 13
    .line 14
    const/4 v5, 0x2

    .line 15
    const/4 v6, 0x0

    .line 16
    const/4 v7, 0x1

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->d:Z

    .line 20
    .line 21
    if-nez v0, :cond_6

    .line 22
    .line 23
    invoke-static {v5}, Ll/wft;->b(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->g:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-static {v5}, Ll/wft;->b(I)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_0

    .line 50
    .line 51
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 52
    .line 53
    if-le v3, v2, :cond_0

    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->q(Ljava/util/List;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/sqr;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/sqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 81
    .line 82
    .line 83
    new-instance v2, Ll/tqr;

    .line 84
    .line 85
    invoke-direct {v2}, Ll/tqr;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    iput-boolean v7, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->d:Z

    .line 99
    .line 100
    new-instance v0, Ll/uqr;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/uqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->j:Z

    .line 110
    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->k:Z

    .line 114
    .line 115
    if-eqz v0, :cond_6

    .line 116
    .line 117
    iput-boolean v6, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->j:Z

    .line 118
    .line 119
    iput-boolean v6, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->k:Z

    .line 120
    .line 121
    new-instance v0, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .line 125
    .line 126
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->g:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    if-nez v4, :cond_3

    .line 133
    .line 134
    const-string v3, "android.permission.CAMERA"

    .line 135
    .line 136
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_3
    invoke-static {v7}, Ll/wft;->b(I)Z

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    if-nez v4, :cond_4

    .line 145
    .line 146
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    :cond_4
    :goto_0
    invoke-static {v5}, Ll/wft;->b(I)Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    if-nez v3, :cond_5

    .line 154
    .line 155
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 156
    .line 157
    if-le v3, v2, :cond_5

    .line 158
    .line 159
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    :cond_5
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 163
    .line 164
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->q(Ljava/util/List;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    new-instance v1, Ll/vqr;

    .line 188
    .line 189
    invoke-direct {v1, p0}, Ll/vqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 190
    .line 191
    .line 192
    new-instance v2, Ll/wqr;

    .line 193
    .line 194
    invoke-direct {v2, p0}, Ll/wqr;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 202
    .line 203
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 204
    .line 205
    .line 206
    :cond_6
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "LIVE_ACT_FRAG_TAG"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    instance-of v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->Q4()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string v0, "LIVE_RESTORE_DATA"

    .line 29
    .line 30
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public onStopLifecycle()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onStopLifecycle()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->d:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->r2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setEnableMask(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setEnableAnimMask(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "jump_to_tag"

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->c:Z

    .line 23
    .line 24
    const-string v0, "LIVE_AUDIENCE_START_DATA"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 33
    .line 34
    const-string v0, "LIVE_ANCHOR_START_DATA"

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->finish()V

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    sget-wide v2, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->n:J

    .line 62
    .line 63
    sub-long/2addr v0, v2

    .line 64
    const-wide/16 v2, 0x1f4

    .line 65
    .line 66
    cmp-long v0, v0, v2

    .line 67
    .line 68
    if-gez v0, :cond_1

    .line 69
    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 73
    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    instance-of p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 81
    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->finish()V

    .line 85
    .line 86
    .line 87
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    sput-wide v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->n:J

    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 94
    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->type:Ljava/lang/String;

    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->g:Ljava/lang/String;

    .line 100
    .line 101
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/am2;->j()V

    .line 104
    .line 105
    .line 106
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->c:Z

    .line 107
    .line 108
    if-nez p1, :cond_3

    .line 109
    .line 110
    sget-object p1, Ll/v2t;->d:Ljava/lang/String;

    .line 111
    .line 112
    const-string v0, "LiveAct.preCreateView() subscribeEngineSo"

    .line 113
    .line 114
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :try_start_0
    invoke-static {}, Ll/hlj;->e()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v0, " live source is "

    .line 124
    .line 125
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->source:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v0, ", live category is "

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->category:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v0, ", live fromLiveSquare is"

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 153
    .line 154
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->fromLiveSquare:Z

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v0, ", live id is "

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    sget-object p1, Ll/v2t;->d:Ljava/lang/String;

    .line 178
    .line 179
    const-string v0, "LiveAct.preCreateView() LivingRoomModule.livingRoomBridge is null."

    .line 180
    .line 181
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-static {p1, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    new-instance p1, Ljava/lang/Exception;

    .line 189
    .line 190
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_3
    sget-object p1, Ll/v2t;->d:Ljava/lang/String;

    .line 202
    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v1, "live page start "

    .line 206
    .line 207
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 211
    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->type:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :goto_0
    invoke-static {}, Ll/zft;->a()V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Ll/hlj;->b()V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public final synthetic q2(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->GoToSettingPage:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->j:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p1, 0x3

    .line 10
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->finish()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public final r2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->c:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->O4(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->isTeenMode:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->P4(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->N4(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :goto_0
    sget v1, Ll/mdc0;->D3:I

    .line 36
    .line 37
    const-string v2, "LIVE_ACT_FRAG_TAG"

    .line 38
    .line 39
    invoke-virtual {v0, v1, p0, v2}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroidx/fragment/app/k;->j()I

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public s2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->c:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->i:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->r2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public shouldBlockOnCreate(Landroid/os/Bundle;)Z
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "android:fragments"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "android:support:fragments"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/q2f;->a(Landroid/content/Intent;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    return v1

    .line 25
    :cond_1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 34
    .line 35
    if-ne v0, v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v1

    .line 45
    :cond_2
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->shouldBlockOnCreate(Landroid/os/Bundle;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0
.end method

.method public u2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->c:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->h:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->r2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
