.class public final Lkxe;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# instance fields
.field public final A:Lxt8;

.field public final B:Lz77;

.field public final C:Lgjm;

.field public final D:Lua7;

.field public E:Ldmd;

.field public F:Lb98;

.field public G:Lcr2;

.field public H:Lvs;

.field public I:Lov0;

.field public J:Ldxe;

.field public K:Lz61;

.field public L:Z

.field public M:I

.field public N:I

.field public O:Lcom/google/android/material/card/MaterialCardView;

.field public P:I

.field public Q:Landroid/view/ViewGroup;

.field public R:Landroid/app/TimePickerDialog;

.field public S:Z

.field public final t:Lixe;

.field public final u:Lixe;

.field public final v:Lfxe;

.field public final w:Ljxe;

.field public final x:Lxu1;

.field public final y:Lcom/opera/android/settings/SettingsManager;

.field public final z:Lqwe;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lqwe;Lxt8;Lz77;Lorm;Lgjm;)V
    .registers 10

    const v0, 0x7f14103a    # 1.9681E38f

    invoke-direct {p0, v0}, Li93;-><init>(I)V

    new-instance v0, Lixe;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lixe;-><init>(Lkxe;B)V

    iput-object v0, p0, Lkxe;->t:Lixe;

    new-instance v0, Lixe;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lixe;-><init>(Lkxe;B)V

    iput-object v0, p0, Lkxe;->u:Lixe;

    new-instance v0, Lfxe;

    const/4 v2, 0x4

    invoke-direct {v0, p0, v2}, Lfxe;-><init>(Lkxe;B)V

    iput-object v0, p0, Lkxe;->v:Lfxe;

    new-instance v0, Lxu1;

    invoke-direct {v0, p0, v1}, Lxu1;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lkxe;->x:Lxu1;

    const v0, 0x7f14096e

    iput v0, p0, Lkxe;->P:I

    iput-object p1, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    new-instance v0, Ljxe;

    invoke-direct {v0, p0, p1}, Ljxe;-><init>(Lkxe;Lcom/opera/android/settings/SettingsManager;)V

    iput-object v0, p0, Lkxe;->w:Ljxe;

    iput-object p2, p0, Lkxe;->z:Lqwe;

    iput-object p3, p0, Lkxe;->A:Lxt8;

    iput-object p4, p0, Lkxe;->B:Lz77;

    iput-object p6, p0, Lkxe;->C:Lgjm;

    new-instance p1, Lua7;

    invoke-direct {p1, p0, p6}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p1, p0, Lkxe;->D:Lua7;

    check-cast p5, Lx5f;

    iget-boolean p0, p5, Lx5f;->h:Z

    if-nez p0, :cond_49

    return-void

    :cond_49
    iget-object p0, p5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-static {p0, p1}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p0

    const-wide/16 p2, 0x1

    iget-object p0, p0, Lhi0;->b:Lfi0;

    invoke-virtual {p0, v2, v1, p2, p3}, Ljf0;->p(IIJ)V

    invoke-virtual {p5, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method


# virtual methods
.method public final C0(Litl;)Litl;
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f050013

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    const p1, 0x7f100022

    if-eqz p0, :cond_1e

    const p0, 0x7f0d0424

    invoke-static {p0}, Lu7k;->j(I)Lu7k;

    move-result-object p0

    iget-object v0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    iput p1, v0, Litl;->b:I

    goto :goto_29

    :cond_1e
    const/4 p0, 0x2

    invoke-static {p0}, Lu7k;->f(I)Lu7k;

    move-result-object p0

    iget-object v0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    iput p1, v0, Litl;->b:I

    :goto_29
    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Litl;

    const/4 p1, 0x1

    iput-boolean p1, p0, Litl;->f:Z

    return-object p0
.end method

.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lkxe;->v:Lfxe;

    return-object p0
.end method

.method public final H0(Lvs;)V
    .registers 8

    iget-object v0, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v1

    if-eqz v1, :cond_13

    invoke-virtual {v1}, Lhjf;->u()Lnzk;

    move-result-object v1

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    :goto_14
    invoke-static {v0, v1}, Lx1p;->D(Landroid/content/Context;Lnzk;)Z

    move-result v1

    new-instance v2, Ldkf;

    if-eqz v1, :cond_20

    const v3, 0x7f040388

    goto :goto_23

    :cond_20
    const v3, 0x7f04062a

    :goto_23
    const v4, 0x7f150054

    invoke-static {v3, v0, v4}, Lf03;->E(ILandroid/content/Context;I)I

    move-result v3

    invoke-direct {v2, v0, v3}, Ldkf;-><init>(Landroid/content/Context;I)V

    const v0, 0x7f0402f4

    const v3, 0x7f06063b

    invoke-static {v0, v2, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object v4, p1, Lvs;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const v5, 0x7f0402c4

    invoke-static {v5, v2, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v4, p1, Lvs;->e:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const v5, 0x7f0402c8

    invoke-static {v5, v2, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v4, p0, Lkxe;->O:Lcom/google/android/material/card/MaterialCardView;

    if-eqz v4, :cond_87

    invoke-virtual {v4, v0}, Lcom/google/android/material/card/MaterialCardView;->b(I)V

    iget-object p1, p0, Lkxe;->O:Lcom/google/android/material/card/MaterialCardView;

    if-eqz v1, :cond_62

    const v0, 0x7f0402d5

    goto :goto_65

    :cond_62
    const v0, 0x7f0402d6

    :goto_65
    invoke-static {v0, v2, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/material/card/MaterialCardView;->g:Lndd;

    iget-object v2, v1, Lndd;->o:Landroid/content/res/ColorStateList;

    if-eq v2, v0, :cond_83

    iput-object v0, v1, Lndd;->o:Landroid/content/res/ColorStateList;

    iget-object v2, v1, Lndd;->d:Lzdd;

    iget v1, v1, Lndd;->i:I

    int-to-float v1, v1

    invoke-virtual {v2, v1}, Lzdd;->A(F)V

    invoke-virtual {v2, v0}, Lzdd;->y(Landroid/content/res/ColorStateList;)V

    :cond_83
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    goto :goto_8e

    :cond_87
    iget-object p1, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    :goto_8e
    invoke-virtual {p0}, Lkxe;->K0()V

    return-void
.end method

.method public final I0(Z)V
    .registers 13

    iget-object v0, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    if-eqz p1, :cond_b

    const-string v1, "night_mode_schedule_start"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_11

    :cond_b
    const-string v1, "night_mode_schedule_end"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v0

    :goto_11
    const-wide/32 v2, 0x36ee80

    div-long v2, v0, v2

    long-to-int v8, v2

    const-wide/32 v2, 0xea60

    div-long/2addr v0, v2

    long-to-int v0, v0

    rem-int/lit8 v9, v0, 0x3c

    new-instance v4, Landroid/app/TimePickerDialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    new-instance v7, Lgxe;

    invoke-direct {v7, p0, p1}, Lgxe;-><init>(Lkxe;Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v10

    const v6, 0x7f150297

    invoke-direct/range {v4 .. v10}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;ILandroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    iput-object v4, p0, Lkxe;->R:Landroid/app/TimePickerDialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    iget-object p1, p0, Lkxe;->z:Lqwe;

    iget-object p0, p0, Lkxe;->R:Landroid/app/TimePickerDialog;

    invoke-virtual {p1, p0}, Lqwe;->a(Landroid/app/Dialog;)V

    return-void
.end method

.method public final J0()V
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lkxe;->E:Ldmd;

    if-nez v1, :cond_b

    iget-object v1, v0, Lkxe;->F:Lb98;

    if-nez v1, :cond_b

    return-void

    :cond_b
    sget-object v1, Lowe;->c:Lowe;

    iget-object v1, v1, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    const-string v2, "darken_websites"

    iget-object v3, v0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    const-string v4, "night_mode_overlay_keyboard"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "night_mode_switch_theme"

    invoke-virtual {v3, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result v6

    const-string v7, "night_mode_schedule_start"

    invoke-virtual {v3, v7}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v7

    const-string v9, "night_mode_schedule_end"

    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v11

    const-string v12, "GMT"

    invoke-static {v12}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v12, Ljava/util/Date;

    invoke-direct {v12, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v11, v12}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v9, v10}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v11, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    iget v9, v0, Lkxe;->M:I

    const/4 v10, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v9, :cond_8d

    if-eq v9, v6, :cond_8d

    const/4 v13, 0x4

    if-ne v6, v13, :cond_8d

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v13

    invoke-static {v13}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v13

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x1f

    const-string v16, "android.permission.ACCESS_FINE_LOCATION"

    if-lt v14, v15, :cond_7f

    new-array v14, v10, [Ljava/lang/String;

    aput-object v16, v14, v12

    const-string v15, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v15, v14, v11

    goto :goto_83

    :cond_7f
    new-array v14, v11, [Ljava/lang/String;

    aput-object v16, v14, v12

    :goto_83
    iget-object v13, v13, Ldx3;->j:Lqi;

    new-instance v15, Lbp;

    invoke-direct {v15, v0, v9}, Lbp;-><init>(Ljava/lang/Object;I)V

    invoke-static {v13, v14, v15, v11}, Lf03;->T(Lorg/chromium/ui/base/WindowAndroid;[Ljava/lang/String;Lbag;Z)V

    :cond_8d
    iput v6, v0, Lkxe;->M:I

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v9

    iget-object v9, v9, Ldx3;->s:Ldxe;

    const v13, 0x7f141022

    const v14, 0x7f14101f

    const v15, 0x7f141021

    const v12, 0x7f14101e

    invoke-virtual {v9, v15, v12, v13, v14}, Ldxe;->R(IIII)Ljava/lang/String;

    move-result-object v9

    iget-object v12, v0, Lkxe;->I:Lov0;

    iget-object v12, v12, Lov0;->d:Ljava/lang/Object;

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v12, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v1, v0, Lkxe;->I:Lov0;

    iget-object v1, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v1, v9}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/widget/GradientSlider;

    const-string v9, "night_mode_dimming"

    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v1, v9}, Lcom/google/android/material/slider/Slider;->C0(F)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->m:Landroid/view/View;

    check-cast v1, Lcom/opera/android/widget/GradientSlider;

    const-string v9, "night_mode_temperature"

    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Lcom/google/android/material/slider/Slider;->C0(F)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->l:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->h:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->h:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 v2, 0x8

    if-eqz v5, :cond_f9

    const/4 v3, 0x0

    goto :goto_fa

    :cond_f9
    move v3, v2

    :goto_fa
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v3, "activity"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    invoke-virtual {v1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result v1

    if-nez v1, :cond_199

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_122

    const/4 v3, 0x0

    goto :goto_123

    :cond_122
    move v3, v2

    :goto_123
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    if-eqz v4, :cond_140

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_140

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_140

    move v1, v11

    goto :goto_141

    :cond_140
    const/4 v1, 0x0

    :goto_141
    iget-object v3, v0, Lkxe;->G:Lcr2;

    iget-object v3, v3, Lcr2;->j:Landroid/view/View;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v4, 0x7f14101b

    if-eqz v1, :cond_183

    new-instance v5, Landroid/text/SpannableStringBuilder;

    invoke-direct {v5}, Landroid/text/SpannableStringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    const-string v5, " *"

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v9

    const v12, 0x7f040316

    const v13, 0x7f060b26

    invoke-static {v12, v9, v13}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v9

    invoke-direct {v5, v9}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v9

    add-int/lit8 v12, v9, -0x1

    const/16 v13, 0x21

    invoke-virtual {v4, v5, v12, v9, v13}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance v5, Lqxh;

    invoke-direct {v5, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_188

    :cond_183
    new-instance v5, Lrxh;

    invoke-direct {v5, v4}, Lrxh;-><init>(I)V

    :goto_188
    invoke-virtual {v3, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v3, v0, Lkxe;->G:Lcr2;

    iget-object v3, v3, Lcr2;->i:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v1, :cond_195

    const/4 v1, 0x0

    goto :goto_196

    :cond_195
    move v1, v2

    :goto_196
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_199
    invoke-static {v6}, Lvep;->A(I)I

    move-result v1

    const/4 v3, 0x3

    if-eqz v1, :cond_1bd

    if-eq v1, v11, :cond_1bd

    if-eq v1, v10, :cond_1b3

    if-ne v1, v3, :cond_1c7

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->k:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v4, 0x7f141035

    :goto_1af
    invoke-static {v4, v1}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    goto :goto_1c7

    :cond_1b3
    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->k:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v4, 0x7f141030

    goto :goto_1af

    :cond_1bd
    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->k:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v4, 0x7f141034

    goto :goto_1af

    :cond_1c7
    :goto_1c7
    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->b:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-ne v6, v3, :cond_1d1

    const/4 v12, 0x0

    goto :goto_1d2

    :cond_1d1
    move v12, v2

    :goto_1d2
    invoke-virtual {v1, v12}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->e:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v1, v7}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->f:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v1, v8}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v1, v0, Lkxe;->H:Lvs;

    invoke-virtual {v0, v1}, Lkxe;->H0(Lvs;)V

    return-void
.end method

.method public final K0()V
    .registers 15

    iget-object v0, p0, Lkxe;->H:Lvs;

    if-eqz v0, :cond_1d

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget v1, p0, Lkxe;->P:I

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lkxe;->H:Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v0

    if-nez v0, :cond_1e

    :cond_1d
    return-void

    :cond_1e
    iget-object v0, p0, Lkxe;->H:Lvs;

    iget-object v1, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget v2, p0, Lkxe;->P:I

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v4

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v5

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v8

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {v5}, Landroid/text/Layout;->getWidth()I

    move-result v6

    sub-int/2addr v0, v6

    new-instance v6, Landroid/text/DynamicLayout;

    invoke-virtual {v5}, Landroid/text/Layout;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    sub-int v9, v4, v0

    invoke-virtual {v5}, Landroid/text/Layout;->getAlignment()Landroid/text/Layout$Alignment;

    move-result-object v10

    invoke-virtual {v5}, Landroid/text/Layout;->getSpacingMultiplier()F

    move-result v11

    invoke-virtual {v5}, Landroid/text/Layout;->getSpacingAdd()F

    move-result v12

    const/4 v13, 0x1

    invoke-direct/range {v6 .. v13}, Landroid/text/DynamicLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/text/Layout;->getLineForVertical(I)I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {v6, v4}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v4

    new-instance v5, Landroid/text/SpannableStringBuilder;

    const/4 v6, 0x0

    invoke-direct {v5, v2, v6, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;II)V

    new-instance v7, Luwj;

    invoke-direct {v7, v0, v3}, Luwj;-><init>(II)V

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    invoke-virtual {v5, v7, v6, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance v0, Landroid/text/SpannableStringBuilder;

    const-string v3, "line.separator"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v3, v2, v4, v7}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;II)V

    new-instance v2, Luwj;

    invoke-direct {v2, v6, v6}, Luwj;-><init>(II)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    invoke-virtual {v3, v2, v6, v4, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/CharSequence;

    aput-object v5, v2, v6

    aput-object v0, v2, v1

    const/4 v0, 0x2

    aput-object v3, v2, v0

    invoke-static {v2}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lkxe;->H:Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v2

    if-eqz v2, :cond_d2

    invoke-virtual {v2}, Lhjf;->u()Lnzk;

    move-result-object v2

    goto :goto_d3

    :cond_d2
    const/4 v2, 0x0

    :goto_d3
    invoke-static {v0, v2}, Lx1p;->D(Landroid/content/Context;Lnzk;)Z

    move-result v0

    if-eqz v0, :cond_dd

    const v0, -0x866201

    goto :goto_e0

    :cond_dd
    const v0, -0xcc9901

    :goto_e0
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v2, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v0, 0xc

    const/16 v3, 0x11

    const/16 v4, 0x21

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance v2, Landroid/text/style/UnderlineSpan;

    invoke-direct {v2}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    iget-object p0, p0, Lkxe;->H:Lvs;

    iget-object p0, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final L0()V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050014

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_e

    return-void

    :cond_e
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result v1

    invoke-static {v0}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result v0

    if-ge v1, v0, :cond_1e

    const/4 v0, 0x2

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x1

    :goto_1f
    iget-object p0, p0, Lkxe;->H:Lvs;

    iget-object p0, p0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/RelativeLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    int-to-float v0, v0

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final M0()V
    .registers 9

    const-string v0, "night_mode_schedule_start"

    iget-object v1, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/32 v4, 0xea60

    div-long/2addr v2, v4

    long-to-int v0, v2

    div-int/lit8 v0, v0, 0x1e

    const/16 v2, 0x18

    if-le v0, v2, :cond_16

    sub-int/2addr v0, v2

    :goto_14
    int-to-float v0, v0

    goto :goto_18

    :cond_16
    add-int/2addr v0, v2

    goto :goto_14

    :goto_18
    const-string v3, "night_mode_schedule_end"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v6

    div-long/2addr v6, v4

    long-to-int v1, v6

    div-int/lit8 v1, v1, 0x1e

    if-le v1, v2, :cond_27

    sub-int/2addr v1, v2

    :goto_25
    int-to-float v1, v1

    goto :goto_29

    :cond_27
    add-int/2addr v1, v2

    goto :goto_25

    :goto_29
    sub-float v2, v0, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v3, 0x3a83126f    # 0.001f

    cmpg-float v2, v2, v3

    if-gez v2, :cond_4b

    iget-object v2, p0, Lkxe;->G:Lcr2;

    iget-object v2, v2, Lcr2;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/widget/ScheduleRangeSlider;

    invoke-virtual {v2}, Lcom/google/android/material/slider/h;->x()F

    move-result v2

    sub-float v2, v1, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v2, v2, v3

    if-gez v2, :cond_4b

    const/4 v0, 0x0

    :cond_4b
    iget-object p0, p0, Lkxe;->G:Lcr2;

    iget-object p0, p0, Lcr2;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/widget/ScheduleRangeSlider;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/ScheduleRangeSlider;->a0([Ljava/lang/Float;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lbpd;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lbpd;-><init>(Landroid/content/Context;)V

    iget-object p1, p1, Lbpd;->b:Ljava/lang/Object;

    check-cast p1, Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "show_main_menu_toggle"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "onboarding_show"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p1

    iget-object p1, p1, Ldx3;->s:Ldxe;

    iput-object p1, p0, Lkxe;->J:Ldxe;

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lryl;->onDestroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lkxe;->J:Ldxe;

    return-void
.end method

.method public final onDestroyView()V
    .registers 4

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lkxe;->w:Ljxe;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    sget-object v0, Lowe;->c:Lowe;

    iget-object v1, p0, Lkxe;->x:Lxu1;

    invoke-virtual {v0, v1}, Lowe;->b(Lnwe;)V

    iget-object v0, p0, Lkxe;->J:Ldxe;

    iget-object v0, v0, Ldxe;->h:Lh7f;

    invoke-virtual {v0, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lkxe;->K:Lz61;

    iget-object v1, p0, Lkxe;->Q:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v0, v0, Lz61;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_33
    iget-object v0, p0, Lkxe;->G:Lcr2;

    iget-object v0, v0, Lcr2;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/ScheduleRangeSlider;

    iget-object v1, p0, Lkxe;->u:Lixe;

    invoke-virtual {v0, v1}, Lcom/google/android/material/slider/h;->B0(Lw73;)V

    iget-object v0, p0, Lkxe;->G:Lcr2;

    iget-object v0, v0, Lcr2;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/GradientSlider;

    iget-object v1, p0, Lkxe;->t:Lixe;

    invoke-virtual {v0, v1}, Lcom/google/android/material/slider/Slider;->A0(Lw73;)V

    iget-object v0, p0, Lkxe;->G:Lcr2;

    iget-object v0, v0, Lcr2;->m:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/GradientSlider;

    invoke-virtual {v0, v1}, Lcom/google/android/material/slider/Slider;->A0(Lw73;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lkxe;->E:Ldmd;

    iput-object v0, p0, Lkxe;->F:Lb98;

    iput-object v0, p0, Lkxe;->G:Lcr2;

    iput-object v0, p0, Lkxe;->H:Lvs;

    iput-object v0, p0, Lkxe;->I:Lov0;

    iput-object v0, p0, Lkxe;->O:Lcom/google/android/material/card/MaterialCardView;

    iput-object v0, p0, Lkxe;->Q:Landroid/view/ViewGroup;

    iget-object v1, p0, Lkxe;->R:Landroid/app/TimePickerDialog;

    if-eqz v1, :cond_72

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_70

    iget-object v1, p0, Lkxe;->R:Landroid/app/TimePickerDialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    :cond_70
    iput-object v0, p0, Lkxe;->R:Landroid/app/TimePickerDialog;

    :cond_72
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 4

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a05f3

    if-ne v0, v1, :cond_16

    new-instance p1, Lswe;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lkxe;->C:Lgjm;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    const/4 p0, 0x1

    return p0

    :cond_16
    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final onResume()V
    .registers 4

    invoke-super {p0}, Lltl;->onResume()V

    iget-boolean v0, p0, Lkxe;->L:Z

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    const-string v1, "night_mode_overlay_keyboard"

    iget-object v2, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2, v0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_19
    invoke-virtual {p0}, Lkxe;->K0()V

    return-void
.end method

.method public final onStart()V
    .registers 10

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-boolean v0, p0, Lkxe;->S:Z

    const/4 v1, 0x1

    if-nez v0, :cond_37

    iget-object v0, p0, Lkxe;->D:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lexe;

    iget-boolean v0, v0, Lexe;->a:Z

    if-eqz v0, :cond_37

    iput-boolean v1, p0, Lkxe;->S:Z

    new-instance v2, Lvp9;

    const v7, 0x7f140b39

    const v8, 0x7f0402b6

    const v3, 0x7f08059a

    const v4, 0x7f04029c

    const v5, 0x7f140b3a

    const v6, 0x7f140b38

    invoke-direct/range {v2 .. v8}, Lvp9;-><init>(IIIIII)V

    iget-object v0, p0, Lkxe;->B:Lz77;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, v3}, Lr22;->b(Ljjm;Lijm;)V

    :cond_37
    iget-object p0, p0, Lkxe;->A:Lxt8;

    invoke-virtual {p0, v1}, Lxt8;->S(I)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lkxe;->G:Lcr2;

    iget-object p1, p1, Lcr2;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/widget/GradientSlider;

    iget-object p2, p0, Lkxe;->t:Lixe;

    invoke-virtual {p1, p2}, Lcom/google/android/material/slider/Slider;->t0(Lw73;)V

    iget-object p1, p0, Lkxe;->G:Lcr2;

    iget-object p1, p1, Lcr2;->m:Landroid/view/View;

    check-cast p1, Lcom/opera/android/widget/GradientSlider;

    invoke-virtual {p1, p2}, Lcom/google/android/material/slider/Slider;->t0(Lw73;)V

    iget-object p1, p0, Lkxe;->G:Lcr2;

    iget-object p1, p1, Lcr2;->c:Landroid/view/View;

    check-cast p1, Lcom/opera/android/widget/ScheduleRangeSlider;

    iget-object p2, p0, Lkxe;->u:Lixe;

    invoke-virtual {p1, p2}, Lcom/google/android/material/slider/h;->t0(Lw73;)V

    iget-object p1, p0, Lkxe;->G:Lcr2;

    iget-object p1, p1, Lcr2;->c:Landroid/view/View;

    check-cast p1, Lcom/opera/android/widget/ScheduleRangeSlider;

    invoke-virtual {p1}, Lcom/google/android/material/slider/h;->C0()V

    iget-object p1, p0, Lkxe;->I:Lov0;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lfxe;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lfxe;-><init>(Lkxe;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lkxe;->G:Lcr2;

    iget-object p2, p1, Lcr2;->l:Landroid/view/View;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lfxe;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lfxe;-><init>(Lkxe;B)V

    iput-object v1, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p2, p1, Lcr2;->h:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lfxe;

    const/4 v3, 0x2

    invoke-direct {v1, p0, v3}, Lfxe;-><init>(Lkxe;B)V

    iput-object v1, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p2, p1, Lcr2;->j:Landroid/view/View;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lfxe;

    const/4 v4, 0x3

    invoke-direct {v1, p0, v4}, Lfxe;-><init>(Lkxe;B)V

    iput-object v1, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p1, Lcr2;->k:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lhxe;

    invoke-direct {p2, p0, v0}, Lhxe;-><init>(Lkxe;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lkxe;->G:Lcr2;

    iget-object p1, p1, Lcr2;->e:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lhxe;

    invoke-direct {p2, p0, v2}, Lhxe;-><init>(Lkxe;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lkxe;->G:Lcr2;

    iget-object p1, p1, Lcr2;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lhxe;

    invoke-direct {p2, p0, v3}, Lhxe;-><init>(Lkxe;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkxe;->M0()V

    new-instance p1, Lz61;

    new-instance p2, Lj21;

    invoke-direct {p2, p0, v3}, Lj21;-><init>(Ljava/lang/Object;B)V

    const/16 v0, 0xb

    invoke-direct {p1, p2, v0}, Lz61;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lkxe;->K:Lz61;

    iget-object v0, p0, Lkxe;->Q:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_aa

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_aa
    iget-object p1, p0, Lkxe;->F:Lb98;

    if-eqz p1, :cond_b1

    invoke-virtual {p0}, Lkxe;->L0()V

    :cond_b1
    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lkxe;->D:Lua7;

    return-object p0
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iput-object v2, v0, Lkxe;->Q:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050013

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    const-string v4, "Missing required view with ID: "

    const v5, 0x7f0a09ca

    const v6, 0x7f0a085f

    const v7, 0x7f0a07c4

    const/4 v8, 0x0

    const/16 v9, 0x8

    if-eqz v3, :cond_df

    iget-object v3, v0, Lkxe;->Q:Landroid/view/ViewGroup;

    const v10, 0x7f0d02e0

    invoke-virtual {v1, v10, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v3, 0x7f0a05f3

    invoke-static {v3, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v14, v11

    check-cast v14, Lcom/google/android/material/button/MaterialButton;

    if-eqz v14, :cond_ce

    invoke-static {v7, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_cc

    invoke-static {v3}, Lcr2;->a(Landroid/view/View;)Lcr2;

    move-result-object v15

    invoke-static {v6, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_ca

    invoke-static {v3}, Lvs;->b(Landroid/view/View;)Lvs;

    move-result-object v16

    invoke-static {v5, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_cf

    invoke-static {v3}, Lov0;->f(Landroid/view/View;)Lov0;

    move-result-object v17

    const v5, 0x7f0a09df

    invoke-static {v5, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v3, :cond_cf

    new-instance v12, Lb98;

    move-object v13, v10

    check-cast v13, Landroid/widget/FrameLayout;

    invoke-direct/range {v12 .. v17}, Lb98;-><init>(Landroid/widget/FrameLayout;Lcom/google/android/material/button/MaterialButton;Lcr2;Lvs;Lov0;)V

    move-object/from16 v3, v16

    move-object/from16 v4, v17

    iput-object v12, v0, Lkxe;->F:Lb98;

    iput-object v15, v0, Lkxe;->G:Lcr2;

    iput-object v3, v0, Lkxe;->H:Lvs;

    iput-object v4, v0, Lkxe;->I:Lov0;

    invoke-virtual {v14, v9}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, v0, Lkxe;->I:Lov0;

    iget-object v3, v3, Lov0;->b:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-virtual {v3, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, v0, Lkxe;->H:Lvs;

    iget-object v3, v3, Lvs;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    iget-object v6, v0, Lkxe;->H:Lvs;

    iget-object v6, v6, Lvs;->e:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    iget-object v7, v0, Lkxe;->H:Lvs;

    iget-object v7, v7, Lvs;->e:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v7}, Landroid/view/View;->getPaddingRight()I

    move-result v7

    invoke-virtual {v3, v4, v6, v7, v8}, Lcom/opera/android/ui/catalog/widget/OperaTextView;->setPadding(IIII)V

    const v3, 0x7f14096e

    iput v3, v0, Lkxe;->P:I

    iget-object v3, v0, Lkxe;->H:Lvs;

    iget-object v3, v3, Lvs;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const v4, 0x7fffffff

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v3, v0, Lkxe;->F:Lb98;

    if-eqz v3, :cond_148

    iget-object v3, v0, Lkxe;->Q:Landroid/view/ViewGroup;

    const v4, 0x7f0a010b

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {v0, v3, v5, v4}, Lltl;->q0(Landroid/view/View;ILcom/google/android/material/appbar/AppBarLayout;)V

    goto/16 :goto_148

    :cond_ca
    move v5, v6

    goto :goto_cf

    :cond_cc
    move v5, v7

    goto :goto_cf

    :cond_ce
    move v5, v3

    :cond_cf
    :goto_cf
    invoke-virtual {v10}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_df
    iget-object v3, v0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance v10, Llzb;

    const/16 v11, 0x17

    invoke-direct {v10, v0, v11}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v10}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object v3, v0, Lkxe;->Q:Landroid/view/ViewGroup;

    const v10, 0x7f0d02df

    invoke-virtual {v1, v10, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v7, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1a2

    invoke-static {v3}, Lcr2;->a(Landroid/view/View;)Lcr2;

    move-result-object v12

    const v3, 0x7f0a085e

    invoke-static {v3, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v13, v7

    check-cast v13, Lcom/google/android/material/card/MaterialCardView;

    if-eqz v13, :cond_1a0

    invoke-static {v6, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_19e

    invoke-static {v3}, Lvs;->b(Landroid/view/View;)Lvs;

    move-result-object v14

    invoke-static {v5, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1a3

    invoke-static {v3}, Lov0;->f(Landroid/view/View;)Lov0;

    move-result-object v15

    new-instance v10, Ldmd;

    move-object v11, v8

    check-cast v11, Landroid/widget/LinearLayout;

    invoke-direct/range {v10 .. v15}, Ldmd;-><init>(Landroid/widget/LinearLayout;Lcr2;Lcom/google/android/material/card/MaterialCardView;Lvs;Lov0;)V

    iput-object v10, v0, Lkxe;->E:Ldmd;

    iput-object v12, v0, Lkxe;->G:Lcr2;

    iput-object v14, v0, Lkxe;->H:Lvs;

    iput-object v15, v0, Lkxe;->I:Lov0;

    iput-object v13, v0, Lkxe;->O:Lcom/google/android/material/card/MaterialCardView;

    iget-object v3, v15, Lov0;->c:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v9}, Landroid/view/View;->setVisibility(I)V

    const v3, 0x7f14096f

    iput v3, v0, Lkxe;->P:I

    iget-object v3, v0, Lkxe;->H:Lvs;

    iget-object v3, v3, Lvs;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_148
    :goto_148
    invoke-super/range {p0 .. p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    iget-object v1, v0, Lkxe;->H:Lvs;

    iget-object v2, v1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v2, Landroid/widget/RelativeLayout;

    new-instance v3, Le73;

    const/16 v4, 0xa

    invoke-direct {v3, v0, v1, v4}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_161

    invoke-static {v1, v2, v3}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_161
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "activity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    invoke-virtual {v1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result v1

    if-eqz v1, :cond_185

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v9}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->i:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-virtual {v1, v9}, Landroid/view/View;->setVisibility(I)V

    :cond_185
    iget-object v1, v0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, v0, Lkxe;->w:Ljxe;

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    sget-object v1, Lowe;->c:Lowe;

    iget-object v2, v0, Lkxe;->x:Lxu1;

    invoke-virtual {v1, v2}, Lowe;->a(Lnwe;)V

    iget-object v1, v0, Lkxe;->J:Ldxe;

    iget-object v1, v1, Ldxe;->h:Lh7f;

    invoke-virtual {v1, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lkxe;->J0()V

    return-void

    :cond_19e
    move v5, v6

    goto :goto_1a3

    :cond_1a0
    move v5, v3

    goto :goto_1a3

    :cond_1a2
    move v5, v7

    :cond_1a3
    :goto_1a3
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 4

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0269

    invoke-static {p2, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1, p2}, Lkxe;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    return-void
.end method
