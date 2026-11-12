.class public final Lr6k;
.super Lab2;
.source "SourceFile"

# interfaces
.implements Lev8;
.implements Lrjm;


# instance fields
.field public final d:Lpt1;

.field public final e:Lne5;

.field public final f:Le7k;

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Lfwf;Lpt1;Lne5;Le7k;)V
    .registers 9

    iget-object v0, p2, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, v0}, Lab2;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lr6k;->d:Lpt1;

    iput-object p3, p0, Lr6k;->e:Lne5;

    iput-object p4, p0, Lr6k;->f:Le7k;

    iget-object p3, p3, Lne5;->g:Ljava/lang/Object;

    check-cast p3, Lpde;

    new-instance p4, Ln6k;

    const/4 v1, 0x1

    invoke-direct {p4, p0, v1}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lt7d;

    const/16 v3, 0xf

    invoke-direct {v2, p4, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p3, p1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p2, Lpt1;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    new-instance p3, Lp6k;

    const/4 p4, 0x0

    invoke-direct {p3, p0, p4}, Lp6k;-><init>(Lr6k;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lq6k;

    invoke-direct {p3, p0, p4}, Lq6k;-><init>(Lr6k;B)V

    new-instance p4, Lw9n;

    invoke-direct {p4, p1, p3}, Lw9n;-><init>(Landroid/view/View;Lx9n;)V

    iget-object p1, p2, Lpt1;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    new-instance p3, Lp6k;

    invoke-direct {p3, p0, v1}, Lp6k;-><init>(Lr6k;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p2, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/weather/view/WeatherWidgetView;

    new-instance p2, Lp6k;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lp6k;-><init>(Lr6k;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lq6k;

    invoke-direct {p2, p0, v1}, Lq6k;-><init>(Lr6k;B)V

    new-instance p3, Lw9n;

    invoke-direct {p3, p1, p2}, Lw9n;-><init>(Landroid/view/View;Lx9n;)V

    new-instance p1, Lkkf;

    const/16 p2, 0x16

    invoke-direct {p1, p0, p2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final b(Lsjm;)V
    .registers 8

    iget-boolean v0, p0, Lr6k;->g:Z

    iget-boolean p1, p1, Lsjm;->a:Z

    if-ne v0, p1, :cond_7

    return-void

    :cond_7
    iput-boolean p1, p0, Lr6k;->g:Z

    if-eqz p1, :cond_43

    if-eqz p1, :cond_43

    iget-boolean p1, p0, Lr6k;->h:Z

    if-eqz p1, :cond_43

    iget-object p1, p0, Lr6k;->e:Lne5;

    iget-object p1, p1, Lne5;->e:Ljava/lang/Object;

    check-cast p1, Lpz6;

    iget-object p1, p1, Lpz6;->e:Lxz6;

    iget-boolean v0, p1, Lxz6;->b:Z

    if-nez v0, :cond_43

    const/4 v0, 0x1

    iput-boolean v0, p1, Lxz6;->b:Z

    iget-object p1, p1, Lxz6;->a:Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_43

    iget-object v1, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->e:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwu0;

    iget-object v1, v1, Lwu0;->b:Lvu0;

    const/4 v3, 0x0

    const-wide/16 v4, 0x1

    invoke-virtual {v1, v3, v0, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {p1, v2}, Lx5f;->U0(Lx56;)V

    :cond_43
    invoke-virtual {p0}, Lr6k;->c0()V

    return-void
.end method

.method public final b0(Lv6k;)V
    .registers 12

    iget-object p0, p0, Lr6k;->d:Lpt1;

    iget-object v0, p0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    iget-object v1, p0, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    iget-object v2, p0, Lpt1;->b:Landroid/view/View;

    check-cast v2, Lcom/opera/android/weather/view/WeatherWidgetView;

    iget-boolean v3, p1, Lv6k;->b:Z

    iget-object v4, p1, Lv6k;->d:Llaj;

    iget-object v5, p1, Lv6k;->e:Lw6k;

    const/16 v6, 0x8

    const/4 v7, 0x0

    if-eqz v3, :cond_1b

    move v3, v7

    goto :goto_1c

    :cond_1b
    move v3, v6

    :goto_1c
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v5, v0}, Lw6k;->d(Lcom/opera/android/custom_views/StylingImageView;)V

    iget-object v0, p0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-virtual {v0, v4}, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b(Llaj;)V

    iget-boolean v0, p1, Lv6k;->c:Z

    if-eqz v0, :cond_33

    move v0, v7

    goto :goto_34

    :cond_33
    move v0, v6

    :goto_34
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v5, p0}, Lw6k;->d(Lcom/opera/android/custom_views/StylingImageView;)V

    invoke-virtual {v1, v4}, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b(Llaj;)V

    iget-object p0, p1, Lv6k;->f:Lzpn;

    sget-object p1, Lwpn;->a:Lwpn;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10c

    sget-object p1, Lxpn;->a:Lxpn;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10c

    sget-object p1, Lvpn;->a:Lvpn;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5f

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_5f
    instance-of p1, p0, Lypn;

    if-eqz p1, :cond_108

    iget-object p1, v2, Lcom/opera/android/weather/view/WeatherWidgetView;->a:Lvs;

    check-cast p0, Lypn;

    iget-object v0, p0, Lypn;->a:Llon;

    invoke-static {v0}, Lxih;->z(Llon;)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_78

    iget-object v0, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/LottieAnimationView;

    invoke-virtual {v0, v1}, Ln2d;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_83

    :cond_78
    iget-object v3, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/widget/LottieAnimationView;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v3, v0}, Ln2d;->j(I)V

    :goto_83
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v3, p0, Lypn;->b:Ljava/lang/String;

    iget-wide v8, p0, Lypn;->c:D

    invoke-static {v8, v9}, Lzed;->a(D)I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0, v3}, [Ljava/lang/Object;

    move-result-object p0

    const v3, 0x7f140433

    invoke-virtual {v0, v3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object v0, p1, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_b1

    const/4 p0, -0x1

    goto :goto_b8

    :cond_b1
    const v0, 0x7f0600b6

    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    :goto_b8
    iget-object v0, p1, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_da

    const/4 v3, 0x1

    if-ne v0, v3, :cond_d4

    const v0, 0x7f060f8c

    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    goto :goto_e1

    :cond_d4
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v1, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_da
    const v0, 0x7f060f8d

    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    :goto_e1
    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object v0, p1, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v1, :cond_f9

    check-cast v0, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    :cond_f9
    if-nez v4, :cond_fd

    sget-object v4, Llaj;->e:Llaj;

    :cond_fd
    iget-object p0, p1, Lvs;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v4, p0}, Llaj;->a(Landroid/widget/TextView;)V

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_108
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_10c
    const/4 p0, 0x4

    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final c0()V
    .registers 9

    iget-boolean v0, p0, Lr6k;->g:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lr6k;->i:Z

    if-eqz v0, :cond_c

    move v0, v1

    goto :goto_d

    :cond_c
    move v0, v2

    :goto_d
    iget-boolean v3, p0, Lr6k;->j:Z

    if-eq v0, v3, :cond_89

    iput-boolean v0, p0, Lr6k;->j:Z

    iget-object v3, p0, Lr6k;->d:Lpt1;

    iget-object v3, v3, Lpt1;->g:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    iget-object p0, p0, Lr6k;->f:Le7k;

    iget-object v4, p0, Le7k;->a:Lcw3;

    invoke-virtual {v4}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lru9;

    iget-object v5, v4, Lru9;->a:Landroid/content/SharedPreferences;

    iget-object v6, p0, Le7k;->e:Lza9;

    iget-boolean v7, v6, Lza9;->b:Z

    if-eq v7, v0, :cond_30

    iput-boolean v0, v6, Lza9;->b:Z

    invoke-virtual {v6, v4}, Lza9;->d(Lru9;)V

    :cond_30
    if-eqz v0, :cond_89

    iget-object v0, p0, Le7k;->g:Lmu5;

    if-nez v0, :cond_89

    iget-object v0, p0, Le7k;->d:Lpw3;

    invoke-virtual {v0}, Lpw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_89

    const-string v0, "jump_minigame.visited"

    invoke-interface {v5, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_89

    const-string v0, "startpage.minigame_button_hint_shown"

    invoke-interface {v5, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_89

    const-string v0, "startpage.minigame_entry_point_impressions"

    invoke-interface {v5, v0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const-string v4, "startpage.installed_with_minigame"

    invoke-interface {v5, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    const/4 v5, 0x3

    if-eqz v4, :cond_65

    move v4, v5

    goto :goto_66

    :cond_65
    const/4 v4, 0x2

    :goto_66
    if-lt v0, v4, :cond_89

    new-instance v0, Lmu5;

    new-instance v4, Ld7k;

    invoke-direct {v4, p0, v3, v2}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Llr2;

    invoke-direct {v2, v5}, Llr2;-><init>(B)V

    invoke-direct {v0, v3, v2, v4, v1}, Lmu5;-><init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;B)V

    iput-object v0, p0, Le7k;->g:Lmu5;

    iget-object p0, p0, Le7k;->c:Lcw3;

    invoke-virtual {p0}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loz3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_89
    return-void
.end method
