.class public final Lp77;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final synthetic a:B

.field public final b:Li7f;

.field public final c:Landroid/view/KeyEvent$Callback;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lpde;Lpde;Lpde;Lpde;)V
    .registers 9

    const/4 v0, 0x1

    iput-byte v0, p0, Lp77;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp77;->c:Landroid/view/KeyEvent$Callback;

    new-instance v1, Li7f;

    invoke-direct {v1}, Li7f;-><init>()V

    iput-object v1, p0, Lp77;->b:Li7f;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, p0, Lp77;->d:Ljava/lang/Object;

    new-instance v1, La6l;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, La6l;-><init>(Lp77;B)V

    invoke-static {p3, p2, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, La6l;

    invoke-direct {p3, p0, v0}, La6l;-><init>(Lp77;B)V

    invoke-static {p4, p2, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, La6l;

    const/4 p4, 0x2

    invoke-direct {p3, p0, p4}, La6l;-><init>(Lp77;B)V

    invoke-static {p5, p2, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Lyc3;

    const/16 p4, 0x8

    invoke-direct {p3, p0, p4}, Lyc3;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lvvf;

    const/16 p4, 0xc

    invoke-direct {p0, p1, p3, p4}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lt7d;

    const/4 p3, 0x7

    invoke-direct {p1, p0, p3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Ldx3;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lp77;->a:B

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lp77;->b:Li7f;

    .line 74
    iput-object p1, p0, Lp77;->c:Landroid/view/KeyEvent$Callback;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lp77;->a:B

    iget-object p0, p0, Lp77;->b:Li7f;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lo9l;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void

    :pswitch_d
    check-cast p1, Lm9l;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lp77;->a:B

    iget-object p0, p0, Lp77;->b:Li7f;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lo9l;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    :pswitch_d
    check-cast p1, Lm9l;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final a()Lb87;
    .registers 7

    iget-object v0, p0, Lp77;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/Pair;

    const/4 v1, 0x0

    if-eqz v0, :cond_5c

    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Lb87;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lrim;

    instance-of v3, v0, Luim;

    if-eqz v3, :cond_2d

    check-cast v0, Luim;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result v3

    if-nez v3, :cond_59

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v3

    if-eqz v3, :cond_59

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v3

    iget-boolean v3, v3, Landroidx/fragment/app/w;->L:Z

    if-nez v3, :cond_59

    invoke-virtual {v0}, Landroidx/fragment/app/i;->dismiss()V

    goto :goto_59

    :cond_2d
    instance-of v3, v0, Lmx3;

    if-eqz v3, :cond_39

    check-cast v0, Lmx3;

    iget-object v0, v0, Lmx3;->a:Lzp1;

    invoke-virtual {v0}, Lzp1;->dismiss()V

    goto :goto_59

    :cond_39
    instance-of v3, v0, Ltf5;

    if-eqz v3, :cond_59

    check-cast v0, Ltf5;

    iget-object v3, v0, Ltf5;->d:Lch5;

    if-eqz v3, :cond_57

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_4e

    check-cast v4, Landroid/view/ViewGroup;

    goto :goto_4f

    :cond_4e
    move-object v4, v1

    :goto_4f
    if-eqz v4, :cond_54

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_54
    invoke-virtual {v3}, Ld4;->e()V

    :cond_57
    iput-object v1, v0, Ltf5;->d:Lch5;

    :cond_59
    :goto_59
    iput-object v1, p0, Lp77;->d:Ljava/lang/Object;

    return-object v2

    :cond_5c
    return-object v1
.end method

.method public final b(Lb87;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lp77;->b:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm9l;

    iget-object v1, p0, Lm9l;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lm9l;->a()V

    goto :goto_7

    :cond_1c
    return-void
.end method

.method public final c(Lb87;)V
    .registers 4

    iget-object v0, p0, Lp77;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/Pair;

    if-eqz v0, :cond_2f

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne v0, p1, :cond_2f

    invoke-virtual {p0}, Lp77;->a()Lb87;

    move-result-object p1

    if-eqz p1, :cond_2f

    new-instance v0, Lg7f;

    iget-object p0, p0, Lp77;->b:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :cond_17
    :goto_17
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_2f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm9l;

    iget-object v1, p0, Lm9l;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p0}, Lm9l;->a()V

    goto :goto_17

    :cond_2f
    return-void
.end method

.method public final e(Lrim;Lb87;)V
    .registers 9

    new-instance v0, Landroid/util/Pair;

    invoke-direct {v0, p2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lp77;->d:Ljava/lang/Object;

    instance-of v0, p1, Luim;

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lp77;->c:Landroid/view/KeyEvent$Callback;

    check-cast v0, Ldx3;

    check-cast p1, Luim;

    invoke-virtual {v0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroidx/fragment/app/a;

    invoke-direct {v1, v0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lym9;->c(Ljava/lang/String;)V

    const-string v2, "ui-dialog-fragment"

    invoke-virtual {p1, v1, v2}, Landroidx/fragment/app/i;->show(Lym9;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroidx/fragment/app/w;->D()V

    invoke-virtual {p0, p2}, Lp77;->b(Lb87;)V

    return-void

    :cond_2d
    instance-of v0, p1, Lmx3;

    if-eqz v0, :cond_5f

    check-cast p1, Lmx3;

    iget-object v0, p1, Lmx3;->a:Lzp1;

    invoke-static {v0}, Lu8n;->e(Landroid/app/Dialog;)V

    invoke-static {v0}, Lo0g;->N0(Landroid/app/Dialog;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    invoke-virtual {p1}, Lmx3;->a()V

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v1

    invoke-virtual {v1, v0}, Lqwe;->a(Landroid/app/Dialog;)V

    iget-object p1, p1, Lmx3;->b:Lab;

    if-eqz p1, :cond_5b

    invoke-virtual {p1, v0}, Lab;->run(Ljava/lang/Object;)V

    :cond_5b
    invoke-virtual {p0, p2}, Lp77;->b(Lb87;)V

    return-void

    :cond_5f
    instance-of v0, p1, Ltf5;

    if-eqz v0, :cond_c4

    check-cast p1, Ltf5;

    iget-object v0, p1, Ltf5;->a:Landroid/app/Activity;

    new-instance v1, Lch5;

    invoke-direct {v1, v0}, Lch5;-><init>(Landroid/content/Context;)V

    move-object v2, v0

    check-cast v2, Lndc;

    const v3, 0x7f0a0c99

    invoke-virtual {v1, v3, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    move-object v2, v0

    check-cast v2, Lw7n;

    const v3, 0x7f0a0c9d

    invoke-virtual {v1, v3, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    move-object v2, v0

    check-cast v2, Lrki;

    const v3, 0x7f0a0c9c

    invoke-virtual {v1, v3, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    iget-object v2, v1, Ld4;->e:Lkotlin/jvm/functions/Function0;

    if-eqz v2, :cond_8e

    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_8e
    new-instance v2, Ls5n;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Ls5n;-><init>(Ld4;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance v4, Leek;

    const/16 v5, 0x15

    invoke-direct {v4, v1, v2, v5}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v4, v1, Ld4;->e:Lkotlin/jvm/functions/Function0;

    new-instance v2, Lsf5;

    invoke-direct {v2, p1, v3}, Lsf5;-><init>(Ltf5;B)V

    new-instance v3, Lue5;

    const v4, 0x3292b8a

    const/4 v5, 0x1

    invoke-direct {v3, v4, v2, v5}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {v1, v3}, Lch5;->o(Lkotlin/jvm/functions/Function2;)V

    iput-object v1, p1, Ltf5;->d:Lch5;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p1, Ltf5;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    invoke-virtual {p0, p2}, Lp77;->b(Lb87;)V

    :cond_c4
    return-void
.end method

.method public final f(Lc6l;Lkotlin/jvm/functions/Function0;)V
    .registers 7

    iget-object v0, p0, Lp77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_15

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    goto :goto_19

    :cond_15
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p1

    :goto_19
    if-eqz p1, :cond_6e

    iget-object p0, p0, Lp77;->b:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :cond_21
    :goto_21
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_6e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lo9l;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    xor-int/lit8 v1, p2, 0x1

    iget-boolean v2, p1, Lo9l;->a:Z

    if-eq v1, v2, :cond_21

    iget-object v1, p1, Lo9l;->b:Lr9l;

    iget-object v2, v1, Lr9l;->D:Lg4l;

    if-nez p2, :cond_60

    sget-object p2, Lc6l;->a:Lc6l;

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4b

    sget-object p2, Luz3;->e:Luz3;

    goto :goto_4c

    :cond_4b
    const/4 p2, 0x0

    :goto_4c
    sget-object v1, Lf4l;->c:Lf4l;

    iget-object v3, v2, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Leek;

    const/4 v3, 0x7

    invoke-direct {v1, v2, p2, v3}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v1}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    const/4 p2, 0x1

    iput-boolean p2, p1, Lo9l;->a:Z

    goto :goto_21

    :cond_60
    new-instance p2, Ld4l;

    const/16 v3, 0x8

    invoke-direct {p2, v2, v3}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {v1, p2}, Lr9l;->q(Lkotlin/jvm/functions/Function0;)V

    const/4 p2, 0x0

    iput-boolean p2, p1, Lo9l;->a:Z

    goto :goto_21

    :cond_6e
    return-void
.end method
