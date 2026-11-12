.class public final Lju2;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lx5f;Lx5f;Lcom/opera/android/Lazy;Ly7f;Lr1;Ltzn;)V
    .registers 12

    const/4 v0, 0x1

    iput-byte v0, p0, Lju2;->a:B

    iget-object v0, p2, Lx5f;->d:Lzpa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lju2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lju2;->c:Ljava/lang/Object;

    iput-object p3, p0, Lju2;->d:Ljava/lang/Object;

    instance-of p3, p5, Lv7f;

    const/16 v1, 0x4b

    const-string v2, "wallpaper_current"

    if-eqz p3, :cond_cb

    check-cast p5, Lv7f;

    iget-object p3, p5, Lv7f;->a:Lf7j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "app_theme"

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    invoke-virtual {p1, p3, v3}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object p3, p5, Lv7f;->c:Lg7j;

    if-eqz p3, :cond_33

    const-string v3, "app_theme_accent"

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    invoke-virtual {p1, p3, v3}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    :cond_33
    if-eqz p6, :cond_39

    iget-object p3, p6, Lr1;->a:Ljava/lang/String;

    if-nez p3, :cond_3b

    :cond_39
    iget-object p3, p5, Lv7f;->b:Ljava/lang/String;

    :cond_3b
    invoke-virtual {p1, v2}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-boolean p6, p2, Lx5f;->h:Z

    if-eqz p6, :cond_51

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p6

    invoke-virtual {p6, v0}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v0

    invoke-virtual {v0, v1, p1}, Lb66;->D(ILjava/lang/String;)V

    invoke-virtual {p2, p6}, Lx5f;->U0(Lx56;)V

    :cond_51
    if-eqz p3, :cond_6b

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_6b

    invoke-virtual {p4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqln;

    new-instance p2, Lsu;

    const/16 p6, 0x13

    invoke-direct {p2, p0, p3, p7, p6}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-virtual {p1, p3, p0, p2}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    goto :goto_6e

    :cond_6b
    invoke-virtual {p7}, Ltzn;->invoke()Ljava/lang/Object;

    :goto_6e
    invoke-virtual {p4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqln;

    iget-boolean p1, p5, Lv7f;->d:Z

    iget-object p0, p0, Lqln;->o:Lagm;

    iget-object p2, p0, Lagm;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/settings/SettingsManager;

    iget-object p3, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p3, Lru9;

    const-string p4, "wallpaper_rotation_enabled"

    invoke-virtual {p2, p1, p4}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    iget-object p2, p2, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p2, p4}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_b7

    const-string p2, "wallpaper.rotation.timestamp"

    if-eqz p1, :cond_a4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p5

    invoke-virtual {p3}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object p3, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast p3, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p3, p2, p5, p6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    goto :goto_b7

    :cond_a4
    invoke-virtual {p3}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object p3, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast p3, Landroid/content/SharedPreferences$Editor;

    const-wide p5, 0x7fffffffffffffffL

    invoke-interface {p3, p2, p5, p6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_b7
    :goto_b7
    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p0, Lonn;

    iget-object p1, p0, Lonn;->f:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p1, p4}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {p0, p2, p1}, Lonn;->d(ZZ)V

    goto :goto_f5

    :cond_cb
    instance-of p0, p5, Lw7f;

    if-nez p0, :cond_dc

    sget-object p0, Lx7f;->a:Lx7f;

    invoke-static {p5, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_dc

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    throw p0

    :cond_dc
    invoke-virtual {p1, v2}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iget-boolean p1, p2, Lx5f;->h:Z

    if-eqz p1, :cond_f2

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v0}, Lx56;->F(Lzpa;)Lb66;

    move-result-object p3

    invoke-virtual {p3, v1, p0}, Lb66;->D(ILjava/lang/String;)V

    invoke-virtual {p2, p1}, Lx5f;->U0(Lx56;)V

    :cond_f2
    invoke-virtual {p7}, Ltzn;->invoke()Ljava/lang/Object;

    :goto_f5
    return-void
.end method

.method public constructor <init>(Ldyf;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Lju2;->a:B

    .line 252
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 253
    iput-object p1, p0, Lju2;->d:Ljava/lang/Object;

    .line 254
    new-instance v0, Lj25;

    const/4 v1, 0x3

    invoke-direct {v0, p1, v1}, Lj25;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lju2;->c:Ljava/lang/Object;

    .line 255
    new-instance v0, Layf;

    invoke-direct {v0, p1}, Layf;-><init>(Ldyf;)V

    iput-object v0, p0, Lju2;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 256
    iput-byte p3, p0, Lju2;->a:B

    iput-object p1, p0, Lju2;->c:Ljava/lang/Object;

    iput-object p2, p0, Lju2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 246
    iput-byte p4, p0, Lju2;->a:B

    iput-object p1, p0, Lju2;->c:Ljava/lang/Object;

    iput-object p2, p0, Lju2;->b:Ljava/lang/Object;

    iput-object p3, p0, Lju2;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lt5d;Lx5f;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Lju2;->a:B

    .line 247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 248
    iput-object p1, p0, Lju2;->b:Ljava/lang/Object;

    .line 249
    const-string v0, "window"

    invoke-virtual {p1, v0}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lju2;->d:Ljava/lang/Object;

    .line 250
    iput-object p2, p0, Lju2;->c:Ljava/lang/Object;

    .line 251
    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method private final S(Lndc;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final R(Lmp0;Ljava/lang/String;)V
    .registers 9

    iget-object p0, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lmb0;

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x0

    invoke-virtual {v2, p1, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Lx56;->z(Lzpa;)Lq56;

    move-result-object p1

    const/16 p2, 0x14

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_35

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_35

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_42

    :cond_35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, p2, v3, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_42
    invoke-virtual {v3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 12

    iget-byte v0, p0, Lju2;->a:B

    iget-object v1, p0, Lju2;->c:Ljava/lang/Object;

    iget-object v2, p0, Lju2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ee

    return-void

    :pswitch_a
    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    iget-object p0, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/WindowManager;

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    invoke-static {}, Li0l;->g()Z

    move-result p0

    if-eqz p0, :cond_2f

    sget-object p0, Loe0;->d:Loe0;

    goto :goto_3c

    :cond_2f
    check-cast v2, Lt5d;

    invoke-static {v2}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_3a

    sget-object p0, Loe0;->c:Loe0;

    goto :goto_3c

    :cond_3a
    sget-object p0, Loe0;->b:Loe0;

    :goto_3c
    check-cast v1, Lx5f;

    iget v2, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iget-object v3, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->y(Lzpa;)Lra0;

    move-result-object v3

    const/16 v5, 0xc

    invoke-virtual {v3, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgp0;

    const/4 v7, 0x4

    const/4 v8, 0x1

    if-nez v6, :cond_6b

    new-instance v6, Lgp0;

    const/16 v9, 0x98b

    invoke-direct {v6, v9, v8, v7}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v5, v8, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v3, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lgp0;

    :cond_6b
    const/4 v3, 0x2

    const/4 v5, -0x1

    invoke-virtual {v6, v3, v5, v2}, Ljf0;->o(III)V

    invoke-virtual {v6, v8, v5, p1}, Ljf0;->o(III)V

    new-instance p1, Ldf0;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-direct {p1, v5, v0, v7}, Ldf0;-><init>(ILjava/lang/Object;B)V

    iget-object v0, v6, Ljf0;->d:[Ldf0;

    const/4 v2, 0x0

    aput-object p1, v0, v2

    const/4 p1, 0x3

    invoke-virtual {v6, p1, v8, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v4}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_89
    new-instance v0, Ls2i;

    check-cast v1, Ly3i;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Ls2i;-><init>(Ly3i;Lddc;)V

    iput-object v0, p0, Lju2;->d:Ljava/lang/Object;

    check-cast v2, Lq82;

    iget-object p0, v2, Lq82;->a:Lh7f;

    invoke-virtual {p0, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void

    :pswitch_a2
    iget-object p0, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p0, Ldyf;

    iget-object p1, p0, Ldyf;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v0

    check-cast v2, Layf;

    invoke-virtual {v0, v2}, Lfue;->b(Ldue;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    check-cast v1, Lj25;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    sget-object v0, Lhte;->k:Lite;

    invoke-static {p1}, Lna2;->w(Landroid/content/Context;)Lhte;

    move-result-object v0

    iget-object v1, p0, Ldyf;->c:Lud7;

    invoke-virtual {v0, v1}, Lno7;->g(Lmo7;)V

    sget-object v0, Lbqe;->k:Lcqe;

    invoke-static {p1}, Luup;->r(Landroid/content/Context;)Lbqe;

    move-result-object p1

    invoke-virtual {p1, v1}, Lno7;->g(Lmo7;)V

    invoke-virtual {p0}, Ldyf;->d()V

    return-void

    :pswitch_e0
    check-cast v1, Lw6f;

    invoke-interface {v1, v2}, Lw6f;->F(Ljava/lang/Object;)V

    iget-object p0, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_ee
    .packed-switch 0x3
        :pswitch_e0
        :pswitch_a2
        :pswitch_89
        :pswitch_a
    .end packed-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 6

    iget-byte v0, p0, Lju2;->a:B

    iget-object v1, p0, Lju2;->c:Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lju2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_a6

    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :pswitch_e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v3, Lq82;

    iget-object p0, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p0, Ls2i;

    if-eqz p0, :cond_1e

    move-object v2, p0

    :cond_1e
    iget-object p0, v3, Lq82;->a:Lh7f;

    invoke-virtual {p0, v2}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void

    :pswitch_24
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p0, Ldyf;

    iget-object p1, p0, Ldyf;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v0

    check-cast v3, Layf;

    invoke-virtual {v0, v3}, Lfue;->e(Ldue;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    check-cast v1, Lj25;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    sget-object v0, Lhte;->k:Lite;

    invoke-static {p1}, Lna2;->w(Landroid/content/Context;)Lhte;

    move-result-object v0

    iget-object v1, p0, Ldyf;->c:Lud7;

    invoke-virtual {v0, v1}, Lno7;->p(Lmo7;)V

    sget-object v0, Lbqe;->k:Lcqe;

    invoke-static {p1}, Luup;->r(Landroid/content/Context;)Lbqe;

    move-result-object p1

    invoke-virtual {p1, v1}, Lno7;->p(Lmo7;)V

    iget-object p1, p0, Ldyf;->f:Lcue;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_7b

    iget-object p1, p0, Ldyf;->h:Lc6j;

    if-eqz p1, :cond_7b

    iget-object v0, p0, Ldyf;->d:Lbyf;

    iget-object p1, p1, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iput-object v2, p0, Ldyf;->h:Lc6j;

    :cond_7b
    sget-object p1, Lcue;->b:Lcue;

    iput-object p1, p0, Ldyf;->f:Lcue;

    iget-object p0, p0, Ldyf;->b:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_97

    check-cast p0, Lp0c;

    iget-object p1, p0, Lp0c;->a:Lbqe;

    iget-object v0, p0, Lp0c;->e:Lud7;

    invoke-virtual {p1, v0}, Lno7;->p(Lmo7;)V

    iget-object p1, p0, Lp0c;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lp0c;->f:Ls9;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    :cond_97
    return-void

    :pswitch_98
    check-cast v1, Lw6f;

    invoke-interface {v1, v3}, Lw6f;->H(Ljava/lang/Object;)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void

    nop

    :pswitch_data_a6
    .packed-switch 0x3
        :pswitch_98
        :pswitch_24
        :pswitch_e
    .end packed-switch
.end method

.method public final onPause(Lndc;)V
    .registers 2

    iget-byte p0, p0, Lju2;->a:B

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 4

    iget-byte p1, p0, Lju2;->a:B

    packed-switch p1, :pswitch_data_44

    :pswitch_5
    return-void

    :pswitch_6
    iget-object p1, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p1, Lv1a;

    new-instance v0, Ly0a;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lv1a;->a(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_14
    iget-object p1, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/autofill/PasswordManager;

    if-nez p1, :cond_21

    new-instance p1, Lcom/opera/android/autofill/PasswordManager;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lju2;->d:Ljava/lang/Object;

    :cond_21
    invoke-static {}, LJ/N;->MaxktGXn()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_38

    iget-object p1, p0, Lju2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/autofill/PasswordManager;

    new-instance v1, Liu2;

    invoke-direct {v1, p0, v0}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, LJ/N;->MNdH5xQ5(Ljava/lang/Object;)V

    goto :goto_42

    :cond_38
    const/4 p1, 0x0

    iput-object p1, p0, Lju2;->d:Ljava/lang/Object;

    iget-object p0, p0, Lju2;->c:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0, v0, v0}, Lx5f;->C(ZZZ)V

    :goto_42
    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_14
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
