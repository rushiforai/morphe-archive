.class public Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/data/Media;

.field public f:Ll/x20;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/d9g0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/d9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->f:Ll/x20;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->g2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->k2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->i2()V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->h2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->e2(Landroid/view/View;)V

    return-void
.end method

.method public static final d2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "media"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const/high16 p0, 0x10000000

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const/high16 p0, 0x80000

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object v0
.end method

.method private synthetic e2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->l2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic g2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->d:Lv/VText;

    .line 2
    .line 3
    new-instance v0, Ll/e9g0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/e9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->c:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct$a;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;->setOnDragDismissListenler(Ll/am50;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->c:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 24
    .line 25
    new-instance v0, Ll/f9g0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/f9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->c:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->e:Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->N(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private synthetic i2()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "returnedMedia"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->e:Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->finish()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/h9g0;->b(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget v0, Ll/x7c0;->a:I

    .line 11
    .line 12
    sget v1, Ll/x7c0;->b:I

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/c9g0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/c9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic k2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->f:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->a:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget v2, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/g9g0;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/g9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_credentials_preview_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "media"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->e:Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v0, Ll/c9c0;->W1:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/high16 v0, -0x1000000

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->dimStatusBar(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_0

    .line 50
    .line 51
    sget p1, Ll/x7c0;->c:I

    .line 52
    .line 53
    sget v0, Ll/x7c0;->d:I

    .line 54
    .line 55
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public shouldShowGradientActionBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
