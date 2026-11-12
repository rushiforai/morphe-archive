.class public final synthetic Lo4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lc5k;


# direct methods
.method public synthetic constructor <init>(Lc5k;B)V
    .registers 3

    iput-byte p2, p0, Lo4k;->a:B

    iput-object p1, p0, Lo4k;->b:Lc5k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 10

    iget-byte v0, p0, Lo4k;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lo4k;->b:Lc5k;

    packed-switch v0, :pswitch_data_136

    check-cast p1, Lf8k;

    iget-object v0, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    iget-object v2, p0, Lc5k;->R:Lq9b;

    iget-object v3, p1, Lf8k;->g:Lrmn;

    if-eqz v3, :cond_8c

    iget-object v4, v3, Lrmn;->b:Llkn;

    iget-object v5, p0, Lc5k;->U:Lpde;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lf8k;

    iget-object v5, v5, Lf8k;->h:Leyh;

    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Lq9b;->a(Landroid/graphics/drawable/Drawable;)V

    if-eqz v5, :cond_32

    new-instance v6, Landroid/graphics/drawable/LayerDrawable;

    const/4 v7, 0x2

    new-array v7, v7, [Landroid/graphics/drawable/Drawable;

    aput-object v4, v7, v1

    const/4 v1, 0x1

    aput-object v5, v7, v1

    invoke-direct {v6, v7}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    move-object v4, v6

    :cond_32
    invoke-virtual {v2, v4}, Lq9b;->a(Landroid/graphics/drawable/Drawable;)V

    iget v1, v3, Lrmn;->f:I

    iget-object v4, v2, Lq9b;->d:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getColor()I

    move-result v5

    if-eq v1, v5, :cond_45

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_45
    iget v1, v3, Lrmn;->d:I

    iget v2, v0, Lcom/opera/android/browser/OperaPageRootView;->f:I

    if-eq v1, v2, :cond_57

    iput v1, v0, Lcom/opera/android/browser/OperaPageRootView;->f:I

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    iget-object v1, v0, Lcom/opera/android/browser/OperaPageRootView;->e:Lc1f;

    if-eqz v1, :cond_57

    invoke-virtual {v1}, Lc1f;->e()V

    :cond_57
    iget v1, v3, Lrmn;->g:I

    iget v2, p1, Lf8k;->i:I

    invoke-static {v1, v2}, Lp37;->r(II)I

    move-result v1

    iget v2, v0, Lcom/opera/android/browser/OperaPageRootView;->g:I

    if-eq v1, v2, :cond_6f

    iput v1, v0, Lcom/opera/android/browser/OperaPageRootView;->g:I

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    iget-object v0, v0, Lcom/opera/android/browser/OperaPageRootView;->e:Lc1f;

    if-eqz v0, :cond_6f

    invoke-virtual {v0}, Lc1f;->e()V

    :cond_6f
    iget-object v0, p0, Lc5k;->W:Lkze;

    invoke-virtual {p0}, Lc5k;->d()Lvr8;

    move-result-object v1

    invoke-static {v0, v1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lc5k;->k()V

    iget-object p1, p1, Lf8k;->j:Lq8l;

    iget-object v0, p0, Lc5k;->c0:Lq8l;

    invoke-virtual {p1, v0}, Lq8l;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8c

    iput-object p1, p0, Lc5k;->c0:Lq8l;

    iget-object p0, p0, Lc5k;->K:Lh5k;

    invoke-virtual {p0, p1}, Lh5k;->b(Lq8l;)V

    :cond_8c
    return-void

    :pswitch_8d
    check-cast p1, Lqjn;

    iget-object p0, p0, Lc5k;->b0:Lks3;

    iput-object p1, p0, Lks3;->d:Ljava/lang/Object;

    iget-object v0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {p0}, Lks3;->m()Lrmn;

    move-result-object v1

    iget-object v2, v1, Lrmn;->c:Llkn;

    new-instance v3, Ltmn;

    invoke-direct {v3, p0, p1}, Ltmn;-><init>(Lks3;Lqjn;)V

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p1, p1, Lqjn;->a:Lxkn;

    iget-object p1, p1, Lxkn;->c:Ljava/lang/String;

    iput-object p1, p0, Lks3;->e:Ljava/lang/Object;

    invoke-virtual {p0}, Lks3;->r()V

    return-void

    :pswitch_b2
    check-cast p1, Lmnf;

    invoke-virtual {p0, p1}, Lc5k;->a(Lmnf;)V

    return-void

    :pswitch_b8
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0}, Lc5k;->i()V

    return-void

    :pswitch_be
    check-cast p1, Lrmn;

    iget-object v0, p0, Lc5k;->W:Lkze;

    invoke-virtual {p0}, Lc5k;->d()Lvr8;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lc5k;->j(Lrmn;)V

    return-void

    :pswitch_cd
    check-cast p1, Llue;

    iget-object v0, p0, Lc5k;->k:Lnue;

    invoke-interface {v0}, Lnue;->getVisibility()Lize;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llue;

    invoke-virtual {v0}, Llue;->d()Z

    move-result v0

    iget-object v2, p0, Lc5k;->r:Lcom/opera/android/feed/FeedContainerView;

    if-eqz v0, :cond_ec

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lc5k;->L:Lx4k;

    invoke-virtual {v0}, Lx4k;->j()V

    goto :goto_f1

    :cond_ec
    const/16 v0, 0x8

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_f1
    iget-object v0, p0, Lc5k;->J:Lv4k;

    invoke-virtual {v0}, Lv4k;->b()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Llue;->b:Llue;

    if-ne p1, v0, :cond_102

    iget-object v1, p0, Lc5k;->P:Lb5k;

    invoke-virtual {v1}, Lb5k;->b()V

    :cond_102
    iget-boolean v1, p0, Lc5k;->a0:Z

    if-eqz v1, :cond_123

    if-ne p1, v0, :cond_123

    iget-object p0, p0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "startpage.feed_category_id"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v0, "startpage.feed_category_backend"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_123
    return-void

    :pswitch_124
    check-cast p1, Llo3;

    iget-object p1, p0, Lc5k;->b0:Lks3;

    iget-object p1, p1, Lks3;->h:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrmn;

    invoke-virtual {p0, p1}, Lc5k;->j(Lrmn;)V

    return-void

    :pswitch_data_136
    .packed-switch 0x0
        :pswitch_124
        :pswitch_cd
        :pswitch_be
        :pswitch_b8
        :pswitch_b2
        :pswitch_8d
    .end packed-switch
.end method
