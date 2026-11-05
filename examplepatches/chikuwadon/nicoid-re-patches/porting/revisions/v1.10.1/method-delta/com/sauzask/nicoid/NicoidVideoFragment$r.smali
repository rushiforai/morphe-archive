.class public Lcom/sauzask/nicoid/NicoidVideoFragment$r;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Le/e/a/l3/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoFragment;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .registers 7

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-boolean v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->z0:Z

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v0, 0x7f0800ea

    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :try_start_17
    sget p1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->N:I

    if-eqz p1, :cond_9d

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 4
    iget-wide v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2a

    .line 5
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 6
    invoke-virtual {v0, p1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->f(I)V

    .line 7
    :cond_2a
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->P:Z

    .line 8
    iput-boolean v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->G1:Z

    .line 9
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 10
    iget-boolean p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->G1:Z

    if-eqz p1, :cond_41

    .line 11
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 12
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v0, 0x7f070195

    .line 13
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_4b

    :cond_41
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 14
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v0, 0x7f070196

    .line 15
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :goto_4b
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->Q:Z

    .line 16
    iput-boolean v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A0:Z

    .line 17
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 18
    iget-boolean p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A0:Z

    if-eqz p1, :cond_62

    .line 19
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 20
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v0, 0x7f070073

    .line 21
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_6c

    :cond_62
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 22
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v0, 0x7f070072

    .line 23
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :goto_6c
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 24
    iget-boolean p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->H0:Z

    if-eqz p1, :cond_73

    return-void

    .line 25
    :cond_73
    sget p1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->O:I

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->P:Z

    if-eqz v0, :cond_9d

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 26
    iget-wide v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    int-to-long v2, p1

    cmp-long v4, v0, v2

    if-lez v4, :cond_9d

    .line 27
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 28
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->u1:Landroid/widget/TextView;

    .line 29
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    div-int/lit16 v2, p1, 0x3e8

    invoke-static {v1, v2}, Lcom/sauzask/nicoid/NicoidVideoFragment;->a(Lcom/sauzask/nicoid/NicoidVideoFragment;I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$r;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 30
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_98} :catch_99

    goto :goto_9d

    :catch_99
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_9d
    :goto_9d
    return-void
.end method
