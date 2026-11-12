.class public final Lcom/opera/android/weather/ui/WeatherWidgetActivity;
.super Lrz4;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0007\u0018\u00002\u00020\u0001:\u0006\u0004\u0004\u0005\u0006\u0007\u0008B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/opera/android/weather/ui/WeatherWidgetActivity;",
        "Lrz4;",
        "<init>",
        "()V",
        "kpn",
        "lpn",
        "mpn",
        "z63",
        "ynh",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic e0:I


# instance fields
.field public final O:Lw6j;

.field public final P:Lqe6;

.field public final Q:Lay;

.field public final R:Lzyk;

.field public S:Lmcj;

.field public T:Loam;

.field public U:Lxm5;

.field public V:Lks3;

.field public W:Leyi;

.field public X:Lr9i;

.field public Y:Lpt1;

.field public Z:Lz63;

.field public a0:Llpn;

.field public b0:Lkpn;

.field public c0:Lkpn;

.field public d0:Z


# direct methods
.method public constructor <init>()V
    .registers 7

    const/16 v0, 0x11

    invoke-direct {p0, v0}, Lrz4;-><init>(I)V

    new-instance v0, Lppn;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lppn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V

    new-instance v1, Lw6j;

    const-class v2, Lrpn;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    new-instance v3, Lppn;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lppn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V

    new-instance v4, Lppn;

    const/4 v5, 0x2

    invoke-direct {v4, p0, v5}, Lppn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V

    invoke-direct {v1, v2, v3, v0, v4}, Lw6j;-><init>(Ls15;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->O:Lw6j;

    new-instance v0, Lqe6;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lqe6;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->P:Lqe6;

    new-instance v0, Lay;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Q:Lay;

    new-instance v0, Lm2n;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lm2n;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->R:Lzyk;

    return-void
.end method


# virtual methods
.method public final B0()Lcom/opera/android/browser/dialog/DialogDelegate;
    .registers 2

    new-instance v0, Lmpn;

    iget-object p0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->R:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    invoke-direct {v0, p0}, Lmpn;-><init>(Landroid/net/Uri;)V

    return-object v0
.end method

.method public final C()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->W:Leyi;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    iget-object v1, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v1, Lkze;

    iget-object v2, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    iget-boolean v0, v0, Leyi;->b:Z

    if-eqz v0, :cond_14

    const-string v0, "ofa-private-mode"

    goto :goto_20

    :cond_14
    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v0

    iget-object v0, v0, Lg7j;->d:Ljava/lang/String;

    const-string v2, "ofa-"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_20
    invoke-static {v1, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->C()V

    return-void
.end method

.method public final D0(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 13

    new-instance v0, Lr9i;

    iget-object v1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->V:Lks3;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    move-object v1, v2

    :cond_8
    invoke-direct {v0, p0, p1, v1}, Lr9i;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lorg/chromium/content_public/browser/WebContents;Lks3;)V

    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->X:Lr9i;

    iget-object p1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->U:Lxm5;

    if-nez p1, :cond_12

    move-object p1, v2

    :cond_12
    iget-object p1, p1, Lxm5;->a:Ljava/lang/Object;

    check-cast p1, Lplh;

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {p1, v0}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object p1

    invoke-static {p1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    new-instance v3, Lte5;

    iget-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->X:Lr9i;

    if-nez v0, :cond_29

    move-object v0, v2

    :cond_29
    iget-object v0, v0, Lr9i;->e:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lupn;

    const/4 v9, 0x4

    const/4 v10, 0x7

    const/4 v4, 0x2

    const-class v6, Lupn;

    const-string v7, "viewsV1NotifyHostStateChanged"

    const-string v8, "viewsV1NotifyHostStateChanged(Lcom/opera/android/genapi/weatherrpc/HostState;)V"

    invoke-direct/range {v3 .. v10}, Lte5;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v0, Lz99;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v3, v1}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    invoke-static {v0, p1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    iget-object p1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->W:Leyi;

    if-eqz p1, :cond_50

    move-object v2, p1

    :cond_50
    iget-object p1, v2, Leyi;->d:Ljava/lang/Object;

    check-cast p1, Lkze;

    new-instance v0, Lqfl;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Lqfl;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lglm;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lglm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v1}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final F0(Lxsl;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->S:Lmcj;

    if-nez v2, :cond_f

    move-object v2, v1

    :cond_f
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v3, Lvsl;->a:Lvsl;

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23

    const v4, 0x10104e0

    invoke-static {v4, v0}, Lf03;->V(ILandroid/content/Context;)Z

    move-result v0

    goto :goto_31

    :cond_23
    instance-of v0, p1, Lwsl;

    if-eqz v0, :cond_7b

    move-object v0, p1

    check-cast v0, Lwsl;

    iget-boolean v0, v0, Lwsl;->a:Z

    if-nez v0, :cond_30

    const/4 v0, 0x1

    goto :goto_31

    :cond_30
    const/4 v0, 0x0

    :goto_31
    invoke-virtual {v2, v0}, Lmcj;->t(Z)V

    iget-object p0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    if-eqz p0, :cond_39

    move-object v1, p0

    :cond_39
    iget-object p0, v1, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, -0x1

    const/high16 v3, -0x1000000

    if-eqz v1, :cond_5a

    invoke-static {v0}, Lf03;->I(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_55

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_6d

    :cond_55
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_6d

    :cond_5a
    instance-of v0, p1, Lwsl;

    if-eqz v0, :cond_77

    check-cast p1, Lwsl;

    iget-boolean p1, p1, Lwsl;->a:Z

    if-eqz p1, :cond_69

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_6d

    :cond_69
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    :goto_6d
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->y:Landroid/content/res/ColorStateList;

    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->b:Lyq1;

    if-eqz p0, :cond_76

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_76
    return-void

    :cond_77
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_7b
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final G0()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->a0:Llpn;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lrtn;->g()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->a0:Llpn;

    iget-object v1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->b0:Lkpn;

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Lrtn;->g()V

    :cond_11
    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->b0:Lkpn;

    iget-object v1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->c0:Lkpn;

    if-eqz v1, :cond_1a

    invoke-virtual {v1}, Lrtn;->g()V

    :cond_1a
    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->c0:Lkpn;

    return-void
.end method

.method public final H0()Lrpn;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->O:Lw6j;

    invoke-virtual {p0}, Lw6j;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrpn;

    return-object p0
.end method

.method public final h0()Ljava/lang/String;
    .registers 1

    const-string p0, "android.intent.action.VIEW"

    return-object p0
.end method

.method public final i0(Lcom/opera/android/FullscreenWebActivity;)I
    .registers 3

    const p0, 0x7f0402f0

    const v0, 0x7f061084

    invoke-static {p0, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public final j0()I
    .registers 1

    const p0, 0x7f0d0483

    return p0
.end method

.method public final k0()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->R:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    return-object p0
.end method

.method public final l0(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 6

    const v0, 0x7f0804f2

    invoke-static {v0, p1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object p0

    iget-object p0, p0, Lrpn;->d:Lrlh;

    iget-object p0, p0, Lrlh;->a:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqpn;

    iget-object p0, p0, Lqpn;->a:Lptl;

    iget-object p0, p0, Lptl;->b:Lxsl;

    sget-object v1, Lvsl;->a:Lvsl;

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, -0x1

    const/high16 v3, -0x1000000

    if-eqz v1, :cond_34

    invoke-static {p1}, Lf03;->I(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_2f

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_47

    :cond_2f
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_47

    :cond_34
    instance-of p1, p0, Lwsl;

    if-eqz p1, :cond_4e

    check-cast p0, Lwsl;

    iget-boolean p0, p0, Lwsl;->a:Z

    if-eqz p0, :cond_43

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_47

    :cond_43
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_47
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    return-object v0

    :cond_4e
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m0()Ljava/lang/CharSequence;
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object v0

    iget-object v0, v0, Lrpn;->d:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqpn;

    iget-object v0, v0, Lqpn;->a:Lptl;

    iget-object v0, v0, Lptl;->a:Lpxh;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {v0, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public final o0(Lorg/chromium/content_public/browser/NavigationController;)Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object v0

    iget-object v0, v0, Lrpn;->d:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqpn;

    iget-boolean v0, v0, Lqpn;->d:Z

    if-eqz v0, :cond_14

    const/4 p0, 0x0

    return p0

    :cond_14
    invoke-super {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->o0(Lorg/chromium/content_public/browser/NavigationController;)Z

    move-result p0

    return p0
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->onDestroy()V

    invoke-virtual {p0}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->G0()V

    iget-object p0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Z:Lz63;

    const/4 v0, 0x0

    if-nez p0, :cond_c

    move-object p0, v0

    :cond_c
    iput-object v0, p0, Lz63;->d:Ljava/lang/Object;

    return-void
.end method

.method public final onSupportNavigateUp()Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->n0()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    invoke-virtual {p0, v0}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->o0(Lorg/chromium/content_public/browser/NavigationController;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_14

    return v1

    :cond_14
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return v1
.end method

.method public final p0()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->d0:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->d0:Z

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    return-void
.end method

.method public final u0(Landroid/view/View;)V
    .registers 14

    move-object v1, p1

    check-cast v1, Landroid/widget/FrameLayout;

    const v0, 0x7f0a0129

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    const-string v3, "Missing required view with ID: "

    if-eqz v2, :cond_13f

    const v0, 0x7f0a03b6

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_13f

    const v0, 0x7f0a03ad

    invoke-static {v0, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_12e

    const v0, 0x7f0a0322

    invoke-static {v0, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v8, :cond_12e

    const v0, 0x7f0a06b5

    invoke-static {v0, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_12e

    const v0, 0x7f0a08f0

    invoke-static {v0, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/google/android/material/button/MaterialButton;

    if-eqz v10, :cond_12e

    new-instance v5, Lv88;

    move-object v6, v2

    check-cast v6, Landroid/widget/LinearLayout;

    const/4 v11, 0x1

    invoke-direct/range {v5 .. v11}, Lv88;-><init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/TextView;Lcom/google/android/material/button/MaterialButton;B)V

    move-object v2, v5

    const v0, 0x7f0a0617

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_13f

    const v0, 0x7f0a0aad

    invoke-static {v0, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v5, :cond_11d

    move-object v5, v3

    new-instance v3, Lb98;

    check-cast v4, Landroid/widget/FrameLayout;

    const/4 v0, 0x4

    invoke-direct {v3, v4, v0}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v0, 0x7f0a07d6

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_140

    const v0, 0x7f0a0bba

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v6, :cond_140

    const v0, 0x7f0a0bbb

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/FrameLayout;

    if-eqz v7, :cond_140

    const v0, 0x7f0a0cda

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_140

    new-instance v0, Lpt1;

    move-object v5, v6

    move-object v6, v7

    const/16 v7, 0x1d

    invoke-direct/range {v0 .. v7}, Lpt1;-><init>(Landroid/widget/FrameLayout;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;B)V

    iput-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p1

    iget-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    const/4 v1, 0x0

    if-nez v0, :cond_b9

    move-object v0, v1

    :cond_b9
    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Lqwe;->b(Landroid/view/View;)V

    new-instance p1, Lz63;

    iget-object v0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    if-nez v0, :cond_c7

    move-object v0, v1

    :cond_c7
    invoke-direct {p1, v0}, Lz63;-><init>(Lpt1;)V

    iput-object p1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Z:Lz63;

    iget-object p1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    if-nez p1, :cond_d1

    move-object p1, v1

    :cond_d1
    iget-object p1, p1, Lpt1;->d:Ljava/lang/Object;

    check-cast p1, Lv88;

    iget-object p1, p1, Lv88;->f:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Lpkm;

    const/16 v2, 0xe

    invoke-direct {v0, p0, v2}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    new-instance v0, Lopn;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    const/4 v3, 0x3

    invoke-static {p1, v1, v1, v0, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    iget-object p1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    if-nez p1, :cond_f8

    move-object p1, v1

    :cond_f8
    iget-object p1, p1, Lpt1;->c:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    new-instance v0, Ljpn;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Ljpn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_10b

    invoke-static {v3, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_10b
    iget-object p1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Y:Lpt1;

    if-eqz p1, :cond_110

    move-object v1, p1

    :cond_110
    iget-object p1, v1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance v0, Ljpn;

    invoke-direct {v0, p0, v2}, Ljpn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V

    invoke-static {p1, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void

    :cond_11d
    move-object v5, v3

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_12e
    move-object v5, v3

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_13f
    move-object v5, v3

    :cond_140
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final v0()V
    .registers 29

    move-object/from16 v0, p0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v2, v1, Lcom/opera/android/OperaApplication;->J:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llz6;

    new-instance v3, Loam;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    new-instance v5, Leq6;

    invoke-virtual {v2}, Llz6;->d()Loz6;

    move-result-object v6

    iget-object v7, v2, Llz6;->j:Lzyk;

    invoke-direct {v5, v6}, Leq6;-><init>(Ljava/lang/Object;)V

    invoke-direct {v3, v4, v5}, Loam;-><init>(Lcom/opera/android/settings/SettingsManager;Leq6;)V

    iput-object v3, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->T:Loam;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v3

    invoke-static {v3}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v3

    iget-object v4, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->T:Loam;

    const/4 v5, 0x0

    if-nez v4, :cond_36

    move-object v4, v5

    :cond_36
    new-instance v6, Lxm5;

    iget-object v8, v2, Llz6;->d:Lbon;

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lqp6;

    invoke-virtual {v2}, Llz6;->d()Loz6;

    move-result-object v10

    invoke-virtual {v2}, Llz6;->c()Lft6;

    move-result-object v11

    iget-object v12, v2, Llz6;->c:Lw7j;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iget-object v13, v10, Loz6;->d:Lf99;

    invoke-virtual {v12}, Lw7j;->m()Lf99;

    move-result-object v12

    new-instance v14, Lx11;

    const/4 v15, 0x3

    invoke-direct {v14, v15, v5, v8}, Lx11;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v8, Lya9;

    move/from16 v16, v15

    const/4 v15, 0x0

    invoke-direct {v8, v13, v12, v14, v15}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v9, v9, Lqp6;->b:Lf99;

    iget-object v12, v11, Lft6;->c:Lyc1;

    iget-object v10, v10, Loz6;->c:Lf99;

    iget-object v11, v11, Lft6;->d:Lyc1;

    new-instance v13, Lzq6;

    const/4 v14, 0x5

    invoke-direct {v13, v14, v5}, Lkuk;-><init>(ILmt5;)V

    const/4 v14, 0x4

    move/from16 v17, v15

    new-array v15, v14, [Lf99;

    aput-object v9, v15, v17

    const/4 v9, 0x1

    aput-object v12, v15, v9

    const/4 v12, 0x2

    aput-object v10, v15, v12

    aput-object v11, v15, v16

    new-instance v10, Lcw;

    const/16 v11, 0x8

    invoke-direct {v10, v15, v13, v11}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v11, v4, Loam;->b:Ljava/lang/Object;

    check-cast v11, Lf99;

    iget-object v12, v4, Loam;->c:Ljava/lang/Object;

    check-cast v12, Ljdj;

    iget-object v4, v4, Loam;->a:Ljava/lang/Object;

    check-cast v4, Leq6;

    iget-object v4, v4, Leq6;->a:Ljava/lang/Object;

    check-cast v4, Loz6;

    iget-object v4, v4, Loz6;->e:Lf99;

    new-instance v13, Lkon;

    invoke-direct {v13, v14, v5}, Lkuk;-><init>(ILmt5;)V

    invoke-static {v11, v12, v4, v13}, Lnb6;->l(Lf99;Lf99;Lf99;Ldr9;)Lcw;

    move-result-object v4

    invoke-static {v4}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v4

    new-instance v11, Lxq6;

    invoke-direct {v11, v14, v5}, Lxq6;-><init>(ILmt5;)V

    invoke-static {v4, v8, v10, v11}, Lnb6;->l(Lf99;Lf99;Lf99;Ldr9;)Lcw;

    move-result-object v4

    sget-object v8, Laej;->b:Lauj;

    invoke-static {v4, v3, v8, v9}, La26;->l0(Lf99;Lnx5;Lbej;I)Lplh;

    move-result-object v3

    iput-object v3, v6, Lxm5;->a:Ljava/lang/Object;

    iput-object v6, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->U:Lxm5;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v3

    invoke-static {v3}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v19

    iget-object v3, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->U:Lxm5;

    if-nez v3, :cond_c6

    move-object/from16 v20, v5

    goto :goto_c8

    :cond_c6
    move-object/from16 v20, v3

    :goto_c8
    new-instance v3, Lnv6;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-direct {v3, v4}, Lnv6;-><init>(Ljava/lang/Object;)V

    iget-object v4, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v4, v4, Lxv1;->m1:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v23, v4

    check-cast v23, Lwyn;

    new-instance v18, Lks3;

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v24, v4

    check-cast v24, Lqp6;

    invoke-virtual {v2}, Llz6;->d()Loz6;

    move-result-object v25

    invoke-virtual {v2}, Llz6;->c()Lft6;

    move-result-object v26

    iget-object v4, v2, Llz6;->m:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v27, v4

    check-cast v27, Lpn6;

    iget-object v4, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->P:Lqe6;

    move-object/from16 v22, v3

    move-object/from16 v21, v4

    invoke-direct/range {v18 .. v27}, Lks3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v3, v18

    iput-object v3, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->V:Lks3;

    new-instance v3, Leyi;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    move/from16 v4, v17

    invoke-direct {v3, v4, v1}, Leyi;-><init>(ZLcom/opera/android/settings/SettingsManager;)V

    iput-object v3, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->W:Leyi;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object v4, v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->R:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    if-nez v6, :cond_134

    move-object v6, v7

    :cond_134
    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_141

    move-object v7, v4

    :cond_141
    const v4, 0x7f050013

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_174

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_174

    if-eqz v3, :cond_159

    const/16 v3, 0xc8

    goto :goto_15b

    :cond_159
    const/16 v3, 0x82

    :goto_15b
    const-string v4, "default_webpage_zoom"

    invoke-virtual {v1, v4}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    const/16 v4, 0x32

    invoke-static {v1, v4, v3}, Ldjh;->c(III)I

    move-result v1

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {v1}, Loup;->n0(I)D

    move-result-wide v8

    invoke-static {v3, v6, v7, v8, v9}, LJ/N;->MdX$dmbm(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;D)V

    :cond_174
    new-instance v1, Ll45;

    new-instance v3, Ls6h;

    invoke-virtual {v2}, Llz6;->a()Lpad;

    move-result-object v4

    invoke-virtual {v2}, Llz6;->c()Lft6;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v3, v4, v6, v7}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v2, v2, Llz6;->n:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldq6;

    invoke-direct {v1, v7, v0, v3, v2}, Ll45;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1}, Ll45;->L()V

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-static {v1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v1

    new-instance v2, Lopn;

    move/from16 v3, v16

    invoke-direct {v2, v0, v5, v3}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    invoke-static {v1, v5, v5, v2, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    invoke-super {v0}, Lcom/opera/android/FullscreenWebActivity;->v0()V

    return-void
.end method

.method public final w0(Landroid/view/View;)V
    .registers 5

    new-instance p1, Lmcj;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-direct {p1, v0}, Lmcj;-><init>(Landroid/view/Window;)V

    iget-object v0, p1, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1a

    invoke-virtual {v0, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p1}, Lmcj;->j()V

    :cond_1a
    invoke-virtual {v0}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v1

    if-eqz v1, :cond_26

    invoke-virtual {v0, v2}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-virtual {p1}, Lmcj;->j()V

    :cond_26
    iput-object p1, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->S:Lmcj;

    return-void
.end method

.method public final x0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 31

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    invoke-super/range {p0 .. p1}, Lrz4;->x0(Lcom/opera/android/browser/WebContentsWrapper;)V

    invoke-virtual {v1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->G0()V

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_37

    new-instance v4, Llpn;

    invoke-virtual {v1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object v5

    iget-object v6, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->R:Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    invoke-direct {v4, v0, v5, v6}, Llpn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lrpn;Landroid/net/Uri;)V

    iput-object v4, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->a0:Llpn;

    new-instance v4, Lkpn;

    invoke-virtual {v1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object v5

    invoke-direct {v4, v0, v5, v3}, Lkpn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lrpn;B)V

    iput-object v4, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->b0:Lkpn;

    new-instance v4, Lkpn;

    invoke-virtual {v1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object v5

    invoke-direct {v4, v0, v5, v2}, Lkpn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lrpn;B)V

    iput-object v4, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->c0:Lkpn;

    :cond_37
    iget-object v4, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Z:Lz63;

    const/4 v5, 0x0

    if-nez v4, :cond_3d

    move-object v4, v5

    :cond_3d
    if-eqz v0, :cond_43

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v5

    :cond_43
    iput-object v5, v4, Lz63;->d:Ljava/lang/Object;

    if-eqz v5, :cond_81

    iget-object v0, v4, Lz63;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    new-instance v6, Landroid/graphics/Rect;

    iget v7, v0, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    iget v4, v4, Lz63;->a:F

    div-float/2addr v7, v4

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-float v7, v7

    float-to-int v7, v7

    iget v8, v0, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    div-float/2addr v8, v4

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-float v8, v8

    float-to-int v8, v8

    iget v9, v0, Landroid/graphics/Rect;->right:I

    int-to-float v9, v9

    div-float/2addr v9, v4

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-float v9, v9

    float-to-int v9, v9

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    div-float/2addr v0, v4

    float-to-double v10, v0

    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-float v0, v10

    float-to-int v0, v0

    invoke-direct {v6, v7, v8, v9, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-interface {v5, v6}, Lorg/chromium/content_public/browser/WebContents;->Q(Landroid/graphics/Rect;)V

    :cond_81
    iget-object v0, v1, Lrz4;->N:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_101

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    iget-object v4, v4, Lcom/opera/android/OperaApplication;->J:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llz6;

    new-instance v9, Lqq6;

    invoke-virtual {v4}, Llz6;->d()Loz6;

    move-result-object v5

    const/4 v12, 0x2

    invoke-direct {v9, v5, v12}, Lqq6;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lnv6;

    invoke-virtual {v4}, Llz6;->c()Lft6;

    move-result-object v5

    invoke-direct {v10, v5}, Lnv6;-><init>(Ljava/lang/Object;)V

    new-instance v11, Lole;

    iget-object v4, v4, Llz6;->f:Lu74;

    invoke-direct {v11, v4}, Lole;-><init>(Ljava/lang/Object;)V

    move-object v4, v0

    new-instance v0, Ltah;

    move-object v5, v4

    new-instance v4, Lipn;

    invoke-direct {v4, v1, v2}, Lipn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V

    move-object v2, v5

    new-instance v5, Lipn;

    invoke-direct {v5, v1, v3}, Lipn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V

    new-instance v7, Llrk;

    invoke-virtual {v1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object v15

    const/16 v19, 0x0

    const/16 v20, 0x12

    const/4 v14, 0x1

    const-class v16, Lrpn;

    const-string v17, "setToolbarAppearance"

    const-string v18, "setToolbarAppearance(Lcom/opera/android/weather/ui/ToolbarAppearance;)V"

    move-object v13, v7

    invoke-direct/range {v13 .. v20}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v21, Llrk;

    invoke-virtual {v1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object v23

    const/16 v27, 0x0

    const/16 v28, 0x13

    const/16 v22, 0x1

    const-string v25, "setForceCloseOnBackNavigation"

    const-string v26, "setForceCloseOnBackNavigation(Z)V"

    move-object/from16 v24, v16

    invoke-direct/range {v21 .. v28}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object v6, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->Q:Lay;

    move-object/from16 v3, p0

    move-object/from16 v8, v21

    invoke-direct/range {v0 .. v11}, Ltah;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lipn;Lipn;Lesk;Llrk;Llrk;Lqq6;Lnv6;Lole;)V

    iget-object v2, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->P:Lqe6;

    iput-object v0, v2, Lqe6;->b:Ljava/lang/Object;

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    new-instance v3, Lqs2;

    invoke-direct {v3, v2, v0, v12}, Lqs2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Ltcc;->a(Lmdc;)V

    :cond_101
    return-void
.end method
