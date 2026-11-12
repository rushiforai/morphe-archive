.class public final Lwrl;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final a:Landroid/content/res/Resources;

.field public final b:Lh73;

.field public final c:Lvrl;

.field public final d:Lsrl;

.field public final e:Lrrl;

.field public final f:Ltrl;

.field public final g:Lcom/opera/android/custom_views/FadingNestedScrollView;

.field public final h:Lqm9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lh73;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/custom_views/FadingNestedScrollView;Lqm9;)V
    .registers 20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lwrl;->a:Landroid/content/res/Resources;

    iput-object p2, p0, Lwrl;->b:Lh73;

    new-instance v6, Li3j;

    iget-object v0, p2, Lh73;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v4, p2, Lh73;->e:Lydn;

    iget-object v1, p2, Lh73;->k:Lz77;

    invoke-direct {v6, p1, v0, v4, v1}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lvrl;

    new-instance v3, Lcrk;

    const/16 p1, 0x10

    invoke-direct {v3, p0, p1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    iget-object v5, p2, Lh73;->j:Lxt8;

    move-object v2, p3

    invoke-direct/range {v1 .. v6}, Lvrl;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lydn;Lxt8;Li3j;)V

    iput-object v1, p0, Lwrl;->c:Lvrl;

    new-instance v0, Lsrl;

    new-instance v2, Lcrk;

    invoke-direct {v2, p0, p1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    iget-object v3, p2, Lh73;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v0, p4, v2, v3, v6}, Lsrl;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Li3j;)V

    iput-object v0, p0, Lwrl;->d:Lsrl;

    new-instance v2, Lrrl;

    new-instance v4, Lcrk;

    invoke-direct {v4, p0, p1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v5, p5

    invoke-direct {v2, v5, v4, v3}, Lrrl;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;)V

    iput-object v2, p0, Lwrl;->e:Lrrl;

    new-instance v5, Ltrl;

    new-instance v7, Lcrk;

    invoke-direct {v7, p0, p1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    iget-object v8, p2, Lh73;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v9, p2, Lh73;->f:Ldxe;

    iget-object v10, p2, Lh73;->j:Lxt8;

    move-object/from16 v6, p6

    invoke-direct/range {v5 .. v10}, Ltrl;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Ldxe;Lxt8;)V

    iput-object v5, p0, Lwrl;->f:Ltrl;

    move-object/from16 p1, p7

    iput-object p1, p0, Lwrl;->g:Lcom/opera/android/custom_views/FadingNestedScrollView;

    move-object/from16 p1, p8

    iput-object p1, p0, Lwrl;->h:Lqm9;

    invoke-virtual {v1}, Lvrl;->s0()V

    iget-object p1, v1, Lvrl;->o:Lydn;

    invoke-virtual {p1, v1}, Lydn;->b(Ltdn;)V

    iget-object p1, v1, Lvrl;->r:Lro9;

    invoke-virtual {p1}, Lro9;->e()V

    invoke-virtual {v0}, Lurl;->s0()V

    iget-object p1, v0, Lurl;->p:Lnrl;

    iget-object p2, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-boolean p1, p1, Lnrl;->a:Z

    const/16 v0, 0x24

    const/16 v1, 0x12

    if-eqz p1, :cond_7f

    move p1, v1

    goto :goto_80

    :cond_7f
    move p1, v0

    :goto_80
    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-virtual {p2, v4, p1, p1, v6}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    invoke-virtual {v2}, Lurl;->s0()V

    iget-object p1, v2, Lurl;->p:Lnrl;

    iget-object p2, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-boolean p1, p1, Lnrl;->a:Z

    if-eqz p1, :cond_94

    move p1, v1

    goto :goto_95

    :cond_94
    move p1, v0

    :goto_95
    invoke-virtual {p2, v4, p1, p1, v6}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    invoke-virtual {v5}, Lurl;->s0()V

    iget-object p1, v5, Lurl;->p:Lnrl;

    iget-object p2, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-boolean p1, p1, Lnrl;->a:Z

    if-eqz p1, :cond_a6

    move v0, v1

    :cond_a6
    invoke-virtual {p2, v4, v0, v0, v6}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    sget-object p1, Lowe;->c:Lowe;

    invoke-virtual {p1, v5}, Lowe;->a(Lnwe;)V

    iget-object p1, v5, Ltrl;->q:Ldxe;

    iget-object p1, p1, Ldxe;->h:Lh7f;

    invoke-virtual {p1, v5}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {v3, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_46

    goto :goto_30

    :sswitch_9
    const-string v0, "compression"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    const/4 v1, 0x3

    goto :goto_30

    :sswitch_13
    const-string v0, "night_mode_schedule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    const/4 v1, 0x2

    goto :goto_30

    :sswitch_1d
    const-string v0, "night_mode"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    const/4 v1, 0x1

    goto :goto_30

    :sswitch_27
    const-string v0, "ad_blocking"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    const/4 v1, 0x0

    :cond_30
    :goto_30
    packed-switch v1, :pswitch_data_58

    return-void

    :pswitch_34
    iget-object p0, p0, Lwrl;->d:Lsrl;

    invoke-virtual {p0}, Lurl;->s0()V

    return-void

    :pswitch_3a
    iget-object p0, p0, Lwrl;->f:Ltrl;

    invoke-virtual {p0}, Lurl;->s0()V

    return-void

    :pswitch_40
    iget-object p0, p0, Lwrl;->e:Lrrl;

    invoke-virtual {p0}, Lurl;->s0()V

    return-void

    :sswitch_data_46
    .sparse-switch
        -0x4adf772f -> :sswitch_27
        -0x23dea296 -> :sswitch_1d
        -0x16b42234 -> :sswitch_13
        0x555a5966 -> :sswitch_9
    .end sparse-switch

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_40
        :pswitch_3a
        :pswitch_3a
        :pswitch_34
    .end packed-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lwrl;->b:Lh73;

    iget-object p1, p1, Lh73;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object p1, p0, Lwrl;->c:Lvrl;

    invoke-virtual {p1}, Lvrl;->P()V

    iget-object p1, p0, Lwrl;->d:Lsrl;

    iget-object p1, p1, Lk8;->a:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lwrl;->e:Lrrl;

    iget-object p1, p1, Lk8;->a:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lwrl;->f:Ltrl;

    invoke-virtual {p0}, Ltrl;->P()V

    return-void
.end method
