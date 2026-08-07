.class public Ll/sg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/a0m;
.implements Ll/o94;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/yf5;",
        ">;",
        "Ll/a0m;",
        "Ll/o94;"
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

.field public D:I

.field public E:I

.field public F:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/MediaMeta;",
            ">;"
        }
    .end annotation
.end field

.field public G:Ll/jxd0;

.field public H:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public I:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public J:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field public K:Lcom/p1/mobile/putong/feed/data/CameraSticker;

.field public a:Landroid/view/SurfaceView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public m:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public n:Landroid/view/ViewStub;

.field public o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

.field public p:Landroid/content/Context;

.field public q:Ll/b0m;

.field public r:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

.field public t:Ll/yf5;

.field public u:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

.field public v:Ll/th0;

.field public w:I

.field public x:I

.field public y:I

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/sg5;->w:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Ll/sg5;->x:I

    .line 9
    .line 10
    iput v1, p0, Ll/sg5;->y:I

    .line 11
    .line 12
    iput-boolean v0, p0, Ll/sg5;->z:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/sg5;->A:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Ll/sg5;->B:Z

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/sg5;->F:Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ll/jxd0;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "comic_face_recorder_need_show_tip"

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ll/sg5;->G:Ll/jxd0;

    .line 55
    .line 56
    iput-object p1, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Ll/sg5;->p:Landroid/content/Context;

    .line 63
    .line 64
    return-void
.end method

.method public static synthetic A(Ll/sg5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->z0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B(Ll/sg5;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sg5;->s0(II)V

    return-void
.end method

.method public static synthetic C(Ll/sg5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/sg5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/sg5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->A0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/sg5;Ljava/lang/Integer;Lcom/p1/mobile/putong/feed/data/CameraSticker;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/sg5;->p0(Ljava/lang/Integer;Lcom/p1/mobile/putong/feed/data/CameraSticker;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic I(Ll/sg5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sg5;->m0()V

    return-void
.end method

.method public static synthetic J(Ll/sg5;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->v0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic K(Ll/sg5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sg5;->r0()V

    return-void
.end method

.method private K0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/sg5;->U0(Z)Z

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/sg5;->k(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/l4m;->O()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic L(Ll/sg5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->y0(Landroid/view/View;)V

    return-void
.end method

.method private L0(Ljava/lang/Runnable;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 4
    .line 5
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x42700000    # 60.0f

    .line 9
    .line 10
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    int-to-float p0, p0

    .line 15
    const/4 v1, 0x2

    .line 16
    new-array v7, v1, [F

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    aput v1, v7, v2

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    aput p0, v7, v1

    .line 24
    .line 25
    const-string v1, "translationX"

    .line 26
    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    const-wide/16 v4, 0x64

    .line 30
    .line 31
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic M(Ll/sg5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sg5;->o0()V

    return-void
.end method

.method private M0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sg5;->F:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/sg5;->a0()Lcom/p1/mobile/putong/data/MediaMeta;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic N(Ll/sg5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sg5;->q0()V

    return-void
.end method

.method private N0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sg5;->F:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/sg5;->F:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/lit8 v0, v0, -0x1

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static bridge synthetic O(Ll/sg5;)Ll/b0m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    return-object p0
.end method

.method public static bridge synthetic P(Ll/sg5;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/sg5;->E:I

    return-void
.end method

.method public static bridge synthetic Q(Ll/sg5;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/sg5;->D:I

    return-void
.end method

.method private Q0(Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->s3:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/bg5;

    .line 34
    .line 35
    invoke-direct {v0, p2}, Ll/bg5;-><init>(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Ll/cg5;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ll/cg5;-><init>(Ll/sg5;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/th0$a;->a()Ll/th0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Ll/sg5;->v:Ll/th0;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static bridge synthetic R(Ll/sg5;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/sg5;->w:I

    return-void
.end method

.method private R0()V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l4m;->prepare()Z

    .line 4
    .line 5
    .line 6
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    goto :goto_2

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    :try_start_1
    const-string v3, "c++_shared"

    .line 12
    .line 13
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 14
    .line 15
    .line 16
    move v3, v1

    .line 17
    goto :goto_0

    .line 18
    :catchall_1
    move v3, v2

    .line 19
    :goto_0
    :try_start_2
    const-string v4, "xeengine"

    .line 20
    .line 21
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 22
    .line 23
    .line 24
    goto :goto_1

    .line 25
    :catchall_2
    move v1, v2

    .line 26
    :goto_1
    new-instance v4, Ljava/lang/RuntimeException;

    .line 27
    .line 28
    new-instance v5, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v6, "IMomoRecorder prepare error, cppSharedLoaded="

    .line 31
    .line 32
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v3, ", xeengineLoaded="

    .line 39
    .line 40
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-direct {v4, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    move v0, v2

    .line 57
    :goto_2
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 60
    .line 61
    invoke-interface {p0}, Ll/l4m;->g()V

    .line 62
    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_0
    const-string p0, "\u76f8\u673a\u6253\u5f00\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7cfb\u7edf\u76f8\u673a\u662f\u5426\u53ef\u7528"

    .line 66
    .line 67
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :goto_3
    return-void
.end method

.method public static bridge synthetic S(Ll/sg5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sg5;->S0()V

    return-void
.end method

.method private S0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/sg5;->K:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "0"

    .line 9
    .line 10
    :goto_0
    new-instance v1, Ll/pf60;

    .line 11
    .line 12
    const-string v2, "shoot_type"

    .line 13
    .line 14
    const-string v3, "immersion_cartoon_effects"

    .line 15
    .line 16
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/pf60;

    .line 20
    .line 21
    const-string v3, "event_type"

    .line 22
    .line 23
    const-string v4, "MC"

    .line 24
    .line 25
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Ll/pf60;

    .line 29
    .line 30
    const-string v4, "sticker_id"

    .line 31
    .line 32
    invoke-direct {v3, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "e_kankan_post_shoot"

    .line 40
    .line 41
    const-string v2, "p_camera_video"

    .line 42
    .line 43
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/sg5;->G:Ll/jxd0;

    .line 47
    .line 48
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 54
    .line 55
    invoke-interface {v0}, Ll/l4m;->h()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    invoke-direct {p0}, Ll/sg5;->X()V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public static bridge synthetic T(Ll/sg5;Z)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sg5;->U0(Z)Z

    move-result p0

    return p0
.end method

.method private T0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/l4m;->y(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/l4m;->i()V

    .line 11
    .line 12
    .line 13
    iget-boolean v0, p0, Ll/sg5;->B:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-direct {p0, v0}, Ll/sg5;->U0(Z)Z

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/sg5;->B:Z

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-direct {p0}, Ll/sg5;->M0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private U0(Z)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l4m;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/l4m;->I(Z)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method private W()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/sg5;->B:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/l4m;->j()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/sg5;->k(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private X()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-direct {p0}, Ll/sg5;->e0()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-ltz v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Ll/sg5;->K0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-direct {p0}, Ll/sg5;->T0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private Y()V
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
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/sg5;->c0()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method private Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sg5;->K:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sg5;->P0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Ll/sg5;->t:Ll/yf5;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/yf5;->k0()V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Ll/sg5;->w:I

    .line 27
    .line 28
    const/16 v1, 0x66

    .line 29
    .line 30
    if-eq v0, v1, :cond_2

    .line 31
    .line 32
    const/16 v0, 0x64

    .line 33
    .line 34
    iput v0, p0, Ll/sg5;->w:I

    .line 35
    .line 36
    :cond_2
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_3

    .line 51
    .line 52
    invoke-direct {p0}, Ll/sg5;->R0()V

    .line 53
    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method

.method private a0()Lcom/p1/mobile/putong/data/MediaMeta;
    .locals 2

    .line 1
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xc4;->e()Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lcom/p1/mobile/putong/data/MediaMeta;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/MediaMeta;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ll/sg5;->l0()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const-string p0, "front"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, "back"

    .line 24
    .line 25
    :goto_0
    iput-object p0, v1, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p0, v1, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 32
    .line 33
    :cond_1
    return-object v1
.end method

.method private d0(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Landroid/os/Bundle;
    .locals 6

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 16
    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 18
    iput-boolean v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    iput-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->advancedRecordingVideo:Z

    .line 22
    .line 23
    iget-object v3, p0, Ll/sg5;->q:Ll/b0m;

    .line 24
    .line 25
    invoke-interface {v3}, Ll/l4m;->K()Ll/qow;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    invoke-virtual {v3}, Ll/qow;->v()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iput v3, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->rotate:I

    .line 40
    .line 41
    :cond_1
    iget-object v3, p0, Ll/sg5;->q:Ll/b0m;

    .line 42
    .line 43
    invoke-interface {v3}, Ll/b0m;->z()Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-object v4, p0, Ll/sg5;->q:Ll/b0m;

    .line 48
    .line 49
    invoke-interface {v4}, Ll/l4m;->e()Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    iput-boolean v4, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isFrontCamera:Z

    .line 54
    .line 55
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    iput-object v3, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->playingMusic:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 62
    .line 63
    :cond_2
    iget-object v3, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 64
    .line 65
    iput-boolean v1, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->autoMusic:Z

    .line 66
    .line 67
    iget v4, p0, Ll/sg5;->w:I

    .line 68
    .line 69
    iput v4, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->shootMode:I

    .line 70
    .line 71
    iget v5, p0, Ll/sg5;->x:I

    .line 72
    .line 73
    iput v5, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->flashMode:I

    .line 74
    .line 75
    iput v4, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->fromState:I

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/sg5;->getCount()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-le v4, v2, :cond_3

    .line 82
    .line 83
    move v4, v2

    .line 84
    goto :goto_0

    .line 85
    :cond_3
    move v4, v1

    .line 86
    :goto_0
    iput-boolean v4, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isFragment:Z

    .line 87
    .line 88
    iget-object v3, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 89
    .line 90
    invoke-direct {p0}, Ll/sg5;->e0()J

    .line 91
    .line 92
    .line 93
    move-result-wide v4

    .line 94
    iput-wide v4, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->maxDuration:J

    .line 95
    .line 96
    iget-object v3, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 97
    .line 98
    iget-object v4, p0, Ll/sg5;->r:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 99
    .line 100
    if-nez v4, :cond_4

    .line 101
    .line 102
    move v5, v2

    .line 103
    goto :goto_1

    .line 104
    :cond_4
    move v5, v1

    .line 105
    :goto_1
    iput-boolean v5, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->hasOriginalSound:Z

    .line 106
    .line 107
    if-eqz v4, :cond_5

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    move v2, v1

    .line 111
    :goto_2
    iput-boolean v2, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->hasMusic:Z

    .line 112
    .line 113
    const-string v2, "EXTRA_KEY_CAMERA_META_DATA"

    .line 114
    .line 115
    iget-object v3, p0, Ll/sg5;->F:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 118
    .line 119
    .line 120
    const-string v2, "EXTRA_KEY_VIDEO_DATA"

    .line 121
    .line 122
    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 123
    .line 124
    .line 125
    const-string p1, "EXTRA_KEY_VIDEO_TRANS_INFO"

    .line 126
    .line 127
    iget-object p0, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 128
    .line 129
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 130
    .line 131
    .line 132
    const-string p0, "key_is_change_speed"

    .line 133
    .line 134
    invoke-virtual {v0, p0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 135
    .line 136
    .line 137
    const-string p0, "extra_from"

    .line 138
    .line 139
    const-string p1, "immersion_cartoon_effects"

    .line 140
    .line 141
    invoke-virtual {v0, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-object v0
.end method

.method private e0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x3a98

    .line 2
    .line 3
    return-wide v0
.end method

.method private k0()V
    .locals 2

    .line 1
    new-instance v0, Ll/vwv;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vwv;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1, p0}, Ll/l4m;->a(Landroid/app/Activity;Ll/k4m;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/sg5;->r:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 24
    .line 25
    iget-object p0, p0, Ll/sg5;->r:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 26
    .line 27
    invoke-interface {v0, p0}, Ll/b0m;->x(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private l0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/l4m;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic n(Ll/sg5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sg5;->n0()V

    return-void
.end method

.method public static synthetic w(Ll/sg5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/sg5;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->x0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic y(Ll/sg5;Ll/g6x;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->B0(Ll/g6x;)V

    return-void
.end method

.method public static synthetic z(Ll/sg5;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sg5;->w0(Landroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->I:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B0(Ll/g6x;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/b0m;->A(Ll/g6x;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->p:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic D0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->v:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/sg5;->Y()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/sg5;->k0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public G0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/uc4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/l4m;->release()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public H0()V
    .locals 2

    .line 1
    iget v0, p0, Ll/sg5;->w:I

    .line 2
    .line 3
    const/16 v1, 0x65

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x66

    .line 8
    .line 9
    iput v0, p0, Ll/sg5;->w:I

    .line 10
    .line 11
    iget-object v1, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->H(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/l4m;->onPause()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public I0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-direct {p0}, Ll/sg5;->Z()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public J0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/sg5;->r:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    iget-object v0, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 4
    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->musicContent:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isSameMusic:Z

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/sg5;->j:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 24
    .line 25
    invoke-interface {p0, p1}, Ll/b0m;->x(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final O0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sg5;->a:Landroid/view/SurfaceView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/sg5$a;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/sg5$a;-><init>(Ll/sg5;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/kg5;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/kg5;-><init>(Ll/sg5;)V

    .line 18
    .line 19
    .line 20
    const/16 v1, 0x1f4

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/sg5;->H:Ll/y20;

    .line 27
    .line 28
    new-instance v0, Ll/lg5;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/lg5;-><init>(Ll/sg5;)V

    .line 31
    .line 32
    .line 33
    const/16 v2, 0x3e8

    .line 34
    .line 35
    invoke-static {v2, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/sg5;->I:Ll/y20;

    .line 40
    .line 41
    new-instance v0, Ll/mg5;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/mg5;-><init>(Ll/sg5;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/sg5;->J:Ll/y20;

    .line 51
    .line 52
    iget-object v0, p0, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 53
    .line 54
    new-instance v1, Ll/ng5;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/ng5;-><init>(Ll/sg5;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/sg5;->l:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 63
    .line 64
    new-instance v1, Ll/og5;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/og5;-><init>(Ll/sg5;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 73
    .line 74
    new-instance v1, Ll/pg5;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/pg5;-><init>(Ll/sg5;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final P0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/sg5;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/io/File;

    .line 6
    .line 7
    iget-object v2, p0, Ll/sg5;->K:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/wdl0;->a(Landroid/content/Context;Ljava/io/File;)Ll/g6x;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Ll/sg5;->p:Landroid/content/Context;

    .line 25
    .line 26
    new-instance v2, Ll/rg5;

    .line 27
    .line 28
    invoke-direct {v2, p0, v0}, Ll/rg5;-><init>(Ll/sg5;Ll/g6x;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 v3, 0x1f4

    .line 32
    .line 33
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tg5;->b(Ll/sg5;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public V(Ll/yf5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sg5;->t:Ll/yf5;

    .line 2
    .line 3
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->P1:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L()V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Ll/sg5;->k(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->p:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getLastDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public b0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/sg5;->c0()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Ll/ag5;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/ag5;-><init>(Ll/sg5;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getCount()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->q0:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/jg5;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/jg5;-><init>(Ll/sg5;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, v0, v1}, Ll/sg5;->Q0(Ljava/lang/String;Ll/x20;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->D0:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-direct {p0, v1, v0}, Ll/sg5;->Q0(Ljava/lang/String;Ll/x20;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public c(Ljava/lang/String;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0xbb8

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->B0:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;-><init>(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/ikl0;->c(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 33
    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/sg5;->J:Ll/y20;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Ll/sg5;->J:Ll/y20;

    .line 46
    .line 47
    invoke-direct {p0, v0}, Ll/sg5;->d0(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Landroid/os/Bundle;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public d()Landroid/view/SurfaceHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->a:Landroid/view/SurfaceView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->u:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->D()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget v0, p0, Ll/sg5;->w:I

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->A0:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/qg5;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/qg5;-><init>(Ll/sg5;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1, v0}, Ll/sg5;->Q0(Ljava/lang/String;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public f0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0xbb8

    .line 2
    .line 3
    return-wide v0
.end method

.method public g0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public h0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 8
    .line 9
    new-instance v1, Ll/fg5;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/fg5;-><init>(Ll/sg5;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->setCancel(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 18
    .line 19
    new-instance v1, Ll/gg5;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/gg5;-><init>(Ll/sg5;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->setOnPropSelect(Ll/a30;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 28
    .line 29
    new-instance v1, Ll/hg5;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/hg5;-><init>(Ll/sg5;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->setDelete(Ll/x20;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 38
    .line 39
    new-instance v1, Ll/sg5$b;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/sg5$b;-><init>(Ll/sg5;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->setStateListener(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->setCategoryData(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public i(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/sg5;->C:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yf5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sg5;->V(Ll/yf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sg5;->U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/sg5;->O0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/sg5;->j0()V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/sg5;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public final j0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sg5;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->z(Landroid/widget/TextView;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sg5;->r:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/sg5;->j:Landroid/widget/TextView;

    .line 15
    .line 16
    iget-object p0, p0, Ll/sg5;->r:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->r2:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Frag;->q4(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sg5;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l4m;->F()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/l4m;->release()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/sg5;->c0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v1}, Ll/sg5;->U0(Z)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/l4m;->F()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->F()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/sg5;->F:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p0, v0}, Ll/l4m;->D(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic o0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/sg5;->K:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 3
    .line 4
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, v0}, Ll/xc4;->m(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/b0m;->T()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 17
    .line 18
    invoke-interface {v0}, Ll/b0m;->B()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/b0m;->t()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onError(II)V
    .locals 1

    .line 1
    new-instance v0, Ll/eg5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/eg5;-><init>(Ll/sg5;II)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFirstFrameRendered()V
    .locals 0

    .line 1
    return-void
.end method

.method public onStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final synthetic p0(Ljava/lang/Integer;Lcom/p1/mobile/putong/feed/data/CameraSticker;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iput-object p2, p0, Ll/sg5;->K:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 2
    .line 3
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p2}, Ll/xc4;->m(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    new-instance p1, Ll/pf60;

    .line 17
    .line 18
    const-string p3, "event_type"

    .line 19
    .line 20
    const-string v0, "MC"

    .line 21
    .line 22
    invoke-direct {p1, p3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    new-instance p3, Ll/pf60;

    .line 26
    .line 27
    const-string v0, "sticker_id"

    .line 28
    .line 29
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {p3, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    filled-new-array {p1, p3}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p3, "e_camera_video_sticker"

    .line 39
    .line 40
    const-string v0, "p_camera_video"

    .line 41
    .line 42
    invoke-static {p3, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-boolean p1, p2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 46
    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/sg5;->P0()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public q(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic q0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/sg5;->f(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic r0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->K()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/sg5;->N0()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/l4m;->removeLast()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-gtz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/sg5;->q:Ll/b0m;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-interface {v0, v1}, Ll/l4m;->D(Z)V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0x64

    .line 33
    .line 34
    iput v0, p0, Ll/sg5;->w:I

    .line 35
    .line 36
    iget-object p0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->H(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public removeLast()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->K()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p0, v0}, Ll/l4m;->D(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public s(FI)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic s0(II)V
    .locals 1

    .line 1
    const/16 v0, -0x12e

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    const/16 p1, 0x64

    .line 6
    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0}, Ll/sg5;->W()V

    .line 11
    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Q1:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-direct {p0}, Ll/sg5;->W()V

    .line 20
    .line 21
    .line 22
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->S1:I

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/sg5;->w:I

    .line 2
    .line 3
    const/16 v1, 0x65

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 9
    .line 10
    if-ne p1, v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/sg5;->b0()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object v0, p0, Ll/sg5;->l:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 17
    .line 18
    if-ne p1, v0, :cond_2

    .line 19
    .line 20
    iget-object p0, p0, Ll/sg5;->q:Ll/b0m;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/b0m;->f()V

    .line 23
    .line 24
    .line 25
    :cond_2
    :goto_0
    return-void
.end method

.method public u()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/sg5;->g0()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0xbb8

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-gez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/sg5;->g0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sub-long/2addr v0, v2

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    const-wide/16 v2, 0x384

    .line 21
    .line 22
    cmp-long p0, v0, v2

    .line 23
    .line 24
    if-gez p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public final synthetic u0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget p1, p0, Ll/sg5;->w:I

    .line 6
    .line 7
    const/16 v0, 0x64

    .line 8
    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 13
    .line 14
    new-instance v0, Landroid/content/Intent;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-class v2, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 23
    .line 24
    .line 25
    const/16 v1, 0x3e9

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget p1, Ll/a8c0;->i:I

    .line 35
    .line 36
    sget v0, Ll/a8c0;->g:I

    .line 37
    .line 38
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public v(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic v0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sg5;->s:Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditAct;->Y1(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/sg5;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic w0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ig5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ig5;-><init>(Ll/sg5;Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/sg5;->L0(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic x0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Ll/dg5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/dg5;-><init>(Ll/sg5;Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic y0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->H:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg5;->H:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
