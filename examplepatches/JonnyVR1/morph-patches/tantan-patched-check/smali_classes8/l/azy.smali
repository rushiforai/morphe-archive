.class public Ll/azy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Ll/d3z;

.field public final c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Ll/bbh0;

.field public h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

.field public j:Ll/trb;

.field public k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

.field public l:Ll/cmi;

.field public m:Ll/wxd0;

.field public n:Ljava/lang/String;

.field public o:Z

.field public p:Z

.field public q:Ll/xvx;

.field public r:Z

.field public s:Ljava/lang/Runnable;

.field public t:Ljava/lang/Runnable;

.field public u:Ljava/lang/Runnable;

.field public v:Ljava/lang/Runnable;

.field public w:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Ll/d3z;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/azy;->a:I

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/azy;->e:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/azy;->f:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/azy;->r:Z

    .line 13
    .line 14
    new-instance v0, Ll/azy$d;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/azy$d;-><init>(Ll/azy;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/azy;->s:Ljava/lang/Runnable;

    .line 20
    .line 21
    new-instance v0, Ll/azy$e;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/azy$e;-><init>(Ll/azy;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/azy;->t:Ljava/lang/Runnable;

    .line 27
    .line 28
    new-instance v0, Ll/eyy;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/eyy;-><init>(Ll/azy;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/azy;->u:Ljava/lang/Runnable;

    .line 34
    .line 35
    new-instance v0, Ll/azy$a;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/azy$a;-><init>(Ll/azy;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/azy;->v:Ljava/lang/Runnable;

    .line 41
    .line 42
    iput-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 43
    .line 44
    iput-object p2, p0, Ll/azy;->b:Ll/d3z;

    .line 45
    .line 46
    invoke-virtual {p2}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 51
    .line 52
    new-instance p2, Ll/xvx;

    .line 53
    .line 54
    invoke-direct {p2}, Ll/xvx;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object p2, p0, Ll/azy;->q:Ll/xvx;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCameraFunction()Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 64
    .line 65
    const-string p1, "e_live_camera"

    .line 66
    .line 67
    const-string p2, "p_chat_view"

    .line 68
    .line 69
    invoke-static {p1, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/azy;->R()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/azy;->S()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/azy;->T()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/azy;->Y()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/azy;->P()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static bridge synthetic A(Ll/azy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->M0(Ljava/lang/String;)V

    return-void
.end method

.method public static varargs H0(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    new-instance v0, Ll/iyy;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1}, Ll/iyy;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->g2:I

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p2, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/app/Dialog;->show()V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cameraSdkLoaded()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance v0, Ll/jyy;

    .line 76
    .line 77
    invoke-direct {v0, p2, p1}, Ll/jyy;-><init>(Landroid/app/Dialog;Ll/x20;)V

    .line 78
    .line 79
    .line 80
    new-instance p1, Ll/kyy;

    .line 81
    .line 82
    invoke-direct {p1}, Ll/kyy;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static varargs U(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/azy;->b0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Ll/azy;->w0(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p0, p1, p2}, Ll/azy;->H0(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static V(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "android.permission.CAMERA"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-array v0, v3, [Ljava/lang/String;

    .line 12
    .line 13
    aput-object v1, v0, v2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x2

    .line 17
    new-array v0, v0, [Ljava/lang/String;

    .line 18
    .line 19
    aput-object v1, v0, v2

    .line 20
    .line 21
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 22
    .line 23
    aput-object v1, v0, v3

    .line 24
    .line 25
    :goto_0
    invoke-static {p0, p1, v0}, Ll/azy;->U(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static W(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "android.permission.CAMERA"

    .line 2
    .line 3
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, p1, v0}, Ll/azy;->U(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/azy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Landroid/app/Dialog;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p1}, Ll/x20;->call()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static b0()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isCameraSdkLoaded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public static synthetic c(Ll/azy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/azy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->a0()V

    return-void
.end method

.method public static synthetic f(Ll/azy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->f0()V

    return-void
.end method

.method public static synthetic g(Ll/azy;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->j0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic h(Ll/azy;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->q0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic i(Ll/azy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->h0()V

    return-void
.end method

.method public static synthetic j(Ll/azy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p0, p1, v0}, Ll/azy;->H0(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic l(Ll/azy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/azy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->i0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic n(Ll/azy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Ll/azy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->s0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p(Ll/azy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->g0()V

    return-void
.end method

.method public static synthetic q(Ll/azy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->C()V

    return-void
.end method

.method public static synthetic r(Ll/azy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/azy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->n0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p0, p1, v0}, Ll/azy;->w0(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic u(Ll/azy;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/azy;->w:Z

    return p0
.end method

.method public static bridge synthetic v(Ll/azy;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/azy;->a:I

    return p0
.end method

.method public static bridge synthetic w(Ll/azy;)Ll/xvx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy;->q:Ll/xvx;

    return-object p0
.end method

.method public static varargs w0(Lcom/p1/mobile/android/app/Act;Ll/x20;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/myy;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Ll/myy;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 p2, 0x0

    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x1

    .line 30
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    invoke-interface {p1}, Ll/x20;->call()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public static bridge synthetic x(Ll/azy;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->B(Z)V

    return-void
.end method

.method public static bridge synthetic y(Ll/azy;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/azy;->K(ZZ)V

    return-void
.end method

.method public static bridge synthetic z(Ll/azy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/azy;->N(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final A0(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContainer()Landroid/widget/LinearLayout;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContainer()Landroid/widget/LinearLayout;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final B(Z)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->SHI_PAI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->b(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    move-object v2, v1

    .line 12
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v1, 0x1

    .line 18
    const/4 v10, 0x0

    .line 19
    const/4 v11, 0x2

    .line 20
    const/4 v12, 0x0

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    new-instance v8, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 24
    .line 25
    invoke-direct {v8}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    neg-int v3, v3

    .line 33
    int-to-float v3, v3

    .line 34
    new-array v9, v11, [F

    .line 35
    .line 36
    aput v3, v9, v10

    .line 37
    .line 38
    aput v12, v9, v1

    .line 39
    .line 40
    const-string v3, "translationX"

    .line 41
    .line 42
    const-wide/16 v4, 0x0

    .line 43
    .line 44
    const-wide/16 v6, 0x96

    .line 45
    .line 46
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    new-instance v4, Ll/azy$f;

    .line 51
    .line 52
    invoke-direct {v4, v0, v2}, Ll/azy$f;-><init>(Ll/azy;Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v3, v4}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v8, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 60
    .line 61
    invoke-direct {v8}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 62
    .line 63
    .line 64
    new-array v9, v1, [F

    .line 65
    .line 66
    aput v12, v9, v10

    .line 67
    .line 68
    const-string v3, "translationX"

    .line 69
    .line 70
    const-wide/16 v4, 0x0

    .line 71
    .line 72
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    iget-object v3, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 89
    .line 90
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->M()Landroid/view/ViewGroup;

    .line 91
    .line 92
    .line 93
    move-result-object v13

    .line 94
    new-array v3, v11, [F

    .line 95
    .line 96
    fill-array-data v3, :array_0

    .line 97
    .line 98
    .line 99
    const-string v14, "alpha"

    .line 100
    .line 101
    const-wide/16 v15, 0x0

    .line 102
    .line 103
    const-wide/16 v17, 0x96

    .line 104
    .line 105
    const/16 v19, 0x0

    .line 106
    .line 107
    move-object/from16 v20, v3

    .line 108
    .line 109
    invoke-static/range {v13 .. v20}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    move-result-object v13

    .line 113
    iget-object v3, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 114
    .line 115
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getInputRoot()Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v14

    .line 119
    new-array v3, v11, [F

    .line 120
    .line 121
    fill-array-data v3, :array_1

    .line 122
    .line 123
    .line 124
    const-string v15, "alpha"

    .line 125
    .line 126
    const-wide/16 v16, 0x0

    .line 127
    .line 128
    const-wide/16 v18, 0x96

    .line 129
    .line 130
    const/16 v20, 0x0

    .line 131
    .line 132
    move-object/from16 v21, v3

    .line 133
    .line 134
    invoke-static/range {v14 .. v21}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 135
    .line 136
    .line 137
    move-result-object v14

    .line 138
    new-instance v8, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 139
    .line 140
    invoke-direct {v8}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    neg-int v3, v3

    .line 148
    int-to-float v3, v3

    .line 149
    new-array v9, v11, [F

    .line 150
    .line 151
    aput v3, v9, v10

    .line 152
    .line 153
    aput v12, v9, v1

    .line 154
    .line 155
    const-string v3, "translationX"

    .line 156
    .line 157
    const-wide/16 v4, 0x0

    .line 158
    .line 159
    const-wide/16 v6, 0x96

    .line 160
    .line 161
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    filled-new-array {v13, v14, v3}, [Landroid/animation/Animator;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    new-instance v4, Ll/lyy;

    .line 174
    .line 175
    invoke-direct {v4, v0}, Ll/lyy;-><init>(Ll/azy;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v3, v4}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 179
    .line 180
    .line 181
    move-result-object v13

    .line 182
    iget-object v3, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 183
    .line 184
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->M()Landroid/view/ViewGroup;

    .line 185
    .line 186
    .line 187
    move-result-object v14

    .line 188
    new-array v3, v11, [F

    .line 189
    .line 190
    fill-array-data v3, :array_2

    .line 191
    .line 192
    .line 193
    const-string v15, "alpha"

    .line 194
    .line 195
    move-object/from16 v21, v3

    .line 196
    .line 197
    invoke-static/range {v14 .. v21}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 198
    .line 199
    .line 200
    move-result-object v14

    .line 201
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getInputRoot()Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v15

    .line 207
    new-array v0, v11, [F

    .line 208
    .line 209
    fill-array-data v0, :array_3

    .line 210
    .line 211
    .line 212
    const-string v16, "alpha"

    .line 213
    .line 214
    const-wide/16 v17, 0x0

    .line 215
    .line 216
    const-wide/16 v19, 0x96

    .line 217
    .line 218
    const/16 v21, 0x0

    .line 219
    .line 220
    move-object/from16 v22, v0

    .line 221
    .line 222
    invoke-static/range {v15 .. v22}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    new-instance v8, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 227
    .line 228
    invoke-direct {v8}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 229
    .line 230
    .line 231
    new-array v9, v1, [F

    .line 232
    .line 233
    aput v12, v9, v10

    .line 234
    .line 235
    const-string v3, "translationX"

    .line 236
    .line 237
    const-wide/16 v4, 0x0

    .line 238
    .line 239
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    filled-new-array {v14, v0, v1}, [Landroid/animation/Animator;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    filled-new-array {v13, v0}, [Landroid/animation/Animator;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public B0(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    new-instance v0, Ljava/io/File;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v1, "shootingResultView StatusInfo = "

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/azy;->t0(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v0, "e_camera_chat_cancel"

    .line 50
    .line 51
    const-string v1, "p_chat_view"

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    invoke-virtual {p0, v0}, Ll/azy;->A0(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->setStatusInfo(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->isPhoto()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    const/high16 v3, 0x41000000    # 8.0f

    .line 81
    .line 82
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    int-to-float v3, v3

    .line 87
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->m(Ljava/lang/String;ZF)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const/16 v1, 0x8

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBarWrapper()Landroid/widget/FrameLayout;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const/4 v1, 0x0

    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBarMaskLayer()Landroid/widget/LinearLayout;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getText()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 149
    .line 150
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->A5:I

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ll/azy;->v0()V

    .line 160
    .line 161
    .line 162
    :cond_1
    :goto_0
    return-void
.end method

.method public final C()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getInputRoot()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContainer()Landroid/widget/LinearLayout;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    iget v3, v0, Ll/bnl0$g;->a:I

    .line 27
    .line 28
    iget v4, v1, Ll/bnl0$g;->a:I

    .line 29
    .line 30
    sub-int/2addr v3, v4

    .line 31
    iput v3, v2, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    iget v4, v0, Ll/bnl0$g;->b:I

    .line 34
    .line 35
    iget v1, v1, Ll/bnl0$g;->b:I

    .line 36
    .line 37
    sub-int/2addr v4, v1

    .line 38
    iput v4, v2, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    iget v1, v0, Ll/bnl0$g;->c:I

    .line 41
    .line 42
    add-int/2addr v3, v1

    .line 43
    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    iget v0, v0, Ll/bnl0$g;->d:I

    .line 46
    .line 47
    add-int/2addr v4, v0

    .line 48
    iput v4, v2, Landroid/graphics/Rect;->bottom:I

    .line 49
    .line 50
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/ryy;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/ryy;-><init>(Ll/azy;)V

    .line 59
    .line 60
    .line 61
    new-instance v3, Ll/azy$g;

    .line 62
    .line 63
    invoke-direct {v3, p0}, Ll/azy$g;-><init>(Ll/azy;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v2, v1, v3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->b(Landroid/graphics/Rect;Ll/x20;Ll/x20;)V

    .line 67
    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-virtual {p0, v0}, Ll/azy;->B(Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public C0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    new-instance v1, Ll/hyy;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/hyy;-><init>(Ll/azy;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/azy;->W(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/azy;->b:Ll/d3z;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/d3z;->m0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public D()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/azy;->A0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azy;->H()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Ll/azy;->u0(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public D0()V
    .locals 4

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/azy;->q:Ll/xvx;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/xvx;->h()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "0"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v1, "1"

    .line 15
    .line 16
    :goto_0
    const-string v2, "front_back"

    .line 17
    .line 18
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/pf60;

    .line 22
    .line 23
    iget-object v2, p0, Ll/azy;->l:Ll/cmi;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/cmi;->r()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "camera_filter_name"

    .line 30
    .line 31
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "e_switch_camera"

    .line 39
    .line 40
    const-string v2, "p_chat_view"

    .line 41
    .line 42
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    iget-boolean v0, p0, Ll/azy;->e:Z

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    const/4 v0, 0x1

    .line 51
    iput-boolean v0, p0, Ll/azy;->e:Z

    .line 52
    .line 53
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/16 v2, 0x8

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text_layout()Lv/VLinear;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const/4 v3, 0x0

    .line 71
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getChangeSizeView()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCloseView()Landroid/widget/ImageView;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    iget v1, p0, Ll/azy;->a:I

    .line 102
    .line 103
    if-eq v1, v0, :cond_3

    .line 104
    .line 105
    const/4 v2, 0x2

    .line 106
    if-ne v1, v2, :cond_2

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_3
    :goto_1
    iget-object v1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 120
    .line 121
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 122
    .line 123
    .line 124
    :goto_2
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 140
    .line 141
    .line 142
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 143
    .line 144
    const/4 v1, -0x1

    .line 145
    invoke-direct {v0, v1, v3}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 149
    .line 150
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->u2:I

    .line 151
    .line 152
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->B:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 159
    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceViewRooter()Landroid/widget/FrameLayout;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/azy;->l:Ll/cmi;

    .line 168
    .line 169
    invoke-virtual {v0, v3}, Ll/cmi;->B(Z)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, v3}, Ll/azy;->E(Z)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public final E(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/azy;->a:I

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Ll/azy;->A0(Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final E0(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/azy;->c0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/azy;->B0(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContainer()Landroid/widget/LinearLayout;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, v1}, Ll/azy;->A0(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final F()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/azy;->D0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusable(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusableInTouchMode(Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    new-instance v1, Ll/nyy;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/nyy;-><init>(Ll/azy;)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v2, 0x96

    .line 40
    .line 41
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public F0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d0()Ll/vez;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/n2;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/n2;->f()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public G()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    new-instance v1, Ll/pyy;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pyy;-><init>(Ll/azy;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x96

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public G0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Ll/azy;->e:Z

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/azy;->e:Z

    .line 12
    .line 13
    iget v1, p0, Ll/azy;->a:I

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const/4 v3, -0x1

    .line 50
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v2, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    const-string v4, "#99ffffff"

    .line 80
    .line 81
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object v2, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 89
    .line 90
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text_layout()Lv/VLinear;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const/16 v2, 0x8

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getChangeSizeView()Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCloseView()Landroid/widget/ImageView;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 124
    .line 125
    .line 126
    const-string v1, "e_camera_chat_close"

    .line 127
    .line 128
    const-string v4, "p_chat_view"

    .line 129
    .line 130
    invoke-static {v1, v4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 161
    .line 162
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 175
    .line 176
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 184
    .line 185
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 190
    .line 191
    .line 192
    new-instance v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 193
    .line 194
    invoke-direct {v1, v3, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 195
    .line 196
    .line 197
    const-string v0, "3:1"

    .line 198
    .line 199
    iput-object v0, v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->B:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceViewRooter()Landroid/widget/FrameLayout;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Ll/azy;->l:Ll/cmi;

    .line 211
    .line 212
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    const/4 v1, 0x1

    .line 217
    if-eqz v0, :cond_2

    .line 218
    .line 219
    iget-object v0, p0, Ll/azy;->l:Ll/cmi;

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Ll/cmi;->B(Z)V

    .line 222
    .line 223
    .line 224
    :cond_2
    invoke-virtual {p0, v1}, Ll/azy;->E(Z)V

    .line 225
    .line 226
    .line 227
    :cond_3
    :goto_0
    return-void
.end method

.method public final H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->setStatusInfo(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/azy;->m:Ll/wxd0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/wxd0;->a()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public I(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/azy;->J(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final I0()V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 2
    .line 3
    iget-object v1, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/xvx;->k(Lcom/p1/mobile/android/app/Act;)Z

    .line 6
    .line 7
    .line 8
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    goto :goto_2

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    :try_start_1
    const-string v3, "c++_shared"

    .line 14
    .line 15
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 16
    .line 17
    .line 18
    move v3, v1

    .line 19
    goto :goto_0

    .line 20
    :catchall_1
    move v3, v2

    .line 21
    :goto_0
    :try_start_2
    const-string v4, "xeengine"

    .line 22
    .line 23
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :catchall_2
    move v1, v2

    .line 28
    :goto_1
    new-instance v4, Ljava/lang/RuntimeException;

    .line 29
    .line 30
    new-instance v5, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v6, "IMomoRecorder prepare error, cppSharedLoaded="

    .line 33
    .line 34
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v3, ", xeengineLoaded="

    .line 41
    .line 42
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {v4, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    move v0, v2

    .line 59
    :goto_2
    if-eqz v0, :cond_0

    .line 60
    .line 61
    iget-object p0, p0, Ll/azy;->q:Ll/xvx;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xvx;->o()V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public J(ZZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iput-boolean p1, p0, Ll/azy;->w:Z

    .line 4
    .line 5
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Ll/azy;->v:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p0, p1, p2}, Ll/azy;->K(ZZ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public J0()V
    .locals 5

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "photo_video"

    .line 4
    .line 5
    const-string v2, "0"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    filled-new-array {v0}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v3, "e_camera_chat_on"

    .line 15
    .line 16
    const-string v4, "p_chat_view"

    .line 17
    .line 18
    invoke-static {v3, v4, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/pf60;

    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v3, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/16 v1, 0x8

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v2, p0, Ll/azy;->t:Ljava/lang/Runnable;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->t:I

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const/4 v2, 0x0

    .line 95
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v2, p0, Ll/azy;->t:Ljava/lang/Runnable;

    .line 105
    .line 106
    const-wide/16 v3, 0xbb8

    .line 107
    .line 108
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/xvx;->p()V

    .line 114
    .line 115
    .line 116
    const/4 v0, 0x2

    .line 117
    invoke-virtual {p0, v0}, Ll/azy;->u0(I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ll/azy;->Q()V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBarWrapper()Landroid/widget/FrameLayout;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const/4 v2, 0x4

    .line 130
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMessageBarRoot()Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBarMaskLayer()Landroid/widget/LinearLayout;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public final K(ZZ)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/azy;->d:Z

    .line 3
    .line 4
    const-string v1, "e_camera_chat_close"

    .line 5
    .line 6
    const-string v2, "p_chat_view"

    .line 7
    .line 8
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A0()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/high16 v2, -0x1000000

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceViewRooter()Landroid/widget/FrameLayout;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/16 v2, 0x8

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCloseView()Landroid/widget/ImageView;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->e()V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text_layout()Lv/VLinear;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iget-object v3, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_0

    .line 109
    .line 110
    sget v4, Ll/g9c0;->i:I

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_0
    sget v4, Ll/g9c0;->W:I

    .line 114
    .line 115
    :goto_0
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_send()Lv/VText;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-interface {v3}, Ll/r97;->t1()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    const/4 v4, 0x1

    .line 141
    xor-int/2addr v3, v4

    .line 142
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->w0()V

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 160
    .line 161
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 165
    .line 166
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iget-object v3, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 171
    .line 172
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->N0:I

    .line 173
    .line 174
    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    const/4 v3, 0x3

    .line 188
    invoke-virtual {v1, v3}, Ll/u1z;->x2(I)V

    .line 189
    .line 190
    .line 191
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 198
    .line 199
    .line 200
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 201
    .line 202
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 207
    .line 208
    .line 209
    if-eqz p1, :cond_1

    .line 210
    .line 211
    iget-object p1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 212
    .line 213
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->getStatusInfo()Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-eqz p1, :cond_1

    .line 222
    .line 223
    invoke-virtual {p0}, Ll/azy;->x0()V

    .line 224
    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_1
    iget-object p1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 228
    .line 229
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->getStatusInfo()Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    if-eqz p1, :cond_2

    .line 238
    .line 239
    invoke-virtual {p0}, Ll/azy;->D()V

    .line 240
    .line 241
    .line 242
    :cond_2
    :goto_1
    iget-object p1, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 243
    .line 244
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 245
    .line 246
    .line 247
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_3

    .line 260
    .line 261
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 262
    .line 263
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getInputAiView()Landroid/view/View;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 268
    .line 269
    .line 270
    :cond_3
    iget-boolean p1, p0, Ll/azy;->o:Z

    .line 271
    .line 272
    if-eqz p1, :cond_4

    .line 273
    .line 274
    iget-object p1, p0, Ll/azy;->b:Ll/d3z;

    .line 275
    .line 276
    invoke-virtual {p1}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    invoke-virtual {p1}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 293
    .line 294
    .line 295
    iget-object p1, p0, Ll/azy;->b:Ll/d3z;

    .line 296
    .line 297
    invoke-virtual {p1}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p1, v4}, Ll/qzz;->L1(Z)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ll/azy;->b:Ll/d3z;

    .line 313
    .line 314
    invoke-virtual {p1}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    invoke-virtual {p1, v4}, Ll/qzz;->O1(Z)V

    .line 327
    .line 328
    .line 329
    :cond_4
    iget-boolean p1, p0, Ll/azy;->p:Z

    .line 330
    .line 331
    if-eqz p1, :cond_5

    .line 332
    .line 333
    iget-object p1, p0, Ll/azy;->b:Ll/d3z;

    .line 334
    .line 335
    invoke-virtual {p1}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-virtual {p1}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-eqz p1, :cond_5

    .line 356
    .line 357
    iget-object p1, p0, Ll/azy;->b:Ll/d3z;

    .line 358
    .line 359
    invoke-virtual {p1}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    invoke-virtual {p1}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 372
    .line 373
    .line 374
    move-result-object p1

    .line 375
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 376
    .line 377
    .line 378
    :cond_5
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 379
    .line 380
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    iget-object v1, p0, Ll/azy;->n:Ljava/lang/String;

    .line 385
    .line 386
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 387
    .line 388
    .line 389
    if-eqz p2, :cond_6

    .line 390
    .line 391
    invoke-virtual {p0}, Ll/azy;->O()V

    .line 392
    .line 393
    .line 394
    :cond_6
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 395
    .line 396
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContainer()Landroid/widget/LinearLayout;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 401
    .line 402
    .line 403
    const/4 p1, 0x0

    .line 404
    iput-object p1, p0, Ll/azy;->g:Ll/bbh0;

    .line 405
    .line 406
    iget-object p1, p0, Ll/azy;->q:Ll/xvx;

    .line 407
    .line 408
    invoke-virtual {p1}, Ll/xvx;->q()V

    .line 409
    .line 410
    .line 411
    iget-object p1, p0, Ll/azy;->q:Ll/xvx;

    .line 412
    .line 413
    invoke-virtual {p1}, Ll/xvx;->l()V

    .line 414
    .line 415
    .line 416
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 417
    .line 418
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 419
    .line 420
    .line 421
    move-result-object p1

    .line 422
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 423
    .line 424
    .line 425
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 426
    .line 427
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 428
    .line 429
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/api/g;->Z1:Z

    .line 430
    .line 431
    iget-object p1, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 432
    .line 433
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    invoke-virtual {p1}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 438
    .line 439
    .line 440
    move-result-object p1

    .line 441
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 442
    .line 443
    if-eq p1, p2, :cond_7

    .line 444
    .line 445
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 446
    .line 447
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getTempInputLayout()Landroid/view/View;

    .line 448
    .line 449
    .line 450
    move-result-object p1

    .line 451
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 452
    .line 453
    .line 454
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 455
    .line 456
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getEditRootView()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 457
    .line 458
    .line 459
    move-result-object p1

    .line 460
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 461
    .line 462
    .line 463
    move-result-object p1

    .line 464
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 465
    .line 466
    const/high16 p2, 0x426c0000    # 59.0f

    .line 467
    .line 468
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 469
    .line 470
    .line 471
    move-result p2

    .line 472
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 473
    .line 474
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 475
    .line 476
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getEditRootView()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 477
    .line 478
    .line 479
    move-result-object p0

    .line 480
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 481
    .line 482
    .line 483
    :cond_7
    return-void
.end method

.method public K0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy;->q:Ll/xvx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xvx;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/azy;->j:Ll/trb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/trb;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/azy;->j:Ll/trb;

    .line 10
    .line 11
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCountDownTimer()Landroid/widget/TextView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 v0, 0x8

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public L0()V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "photo_video"

    .line 4
    .line 5
    const-string v2, "1"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    filled-new-array {v0}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "e_camera_chat_on"

    .line 15
    .line 16
    const-string v2, "p_chat_view"

    .line 17
    .line 18
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 22
    .line 23
    new-instance v1, Ll/azy$j;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/azy$j;-><init>(Ll/azy;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/xvx;->s(Ll/wo50;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xvx;->j()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 7
    .line 8
    new-instance v1, Ll/azy$i;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/azy$i;-><init>(Ll/azy;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/xvx;->d(Ll/hn50;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final M0(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/oyy;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/oyy;-><init>(Ll/azy;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/ThreadUtil;->i(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final N(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/qyy;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/qyy;-><init>(Ll/azy;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/ThreadUtil;->i(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public O()V
    .locals 2

    .line 1
    iget v0, p0, Ll/azy;->a:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d0()Ll/vez;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/n2;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/n2;->d()Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/uyy;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/uyy;-><init>(Ll/azy;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/vyy;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/vyy;-><init>(Ll/azy;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/wyy;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/wyy;-><init>(Ll/azy;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCloseView()Landroid/widget/ImageView;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/xyy;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/xyy;-><init>(Ll/azy;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getChangeSizeView()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/yyy;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/yyy;-><init>(Ll/azy;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/fyy;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/fyy;-><init>(Ll/azy;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/azy;->X()V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/gyy;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/gyy;-><init>(Ll/azy;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public Q()V
    .locals 2

    .line 1
    new-instance v0, Ll/trb;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/trb;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/azy;->j:Ll/trb;

    .line 7
    .line 8
    new-instance v1, Ll/azy$c;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/azy$c;-><init>(Ll/azy;)V

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x1e

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1}, Ll/trb;->b(ILl/qrl;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final R()V
    .locals 3

    .line 1
    new-instance v0, Ll/cmi;

    .line 2
    .line 3
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    iget-object v2, p0, Ll/azy;->q:Ll/xvx;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p0}, Ll/cmi;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Ll/xvx;Ll/azy;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/azy;->l:Ll/cmi;

    .line 11
    .line 12
    return-void
.end method

.method public final S()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/tyy;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/tyy;-><init>(Ll/azy;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final T()V
    .locals 3

    .line 1
    new-instance v0, Ll/wxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "l_s_i_i"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ll/clz;->i3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ll/wxd0;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/azy;->m:Ll/wxd0;

    .line 31
    .line 32
    return-void
.end method

.method public final X()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 2
    .line 3
    new-instance v1, Ll/azy$h;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/azy$h;-><init>(Ll/azy;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->setRecorderCallback(Ll/xqc0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final Y()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 9
    .line 10
    new-instance v1, Ll/azy$b;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/azy$b;-><init>(Ll/azy;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->setResultViewListener(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceViewRooter()Landroid/widget/FrameLayout;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 36
    .line 37
    new-instance v1, Ll/syy;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/syy;-><init>(Ll/azy;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->setCancelClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xvx;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/xvx;->q()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azy;->I0()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/bbh0;

    .line 15
    .line 16
    iget-object v1, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 17
    .line 18
    iget-object v2, p0, Ll/azy;->q:Ll/xvx;

    .line 19
    .line 20
    invoke-direct {v0, v1, v2}, Ll/bbh0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/xvx;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/azy;->g:Ll/bbh0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/bbh0;->i()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContainer()Landroid/widget/LinearLayout;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/azy;->g:Ll/bbh0;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/bbh0;->j()Landroid/view/SurfaceView;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/azy;->l:Ll/cmi;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/cmi;->o()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final a0()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/azy;->Z()V

    .line 2
    .line 3
    .line 4
    const-string v0, "e_close_camera_chat"

    .line 5
    .line 6
    const-string v1, "p_chat_view"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "e_camera_chat_close"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Ll/azy;->a:I

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-ne v0, v2, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/pf60;

    .line 22
    .line 23
    const-string v3, "photo_video"

    .line 24
    .line 25
    const-string v4, "1"

    .line 26
    .line 27
    invoke-direct {v0, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    filled-new-array {v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v3, "e_camera_chat_on"

    .line 35
    .line 36
    invoke-static {v3, v1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    const-string v0, "showBar"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/azy;->t0(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-boolean v2, p0, Ll/azy;->d:Z

    .line 45
    .line 46
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->z0()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->EMOJI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 54
    .line 55
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->B0(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/azy;->D0()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/azy;->n:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, ""

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const/4 v1, -0x1

    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_1

    .line 121
    .line 122
    const v1, 0x66ffffff

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_1
    const v1, -0x66000001

    .line 127
    .line 128
    .line 129
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 133
    .line 134
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const/4 v1, 0x0

    .line 139
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceViewRooter()Landroid/widget/FrameLayout;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const/4 v3, 0x4

    .line 158
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 167
    .line 168
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getEditRootView()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_send()Lv/VText;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    const/16 v3, 0x8

    .line 182
    .line 183
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->N()V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_2

    .line 204
    .line 205
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 206
    .line 207
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getInputAiView()Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    :cond_2
    invoke-virtual {p0}, Ll/azy;->c0()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_3

    .line 219
    .line 220
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 221
    .line 222
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iget-object v4, p0, Ll/azy;->s:Ljava/lang/Runnable;

    .line 227
    .line 228
    invoke-virtual {v0, v4}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->u:I

    .line 238
    .line 239
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 243
    .line 244
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 252
    .line 253
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iget-object v4, p0, Ll/azy;->s:Ljava/lang/Runnable;

    .line 258
    .line 259
    const-wide/16 v5, 0xbb8

    .line 260
    .line 261
    invoke-virtual {v0, v4, v5, v6}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 262
    .line 263
    .line 264
    :cond_3
    iget-object v0, p0, Ll/azy;->m:Ll/wxd0;

    .line 265
    .line 266
    const-class v4, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 267
    .line 268
    invoke-virtual {v0, v4}, Ll/wxd0;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 273
    .line 274
    invoke-virtual {p0, v0}, Ll/azy;->E0(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 278
    .line 279
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    iget-object v4, p0, Ll/azy;->u:Ljava/lang/Runnable;

    .line 284
    .line 285
    invoke-virtual {v0, v4}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 286
    .line 287
    .line 288
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 289
    .line 290
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    iget-object v4, p0, Ll/azy;->u:Ljava/lang/Runnable;

    .line 295
    .line 296
    invoke-virtual {v0, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 297
    .line 298
    .line 299
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 300
    .line 301
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-virtual {v0}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_4

    .line 322
    .line 323
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 324
    .line 325
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    invoke-virtual {v0}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 342
    .line 343
    .line 344
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 345
    .line 346
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    invoke-virtual {v0, v1}, Ll/qzz;->L1(Z)V

    .line 359
    .line 360
    .line 361
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 362
    .line 363
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-virtual {v0, v1}, Ll/qzz;->O1(Z)V

    .line 376
    .line 377
    .line 378
    iput-boolean v2, p0, Ll/azy;->o:Z

    .line 379
    .line 380
    goto :goto_1

    .line 381
    :cond_4
    iput-boolean v1, p0, Ll/azy;->o:Z

    .line 382
    .line 383
    :goto_1
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 384
    .line 385
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-virtual {v0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-eqz v0, :cond_5

    .line 406
    .line 407
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 408
    .line 409
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    invoke-virtual {v0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-nez v0, :cond_5

    .line 430
    .line 431
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 432
    .line 433
    invoke-virtual {v0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    invoke-virtual {v0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 450
    .line 451
    .line 452
    iput-boolean v2, p0, Ll/azy;->p:Z

    .line 453
    .line 454
    goto :goto_2

    .line 455
    :cond_5
    iput-boolean v1, p0, Ll/azy;->p:Z

    .line 456
    .line 457
    :goto_2
    iget-object v0, p0, Ll/azy;->b:Ll/d3z;

    .line 458
    .line 459
    invoke-virtual {v0, v2}, Ll/d3z;->J1(Z)V

    .line 460
    .line 461
    .line 462
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 463
    .line 464
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    iget-object v2, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 469
    .line 470
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->B5:I

    .line 471
    .line 472
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v2

    .line 476
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 477
    .line 478
    .line 479
    iget v0, p0, Ll/azy;->a:I

    .line 480
    .line 481
    const/4 v2, 0x3

    .line 482
    if-ne v0, v2, :cond_6

    .line 483
    .line 484
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 485
    .line 486
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 491
    .line 492
    .line 493
    :cond_6
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 494
    .line 495
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getTempInputLayout()Landroid/view/View;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 500
    .line 501
    .line 502
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 503
    .line 504
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getEditRootView()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 509
    .line 510
    .line 511
    move-result-object v0

    .line 512
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 513
    .line 514
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 515
    .line 516
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 517
    .line 518
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getEditRootView()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 523
    .line 524
    .line 525
    return-void
.end method

.method public final c0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/azy;->m:Ll/wxd0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const-class v2, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Ll/wxd0;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-object v0, p0, Ll/azy;->m:Ll/wxd0;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ll/wxd0;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    return v1

    .line 35
    :cond_2
    new-instance v0, Ljava/io/File;

    .line 36
    .line 37
    iget-object p0, p0, Ll/azy;->m:Ll/wxd0;

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ll/wxd0;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    return v1

    .line 59
    :cond_3
    const/4 p0, 0x1

    .line 60
    return p0
.end method

.method public d0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/azy;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;-><init>(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->setText(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/azy;->B0(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic f0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSingleText()Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text_layout()Lv/VLinear;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v2, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    sget v3, Ll/g9c0;->i:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    sget v3, Ll/g9c0;->W:I

    .line 52
    .line 53
    :goto_0
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->T()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->A0()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_send()Lv/VText;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object p0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 91
    .line 92
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->N0:I

    .line 93
    .line 94
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic g0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic h0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/azy;->D0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusable(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/azy;->F0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic i0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/azy;->L()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMessageBarRoot()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, v1}, Ll/azy;->e0(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azy;->d0()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Ll/azy;->e:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/azy;->G0()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/azy;->O()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/azy;->I(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->getStatusInfo()Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->isPhoto()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, v0, p1}, Ll/azy;->y0(Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/azy;->K0()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/pf60;

    .line 5
    .line 6
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/xvx;->h()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v0, "0"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v0, "1"

    .line 18
    .line 19
    :goto_0
    const-string v1, "front_back"

    .line 20
    .line 21
    invoke-direct {p1, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/pf60;

    .line 25
    .line 26
    iget-object p0, p0, Ll/azy;->l:Ll/cmi;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/cmi;->r()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v1, "camera_filter_name"

    .line 33
    .line 34
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "e_switch_camera"

    .line 42
    .line 43
    const-string v0, "p_chat_view"

    .line 44
    .line 45
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy;->G0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/azy;->O()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/xvx;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/azy;->d0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :cond_0
    iput-boolean v1, p0, Ll/azy;->r:Z

    .line 21
    .line 22
    iget-object p1, p0, Ll/azy;->q:Ll/xvx;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/xvx;->q()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/azy;->I0()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    if-ne p1, v0, :cond_4

    .line 34
    .line 35
    iget-object v0, p0, Ll/azy;->q:Ll/xvx;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/xvx;->i()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/azy;->d0()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    :cond_2
    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Ll/azy;->r:Z

    .line 51
    .line 52
    iget-object p1, p0, Ll/azy;->q:Ll/xvx;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/xvx;->q()V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    iget-object p1, p0, Ll/azy;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 68
    .line 69
    .line 70
    :cond_3
    iget-object p0, p0, Ll/azy;->g:Ll/bbh0;

    .line 71
    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ll/bbh0;->k(Z)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 79
    .line 80
    if-ne p1, v0, :cond_5

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/azy;->L()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v1}, Ll/azy;->I(Z)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/azy;->l:Ll/cmi;

    .line 89
    .line 90
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_5

    .line 95
    .line 96
    iget-object p0, p0, Ll/azy;->l:Ll/cmi;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/cmi;->p()V

    .line 99
    .line 100
    .line 101
    :cond_5
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/azy;->D()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/pf60;

    .line 5
    .line 6
    const-string p1, "photo_video"

    .line 7
    .line 8
    const-string v0, "1"

    .line 9
    .line 10
    invoke-direct {p0, p1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    filled-new-array {p0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_camera_chat_on"

    .line 18
    .line 19
    const-string v0, "p_chat_view"

    .line 20
    .line 21
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "e_camera_chat_cancel"

    .line 25
    .line 26
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic s0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/azy;->e0(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public t0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public u0(I)V
    .locals 3

    .line 1
    iput p1, p0, Ll/azy;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    if-eq p1, v0, :cond_5

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p1, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p1, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 20
    .line 21
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget v1, Ll/g9c0;->i:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const-string v0, "#19000000"

    .line 67
    .line 68
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 76
    .line 77
    sget p1, Ll/ibc0;->u3:I

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    iget-object p1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 84
    .line 85
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_3

    .line 122
    .line 123
    sget v1, Ll/g9c0;->j:I

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_3
    sget v1, Ll/g9c0;->o:I

    .line 127
    .line 128
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 136
    .line 137
    sget p1, Ll/ibc0;->v3:I

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_4
    iget-object p0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 144
    .line 145
    sget p1, Ll/ibc0;->z3:I

    .line 146
    .line 147
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_5
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-nez p1, :cond_6

    .line 162
    .line 163
    iget-object p1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 164
    .line 165
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getRealShotSend()Landroid/widget/TextView;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 173
    .line 174
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 175
    .line 176
    .line 177
    :cond_6
    iget-object p0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 178
    .line 179
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-eqz p1, :cond_7

    .line 192
    .line 193
    sget p1, Ll/ibc0;->y3:I

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_7
    sget p1, Ll/ibc0;->x3:I

    .line 197
    .line 198
    :goto_2
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public final v0()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Ll/azy;->u0(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->getStatusInfo()Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->setText(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/azy;->m:Ll/wxd0;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/wxd0;->c(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public y0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy;->h:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, p1, v1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->Q2(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Ll/azy;->u0(I)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/pf60;

    .line 29
    .line 30
    const-string p2, "photo_video"

    .line 31
    .line 32
    const-string v0, "1"

    .line 33
    .line 34
    invoke-direct {p1, p2, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    filled-new-array {p1}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string p2, "e_camera_chat_on"

    .line 42
    .line 43
    const-string v0, "p_chat_view"

    .line 44
    .line 45
    invoke-static {p2, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    invoke-virtual {p0, p1}, Ll/azy;->A0(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/azy;->H()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/azy;->O()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    return-void
.end method
