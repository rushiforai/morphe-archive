.class public Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Landroid/view/View$OnClickListener;",
        "Ll/iam<",
        "Ll/x9m;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroid/widget/ImageView;

.field public B:Landroid/widget/ImageView;

.field public C:Landroid/widget/LinearLayout;

.field public D:Landroid/widget/ImageView;

.field public E:Landroid/widget/TextView;

.field public E0:Lrx/subjects/a;

.field public F:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public G:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public H:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public I:Lv/VButton;

.field public J:Landroid/view/ViewStub;

.field public K:Landroid/view/ViewStub;

.field public L:Landroid/view/ViewStub;

.field public M:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

.field public O:Ll/kz10;

.field public P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public Q:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

.field public R:Ljava/lang/String;

.field public S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

.field public T:Ljava/lang/String;

.field public U:Ll/fam;

.field public V:Z

.field public W:I

.field public X:I

.field public Y:Z

.field public Z:Ll/fe00;

.field public k0:Ll/x9m;

.field public p0:Z

.field public z:Landroid/view/TextureView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x19

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->W:I

    .line 7
    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->X:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Y:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->p0:Z

    .line 14
    .line 15
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->E0:Lrx/subjects/a;

    .line 20
    .line 21
    return-void
.end method

.method private I5(Landroid/view/View;Z)V
    .locals 11

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, p0

    .line 13
    :goto_0
    if-eqz p2, :cond_1

    .line 14
    .line 15
    move v1, p0

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    :goto_1
    if-eqz p2, :cond_2

    .line 22
    .line 23
    sget-object v2, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    :goto_2
    move-object v9, v2

    .line 26
    goto :goto_3

    .line 27
    :cond_2
    sget-object v2, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :goto_3
    int-to-float v0, v0

    .line 31
    int-to-float v1, v1

    .line 32
    const/4 v2, 0x2

    .line 33
    new-array v10, v2, [F

    .line 34
    .line 35
    aput v0, v10, p0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    aput v1, v10, p0

    .line 39
    .line 40
    const-string v4, "translationY"

    .line 41
    .line 42
    const-wide/16 v5, 0x0

    .line 43
    .line 44
    const-wide/16 v7, 0x1f4

    .line 45
    .line 46
    move-object v3, p1

    .line 47
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v3, p0}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    new-instance p1, Ll/p9m;

    .line 55
    .line 56
    invoke-direct {p1, v3, p2}, Ll/p9m;-><init>(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic M4(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/oki;->k(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->B5(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->A5()V

    return-void
.end method

.method public static synthetic P4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string v1, "OnVideoProcessFinished Error"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->E5()V

    return-void
.end method

.method public static synthetic R4(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->F5()V

    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->C5(IILjava/lang/String;)V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->D5(IILjava/lang/String;)V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z5(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static bridge synthetic W4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    return-object p0
.end method

.method public static bridge synthetic X4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Y:Z

    return p0
.end method

.method public static bridge synthetic Y4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fe00;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Z:Ll/fe00;

    return-object p0
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    return-object p0
.end method

.method public static bridge synthetic a5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->X:I

    return p0
.end method

.method public static bridge synthetic b5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->E0:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic c5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/x9m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->k0:Ll/x9m;

    return-object p0
.end method

.method public static bridge synthetic d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    return-object p0
.end method

.method public static bridge synthetic e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    return-object p0
.end method

.method public static bridge synthetic f5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    return-void
.end method

.method public static bridge synthetic g5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->V:Z

    return-void
.end method

.method public static bridge synthetic h5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Y:Z

    return-void
.end method

.method public static bridge synthetic i5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->X:I

    return-void
.end method

.method public static bridge synthetic j5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->W:I

    return-void
.end method

.method public static bridge synthetic k5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->n5(II)V

    return-void
.end method

.method private r5()V
    .locals 1

    .line 1
    new-instance v0, Ll/x9m;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x9m;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private s5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

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
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private w5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->C:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->B:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I:Lv/VButton;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->H:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->G:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final synthetic A5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->k0:Ll/x9m;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->T:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/x9m;->g0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic B5(Ljava/lang/Object;)V
    .locals 0

    .line 1
    new-instance p1, Ll/t9m;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/t9m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic C5(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/helper/exception/VideoEditProcessErrorException;->reportVideoEditProcessError(IILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I:Lv/VButton;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 36
    .line 37
    invoke-interface {p1}, Ll/fam;->p()Z

    .line 38
    .line 39
    .line 40
    :cond_1
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->o2:I

    .line 41
    .line 42
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic D5(IILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/o9m;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/o9m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;IILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic E5()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->L5(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I5(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic F5()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->L5(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I5(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final G5(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Z:Ll/fe00;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p1, Ll/fe00;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p1, Ll/fe00;->c:I

    .line 10
    .line 11
    iput v0, p1, Ll/fe00;->d:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ll/fam;->i(F)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->X:I

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    const/high16 v2, 0x42c80000    # 100.0f

    .line 26
    .line 27
    div-float/2addr v1, v2

    .line 28
    invoke-interface {v0, v1}, Ll/fam;->i(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Z:Ll/fe00;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Ll/fe00;->b:Ljava/lang/String;

    .line 36
    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 38
    .line 39
    iput v1, v0, Ll/fe00;->c:I

    .line 40
    .line 41
    iget p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 42
    .line 43
    iput p1, v0, Ll/fe00;->d:I

    .line 44
    .line 45
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 54
    .line 55
    const-wide/16 v0, 0x0

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    invoke-interface {p0, v0, v1, p1}, Ll/fam;->m(JZ)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public final H5()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->p0:Z

    .line 2
    .line 3
    xor-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->p0:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v1}, Ll/fam;->pause()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P5()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-interface {v1}, Ll/fam;->resume()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->u5()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final J5()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cai;->e(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v2, v0, v2

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    aget v0, v0, v3

    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 16
    .line 17
    invoke-static {v4}, Ll/cai;->h(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/high16 v5, 0x500000

    .line 22
    .line 23
    invoke-interface {v1, v2, v0, v4, v5}, Ll/fam;->k(IIII)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->T:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/fam;->n(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->r2:I

    .line 34
    .line 35
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/android/app/Frag;->p4(IZ)Landroid/app/Dialog;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final K5()V
    .locals 4

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 21
    .line 22
    iget v2, v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->size:I

    .line 23
    .line 24
    int-to-long v2, v2

    .line 25
    cmp-long v0, v0, v2

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->J5()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->q2:I

    .line 35
    .line 36
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->s5()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final L5(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->F:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I5(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public M5()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->M:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final N5()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->K:Landroid/view/ViewStub;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->O:Ll/kz10;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

    .line 27
    .line 28
    new-instance v1, Ll/l9m;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/l9m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->setDismissListener(Ll/x20;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 49
    .line 50
    iget-wide v3, v1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->k(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;J)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->l()V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->L5(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;

    .line 65
    .line 66
    const/4 v1, 0x1

    .line 67
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I5(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    :goto_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Z1:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final O5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->L:Landroid/view/ViewStub;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->O:Ll/kz10;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 27
    .line 28
    new-instance v1, Ll/m9m;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/m9m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->setDismissListener(Ll/x20;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 37
    .line 38
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->X:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->setCurrentVolumeValue(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->M5()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->l(ZLcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->L5(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I5(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    :goto_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Z1:I

    .line 66
    .line 67
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final P5()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->A:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-wide/16 v0, 0xc8

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->w5()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->y5()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x9m;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->o5(Ll/x9m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->l5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->m5()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public l5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/w9m;->b(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final m5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->s5()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string v0, "extra_key_video_path"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->R:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "extra_key_music_content"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->R:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->t5(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->playingMusic:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->M:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 43
    .line 44
    const/16 v0, 0x32

    .line 45
    .line 46
    iput v0, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 47
    .line 48
    new-instance p1, Ljava/io/File;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 53
    .line 54
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_5

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    const-wide/16 v2, 0x0

    .line 68
    .line 69
    cmp-long v0, v0, v2

    .line 70
    .line 71
    if-gtz v0, :cond_1

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    long-to-int p1, v1

    .line 82
    iput p1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->size:I

    .line 83
    .line 84
    invoke-static {}, Ll/be00;->b()Ll/fam;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 89
    .line 90
    const/4 v0, 0x1

    .line 91
    invoke-interface {p1, v0}, Ll/fam;->d(Z)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 95
    .line 96
    const/4 v0, 0x0

    .line 97
    invoke-interface {p1, v0}, Ll/fam;->e(Z)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 101
    .line 102
    new-instance v0, Ll/n9m;

    .line 103
    .line 104
    invoke-direct {v0, p0}, Ll/n9m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {p1, v0}, Ll/fam;->j(Ll/jpw;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 111
    .line 112
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$a;

    .line 113
    .line 114
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {p1, v0}, Ll/fam;->o(Ll/kpw;)V

    .line 118
    .line 119
    .line 120
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->r5()V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->k0:Ll/x9m;

    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 126
    .line 127
    iput-object v0, p1, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 130
    .line 131
    invoke-virtual {p1, v0, v1}, Ll/x9m;->f0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->v5()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->x5()V

    .line 138
    .line 139
    .line 140
    const-string p1, "current_video"

    .line 141
    .line 142
    const-string v0, "temp"

    .line 143
    .line 144
    invoke-static {p1, v0}, Ll/sw5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_2

    .line 153
    .line 154
    const-string p1, "mp4"

    .line 155
    .line 156
    invoke-static {p1}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->T:Ljava/lang/String;

    .line 165
    .line 166
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->T:Ljava/lang/String;

    .line 167
    .line 168
    if-nez p1, :cond_3

    .line 169
    .line 170
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->s5()V

    .line 171
    .line 172
    .line 173
    :cond_3
    new-instance p1, Ll/fe00;

    .line 174
    .line 175
    invoke-direct {p1}, Ll/fe00;-><init>()V

    .line 176
    .line 177
    .line 178
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Z:Ll/fe00;

    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 181
    .line 182
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 183
    .line 184
    iput-object v1, p1, Ll/fe00;->a:Ljava/lang/String;

    .line 185
    .line 186
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 187
    .line 188
    iput v1, p1, Ll/fe00;->e:I

    .line 189
    .line 190
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 191
    .line 192
    iput v0, p1, Ll/fe00;->f:I

    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 195
    .line 196
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_4

    .line 201
    .line 202
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Z:Ll/fe00;

    .line 203
    .line 204
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 205
    .line 206
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 207
    .line 208
    iput-object v0, p1, Ll/fe00;->b:Ljava/lang/String;

    .line 209
    .line 210
    iget v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 211
    .line 212
    iput v0, p1, Ll/fe00;->c:I

    .line 213
    .line 214
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 215
    .line 216
    iput p0, p1, Ll/fe00;->d:I

    .line 217
    .line 218
    :cond_4
    return-void

    .line 219
    :cond_5
    :goto_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->s2:I

    .line 220
    .line 221
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 222
    .line 223
    .line 224
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->s5()V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public final n5(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-double v2, p2

    .line 14
    int-to-double p1, p1

    .line 15
    div-double/2addr v2, p1

    .line 16
    int-to-double p1, v0

    .line 17
    mul-double/2addr p1, v2

    .line 18
    double-to-int p1, p1

    .line 19
    if-le v1, p1, :cond_0

    .line 20
    .line 21
    move p2, p1

    .line 22
    move p1, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    int-to-double p1, v1

    .line 25
    div-double/2addr p1, v2

    .line 26
    double-to-int p1, p1

    .line 27
    move p2, v1

    .line 28
    :goto_0
    sub-int v2, v0, p1

    .line 29
    .line 30
    div-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    sub-int v3, v1, p2

    .line 33
    .line 34
    div-int/lit8 v3, v3, 0x2

    .line 35
    .line 36
    new-instance v4, Landroid/graphics/Matrix;

    .line 37
    .line 38
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 39
    .line 40
    .line 41
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 42
    .line 43
    invoke-virtual {v5, v4}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 44
    .line 45
    .line 46
    int-to-float p1, p1

    .line 47
    int-to-float v0, v0

    .line 48
    div-float/2addr p1, v0

    .line 49
    int-to-float p2, p2

    .line 50
    int-to-float v0, v1

    .line 51
    div-float/2addr p2, v0

    .line 52
    invoke-virtual {v4, p1, p2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 53
    .line 54
    .line 55
    int-to-float p1, v2

    .line 56
    int-to-float p2, v3

    .line 57
    invoke-virtual {v4, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 61
    .line 62
    invoke-virtual {p0, v4}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->p5()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public o5(Ll/x9m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->k0:Ll/x9m;

    .line 2
    .line 3
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    const/16 p2, 0x3e9

    .line 8
    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "result_selected"

    .line 18
    .line 19
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->O:Ll/kz10;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ll/kz10;->d(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->I:Lv/VButton;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->K5()V

    .line 10
    .line 11
    .line 12
    const-string p0, "e_photo_to_video_edit_next"

    .line 13
    .line 14
    const-string p1, "p_photo_to_video_edit"

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->B:Landroid/widget/ImageView;

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->o()Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->C:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    if-ne p1, v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->q5()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->G:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 37
    .line 38
    if-ne p1, v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->N5()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->H:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 45
    .line 46
    if-ne p1, v0, :cond_4

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->O5()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 53
    .line 54
    if-ne p1, v0, :cond_5

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->H5()V

    .line 57
    .line 58
    .line 59
    :cond_5
    return-void
.end method

.method public final p5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->k0:Ll/x9m;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/x9m;->e0(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->s5()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final q5()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-class v2, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x3e9

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v0, Ll/a8c0;->i:I

    .line 22
    .line 23
    sget v1, Ll/a8c0;->g:I

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final t5(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;-><init>(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/ikl0;->c(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x32

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 15
    .line 16
    return-object p0
.end method

.method public final u5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->A:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

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
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->A:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-wide/16 v0, 0xc8

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final v5()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/q9m;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/q9m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->E0:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/r9m;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/r9m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Ll/s9m;

    .line 33
    .line 34
    invoke-direct {p0}, Ll/s9m;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1, p0}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final x5()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$b;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->O:Ll/kz10;

    .line 7
    .line 8
    return-void
.end method

.method public final y5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->B:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v1, v1, [Landroid/view/View;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput-object v0, v1, v2

    .line 8
    .line 9
    invoke-static {v1}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->A:Landroid/widget/ImageView;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->E:Landroid/widget/TextView;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->E:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-static {p0}, Ll/bnl0;->z(Landroid/widget/TextView;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic z5(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_3

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    new-instance p1, Ljava/io/File;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->V:Z

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->V:Z

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->P:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->G5(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_8

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 59
    .line 60
    invoke-interface {p0}, Ll/fam;->p()Z

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    :goto_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->p2:I

    .line 65
    .line 66
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->s5()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 74
    .line 75
    if-ne p1, v0, :cond_4

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_8

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 86
    .line 87
    invoke-interface {p0}, Ll/fam;->pause()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 92
    .line 93
    if-ne p1, v0, :cond_5

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->z:Landroid/view/TextureView;

    .line 96
    .line 97
    const/16 p1, 0x8

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 104
    .line 105
    if-ne p1, v0, :cond_8

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->S:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 108
    .line 109
    if-nez p1, :cond_6

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_7

    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 121
    .line 122
    invoke-interface {p1}, Ll/fam;->release()V

    .line 123
    .line 124
    .line 125
    const/4 p1, 0x0

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->U:Ll/fam;

    .line 127
    .line 128
    :cond_7
    invoke-static {}, Ll/sw5;->b()Ljava/io/File;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_8

    .line 137
    .line 138
    new-instance p1, Ll/u9m;

    .line 139
    .line 140
    invoke-direct {p1, p0}, Ll/u9m;-><init>(Ljava/io/File;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    :goto_1
    return-void
.end method
