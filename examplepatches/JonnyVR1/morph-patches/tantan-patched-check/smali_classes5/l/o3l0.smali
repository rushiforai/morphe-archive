.class public Ll/o3l0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/o3l0;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/o3l0;->m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic f(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ll/e4l0;ZZLjava/lang/String;ILcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/o3l0;->l(Lcom/p1/mobile/android/app/Act;Ll/e4l0;ZZLjava/lang/String;ILcom/tantanapp/sharedlibrary/loader/LoadEvent;)V

    return-void
.end method

.method public static synthetic g(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILcom/p1/mobile/putong/facertification/RxFacertification$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/o3l0;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILcom/p1/mobile/putong/facertification/RxFacertification$b;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    sput-boolean p0, Ll/x5l0;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic i()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/x5l0;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public static p(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZLjava/lang/String;Z)V
    .locals 8

    .line 1
    new-instance v0, Ll/e4l0;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move v6, p6

    .line 9
    move-object/from16 v7, p8

    .line 10
    .line 11
    invoke-direct/range {v0 .. v7}, Ll/e4l0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    const-string p4, "facertification"

    .line 19
    .line 20
    invoke-virtual {p3, p4}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->u(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    new-instance p4, Ll/e3l0;

    .line 25
    .line 26
    invoke-direct {p4}, Ll/e3l0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3, p4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    const/4 p4, 0x1

    .line 38
    invoke-virtual {p3, p4}, Lrx/c;->take(I)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    new-instance p4, Ll/f3l0;

    .line 43
    .line 44
    invoke-direct {p4, p1}, Ll/f3l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p3, p4}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    move-object v3, v0

    .line 52
    new-instance v0, Ll/g3l0;

    .line 53
    .line 54
    move-object v1, p0

    .line 55
    move-object v2, p1

    .line 56
    move-object v6, p2

    .line 57
    move v7, p6

    .line 58
    move v4, p7

    .line 59
    move/from16 v5, p9

    .line 60
    .line 61
    invoke-direct/range {v0 .. v7}, Ll/g3l0;-><init>(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ll/e4l0;ZZLjava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/h3l0;

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ll/h3l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 0

    .line 1
    new-instance p0, Ll/d4l0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/d4l0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/d4l0;->n(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/android/app/Act;Ll/e4l0;ZZLjava/lang/String;ILcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const-string p7, "megface"

    .line 5
    .line 6
    invoke-static {p7}, Ll/o3l0;->p(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string p7, "securitydevice"

    .line 10
    .line 11
    invoke-static {p7}, Ll/o3l0;->p(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Ll/e4l0;->g()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p7

    .line 22
    invoke-interface {p7}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p2, p3, p4}, Ll/e4l0;->h(ZZ)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {p2, p4}, Ll/e4l0;->i(Z)Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    move-object v0, p0

    .line 35
    move-object v2, p1

    .line 36
    move-object v6, p5

    .line 37
    move v7, p6

    .line 38
    invoke-virtual/range {v0 .. v7}, Ll/o3l0;->q(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/o3l0;->r(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "android.permission.CAMERA"

    .line 18
    .line 19
    filled-new-array {v1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/j3l0;

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    move-object v3, p1

    .line 41
    move-object v4, p2

    .line 42
    move-object v5, p3

    .line 43
    move-object v6, p4

    .line 44
    move-object v7, p5

    .line 45
    move v8, p6

    .line 46
    invoke-direct/range {v1 .. v8}, Ll/j3l0;-><init>(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILcom/p1/mobile/putong/facertification/RxFacertification$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p4, p1, p2, p3}, Ll/o3l0;->k(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    move-object p1, p2

    .line 4
    move-object p2, p3

    .line 5
    move-object p3, p4

    .line 6
    move-object p4, p5

    .line 7
    move-object p5, p6

    .line 8
    move p6, p7

    .line 9
    invoke-virtual/range {p0 .. p6}, Ll/o3l0;->r(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    move-object p1, p2

    .line 14
    move-object p2, p3

    .line 15
    move-object p3, p4

    .line 16
    move-object p4, p5

    .line 17
    move-object p5, p6

    .line 18
    move p6, p7

    .line 19
    new-instance p7, Ll/i3l0;

    .line 20
    .line 21
    move-object v0, p1

    .line 22
    move-object p1, p0

    .line 23
    move-object p0, p7

    .line 24
    move p7, p6

    .line 25
    move-object p6, p5

    .line 26
    move-object p5, p4

    .line 27
    move-object p4, p3

    .line 28
    move-object p3, p2

    .line 29
    move-object p2, v0

    .line 30
    invoke-direct/range {p0 .. p7}, Ll/i3l0;-><init>(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    move-object p1, p2

    .line 34
    invoke-static {p1, p0}, Ll/l7y;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final r(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->p()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v4, Ll/wq8;

    .line 6
    .line 7
    invoke-direct {v4}, Ll/wq8;-><init>()V

    .line 8
    .line 9
    .line 10
    move-object v1, p1

    .line 11
    move-object v2, p2

    .line 12
    move-object v3, p3

    .line 13
    move-object v5, p4

    .line 14
    move-object v6, p5

    .line 15
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->A(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/k3l0;

    .line 24
    .line 25
    invoke-direct {p2}, Ll/k3l0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance p2, Ll/l3l0;

    .line 33
    .line 34
    invoke-direct {p2, v1}, Ll/l3l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance p2, Ll/m3l0;

    .line 42
    .line 43
    invoke-direct {p2, p0, v1, v6, p6}, Ll/m3l0;-><init>(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/n3l0;

    .line 47
    .line 48
    invoke-direct {p0, v1}, Ll/n3l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 49
    .line 50
    .line 51
    const/4 p3, 0x0

    .line 52
    invoke-static {p2, p0, p3}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method
