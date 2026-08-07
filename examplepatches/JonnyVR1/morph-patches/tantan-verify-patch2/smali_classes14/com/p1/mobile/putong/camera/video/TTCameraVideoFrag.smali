.class public Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;
.super Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field public B:Ll/u6m;

.field public C:Ll/y6m;

.field public D:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->Y4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->e5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->h5()V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->a5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->Z4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->g5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->b5()V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->f5()V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->d5(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->c5()V

    return-void
.end method

.method private synthetic Y4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Z4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/y6m;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->k5(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->j5()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic a5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->l5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/camera/R$string;->e:I

    .line 5
    .line 6
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/u6m;->q()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/zvh0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/zvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private i5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/u6m;->getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/qvh0;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/qvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 12
    .line 13
    .line 14
    new-instance v3, Ll/rvh0;

    .line 15
    .line 16
    invoke-direct {v3, p0}, Ll/rvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v1, v2, v3}, Ll/y6m;->d(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private j5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->g()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-interface {v0, v1, v2}, Ll/u6m;->a(J)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 15
    .line 16
    invoke-interface {v1}, Ll/u6m;->getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, v1}, Ll/y6m;->a(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->D:Ll/kcg0;

    .line 24
    .line 25
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->g()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const-wide/16 v2, 0x0

    .line 35
    .line 36
    cmp-long v0, v0, v2

    .line 37
    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    const-wide/16 v0, 0x1

    .line 41
    .line 42
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->g()J

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    long-to-int v1, v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/wvh0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/wvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 78
    .line 79
    .line 80
    new-instance v2, Ll/xvh0;

    .line 81
    .line 82
    invoke-direct {v2, p0}, Ll/xvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 83
    .line 84
    .line 85
    new-instance v3, Ll/yvh0;

    .line 86
    .line 87
    invoke-direct {v3, p0}, Ll/yvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2, v3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->D:Ll/kcg0;

    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method private l5()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->k5(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/y6m;->destroy()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->l()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    xor-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->y(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->X4()Ll/y6m;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ll/y6m;->b(Lcom/p1/mobile/putong/camera/TTCameraConfig;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->i5()V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final X4()Ll/y6m;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/ith0;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v0, p0}, Ll/ith0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    new-instance v0, Ll/awh0;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v0, p0}, Ll/awh0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public final synthetic b5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ll/u6m;->b(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic c5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0}, Ll/u6m;->b(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->X4()Ll/y6m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 11
    .line 12
    invoke-interface {v0, p0}, Ll/y6m;->b(Lcom/p1/mobile/putong/camera/TTCameraConfig;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic d5(Ljava/lang/Long;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    const-wide/16 v3, 0x1

    .line 8
    .line 9
    add-long/2addr v1, v3

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->g()J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    invoke-interface {v0, v1, v2, p0, p1}, Ll/u6m;->d(JJ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic e5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->k5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic f5()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->k5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 5
    .line 6
    invoke-interface {p1}, Ll/u6m;->getCloseButton()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/svh0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/svh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 19
    .line 20
    invoke-interface {p1}, Ll/u6m;->getRecordButton()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/tvh0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/tvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 33
    .line 34
    invoke-interface {p1}, Ll/u6m;->getSwitchCameraButton()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 41
    .line 42
    invoke-interface {p1}, Ll/u6m;->getSwitchCameraButton()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/uvh0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/uvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final h5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/u6m;->q()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/vvh0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/vvh0;-><init>(Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 11
    .line 12
    invoke-interface {p2}, Ll/u6m;->getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->d()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->setDescriptionText(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 33
    .line 34
    invoke-interface {p0}, Ll/u6m;->q()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final k5(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->D:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/y6m;->f()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/u6m;->c()V

    .line 14
    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->i()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->e()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 41
    .line 42
    invoke-interface {v3}, Ll/y6m;->c()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v3, 0x1

    .line 51
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->d(Z)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/camera/TTCameraBaseFrag;->z:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->c(Lcom/p1/mobile/putong/camera/TTCameraConfig;)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->a()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->C:Ll/y6m;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/y6m;->destroy()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->B:Ll/u6m;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/u6m;->release()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->k5(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/video/TTCameraVideoFrag;->i5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
