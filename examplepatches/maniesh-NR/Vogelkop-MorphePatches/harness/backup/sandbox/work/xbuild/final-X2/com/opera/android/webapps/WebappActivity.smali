.class public Lcom/opera/android/webapps/WebappActivity;
.super Lt5d;
.source "SourceFile"

# interfaces
.implements Liga;


# static fields
.field public static final synthetic J:I


# instance fields
.field public final A:Lcv3;

.field public B:Luuj;

.field public C:Lfzk;

.field public D:Landroid/view/View;

.field public E:Z

.field public F:Z

.field public G:Lorg/chromium/base/CommandLine;

.field public H:Lxi5;

.field public I:Z

.field public x:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public y:Lryn;

.field public z:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lt5d;-><init>()V

    new-instance v0, Lryn;

    invoke-direct {v0}, Lryn;-><init>()V

    iput-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    new-instance v0, Lcv3;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lcv3;-><init>(Ldx3;B)V

    iput-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->A:Lcv3;

    return-void
.end method


# virtual methods
.method public final G(Lcom/opera/android/browser/chromium/ChromiumContent;)Ljava/util/List;
    .registers 3

    iget-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-boolean p1, p1, Lryn;->m:Z

    if-eqz p1, :cond_9

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_9
    new-instance p1, Lqz4;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lqz4;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final I(Lcom/opera/android/browser/chromium/ChromiumContent;)Ljava/util/List;
    .registers 3

    iget-object p0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-boolean p0, p0, Lryn;->m:Z

    if-nez p0, :cond_11

    new-instance p0, Lkk5;

    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lkk5;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;B)V

    invoke-static {p0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object p0

    return-object p0

    :cond_11
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public final J()Ld7h;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final K()Livn;
    .registers 3

    new-instance v0, Lr2n;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lr2n;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final Z()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final c0(Ljava/lang/Class;)Lcjm;
    .registers 3

    const-class p0, Lryl;

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x0

    goto :goto_10

    :cond_a
    const-class p0, Landroidx/fragment/app/i;

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    :goto_10
    new-instance p1, Lcjm;

    const v0, 0x7f0a062b

    invoke-direct {p1, v0, p0}, Lcjm;-><init>(IZ)V

    return-object p1
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 4

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x7d

    if-ne v0, v1, :cond_49

    invoke-virtual {p1}, Landroid/view/KeyEvent;->isCanceled()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_48

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_48

    iget-boolean v0, p0, Lcom/opera/android/webapps/WebappActivity;->E:Z

    if-eqz v0, :cond_48

    invoke-virtual {p1}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result p1

    if-nez p1, :cond_48

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->f0()Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object p0

    if-eqz p0, :cond_48

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p1

    if-nez p1, :cond_48

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/NavigationController;->n()Z

    move-result p1

    if-eqz p1, :cond_48

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p1

    if-nez p1, :cond_48

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->n()Z

    move-result p1

    if-eqz p1, :cond_48

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->l()V

    :cond_48
    return v1

    :cond_49
    invoke-super {p0, p1}, Lt5d;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object p0, p0, Lryn;->h:Ljava/lang/String;

    return-object p0
.end method

.method public final e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;
    .registers 2

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a0218

    invoke-static {v0, p0}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    return-object p0
.end method

.method public final f0()Lcom/opera/android/browser/chromium/ChromiumContent;
    .registers 2

    invoke-virtual {p0}, Ldx3;->W()Lk6l;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return-object v0

    :cond_8
    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-nez p0, :cond_d

    return-object v0

    :cond_d
    invoke-static {p0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p0

    if-eqz p0, :cond_16

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    return-object p0

    :cond_16
    return-object v0
.end method

.method public final g(Ljava/lang/String;)Z
    .registers 2

    iget-object p0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object p0, p0, Lryn;->h:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final g0()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget v0, v0, Lryn;->l:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1f

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->f0()Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    iget-object v1, p0, Leq9;->a:Ld37;

    iput-object v0, v1, Ld37;->g:Ljava/lang/Object;

    const/4 v2, 0x0

    iput-boolean v2, v1, Ld37;->b:Z

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Ld37;->j(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    invoke-virtual {p0}, Leq9;->e()V

    :cond_1f
    return-void
.end method

.method public final h(Lzhj;)V
    .registers 3

    const v0, 0x7f0a062b

    invoke-virtual {p0, p1, v0}, Ldx3;->X(Lzhj;I)V

    return-void
.end method

.method public final h0()V
    .registers 8

    iget-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object v0, v0, Lryn;->f:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object v0, v0, Lryn;->f:Ljava/lang/String;

    goto :goto_29

    :cond_f
    iget-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->x:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->p()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_29

    iget-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object v0, v0, Lryn;->h:Ljava/lang/String;

    sget-object v1, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_29

    :cond_28
    const/4 v0, 0x0

    :cond_29
    :goto_29
    const v1, 0x7f0a0cdd

    invoke-virtual {p0, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/opera/android/webapps/WebappActivity;->z:Ljava/lang/Integer;

    if-nez v1, :cond_4d

    iget-object v2, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-wide v2, v2, Lryn;->i:J

    const-wide v4, 0x80000000L

    cmp-long v4, v2, v4

    if-eqz v4, :cond_4d

    long-to-int v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/webapps/WebappActivity;->z:Ljava/lang/Integer;

    :cond_4d
    if-nez v1, :cond_57

    const v1, 0x7f061083

    invoke-virtual {p0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v1

    goto :goto_5b

    :cond_57
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_5b
    const/16 v2, 0xff

    invoke-static {v1, v2}, Lp37;->m0(II)I

    move-result v1

    new-instance v2, Landroid/app/ActivityManager$TaskDescription;

    iget-object v3, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object v4, v3, Lryn;->b:Ljava/lang/String;

    iget-object v5, v3, Lryn;->c:Landroid/graphics/Bitmap;

    const/4 v6, 0x0

    if-nez v5, :cond_7f

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7d

    invoke-static {v4, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    array-length v5, v4

    invoke-static {v4, v6, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, v3, Lryn;->c:Landroid/graphics/Bitmap;

    :cond_7d
    iget-object v5, v3, Lryn;->c:Landroid/graphics/Bitmap;

    :cond_7f
    invoke-direct {v2, v0, v5, v1}, Landroid/app/ActivityManager$TaskDescription;-><init>(Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    invoke-virtual {p0, v2}, Landroid/app/Activity;->setTaskDescription(Landroid/app/ActivityManager$TaskDescription;)V

    iget-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->C:Lfzk;

    iget-object p0, p0, Lcom/opera/android/webapps/WebappActivity;->z:Ljava/lang/Integer;

    if-eqz p0, :cond_90

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_92

    :cond_90
    const/high16 p0, -0x1000000

    :goto_92
    new-instance v1, Lgxh;

    invoke-direct {v1, p0}, Lgxh;-><init>(I)V

    iget-object p0, v0, Lfzk;->c:Lfz2;

    sget-object v0, Lfzk;->e:[Lxtb;

    aget-object v0, v0, v6

    invoke-virtual {p0, v0, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1}, Lt5d;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/webapps/WebappActivity;->I:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    const/4 v0, 0x0

    if-nez p1, :cond_12

    move-object p1, v0

    :cond_12
    iput-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->G:Lorg/chromium/base/CommandLine;

    invoke-static {p0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->H:Lxi5;

    new-instance p1, Lryn;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p1, v1}, Lryn;-><init>(Landroid/content/Intent;)V

    iput-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object v1, p1, Lryn;->a:Ljava/lang/String;

    if-eqz v1, :cond_14c

    iget-object p1, p1, Lryn;->h:Ljava/lang/String;

    if-eqz p1, :cond_14c

    const p1, 0x7f0d001f

    invoke-virtual {p0, p1}, Ldx3;->setContentView(I)V

    const p1, 0x7f0a006f

    invoke-virtual {p0, p1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->D:Landroid/view/View;

    new-instance p1, Lfzk;

    iget-object v1, p0, Lcom/opera/android/webapps/WebappActivity;->D:Landroid/view/View;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v3

    invoke-direct {p1, v1, v2, v3}, Lfzk;-><init>(Landroid/view/View;Landroid/view/Window;Lqwe;)V

    iput-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->C:Lfzk;

    iget-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->G:Lorg/chromium/base/CommandLine;

    invoke-static {p0, p1}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance p1, Lwt2;

    const/4 v1, 0x7

    invoke-direct {p1, p0, v1}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    invoke-virtual {p0}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p1

    new-instance v1, Lxt2;

    const/16 v2, 0xa

    invoke-direct {v1, p0, v2}, Lxt2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v1}, Lkcf;->a(Lndc;Lgcf;)V

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->h0()V

    iget-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-boolean v1, p1, Lryn;->n:Z

    if-eqz v1, :cond_7e

    new-instance v1, Liwl;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_83

    :cond_7e
    new-instance v1, Luuj;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    :goto_83
    iput-object v1, p0, Lcom/opera/android/webapps/WebappActivity;->B:Luuj;

    iget-wide v1, p1, Lryn;->j:J

    const-wide v3, 0x80000000L

    cmp-long p1, v1, v3

    if-eqz p1, :cond_92

    long-to-int p1, v1

    goto :goto_99

    :cond_92
    const p1, 0x7f061082

    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    move-result p1

    :goto_99
    const v1, 0x1020002

    invoke-virtual {p0, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/opera/android/webapps/WebappActivity;->B:Luuj;

    invoke-virtual {v2, p0, v1, p1}, Luuj;->h(Lcom/opera/android/webapps/WebappActivity;Landroid/view/ViewGroup;I)V

    iget-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->B:Luuj;

    iget-object v1, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, v1, Lryn;->d:Landroid/graphics/drawable/Drawable;

    iget-object v4, v1, Lryn;->b:Ljava/lang/String;

    if-nez v3, :cond_e9

    iget v3, v1, Lryn;->e:I

    if-eqz v3, :cond_c2

    sget-object v4, Landroidx/core/content/res/ResourcesCompat;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v2, v3, v0}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, v1, Lryn;->d:Landroid/graphics/drawable/Drawable;

    goto :goto_e7

    :cond_c2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_e7

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v3, v1, Lryn;->c:Landroid/graphics/Bitmap;

    if-nez v3, :cond_e2

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_e0

    const/4 v3, 0x0

    invoke-static {v4, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    array-length v5, v4

    invoke-static {v4, v3, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, v1, Lryn;->c:Landroid/graphics/Bitmap;

    :cond_e0
    iget-object v3, v1, Lryn;->c:Landroid/graphics/Bitmap;

    :cond_e2
    invoke-direct {v0, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v0, v1, Lryn;->d:Landroid/graphics/drawable/Drawable;

    :cond_e7
    :goto_e7
    iget-object v3, v1, Lryn;->d:Landroid/graphics/drawable/Drawable;

    :cond_e9
    iget-object p0, p0, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object p0, p0, Lryn;->g:Ljava/lang/String;

    iget-object v0, p1, Luuj;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_14b

    if-eqz v3, :cond_11a

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iget-object v1, p1, Luuj;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/webapps/WebappActivity;

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070a3e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    if-le v0, v1, :cond_11a

    iget-object v0, p1, Luuj;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    const v1, 0x7f0a0cdb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_11a
    invoke-virtual {p1, p0}, Luuj;->n(Ljava/lang/String;)V

    iget p0, p1, Luuj;->a:I

    const/4 v0, -0x1

    invoke-static {v0, p0}, Lab5;->e(II)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, -0x1000000

    invoke-static {v1, p0}, Lab5;->e(II)D

    move-result-wide v1

    double-to-float p0, v1

    cmpl-float p0, v0, p0

    if-lez p0, :cond_14b

    iget-object p0, p1, Luuj;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    const v0, 0x7f0a0cdc

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    iget-object p1, p1, Luuj;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/webapps/WebappActivity;

    const v0, 0x7f06025a

    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_14b
    return-void

    :cond_14c
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->A:Lcv3;

    invoke-virtual {p0, v0}, Ldx3;->b0(Lcv3;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/webapps/WebappActivity;->B:Luuj;

    invoke-super {p0}, Ldx3;->onDestroy()V

    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/16 v0, 0x52

    if-eq p1, v0, :cond_9

    invoke-super {p0, p1, p2}, Lfp1;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0

    :cond_9
    invoke-virtual {p2}, Landroid/view/KeyEvent;->startTracking()V

    const/4 p0, 0x1

    return p0
.end method

.method public final onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 5

    const/4 v0, 0x1

    :try_start_1
    iget-boolean v1, p0, Lcom/opera/android/webapps/WebappActivity;->E:Z

    if-nez v1, :cond_a

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0

    :cond_a
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0

    :cond_15
    const/16 v1, 0x52

    if-eq p1, v1, :cond_1e

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p0
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_1f

    return p0

    :cond_1e
    return v0

    :catchall_1f
    move-exception p0

    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V

    return v0
.end method

.method public final onPause()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/r;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/webapps/WebappActivity;->F:Z

    iget-boolean v0, p0, Lcom/opera/android/webapps/WebappActivity;->E:Z

    if-eqz v0, :cond_19

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lqim;->p:Z

    iget-object p0, p0, Lqim;->b:Lll9;

    iget v1, p0, Lll9;->h:I

    add-int/2addr v1, v0

    iput v1, p0, Lll9;->h:I

    :cond_19
    return-void
.end method

.method public final onResume()V
    .registers 6

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->g0()V

    invoke-super {p0}, Landroidx/fragment/app/r;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/webapps/WebappActivity;->F:Z

    iget-boolean v1, p0, Lcom/opera/android/webapps/WebappActivity;->E:Z

    if-eqz v1, :cond_15

    iget-object v1, p0, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v0}, Lqim;->i(Z)V

    :cond_15
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-boolean v1, p0, Lcom/opera/android/webapps/WebappActivity;->I:Z

    sget-object v2, Lle0;->u:Lle0;

    sget-object v3, Lje0;->d:Lje0;

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v2, v3}, Lx5f;->T(ZLjava/lang/String;Lle0;Lje0;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/webapps/WebappActivity;->I:Z

    return-void
.end method

.method public final onSupportNavigateUp()Z
    .registers 1

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p0, 0x1

    return p0
.end method
