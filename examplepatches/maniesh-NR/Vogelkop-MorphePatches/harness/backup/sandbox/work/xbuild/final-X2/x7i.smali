.class public final synthetic Lx7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/RootView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/RootView;B)V
    .registers 3

    iput-byte p2, p0, Lx7i;->a:B

    iput-object p1, p0, Lx7i;->b:Lcom/opera/android/RootView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    iget-byte v0, p0, Lx7i;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lx7i;->b:Lcom/opera/android/RootView;

    packed-switch v0, :pswitch_data_10c

    invoke-virtual {p0}, Lcom/opera/android/RootView;->requestLayout()V

    return-void

    :pswitch_c
    sget v0, Lcom/opera/android/RootView;->D:I

    invoke-virtual {p0}, Lcom/opera/android/RootView;->f()V

    return-void

    :pswitch_12
    iget-object v0, p0, Lcom/opera/android/RootView;->j:Lqwe;

    sget v2, Lcom/opera/android/RootView;->D:I

    iget-object v2, p0, Lcom/opera/android/RootView;->x:Lc1f;

    iput-boolean v1, p0, Lcom/opera/android/RootView;->A:Z

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_f9

    iget-object v3, p0, Lcom/opera/android/RootView;->z:Lmcj;

    if-eqz v3, :cond_f9

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v3, v3, Lmcj;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/Window;

    const/16 v5, 0x1e

    if-ge v4, v5, :cond_34

    iget-boolean v4, p0, Lcom/opera/android/RootView;->m:Z

    invoke-static {v3, v4}, Locp;->p(Landroid/view/Window;Z)V

    goto :goto_3b

    :cond_34
    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    const/4 v4, 0x3

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    :goto_3b
    invoke-virtual {v2}, Lc1f;->h()V

    iget-object v3, v2, Lc1f;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/high16 v5, -0x1000000

    move v7, v1

    move v6, v5

    :goto_4a
    if-ge v7, v4, :cond_5f

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lgck;

    iget-object v8, v8, Lgck;->a:Lfck;

    invoke-interface {v8}, Lfck;->b()I

    move-result v8

    invoke-static {v6, v8}, Lp37;->r(II)I

    move-result v6

    goto :goto_4a

    :cond_5f
    iget-object v4, v0, Lqwe;->a:Lbp;

    iget v4, v4, Lbp;->a:I

    invoke-static {v6, v4}, Lp37;->X(II)I

    move-result v4

    iget v6, p0, Lcom/opera/android/RootView;->p:I

    if-eqz v6, :cond_92

    iget v5, p0, Lcom/opera/android/RootView;->s:I

    invoke-virtual {v2}, Lc1f;->h()V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v6, v1

    :goto_75
    if-ge v6, v2, :cond_8a

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lgck;

    iget-object v7, v7, Lgck;->a:Lfck;

    invoke-interface {v7}, Lfck;->a()I

    move-result v7

    invoke-static {v5, v7}, Lp37;->r(II)I

    move-result v5

    goto :goto_75

    :cond_8a
    iget-object v0, v0, Lqwe;->a:Lbp;

    iget v0, v0, Lbp;->a:I

    invoke-static {v5, v0}, Lp37;->X(II)I

    move-result v5

    :cond_92
    iget-object v0, p0, Lcom/opera/android/RootView;->z:Lmcj;

    invoke-static {v4}, Lp37;->u0(I)Z

    move-result v2

    invoke-virtual {v0, v2}, Lmcj;->t(Z)V

    invoke-static {v5}, Lp37;->u0(I)Z

    move-result v0

    iget-object v2, p0, Lcom/opera/android/RootView;->z:Lmcj;

    invoke-virtual {v2, v0}, Lmcj;->r(Z)V

    iget v0, p0, Lcom/opera/android/RootView;->o:I

    if-eqz v0, :cond_a9

    move v4, v1

    :cond_a9
    iget-object v0, p0, Lcom/opera/android/RootView;->z:Lmcj;

    iget-object v2, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/Window;

    invoke-virtual {v2}, Landroid/view/Window;->getStatusBarColor()I

    move-result v3

    if-eq v4, v3, :cond_bb

    invoke-virtual {v2, v4}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v0}, Lmcj;->j()V

    :cond_bb
    iget-object v0, p0, Lcom/opera/android/RootView;->z:Lmcj;

    iget-object v2, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/Window;

    invoke-virtual {v2}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v3

    if-eqz v3, :cond_cd

    invoke-virtual {v2, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-virtual {v0}, Lmcj;->j()V

    :cond_cd
    iget-object v0, p0, Lcom/opera/android/RootView;->z:Lmcj;

    iget-object v2, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/Window;

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v4, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v5, -0x80000000

    and-int/2addr v4, v5

    const/4 v6, 0x1

    if-eq v4, v5, :cond_e3

    invoke-virtual {v2, v5}, Landroid/view/Window;->addFlags(I)V

    move v1, v6

    :cond_e3
    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v4, 0xc000000

    and-int/2addr v3, v4

    if-eqz v3, :cond_ee

    invoke-virtual {v2, v4}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_ef

    :cond_ee
    move v6, v1

    :goto_ef
    if-eqz v6, :cond_f9

    invoke-virtual {v0}, Lmcj;->j()V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    :cond_f9
    return-void

    :pswitch_fa
    sget v0, Lcom/opera/android/RootView;->D:I

    invoke-virtual {p0}, Lcom/opera/android/RootView;->e()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_103
    iput-boolean v1, p0, Lcom/opera/android/RootView;->h:Z

    iget-object p0, p0, Lcom/opera/android/RootView;->i:Lx7i;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_103
        :pswitch_fa
        :pswitch_12
        :pswitch_c
    .end packed-switch
.end method
