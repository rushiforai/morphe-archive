.class public Le/e/a/a3$t;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Le/e/a/l3/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/a3;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Le/e/a/a3;


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .registers 5

    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 1
    iget-boolean v0, p1, Le/e/a/a3;->B0:Z

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object p1, p1, Le/e/a/a3;->x1:Landroid/view/View;

    const v0, 0x7f0800ea

    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :try_start_17
    sget p1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->N:I

    if-eqz p1, :cond_96

    iget-object v0, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 4
    iget v0, v0, Le/e/a/a3;->k0:I

    if-nez v0, :cond_26

    .line 5
    iget-object v0, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 6
    invoke-virtual {v0, p1}, Le/e/a/a3;->f(I)V

    .line 7
    :cond_26
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->P:Z

    .line 8
    iput-boolean v0, p1, Le/e/a/a3;->G1:Z

    .line 9
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 10
    iget-boolean p1, p1, Le/e/a/a3;->G1:Z

    if-eqz p1, :cond_3d

    .line 11
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 12
    iget-object p1, p1, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v0, 0x7f070195

    .line 13
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_47

    :cond_3d
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 14
    iget-object p1, p1, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v0, 0x7f070196

    .line 15
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :goto_47
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->Q:Z

    .line 16
    iput-boolean v0, p1, Le/e/a/a3;->C0:Z

    .line 17
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 18
    iget-boolean p1, p1, Le/e/a/a3;->C0:Z

    if-eqz p1, :cond_5e

    .line 19
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 20
    iget-object p1, p1, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v0, 0x7f070073

    .line 21
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_68

    :cond_5e
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 22
    iget-object p1, p1, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v0, 0x7f070072

    .line 23
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :goto_68
    iget-object p1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 24
    iget-boolean p1, p1, Le/e/a/a3;->J0:Z

    if-eqz p1, :cond_6f

    return-void

    .line 25
    :cond_6f
    sget p1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->O:I

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->P:Z

    if-eqz v0, :cond_96

    iget-object v0, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 26
    iget v0, v0, Le/e/a/a3;->k0:I

    if-le v0, p1, :cond_96

    .line 27
    iget-object v0, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 28
    iget-object v0, v0, Le/e/a/a3;->u1:Landroid/widget/TextView;

    .line 29
    iget-object v1, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    div-int/lit16 v2, p1, 0x3e8

    invoke-static {v1, v2}, Le/e/a/a3;->a(Le/e/a/a3;I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/a3$t;->a:Le/e/a/a3;

    .line 30
    iget-object v0, v0, Le/e/a/a3;->b0:Landroid/widget/SeekBar;

    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V
    :try_end_91
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_91} :catch_92

    goto :goto_96

    :catch_92
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_96
    :goto_96
    return-void
.end method
