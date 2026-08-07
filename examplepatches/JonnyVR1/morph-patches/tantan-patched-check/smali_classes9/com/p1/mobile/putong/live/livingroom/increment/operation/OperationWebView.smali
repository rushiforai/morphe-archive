.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings<",
        "Ll/p260;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Landroid/view/animation/RotateAnimation;

.field public final l:I

.field public final m:I

.field public n:Ll/w0c;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x43140000    # 148.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->l:I

    .line 11
    .line 12
    const/high16 p1, 0x42900000    # 72.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->m:I

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x43140000    # 148.0f

    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->l:I

    const/high16 p1, 0x42900000    # 72.0f

    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->m:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x43140000    # 148.0f

    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->l:I

    const/high16 p1, 0x42900000    # 72.0f

    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->m:I

    return-void
.end method

.method private synthetic B0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/p260;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p260;->d4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic D0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/p260;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p260;->d4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->D0()V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->z0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "accessOutterToken "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "[live]operation"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->r0()V

    return-void
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Landroid/webkit/WebView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->G0(Landroid/webkit/WebView;)V

    return-void
.end method

.method private t0()V
    .locals 4

    .line 1
    new-instance v0, Ll/w0c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w0c;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->n:Ll/w0c;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Landroid/app/Activity;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->n:Ll/w0c;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    const-string v2, ""

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3, v2}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->n:Ll/w0c;

    .line 45
    .line 46
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Ll/nxl;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final E0(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->w0()Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 9
    .line 10
    check-cast v0, Ll/p260;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/p260;->e4()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->j:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/wrv;->a()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/f260;

    .line 35
    .line 36
    invoke-direct {v2, p0, v0, p1}, Ll/f260;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/g260;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/g260;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->h5Url:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->u0(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final G0(Landroid/webkit/WebView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->r0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/hiv;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-boolean v1, v0, Ll/hiv;->i:Z

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public H0()V
    .locals 3

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, v0, Ll/hiv;->i:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    const-string v2, "about:blank"

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->r0()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public I0(Landroid/graphics/drawable/Drawable;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/view/animation/RotateAnimation;

    .line 7
    .line 8
    const/4 v6, 0x1

    .line 9
    const/high16 v7, 0x3f000000    # 0.5f

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/high16 v3, 0x43b40000    # 360.0f

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    const/high16 v5, 0x3f000000    # 0.5f

    .line 16
    .line 17
    invoke-direct/range {v1 .. v7}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

    .line 21
    .line 22
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

    .line 33
    .line 34
    const-wide/16 v0, 0x258

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

    .line 40
    .line 41
    const/4 v0, -0x1

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setRepeatCount(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->i:Lv/VImage;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public J0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->l:I

    .line 13
    .line 14
    int-to-float v0, v0

    .line 15
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->width:F

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->y0(F)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->width:F

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, v2

    .line 29
    :goto_0
    mul-float/2addr v0, v1

    .line 30
    float-to-int v0, v0

    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->m:I

    .line 32
    .line 33
    int-to-float v1, v1

    .line 34
    iget v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->height:F

    .line 35
    .line 36
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->y0(F)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->height:F

    .line 43
    .line 44
    :cond_1
    mul-float/2addr v1, v2

    .line 45
    float-to-int v1, v1

    .line 46
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->K0(II)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->h:Lv/VDraweeView;

    .line 50
    .line 51
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->closeButtonUrl:Ljava/lang/String;

    .line 52
    .line 53
    sget v3, Ll/qa00;->m:I

    .line 54
    .line 55
    const-string v4, "context_livingAct"

    .line 56
    .line 57
    invoke-static {v4, v1, v2, v3}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->h:Lv/VDraweeView;

    .line 61
    .line 62
    new-instance v2, Ll/d260;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Ll/d260;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->fadingSeconds:I

    .line 71
    .line 72
    if-lez v1, :cond_2

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 75
    .line 76
    check-cast v2, Ll/p260;

    .line 77
    .line 78
    int-to-long v3, v1

    .line 79
    new-instance v1, Ll/e260;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/e260;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    .line 82
    .line 83
    .line 84
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 85
    .line 86
    invoke-virtual {v2, v3, v4, v5, v1}, Ll/i6t;->B3(JLjava/util/concurrent/TimeUnit;Ljava/lang/Runnable;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->E0(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 93
    .line 94
    check-cast p2, Ll/p260;

    .line 95
    .line 96
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 101
    .line 102
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showOperationsRoot()Ll/v3f$d;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    new-instance v1, Ll/q260$a;

    .line 107
    .line 108
    const/16 v2, 0x1fa4

    .line 109
    .line 110
    invoke-direct {v1, v2}, Ll/q260$a;-><init>(I)V

    .line 111
    .line 112
    .line 113
    const/4 v2, 0x0

    .line 114
    invoke-virtual {v1, v2}, Ll/q260$a;->i(Z)Ll/q260$a;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v1}, Ll/q260$a;->a()Ll/q260;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {p2, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 126
    .line 127
    check-cast p2, Ll/p260;

    .line 128
    .line 129
    invoke-virtual {p2}, Ll/xzs;->L2()Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 134
    .line 135
    check-cast v1, Ll/p260;

    .line 136
    .line 137
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    const-string v2, "H5Drawer"

    .line 142
    .line 143
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-static {p2, v1, p1, v2}, Ll/s260;->d(ZLl/oo2;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->p0(I)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public final K0(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 8
    .line 9
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 10
    .line 11
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/webkit/WebView;->stopLoading()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/p260;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->q0(Ll/p260;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public o0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->n:Ll/w0c;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/ffv;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/w0c;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->h0(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->t0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p0(I)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 2
    .line 3
    check-cast v0, Ll/p260;

    .line 4
    .line 5
    new-instance v1, Ll/f060;

    .line 6
    .line 7
    const/16 v2, 0x1fa4

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/f060;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 27
    .line 28
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v3, 0x5

    .line 37
    if-ne v0, v3, :cond_0

    .line 38
    .line 39
    int-to-float p1, p1

    .line 40
    :goto_0
    move v9, p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    const/16 v3, 0x11

    .line 43
    .line 44
    if-ne v0, v3, :cond_1

    .line 45
    .line 46
    int-to-float p1, p1

    .line 47
    const/high16 v0, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float/2addr p1, v0

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 p1, 0x0

    .line 52
    goto :goto_0

    .line 53
    :goto_1
    new-instance v3, Landroid/view/animation/ScaleAnimation;

    .line 54
    .line 55
    const/4 v10, 0x0

    .line 56
    const/4 v11, 0x0

    .line 57
    const/4 v4, 0x0

    .line 58
    const/high16 v5, 0x3f800000    # 1.0f

    .line 59
    .line 60
    const/4 v6, 0x0

    .line 61
    const/high16 v7, 0x3f800000    # 1.0f

    .line 62
    .line 63
    const/4 v8, 0x0

    .line 64
    invoke-direct/range {v3 .. v11}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 65
    .line 66
    .line 67
    const-wide/16 v4, 0xc8

    .line 68
    .line 69
    invoke-virtual {v3, v4, v5}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 79
    .line 80
    invoke-virtual {p0, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public q0(Ll/p260;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->j:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final r0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k:Landroid/view/animation/RotateAnimation;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->i:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->i:Lv/VImage;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 10
    .line 11
    check-cast p0, Ll/p260;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/p260;->d4()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final u0(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget v0, Ll/mdc0;->f8:I

    .line 2
    .line 3
    invoke-virtual {p2, v0, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p3}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "H5-Authorization"

    .line 18
    .line 19
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p2, p3, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public v0(Ll/bcg0;)Z
    .locals 0

    .line 1
    iget p1, p1, Ll/bcg0;->b:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public w0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final y0(F)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    cmpl-float p0, p1, p0

    if-lez p0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    cmpg-float p0, p1, p0

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic z0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 2
    .line 3
    check-cast v0, Ll/p260;

    .line 4
    .line 5
    iget-object p3, p3, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p3}, Ll/p260;->l4(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->h5Url:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->u0(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
