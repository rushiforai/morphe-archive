.class public final Lvvm;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;

.field public final synthetic n:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    iput-byte p6, p0, Lvvm;->i:B

    iput-object p1, p0, Lvvm;->j:Ljava/lang/Object;

    iput-object p2, p0, Lvvm;->k:Ljava/lang/Object;

    iput-object p3, p0, Lvvm;->l:Ljava/lang/Object;

    iput-object p4, p0, Lvvm;->m:Ljava/lang/Object;

    iput-object p5, p0, Lvvm;->n:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lvvm;->i:B

    iget-object v1, p0, Lvvm;->m:Ljava/lang/Object;

    iget-object v2, p0, Lvvm;->l:Ljava/lang/Object;

    iget-object v3, p0, Lvvm;->k:Ljava/lang/Object;

    iget-object v4, p0, Lvvm;->j:Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object p0, p0, Lvvm;->n:Ljava/lang/Object;

    const/4 v6, 0x1

    packed-switch v0, :pswitch_data_fa

    check-cast p0, Ly13;

    check-cast v4, Llqh;

    iget-boolean v0, v4, Llqh;->a:Z

    if-eqz v0, :cond_92

    check-cast v3, Lguo;

    iget-boolean v0, v3, Lguo;->q:Z

    if-eqz v0, :cond_92

    iget-object v0, v3, Lguo;->l:Llzo;

    if-eqz v0, :cond_92

    check-cast v2, Llqh;

    iget-boolean v3, v2, Llqh;->a:Z

    if-nez v3, :cond_92

    iput-boolean v6, v2, Llqh;->a:Z

    iget-object v0, v0, Llzo;->a:La3p;

    check-cast v1, Lguo;

    if-eqz v1, :cond_37

    iget-object v1, v1, Lguo;->l:Llzo;

    if-eqz v1, :cond_37

    iget-object v5, v1, Llzo;->a:La3p;

    :cond_37
    if-eqz v5, :cond_8d

    new-instance v1, Lqqo;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v5, p0}, Landroid/view/View;->setVisibility(I)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v5, v2}, Landroid/view/View;->setAlpha(F)V

    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v3, 0x2

    new-array v4, v3, [F

    fill-array-data v4, :array_100

    const-string v7, "alpha"

    invoke-static {v0, v7, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v8, 0x12c

    invoke-virtual {v0, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    new-array v4, v3, [F

    fill-array-data v4, :array_108

    invoke-static {v5, v7, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    new-array v3, v3, [Landroid/animation/Animator;

    aput-object v0, v3, p0

    aput-object v4, v3, v6

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    new-instance v0, Lal9;

    const/4 v3, 0x7

    invoke-direct {v0, v3, v5, v1, p0}, Lal9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_92

    :cond_8d
    if-eqz p0, :cond_92

    invoke-virtual {p0}, Ly13;->invoke()Ljava/lang/Object;

    :cond_92
    :goto_92
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_95
    invoke-static {}, Lcom/usercentrics/sdk/UsercentricsBanner;->access$getActiveDialog$cp()Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_a9

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/usercentrics/sdk/UsercentricsDialog;

    if-eqz v0, :cond_a9

    invoke-virtual {v0}, Lcom/usercentrics/sdk/UsercentricsDialog;->g()Z

    move-result v0

    if-eq v0, v6, :cond_f7

    :cond_a9
    move-object v7, v4

    check-cast v7, Lcom/usercentrics/sdk/UsercentricsBanner;

    move-object v8, v3

    check-cast v8, Landroid/content/Context;

    move-object v9, v2

    check-cast v9, Luwm;

    const/4 v11, 0x0

    move-object v12, v1

    check-cast v12, Lfqg;

    const/4 v10, 0x0

    invoke-static/range {v7 .. v12}, Lcom/usercentrics/sdk/UsercentricsBanner;->access$getDialog(Lcom/usercentrics/sdk/UsercentricsBanner;Landroid/content/Context;Luwm;Ljava/lang/Integer;ZLfqg;)Lcom/usercentrics/sdk/UsercentricsDialog;

    move-result-object v0

    check-cast p0, Lbxm;

    if-eqz p0, :cond_f4

    iget-object v1, p0, Lbxm;->b:Ljava/lang/Boolean;

    iget-object v2, p0, Lbxm;->c:Ljava/lang/Integer;

    iget-object p0, p0, Lbxm;->a:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {p0, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ef

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcxm;

    new-instance v5, Lbqg;

    iget-object v6, v4, Lcxm;->a:Ljava/lang/String;

    iget-object v4, v4, Lcxm;->b:Ljava/util/Map;

    invoke-direct {v5, v6, v4}, Lbqg;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d6

    :cond_ef
    new-instance v5, Llvi;

    invoke-direct {v5, v1, v2, v3}, Llvi;-><init>(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/util/ArrayList;)V

    :cond_f4
    invoke-virtual {v0, v5}, Lcom/usercentrics/sdk/UsercentricsDialog;->i(Llvi;)V

    :cond_f7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_fa
    .packed-switch 0x0
        :pswitch_95
    .end packed-switch

    :array_100
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_108
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
