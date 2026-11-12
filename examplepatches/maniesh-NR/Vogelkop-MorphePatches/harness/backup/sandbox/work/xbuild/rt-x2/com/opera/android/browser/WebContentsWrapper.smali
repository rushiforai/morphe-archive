.class public Lcom/opera/android/browser/WebContentsWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static k:I = 0x7fffffff


# instance fields
.field public a:J

.field public final b:Lqi;

.field public final c:Lh7f;

.field public final d:B

.field public e:I

.field public f:Z

.field public g:Z

.field private h:Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public i:I

.field public j:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->R:Z

    return-void
.end method

.method public constructor <init>(Lqi;)V
    .registers 3

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Lh7f;

    .line 101
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->c:Lh7f;

    const/high16 v0, -0x80000000

    .line 103
    iput v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    .line 104
    iput-object p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    const/4 p1, 0x0

    .line 105
    iput-byte p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->d:B

    return-void
.end method

.method public constructor <init>(Lqi;Lorg/chromium/content_public/browser/WebContents;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->c:Lh7f;

    iput-object p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    iput-byte p3, p0, Lcom/opera/android/browser/WebContentsWrapper;->d:B

    sget p1, Lcom/opera/android/browser/WebContentsWrapper;->k:I

    add-int/lit8 p3, p1, -0x1

    sput p3, Lcom/opera/android/browser/WebContentsWrapper;->k:I

    iput p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    invoke-static {p0, p2}, LJ/N;->MEihbG12(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-eqz p1, :cond_5c

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p1

    if-eqz p1, :cond_5b

    iget-object p1, p1, Ldx3;->t:Lkoi;

    if-eqz p1, :cond_5b

    iget-object p2, p1, Lkoi;->e:Ljava/util/ArrayList;

    iget-boolean p3, p1, Lkoi;->g:Z

    if-nez p3, :cond_5b

    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5b

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p3

    if-nez p3, :cond_5b

    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p1, Lkoi;->f:Ljava/util/HashMap;

    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p2, p0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    new-instance p3, Lleg;

    invoke-direct {p3, p1, p2, p0}, Lleg;-><init>(Lkoi;Lorg/chromium/content_public/browser/WebContents;Lcom/opera/android/browser/WebContentsWrapper;)V

    invoke-interface {p2}, Lorg/chromium/content_public/browser/WebContents;->getVisibility()I

    move-result p0

    const/4 p1, 0x2

    if-ne p0, p1, :cond_5b

    invoke-virtual {p3, p1}, Lleg;->onVisibilityChanged(I)V

    :cond_5b
    return-void

    :cond_5c
    const-string p0, "Failed to create a native instance."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static receivedHtmlMetaData(Ljava/lang/Object;[Ljava/lang/String;)V
    .registers 7
    .param p0    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    check-cast p0, Lcom/opera/api/Callback;

    array-length v0, p1

    if-nez v0, :cond_b

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_b
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    :goto_19
    array-length v3, p1

    if-ge v2, v3, :cond_33

    aget-object v3, p1, v2

    if-nez v3, :cond_29

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30

    :cond_29
    add-int/lit8 v2, v2, 0x1

    aget-object v4, p1, v2

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    :cond_33
    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public a(Lxr5;)Lorg/chromium/ui/base/ViewAndroidDelegate;
    .registers 2

    new-instance p0, Lorg/chromium/ui/base/ViewAndroidDelegate;

    invoke-direct {p0, p1}, Lorg/chromium/ui/base/ViewAndroidDelegate;-><init>(Lxr5;)V

    return-object p0
.end method

.method public final b()V
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/opera/android/browser/WebContentsWrapper;->h:Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;

    invoke-static {v0, v1, v2}, LJ/N;->MqlMMZM3(JLjava/lang/Object;)V

    invoke-static {v0, v1}, LJ/N;->MvxZAR9q(J)V

    return-void
.end method

.method public final c()Ldx3;
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    iget-object p0, p0, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lt8;->d(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p0

    instance-of v0, p0, Ldx3;

    if-eqz v0, :cond_15

    check-cast p0, Ldx3;

    return-object p0

    :cond_15
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()Lorg/chromium/content_public/browser/NavigationController;
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    return-object p0
.end method

.method public final e()Lorg/chromium/content_public/browser/WebContents;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_f

    invoke-static {v0, v1}, LJ/N;->MuToB3Z8(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    return-object p0

    :cond_f
    const-string p0, "Cannot call native method without a native instance."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final f()Lorg/chromium/content_public/browser/WebContents;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_f

    invoke-static {v0, v1}, LJ/N;->MuToB3Z8(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Lqq6;)V
    .registers 10

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    new-instance v3, Lxr5;

    invoke-direct {v3, v1, p1, v0}, Lxr5;-><init>(Ldx3;Lqq6;Lorg/chromium/content_public/browser/WebContents;)V

    invoke-virtual {p0, v3}, Lcom/opera/android/browser/WebContentsWrapper;->a(Lxr5;)Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object v2

    iget-object v4, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f1401b7

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v6, 0x0

    invoke-static {p1, v1, v6, v7}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v5, Loji;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-interface/range {v0 .. v5}, Lorg/chromium/content_public/browser/WebContents;->W0(Ljava/lang/String;Lorg/chromium/ui/base/ViewAndroidDelegate;Lxr5;Lqi;Loji;)V

    const-class p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    sget-object v1, Lw7d;->g:Lhai;

    invoke-interface {v0, p1, v1}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    new-instance v1, Lzzi;

    move-object v2, v0

    check-cast v2, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object v2, v2, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    invoke-direct {v1, v0, v2, v3}, Lzzi;-><init>(Lorg/chromium/content_public/browser/WebContents;Lhuh;Lxr5;)V

    invoke-static {v0}, Lwyi;->f(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SmartSelectionClient;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_83

    const/4 v4, 0x2

    new-array v4, v4, [Lwyi;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v2, 0x1

    aput-object v1, v4, v2

    new-instance v1, Lxyi;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Lxyi;-><init>(Ljava/util/List;)V

    iput-object v1, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->I:Lwyi;

    invoke-virtual {v1}, Lxyi;->d()Lshf;

    move-result-object v1

    iput-object v1, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->J:Lshf;

    iput-object v3, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->L:Lvyi;

    goto :goto_89

    :cond_83
    iput-object v1, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->I:Lwyi;

    iput-object v3, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->J:Lshf;

    iput-object v3, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->L:Lvyi;

    :goto_89
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    new-instance p1, Lleg;

    invoke-direct {p1, p0, v0, v0}, Lleg;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lorg/chromium/content_public/browser/WebContents;Lorg/chromium/content_public/browser/WebContents;)V

    return-void
.end method

.method public final getDarkThemedUi()Z
    .registers 3

    iget v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->e:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p0

    invoke-static {p0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p0

    if-eqz p0, :cond_25

    invoke-virtual {p0}, Lhjf;->u()Lnzk;

    move-result-object p0

    goto :goto_26

    :cond_25
    const/4 p0, 0x0

    :goto_26
    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->P(Lnzk;)Z

    move-result p0

    return p0
.end method

.method public final getDarkmodeEnabled()Z
    .registers 2

    iget v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->e:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_27

    iget-boolean v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->f:Z

    if-nez v0, :cond_27

    iget-byte v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->d:B

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_27

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p0

    invoke-static {p0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p0

    if-eqz p0, :cond_21

    invoke-virtual {p0}, Lhjf;->u()Lnzk;

    move-result-object p0

    goto :goto_22

    :cond_21
    const/4 p0, 0x0

    :goto_22
    invoke-static {v0, p0}, Lx1p;->D(Landroid/content/Context;Lnzk;)Z

    move-result p0

    return p0

    :cond_27
    const/4 p0, 0x0

    return p0
.end method

.method public final getForceEnableZoom()Z
    .registers 2

    iget v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->e:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_c

    iget-byte p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->d:B

    and-int/lit8 p0, p0, 0x1

    if-eqz p0, :cond_e

    :cond_c
    const/4 p0, 0x0

    return p0

    :cond_e
    sget-object p0, Lt8;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "force_enable_zoom"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getSupportResourceBlocking()Z
    .registers 1

    iget-byte p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->d:B

    and-int/lit8 p0, p0, 0x4

    if-nez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final getView()Landroid/view/View;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_13

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object p0

    if-eqz p0, :cond_13

    iget-object p0, p0, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    return-object p0

    :cond_13
    const/4 p0, 0x0

    return-object p0
.end method

.method public final h()Z
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final i()V
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-void

    :cond_9
    invoke-static {v0, v1}, LJ/N;->MS1u5UBz(J)V

    return-void
.end method

.method public final isReaderMode()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->g:Z

    return p0
.end method

.method public final j(Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;)V
    .registers 4

    iput-object p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->h:Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;

    iget-wide v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MfuBvJPx(JLjava/lang/Object;)V

    return-void
.end method

.method public final onCertificateErrorPageBackPressed()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrtn;

    invoke-virtual {v0}, Lrtn;->h()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final setUseDesktopUserAgent(Z)V
    .registers 8

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/NavigationController;->t()I

    move-result v1

    invoke-interface {v0, v1}, Lorg/chromium/content_public/browser/NavigationController;->i(I)Lorg/chromium/content_public/browser/NavigationEntry;

    move-result-object v2

    if-eqz v2, :cond_33

    iget-object v3, v2, Lorg/chromium/content_public/browser/NavigationEntry;->c:Lorg/chromium/url/GURL;

    const-string v4, "opera-internal"

    invoke-virtual {v3}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    iget-object v2, v2, Lorg/chromium/content_public/browser/NavigationEntry;->b:Lorg/chromium/url/GURL;

    invoke-virtual {v3, v2}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_33

    iget-wide v4, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    invoke-virtual {v3}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, v5, v1, p0}, LJ/N;->Ml0Adv5P(JILjava/lang/Object;)V

    goto :goto_33

    :cond_2e
    iget-wide v2, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    invoke-static {v2, v3, v1}, LJ/N;->M3IU1D7D(JI)V

    :cond_33
    :goto_33
    invoke-interface {v0, p1}, Lorg/chromium/content_public/browser/NavigationController;->k(Z)V

    return-void
.end method
