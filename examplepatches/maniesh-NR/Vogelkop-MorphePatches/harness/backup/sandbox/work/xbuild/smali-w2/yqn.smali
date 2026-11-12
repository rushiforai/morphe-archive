.class public final synthetic Lyqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrn;


# direct methods
.method public synthetic constructor <init>(Lmrn;B)V
    .registers 3

    iput-byte p2, p0, Lyqn;->a:B

    iput-object p1, p0, Lyqn;->b:Lmrn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lyqn;->a:B

    iget-object p0, p0, Lyqn;->b:Lmrn;

    packed-switch v0, :pswitch_data_6e

    iget-object p0, p0, Lmrn;->p:Lkrn;

    sget-object v0, Ldrn;->j:Ldrn;

    invoke-interface {p0, v0}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_f
    iget-object p0, p0, Lmrn;->m:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_17
    iget-object v0, p0, Lmrn;->o:Lcrn;

    invoke-virtual {p0}, Lmrn;->e()Z

    move-result v1

    if-eqz v1, :cond_6d

    iget-object v1, p0, Lmrn;->d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v2, p0, Lmrn;->c:Landroid/view/View;

    invoke-static {v2}, Lmrn;->f(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_2b

    move-object v4, v2

    goto :goto_35

    :cond_2b
    invoke-static {v1}, Lmrn;->f(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_33

    :goto_31
    move-object v4, v1

    goto :goto_35

    :cond_33
    const/4 v1, 0x0

    goto :goto_31

    :goto_35
    if-eqz v4, :cond_6d

    invoke-interface {v0}, Lcrn;->j()Lrn9;

    move-result-object v1

    invoke-interface {v0}, Lcrn;->b()Landroid/view/ViewGroup;

    move-result-object v3

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    new-instance v7, Lsxh;

    const v5, 0x7f1410e7

    invoke-direct {v7, v5, v2}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    const/high16 v2, 0x41000000    # 8.0f

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v2, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    new-instance v2, Lqba;

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v6, 0x3

    const v9, 0x7f0d004c

    const/4 v11, 0x1

    invoke-direct/range {v2 .. v11}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    new-instance v3, Llrn;

    invoke-direct {v3, p0, v1}, Llrn;-><init>(Lmrn;Lrn9;)V

    new-instance p0, Lsba;

    invoke-direct {p0, v2}, Lsba;-><init>(Lqba;)V

    invoke-interface {v0, p0, v3}, Lcrn;->m(Lsba;Llrn;)V

    :cond_6d
    return-void

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
