.class public Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/pf60<",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/content/Intent;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/qf5;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qf5;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x190

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->f:Ll/y20;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->e2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Landroid/content/Intent;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->f:Ll/y20;

    .line 2
    .line 3
    new-instance v1, Ll/pf60;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->h2(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d2()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "comic_face_black_list"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    const-string v1, ","

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    array-length v1, v0

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    xor-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    return v0

    .line 44
    :cond_2
    :goto_0
    return v2
.end method

.method private e2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 9
    .line 10
    invoke-direct {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->e:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->g2(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->c2()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ll/xc4;->m(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static final h2(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/wzx;->k()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const-string v2, "android.permission.CAMERA"

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-array v1, v4, [Ljava/lang/String;

    .line 19
    .line 20
    aput-object v2, v1, v3

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x2

    .line 24
    new-array v1, v1, [Ljava/lang/String;

    .line 25
    .line 26
    aput-object v2, v1, v3

    .line 27
    .line 28
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 29
    .line 30
    aput-object v2, v1, v4

    .line 31
    .line 32
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/tf5;

    .line 49
    .line 50
    invoke-direct {v2, p0, v0}, Ll/tf5;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static i2(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-lt v0, v1, :cond_2

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->d2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Ll/sf5;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/sf5;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->h2(Lcom/p1/mobile/android/app/Act;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    :goto_0
    const-string p0, "\u7531\u4e8e\u673a\u578b\u95ee\u9898,\u6682\u4e0d\u652f\u6301\u672c\u529f\u80fd\uff5e"

    .line 34
    .line 35
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uf5;->b(Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c2()V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/nx40;->h(Landroid/app/Activity;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->d:Landroid/view/View;

    .line 8
    .line 9
    filled-new-array {p0}, [Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final g2(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Ll/hdc0;->A:I

    .line 18
    .line 19
    invoke-virtual {p0, v1, p1, v0}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x80

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->d:Landroid/view/View;

    .line 15
    .line 16
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->mIfInNewUi1ShouldUseThemNewUI2:Z

    .line 6
    .line 7
    new-instance v0, Ll/rf5;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/rf5;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->e:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->e:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->o()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_video"

    .line 2
    .line 3
    return-object p0
.end method
