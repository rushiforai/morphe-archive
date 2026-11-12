.class public final Lc76;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lssl;
.implements Leak;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0001\u0007B\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "Lc76;",
        "Landroidx/fragment/app/Fragment;",
        "Landroid/view/View$OnClickListener;",
        "Lssl;",
        "Leak;",
        "<init>",
        "()V",
        "y9m",
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
.field public static final h:[I

.field public static final i:[I


# instance fields
.field public a:Lvs;

.field public b:Lx93;

.field public c:Landroid/widget/FrameLayout;

.field public d:Z

.field public final e:Lpde;

.field public final f:La83;

.field public final g:Lxt2;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0x8

    const/16 v1, 0x10

    const/4 v2, 0x1

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lc76;->h:[I

    const/16 v0, 0x20

    const/16 v1, 0x40

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lc76;->i:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lpde;

    sget-object v1, Lkl0;->k:Lkl0;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lc76;->e:Lpde;

    new-instance v0, La83;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, La83;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lc76;->f:La83;

    new-instance v0, Lxt2;

    invoke-direct {v0, p0, v1}, Lxt2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lc76;->g:Lxt2;

    return-void
.end method


# virtual methods
.method public final T()Likc;
    .registers 1

    iget-object p0, p0, Lc76;->e:Lpde;

    return-object p0
.end method

.method public final f0(Landroid/content/Context;Z)I
    .registers 4

    iget-object p0, p0, Lc76;->b:Lx93;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    if-nez p2, :cond_1c

    const p0, 0x7f040216

    const p2, 0x7f0600ae

    invoke-static {p0, p1, p2}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    sget-object v0, Lf03;->i:[I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p0

    return p0

    :cond_1c
    invoke-virtual {p0}, Lx93;->H()Lzlb;

    move-result-object p0

    invoke-virtual {p0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_24
    move-object p2, p0

    check-cast p2, Lbmb;

    invoke-virtual {p2}, Lbmb;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    invoke-virtual {p2}, Lbmb;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ldn5;

    iget-boolean p2, p2, Ldn5;->e:Z

    if-nez p2, :cond_24

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    return p0

    :cond_40
    const p0, 0x7f040214

    const p2, 0x7f0600b1

    invoke-static {p0, p1, p2}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    return p0
.end method

.method public final g0(Landroid/view/LayoutInflater;)V
    .registers 14

    iget-object v0, p0, Lc76;->c:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, p0, Lc76;->c:Landroid/widget/FrameLayout;

    if-nez v0, :cond_e

    move-object v0, v1

    :cond_e
    const v2, 0x7f0d00e9

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v0, 0x7f0a025b

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const-string v2, "Missing required view with ID: "

    if-eqz v6, :cond_101

    const v0, 0x7f0a026e

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_101

    const v0, 0x7f0a056f

    invoke-static {v0, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    if-eqz v5, :cond_f1

    const v0, 0x7f0a0605

    invoke-static {v0, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_f1

    new-instance v0, Lhl4;

    move-object v10, v7

    check-cast v10, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v11, 0x1

    invoke-direct {v0, v10, v11}, Lhl4;-><init>(Landroidx/recyclerview/widget/RecyclerView;B)V

    new-instance v7, Lov0;

    check-cast v4, Lcom/opera/android/custom_views/FadingNestedScrollView;

    const/16 v8, 0x9

    invoke-direct {v7, v4, v5, v0, v8}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v0, 0x7f0a0bba

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v8, :cond_101

    new-instance v4, Lvs;

    move-object v5, p1

    check-cast v5, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v9, 0x9

    invoke-direct/range {v4 .. v9}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v4, p0, Lc76;->a:Lvs;

    iget-object p1, p0, Lc76;->b:Lx93;

    if-nez p1, :cond_73

    move-object p1, v1

    :cond_73
    invoke-virtual {v10, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Lc76;->a:Lvs;

    if-nez p1, :cond_7b

    move-object p1, v1

    :cond_7b
    iget-object p1, p1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lov0;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lhl4;

    iget-object p1, p1, Lhl4;->b:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    invoke-direct {v0, v11, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Lc76;->a:Lvs;

    if-nez p1, :cond_95

    move-object p1, v1

    :cond_95
    iget-object p1, p1, Lvs;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lc76;->a:Lvs;

    if-nez p1, :cond_a2

    move-object v0, v1

    goto :goto_a3

    :cond_a2
    move-object v0, p1

    :goto_a3
    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    iput-object p0, v0, Landroidx/appcompat/widget/Toolbar;->H:Lssl;

    if-nez p1, :cond_ac

    move-object p1, v1

    :cond_ac
    iget-object p1, p1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lov0;

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    new-instance v0, Lhz0;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v2}, Lhz0;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-static {p1, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v0, p1}, Lhz0;->a(Landroid/view/View;)V

    iget-object p1, p0, Lc76;->a:Lvs;

    if-nez p1, :cond_c5

    move-object p1, v1

    :cond_c5
    iget-object p1, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v0, Lkp5;

    const/16 v3, 0x14

    invoke-direct {v0, v3}, Lkp5;-><init>(B)V

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p1, v0}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    invoke-virtual {p0}, Lc76;->h0()V

    iget-object p1, p0, Lc76;->a:Lvs;

    if-eqz p1, :cond_dd

    move-object v1, p1

    :cond_dd
    iget-object p1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    new-instance v0, Lpc5;

    invoke-direct {v0, p0, v2}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_ed

    return-void

    :cond_ed
    invoke-static {p0, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_f1
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_101
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final h0()V
    .registers 10

    iget-object v0, p0, Lc76;->a:Lvs;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v0

    const v2, 0x7f0a06aa

    invoke-virtual {v0, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v2, p0, Lc76;->b:Lx93;

    if-nez v2, :cond_1a

    move-object v2, v1

    :cond_1a
    invoke-virtual {v2}, Lx93;->H()Lzlb;

    move-result-object v2

    invoke-virtual {v2}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_22
    move-object v3, v2

    check-cast v3, Lbmb;

    invoke-virtual {v3}, Lbmb;->hasNext()Z

    move-result v4

    const v5, 0x7f14056f

    if-eqz v4, :cond_7b

    invoke-virtual {v3}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldn5;

    iget-boolean v3, v3, Ldn5;->e:Z

    if-nez v3, :cond_22

    iget-object v2, p0, Lc76;->b:Lx93;

    if-nez v2, :cond_3d

    move-object v2, v1

    :cond_3d
    invoke-virtual {v2}, Lx93;->H()Lzlb;

    move-result-object v2

    invoke-virtual {v2}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_47
    move-object v6, v2

    check-cast v6, Lbmb;

    invoke-virtual {v6}, Lbmb;->hasNext()Z

    move-result v7

    const/4 v8, -0x1

    if-eqz v7, :cond_5e

    invoke-virtual {v6}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ldn5;

    iget-boolean v6, v6, Ldn5;->e:Z

    if-nez v6, :cond_5f

    add-int/lit8 v4, v4, 0x1

    goto :goto_47

    :cond_5e
    move v4, v8

    :cond_5f
    if-eq v4, v8, :cond_62

    const/4 v3, 0x1

    :cond_62
    if-nez v3, :cond_71

    const v2, 0x7f0805ec

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    const v2, 0x7f140f25

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_84

    :cond_71
    const v2, 0x7f0805ed

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    invoke-interface {v0, v5}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_84

    :cond_7b
    const v2, 0x7f0805eb

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    invoke-interface {v0, v5}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    :goto_84
    iget-object v2, p0, Lc76;->a:Lvs;

    if-eqz v2, :cond_89

    move-object v1, v2

    :cond_89
    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v2

    invoke-virtual {p0, v1, v2}, Lc76;->f0(Landroid/content/Context;Z)I

    move-result p0

    invoke-interface {v0}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_a9

    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, p0, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    :cond_a9
    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->T()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->V(Z)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-object v0, p0, Lc76;->a:Lvs;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_75

    iget-object p1, p0, Lc76;->a:Lvs;

    if-nez p1, :cond_15

    move-object p1, v1

    :cond_15
    iget-object p1, p1, Lvs;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object p1

    const v0, 0x7f0a06aa

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-virtual {p0}, Lc76;->h0()V

    iget-object p1, p0, Lc76;->b:Lx93;

    if-nez p1, :cond_30

    move-object p1, v1

    :cond_30
    invoke-virtual {p1}, Lx93;->H()Lzlb;

    move-result-object v2

    invoke-virtual {v2}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_38
    move-object v3, v2

    check-cast v3, Lbmb;

    invoke-virtual {v3}, Lbmb;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4a

    invoke-virtual {v3}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldn5;

    iput-boolean v0, v3, Ldn5;->f:Z

    goto :goto_38

    :cond_4a
    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    iget-object p1, p0, Lc76;->g:Lxt2;

    invoke-virtual {p1, v0}, Lgcf;->setEnabled(Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lcom/opera/android/startup/WelcomeActivity;

    new-instance v2, Lo2c;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "key.asked_consents"

    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v3

    iget-object v4, p0, Lc76;->b:Lx93;

    if-eqz v4, :cond_69

    move-object v1, v4

    :cond_69
    invoke-virtual {v1}, Lx93;->G()I

    move-result v1

    iget-boolean p0, p0, Lc76;->d:Z

    invoke-direct {v2, v3, v1, v0, p0}, Lo2c;-><init>(IIZZ)V

    invoke-virtual {p1, v2}, Lcom/opera/android/startup/WelcomeActivity;->K(Lo2c;)V

    :cond_75
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc76;->g0(Landroid/view/LayoutInflater;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 13

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "key.asked_consents"

    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v2

    const/4 v0, 0x0

    if-eqz p1, :cond_20

    const-string v1, "key.granted_consents"

    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "key.has_interacted_with_menu"

    invoke-virtual {p1, v3, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lc76;->d:Z

    move v3, v1

    goto :goto_21

    :cond_20
    move v3, v2

    :goto_21
    new-instance p1, Lx93;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v6

    const v5, 0x7f140fc0

    const/4 v7, 0x1

    sget-object v4, Lc76;->h:[I

    invoke-static/range {v2 .. v7}, Ly9m;->n(II[IILehc;Z)V

    move v1, v0

    move v4, v1

    :goto_32
    const/4 v10, 0x2

    move-object v8, v6

    sget-object v6, Lc76;->i:[I

    if-ge v4, v10, :cond_3f

    aget v5, v6, v4

    or-int/2addr v1, v5

    add-int/lit8 v4, v4, 0x1

    move-object v6, v8

    goto :goto_32

    :cond_3f
    and-int v4, v2, v1

    if-ne v4, v1, :cond_44

    const/4 v0, 0x1

    :cond_44
    move v9, v0

    if-eqz v9, :cond_4a

    move v4, v2

    move v5, v3

    goto :goto_4c

    :cond_4a
    move v4, v1

    move v5, v4

    :goto_4c
    const v7, 0x7f140fef

    invoke-static/range {v4 .. v9}, Ly9m;->n(II[IILehc;Z)V

    move-object v6, v8

    invoke-static {v6}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v0

    invoke-direct {p1, v0, v10}, Lx93;-><init>(Ljava/util/AbstractList;B)V

    iput-object p1, p0, Lc76;->b:Lx93;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    invoke-virtual {p1}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p1

    iget-object v0, p0, Lc76;->g:Lxt2;

    invoke-virtual {p1, p0, v0}, Lkcf;->a(Lndc;Lgcf;)V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    new-instance p2, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lc76;->c:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Lc76;->g0(Landroid/view/LayoutInflater;)V

    iget-object p0, p0, Lc76;->c:Landroid/widget/FrameLayout;

    if-nez p0, :cond_13

    const/4 p0, 0x0

    :cond_13
    return-object p0
.end method

.method public final onDestroyView()V
    .registers 4

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    iget-object v0, p0, Lc76;->b:Lx93;

    const/4 v1, 0x0

    if-nez v0, :cond_9

    move-object v0, v1

    :cond_9
    iget-object v2, p0, Lc76;->f:La83;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    iget-object p0, p0, Lc76;->a:Lvs;

    if-nez p0, :cond_13

    move-object p0, v1

    :cond_13
    iget-object p0, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    iput-object v1, p0, Landroidx/appcompat/widget/Toolbar;->H:Lssl;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 8

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a06aa

    const/4 v1, 0x0

    if-ne p1, v0, :cond_76

    const/4 p1, 0x1

    iput-boolean p1, p0, Lc76;->d:Z

    iget-object p0, p0, Lc76;->b:Lx93;

    if-nez p0, :cond_12

    const/4 p0, 0x0

    :cond_12
    invoke-virtual {p0}, Lx93;->H()Lzlb;

    move-result-object v0

    invoke-virtual {v0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v2, v1

    :goto_1b
    move-object v3, v0

    check-cast v3, Lbmb;

    invoke-virtual {v3}, Lbmb;->hasNext()Z

    move-result v4

    const/4 v5, -0x1

    if-eqz v4, :cond_32

    invoke-virtual {v3}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldn5;

    iget-boolean v3, v3, Ldn5;->e:Z

    if-nez v3, :cond_33

    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_32
    move v2, v5

    :cond_33
    if-eq v2, v5, :cond_37

    move v0, p1

    goto :goto_38

    :cond_37
    move v0, v1

    :goto_38
    if-nez v0, :cond_58

    invoke-virtual {p0}, Lx93;->H()Lzlb;

    move-result-object v0

    invoke-virtual {v0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_42
    move-object v1, v0

    check-cast v1, Lbmb;

    invoke-virtual {v1}, Lbmb;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_54

    invoke-virtual {v1}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldn5;

    iput-boolean p1, v1, Ldn5;->e:Z

    goto :goto_42

    :cond_54
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return p1

    :cond_58
    invoke-virtual {p0}, Lx93;->H()Lzlb;

    move-result-object v0

    invoke-virtual {v0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_60
    move-object v2, v0

    check-cast v2, Lbmb;

    invoke-virtual {v2}, Lbmb;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_72

    invoke-virtual {v2}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldn5;

    iput-boolean v1, v2, Ldn5;->e:Z

    goto :goto_60

    :cond_72
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return p1

    :cond_76
    return v1
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lc76;->b:Lx93;

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :cond_8
    invoke-virtual {v0}, Lx93;->G()I

    move-result v0

    const-string v1, "key.granted_consents"

    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "key.has_interacted_with_menu"

    iget-boolean p0, p0, Lc76;->d:Z

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lc76;->b:Lx93;

    const/4 p2, 0x0

    if-nez p1, :cond_9

    move-object p1, p2

    :cond_9
    iget-object v0, p0, Lc76;->f:La83;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iget-object p0, p0, Lc76;->a:Lvs;

    if-eqz p0, :cond_13

    move-object p2, p0

    :cond_13
    iget-object p0, p2, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p1, Lkp5;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lkp5;-><init>(B)V

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0, p1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method
