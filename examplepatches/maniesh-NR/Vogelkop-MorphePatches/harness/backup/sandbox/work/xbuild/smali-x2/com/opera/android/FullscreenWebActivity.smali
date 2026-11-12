.class public Lcom/opera/android/FullscreenWebActivity;
.super Ldx3;
.source "SourceFile"


# static fields
.field public static final I:Ljava/util/HashSet;


# instance fields
.field public A:Llqm;

.field public B:Z

.field public C:Lshf;

.field public D:Llq9;

.field public E:I

.field public F:Llq9;

.field public G:I

.field public H:I

.field public u:Ljq9;

.field public v:Lcom/opera/android/browser/WebContentsWrapper;

.field public w:Lkq9;

.field public x:Lwt2;

.field public y:Lwy3;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "https"

    const-string v2, "chrome"

    const-string v3, "http"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/opera/android/FullscreenWebActivity;->I:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ldx3;-><init>()V

    sget-object v0, Llqm;->i:Llqm;

    iput-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->A:Llqm;

    const/4 v0, 0x1

    iput v0, p0, Lcom/opera/android/FullscreenWebActivity;->E:I

    return-void
.end method

.method public static A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V
    .registers 9

    sget-object v5, Llqm;->d:Llqm;

    const/4 v4, 0x1

    const-class v1, Lcom/opera/android/FullscreenWebActivity;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;
    .registers 9

    if-eqz p2, :cond_12

    new-instance v0, Landroid/content/Intent;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, p2, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_1b

    :cond_12
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {v0, p2, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    :goto_1b
    if-eqz p3, :cond_2a

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p3, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    const-string p1, "android.intent.extra.TITLE"

    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    :cond_2a
    const-string p0, "fullscreen-open-new-tab"

    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz p5, :cond_3a

    const-string p0, "fullscreen-origin-new-tab"

    invoke-virtual {p5}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_3a
    return-object v0
.end method

.method public static z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V
    .registers 9

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-class v1, Lcom/opera/android/FullscreenWebActivity;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public C()V
    .registers 1

    invoke-super {p0}, Lhjf;->C()V

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    :cond_a
    return-void
.end method

.method public final Z()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d0(I)V
    .registers 4

    iget v0, p0, Lcom/opera/android/FullscreenWebActivity;->H:I

    add-int/2addr p1, v0

    iget v0, p0, Lcom/opera/android/FullscreenWebActivity;->E:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_14

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    instance-of v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_21

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->A(I)V

    return-void

    :cond_14
    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    if-eqz p0, :cond_21

    iget v0, p0, Ljq9;->m:I

    if-eq v0, p1, :cond_21

    iput p1, p0, Ljq9;->m:I

    invoke-virtual {p0}, Ljq9;->g()V

    :cond_21
    return-void
.end method

.method public f0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;
    .registers 5

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/FullscreenWebActivity;->t0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;

    move-result-object p1

    iget-object p2, p0, Lcom/opera/android/FullscreenWebActivity;->w:Lkq9;

    if-nez p2, :cond_f

    new-instance p2, Lkq9;

    invoke-direct {p2, p0}, Lkq9;-><init>(Lcom/opera/android/FullscreenWebActivity;)V

    iput-object p2, p0, Lcom/opera/android/FullscreenWebActivity;->w:Lkq9;

    :cond_f
    iget-wide v0, p1, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    invoke-static {v0, v1, p2}, LJ/N;->MqlMMZM3(JLjava/lang/Object;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/WebContentsWrapper;->g(Lqq6;)V

    return-object p1
.end method

.method public g0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 2

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->b()V

    return-void
.end method

.method public h0()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public i0(Lcom/opera/android/FullscreenWebActivity;)I
    .registers 3

    const p0, 0x7f04020b

    const v0, 0x7f060259

    invoke-static {p0, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public j0()I
    .registers 1

    const p0, 0x7f0d01fd

    return p0
.end method

.method public k0()Landroid/net/Uri;
    .registers 1

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public l0(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4

    const p0, 0x7f040003

    const v0, 0x7f0804f2

    invoke-static {p0, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    const v0, 0x7f040216

    const v1, 0x7f0600b1

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-static {p0, p1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-object p0
.end method

.method public m0()Ljava/lang/CharSequence;
    .registers 2

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "android.intent.extra.TITLE"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final n0()Lorg/chromium/content_public/browser/WebContents;
    .registers 2

    iget-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_11

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public o0(Lorg/chromium/content_public/browser/NavigationController;)Z
    .registers 2

    if-eqz p1, :cond_d

    invoke-interface {p1}, Lorg/chromium/content_public/browser/NavigationController;->f()Z

    move-result p0

    if-eqz p0, :cond_d

    invoke-interface {p1}, Lorg/chromium/content_public/browser/NavigationController;->e()V

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Ldx3;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->j0()I

    move-result p1

    invoke-virtual {p0, p1}, Ldx3;->setContentView(I)V

    const p1, 0x7f0a006f

    invoke-virtual {p0, p1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->u0(Landroid/view/View;)V

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->w0(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez p1, :cond_22

    const/4 p1, 0x0

    :cond_22
    invoke-static {p0, p1}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance p1, Lwt2;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lwt2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->x:Lwt2;

    invoke-static {p0, p1}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    invoke-virtual {p0}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p1

    new-instance v0, Lxt2;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lxt2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v0}, Lkcf;->a(Lndc;Lgcf;)V

    return-void
.end method

.method public onDestroy()V
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/FullscreenWebActivity;->x0(Lcom/opera/android/browser/WebContentsWrapper;)V

    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->y:Lwy3;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Lwy3;->g()V

    :cond_b
    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    if-eqz v1, :cond_30

    iget-object v2, v1, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iget-object v3, v2, Lc5o;->a:Ljava/lang/Object;

    check-cast v3, Landroid/view/SurfaceView;

    invoke-virtual {v3}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v3

    iget-object v2, v2, Lc5o;->b:Ljava/lang/Object;

    check-cast v2, Lyr5;

    invoke-interface {v3, v2}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    iput-object v0, v1, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->b:Lqi;

    iget-wide v2, v1, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v2, v3}, LJ/N;->MTwjIV_e(J)V

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    const/4 v2, 0x0

    iput-boolean v2, v1, Lqxe;->j:Z

    iput-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    :cond_30
    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->x:Lwt2;

    if-eqz v1, :cond_39

    invoke-static {v1}, Le7d;->c(Lc7d;)V

    iput-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->x:Lwt2;

    :cond_39
    iput-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    invoke-super {p0}, Ldx3;->onDestroy()V

    return-void
.end method

.method public onStart()V
    .registers 2

    invoke-super {p0}, Lfp1;->onStart()V

    iget-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    return-void

    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/FullscreenWebActivity;->z:Z

    return-void
.end method

.method public onStop()V
    .registers 2

    invoke-super {p0}, Ldx3;->onStop()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/FullscreenWebActivity;->z:Z

    return-void
.end method

.method public onSupportNavigateUp()Z
    .registers 1

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p0, 0x1

    return p0
.end method

.method public p0()V
    .registers 5

    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->h0()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_10
    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->m0()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->k0()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2b

    sget-object v3, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {v3, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2b

    if-nez v0, :cond_27

    const/4 v3, 0x1

    goto :goto_28

    :cond_27
    move v3, v2

    :goto_28
    invoke-virtual {p0, v1, v2, v3}, Lcom/opera/android/FullscreenWebActivity;->s0(Landroid/net/Uri;II)V

    :cond_2b
    if-eqz v0, :cond_30

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_30
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "fullscreen-open-new-tab"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/opera/android/FullscreenWebActivity;->B:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "fullscreen-origin-new-tab"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Llqm;->d(I)Llqm;

    move-result-object v0

    if-nez v0, :cond_4f

    sget-object v0, Llqm;->i:Llqm;

    :cond_4f
    iput-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->A:Llqm;

    return-void
.end method

.method public final q0(Lorg/chromium/url/GURL;)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/FullscreenWebActivity;->B:Z

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lxgf;

    invoke-direct {v0, p1}, Lxgf;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->A:Llqm;

    iput-object p1, v0, Lxgf;->m:Llqm;

    const/4 p1, 0x1

    iput-boolean p1, v0, Lxgf;->n:Z

    invoke-static {p0, v0}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_1b
    new-instance v0, Lksc;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lksc;-><init>(Lorg/chromium/url/GURL;I)V

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->n0()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    if-eqz p0, :cond_2e

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/NavigationController;->r(Lksc;)Lorg/chromium/content_public/browser/NavigationHandle;

    :cond_2e
    return-void
.end method

.method public r0(ILjava/lang/String;)V
    .registers 5

    new-instance v0, Lksc;

    const/4 v1, 0x6

    invoke-direct {v0, p2, v1}, Lksc;-><init>(Ljava/lang/String;I)V

    const/4 p2, 0x1

    if-eqz p1, :cond_f

    if-ne p1, p2, :cond_11

    const/4 p1, 0x0

    iput-boolean p1, v0, Lksc;->k:Z

    goto :goto_11

    :cond_f
    iput-boolean p2, v0, Lksc;->k:Z

    :cond_11
    :goto_11
    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->n0()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    if-eqz p0, :cond_1e

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/NavigationController;->r(Lksc;)Lorg/chromium/content_public/browser/NavigationHandle;

    :cond_1e
    return-void
.end method

.method public final s0(Landroid/net/Uri;II)V
    .registers 6

    sget-object v0, Lcom/opera/android/FullscreenWebActivity;->I:Ljava/util/HashSet;

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_10
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    sget-object p1, Lzs9;->a:Lorg/chromium/url/GURL;

    goto :goto_26

    :cond_1d
    invoke-static {}, Lorg/chromium/url/GURL;->a()V

    invoke-static {p1}, LJ/N;->Ml2KxI$W(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/chromium/url/GURL;

    :goto_26
    invoke-virtual {p1}, Lorg/chromium/url/GURL;->h()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_30

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_30
    const/4 v0, 0x1

    if-ne p3, v0, :cond_36

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_36
    invoke-virtual {p0, p2, p1}, Lcom/opera/android/FullscreenWebActivity;->r0(ILjava/lang/String;)V

    return-void
.end method

.method public t0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;
    .registers 4

    new-instance p0, Lcom/opera/android/browser/WebContentsWrapper;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/browser/WebContentsWrapper;-><init>(Lqi;Lorg/chromium/content_public/browser/WebContents;I)V

    return-object p0
.end method

.method public u0(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public v0()V
    .registers 8

    const v0, 0x7f0a006f

    invoke-virtual {p0, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const v1, 0x7f0a0cda

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    const v2, 0x7f0a0bbb

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a04f5

    invoke-virtual {p0, v3}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/ToolbarProgressBar;

    if-eqz v3, :cond_2b

    new-instance v4, Lshf;

    invoke-direct {v4, v3}, Lshf;-><init>(Lcom/opera/android/custom_views/ToolbarProgressBar;)V

    iput-object v4, p0, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    :cond_2b
    iget-object v3, p0, Ldx3;->j:Lqi;

    const/4 v4, 0x0

    invoke-static {v4, v4}, LJ/N;->M_FZHKB_(ZZ)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/chromium/content_public/browser/WebContents;

    invoke-virtual {p0, v3, v5}, Lcom/opera/android/FullscreenWebActivity;->f0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;

    move-result-object v3

    new-instance v5, Ljq9;

    invoke-direct {v5, v1}, Lqxe;-><init>(Landroid/view/ViewGroup;)V

    iput-object v5, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    iget-object v6, p0, Ldx3;->j:Lqi;

    invoke-virtual {v5, v6}, Lqxe;->f(Lorg/chromium/ui/base/WindowAndroid;)V

    invoke-virtual {p0, v3}, Lcom/opera/android/FullscreenWebActivity;->x0(Lcom/opera/android/browser/WebContentsWrapper;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v3

    if-eqz v2, :cond_56

    invoke-virtual {v3, v2}, Lqwe;->b(Landroid/view/View;)V

    :cond_56
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0, p0}, Lcom/opera/android/FullscreenWebActivity;->i0(Lcom/opera/android/FullscreenWebActivity;)I

    move-result v6

    iget-object v3, v3, Lqwe;->a:Lbp;

    iget v3, v3, Lbp;->a:I

    invoke-static {v6, v3}, Lp37;->X(II)I

    move-result v3

    invoke-direct {v5, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v2, Lwy3;

    iget-object v3, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-direct {v2, p0, v3, v1}, Lwy3;-><init>(Lcom/opera/android/FullscreenWebActivity;Lcom/opera/android/browser/WebContentsWrapper;Landroid/view/ViewGroup;)V

    iput-object v2, p0, Lcom/opera/android/FullscreenWebActivity;->y:Lwy3;

    sget-object v2, Lq9n;->c:Ll5b;

    const v2, 0x7f0a0bba

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/widget/Toolbar;

    const/4 v3, 0x7

    if-eqz v2, :cond_a0

    new-instance v5, Le73;

    invoke-direct {v5, p0, v2, v3}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v6

    if-eqz v6, :cond_93

    invoke-static {v6, v2, v5}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_93
    invoke-virtual {v5, v2}, Le73;->a(Landroid/view/View;)V

    invoke-virtual {p0, v2}, Lfp1;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    invoke-virtual {p0}, Lfp1;->getSupportActionBar()Lgc;

    move-result-object v2

    invoke-virtual {v2}, Lgc;->o()V

    :cond_a0
    new-instance v2, Ls6h;

    invoke-direct {v2, p0, v0}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v5, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v1, v2}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    const v1, 0x7f0a0129

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_bb

    new-instance v1, Lz22;

    invoke-direct {v1, p0, v3}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_bb
    iget-boolean v0, p0, Lcom/opera/android/FullscreenWebActivity;->z:Z

    if-eqz v0, :cond_c4

    iput-boolean v4, p0, Lcom/opera/android/FullscreenWebActivity;->z:Z

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    :cond_c4
    return-void
.end method

.method public w0(Landroid/view/View;)V
    .registers 5

    new-instance v0, Lfzk;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p0

    invoke-direct {v0, p1, v1, p0}, Lfzk;-><init>(Landroid/view/View;Landroid/view/Window;Lqwe;)V

    return-void
.end method

.method public x0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    if-eq v0, p1, :cond_9f

    iput-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->D:Llq9;

    const/4 v1, 0x0

    if-eqz p1, :cond_10

    invoke-virtual {p1}, Lrtn;->g()V

    iput-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->D:Llq9;

    :cond_10
    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->F:Llq9;

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Lrtn;->g()V

    iput-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->F:Llq9;

    :cond_19
    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v2, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    const/4 v3, 0x0

    if-eqz p1, :cond_87

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-virtual {v2, p1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c(Lorg/chromium/content_public/browser/WebContents;)V

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->y:Lwy3;

    if-eqz p1, :cond_53

    iget-object v1, p1, Lwy3;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/FullscreenWebActivity;

    invoke-virtual {p1}, Lwy3;->g()V

    iget-object v2, v1, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_4e

    iget-object p1, p1, Lwy3;->d:Ljava/lang/Object;

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v2, v1, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    :cond_4e
    iget-object p1, v1, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_53
    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Lorg/chromium/content_public/browser/WebContents;->v1(I)V

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    if-eqz p1, :cond_6b

    new-instance p1, Llq9;

    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    const/4 v2, 0x1

    invoke-direct {p1, p0, v1, v2}, Llq9;-><init>(Lcom/opera/android/FullscreenWebActivity;Lcom/opera/android/browser/WebContentsWrapper;B)V

    iput-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->D:Llq9;

    :cond_6b
    new-instance p1, Llq9;

    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-direct {p1, p0, v1, v3}, Llq9;-><init>(Lcom/opera/android/FullscreenWebActivity;Lcom/opera/android/browser/WebContentsWrapper;B)V

    iput-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->F:Llq9;

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->x0()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->y0(I)V

    iget p1, p0, Lcom/opera/android/FullscreenWebActivity;->G:I

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->d0(I)V

    goto :goto_8a

    :cond_87
    invoke-virtual {v2, v1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c(Lorg/chromium/content_public/browser/WebContents;)V

    :goto_8a
    if-eqz v0, :cond_9f

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1, v3}, Lorg/chromium/content_public/browser/WebContents;->v1(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/FullscreenWebActivity;->g0(Lcom/opera/android/browser/WebContentsWrapper;)V

    :cond_9f
    return-void
.end method

.method public final y0(I)V
    .registers 6

    iget v0, p0, Lcom/opera/android/FullscreenWebActivity;->E:I

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iget v1, p0, Lcom/opera/android/FullscreenWebActivity;->G:I

    if-eqz v1, :cond_21

    const/4 v1, 0x1

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eq v0, v2, :cond_10

    move v0, v3

    goto :goto_11

    :cond_10
    move v0, v1

    :goto_11
    if-eq p1, v2, :cond_14

    move v1, v3

    :cond_14
    if-eq v0, v1, :cond_21

    invoke-virtual {p0, v3}, Lcom/opera/android/FullscreenWebActivity;->d0(I)V

    iput p1, p0, Lcom/opera/android/FullscreenWebActivity;->E:I

    iget p1, p0, Lcom/opera/android/FullscreenWebActivity;->G:I

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->d0(I)V

    return-void

    :cond_21
    iput p1, p0, Lcom/opera/android/FullscreenWebActivity;->E:I

    return-void
.end method
