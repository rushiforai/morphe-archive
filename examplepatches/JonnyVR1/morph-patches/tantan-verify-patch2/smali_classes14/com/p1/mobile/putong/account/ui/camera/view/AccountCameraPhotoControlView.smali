.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRecordButton;

.field public b:Lv/VFrame;

.field public c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;

.field public d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;

.field public e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;

.field public f:Ll/vh;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->g(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/si;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;->getDraweeView()Lv/VDraweeView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/bbc0;->V:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;->getDraweeView()Lv/VDraweeView;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/high16 v1, 0x40c00000    # 6.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/wlj;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/wlj;

    .line 55
    .line 56
    sget-object v1, Ll/h1e0;->h:Ll/h1e0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/wlj;->w(Ll/h1e0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    .line 64
    const/high16 v0, 0x40400000    # 3.0f

    .line 65
    .line 66
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 71
    .line 72
    .line 73
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;->getDraweeLayout()Landroid/widget/FrameLayout;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    sget p1, Ll/bbc0;->U:I

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/vh;->i(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/vh;->p()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-interface {p1, v0}, Ll/vh;->onStateChanged(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

    .line 24
    .line 25
    const/4 p1, 0x2

    .line 26
    invoke-interface {p0, p1}, Ll/vh;->onStateChanged(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/vh;->v(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;

    .line 2
    .line 3
    new-instance v1, Ll/pi;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pi;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRecordButton;

    .line 12
    .line 13
    new-instance v1, Ll/qi;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/qi;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;

    .line 22
    .line 23
    new-instance v1, Ll/ri;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/ri;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setCallback(Ll/vh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->f:Ll/vh;

    .line 2
    .line 3
    return-void
.end method

.method public setEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraPhotoControlView;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRecordButton;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
