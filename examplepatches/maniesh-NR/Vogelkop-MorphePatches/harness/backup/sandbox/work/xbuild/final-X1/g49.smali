.class public final Lg49;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# static fields
.field public static final f:J

.field public static final g:J

.field public static final h:J


# instance fields
.field public final a:Lumi;

.field public final b:Lm9k;

.field public final c:Lucc;

.field public d:Lb7k;

.field public e:Loml;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->e:Lun7;

    const/16 v1, 0xf

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Lg49;->f:J

    const/4 v1, 0x5

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lg49;->g:J

    const/16 v0, 0x1f4

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lg49;->h:J

    return-void
.end method

.method public constructor <init>(Lumi;Lm9k;Lorm;)V
    .registers 12

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    iput-object p1, p0, Lg49;->a:Lumi;

    iput-object p2, p0, Lg49;->b:Lm9k;

    new-instance p1, Lucc;

    new-instance v0, Ls2;

    const/4 v6, 0x0

    const/16 v7, 0x8

    const/4 v1, 0x2

    const-class v3, Lorm;

    const-string v4, "logDependenciesLoadingScreenDuration"

    const-string v5, "logDependenciesLoadingScreenDuration(Lcom/opera/android/analytics/AggroLoadingScreenExitReason;J)V"

    move-object v2, p3

    invoke-direct/range {v0 .. v7}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {p1, v0}, Lucc;-><init>(Ls2;)V

    iput-object p1, p0, Lg49;->c:Lucc;

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lg49;->b:Lm9k;

    iget-object v0, p1, Lm9k;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_37

    iget-object v0, p1, Lm9k;->h:Loml;

    if-eqz v0, :cond_1b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    :cond_1b
    const/4 v0, 0x0

    iput-object v0, p1, Lm9k;->h:Loml;

    iget-object v1, p1, Lm9k;->a:Lumi;

    new-instance v2, Lmni;

    const/16 v3, 0x18

    invoke-direct {v2, p1, v3}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v1, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v1

    new-instance v2, Loml;

    invoke-direct {v2, v1}, Loml;-><init>(Lnml;)V

    sget-wide v3, Lg49;->f:J

    invoke-static {v2, v0, v3, v4}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    iput-object v2, p1, Lm9k;->h:Loml;

    :cond_37
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    iget-object v1, p0, Lg49;->c:Lucc;

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    new-instance v0, Lf49;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lf49;-><init>(Lg49;B)V

    iget-object v1, p1, Lm9k;->e:Ljze;

    new-instance v2, Lhze;

    const/4 v3, 0x6

    invoke-direct {v2, p1, v0, v3}, Lhze;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, p0, v2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 13

    const p3, 0x7f0d03c5

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a00f2

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/4 v1, 0x0

    if-eqz p3, :cond_95

    const p2, 0x7f0a0b7a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextSwitcher;

    if-eqz v2, :cond_95

    new-instance p2, Lb7k;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p2, p1, p3, v2}, Lb7k;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/ThemeableLottieAnimationView;Landroid/widget/TextSwitcher;)V

    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {p1, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    sget-wide v5, Lg49;->h:J

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v7

    invoke-virtual {p1, v7, v8}, Landroid/view/animation/Animation;->setStartOffset(J)V

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v7

    invoke-virtual {p1, v7, v8}, Landroid/view/animation/Animation;->setDuration(J)V

    invoke-virtual {v2, p1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    new-instance p1, Landroid/view/animation/AlphaAnimation;

    invoke-direct {p1, v4, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    invoke-virtual {v2, p1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    new-instance p1, Li3d;

    const-string v2, "ThemeColor"

    const v3, 0x7f0402d7

    invoke-direct {p1, v2, v3}, Li3d;-><init>(Ljava/lang/String;I)V

    new-instance v2, Li3d;

    const-string v3, "SurfaceColor"

    const v4, 0x7f0402f1

    invoke-direct {v2, v3, v4}, Li3d;-><init>(Ljava/lang/String;I)V

    filled-new-array {p1, v2}, [Li3d;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->z([Li3d;)V

    invoke-virtual {p3}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    iput-object p2, p0, Lg49;->d:Lb7k;

    iget-object p1, p0, Lg49;->e:Loml;

    if-nez p1, :cond_8b

    new-instance p1, Lf49;

    invoke-direct {p1, p0, v0}, Lf49;-><init>(Lg49;B)V

    iget-object p2, p0, Lg49;->a:Lumi;

    invoke-interface {p2, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance p2, Loml;

    invoke-direct {p2, p1}, Loml;-><init>(Lnml;)V

    sget-wide v2, Lg49;->g:J

    invoke-static {p2, v1, v2, v3}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    iput-object p2, p0, Lg49;->e:Loml;

    :cond_8b
    iget-object p0, p0, Lg49;->d:Lb7k;

    if-eqz p0, :cond_94

    iget-object p0, p0, Lb7k;->b:Landroid/view/View;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :cond_94
    return-object v1

    :cond_95
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    iget-object v0, p0, Lg49;->e:Loml;

    if-eqz v0, :cond_b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Lg49;->e:Loml;

    iput-object v0, p0, Lg49;->d:Lb7k;

    return-void
.end method
