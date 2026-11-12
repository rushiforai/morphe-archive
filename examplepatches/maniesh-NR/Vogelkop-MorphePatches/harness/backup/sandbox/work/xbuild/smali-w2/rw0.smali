.class public final synthetic Lrw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcll;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lrw0;->a:B

    iput-object p1, p0, Lrw0;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final K()V
    .registers 7

    iget-byte v0, p0, Lrw0;->a:B

    const v1, 0x7f06063b

    const/4 v2, 0x1

    iget-object p0, p0, Lrw0;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_f6

    check-cast p0, Lqln;

    iget-object v0, p0, Lqln;->h:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqjn;

    iget-object v0, v0, Lqjn;->a:Lxkn;

    iget-object v0, v0, Lxkn;->b:Laln;

    invoke-interface {v0}, Laln;->a()Z

    move-result v0

    if-eqz v0, :cond_29

    new-instance v0, Lvk2;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lvk2;-><init>(B)V

    invoke-virtual {p0, v0, v2}, Lqln;->a(Lcom/opera/api/Callback;I)V

    :cond_29
    return-void

    :pswitch_2a
    check-cast p0, Lt59;

    invoke-virtual {p0}, Lt59;->c()V

    return-void

    :pswitch_30
    check-cast p0, Lnxa;

    iget-object v0, p0, Lnxa;->a:Landroid/content/Context;

    invoke-static {v0}, Lui6;->o(Landroid/content/Context;)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {p0, v3, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    new-instance v1, Lw3a;

    const v4, 0x7f0803ec

    invoke-static {v4, v0}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const v5, 0x7f0402af

    invoke-static {v5, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    invoke-static {v4, v0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    const/16 v0, 0x11

    invoke-direct {v1, v4, v0, v3}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    invoke-virtual {p0, v2, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_5b
    check-cast p0, Lowa;

    iget-object v0, p0, Lowa;->b:Landroid/graphics/drawable/ShapeDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    iget-object p0, p0, Lowa;->a:Landroid/content/Context;

    const v3, 0x7f0402f4

    invoke-static {v3, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v2, p0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_73
    check-cast p0, Lw04;

    iget-object v0, p0, Lw04;->b:Lx05;

    iget-object p0, p0, Lw04;->a:Landroid/content/Context;

    sget-object v2, Lwz3;->a:Lixh;

    invoke-virtual {v2, p0}, Ly7h;->l(Landroid/content/Context;)F

    move-result v2

    iget-object v3, v0, Lx05;->a:Lu05;

    iput v2, v3, Lu05;->h:F

    iget-object v3, v3, Lu05;->b:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    const v2, 0x7f0402d7

    invoke-static {v2, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    filled-new-array {p0}, [I

    move-result-object p0

    invoke-virtual {v0, p0}, Lx05;->b([I)V

    return-void

    :pswitch_9a
    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {p0}, Lf03;->f(Landroid/app/Activity;)V

    return-void

    :pswitch_a2
    check-cast p0, Lbp3;

    invoke-virtual {p0, v2}, Lbp3;->i(Z)V

    return-void

    :pswitch_a8
    check-cast p0, Lx22;

    iget-object v0, p0, Lx22;->b:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_ee

    invoke-virtual {p0, v0}, Lx22;->g(Lb2l;)Lv22;

    move-result-object p0

    if-eqz p0, :cond_ee

    iget-object v0, p0, Lv22;->f:Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->e:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-eqz v0, :cond_ee

    iget-object p0, p0, Lv22;->h:Lr22;

    if-eqz p0, :cond_ee

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    if-eqz p0, :cond_ee

    iget-object p0, p0, Lvsn;->c:Ls62;

    iget-object p0, p0, Ls62;->y:Leyi;

    iget-object v0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Lkze;

    iget-object v1, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    iget-boolean p0, p0, Leyi;->b:Z

    if-eqz p0, :cond_df

    const-string p0, "ofa-private-mode"

    goto :goto_eb

    :cond_df
    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    iget-object p0, p0, Lg7j;->d:Ljava/lang/String;

    const-string v1, "ofa-"

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_eb
    invoke-static {v0, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    :cond_ee
    return-void

    :pswitch_ef
    check-cast p0, Ligi;

    invoke-virtual {p0}, Ligi;->A0()V

    return-void

    nop

    :pswitch_data_f6
    .packed-switch 0x0
        :pswitch_ef
        :pswitch_a8
        :pswitch_a2
        :pswitch_9a
        :pswitch_73
        :pswitch_5b
        :pswitch_30
        :pswitch_2a
    .end packed-switch
.end method
