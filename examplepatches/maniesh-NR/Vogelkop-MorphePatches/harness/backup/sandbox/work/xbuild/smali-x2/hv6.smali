.class public final synthetic Lhv6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 13
    iput-byte p1, p0, Lhv6;->a:B

    iput-object p2, p0, Lhv6;->c:Ljava/lang/Object;

    iput-boolean p4, p0, Lhv6;->b:Z

    iput-object p3, p0, Lhv6;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ZLr4i;Lq4i;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lhv6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lhv6;->b:Z

    iput-object p2, p0, Lhv6;->c:Ljava/lang/Object;

    iput-object p3, p0, Lhv6;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-byte p1, p0, Lhv6;->a:B

    const/4 v0, 0x1

    iget-object v1, p0, Lhv6;->d:Ljava/lang/Object;

    iget-boolean v2, p0, Lhv6;->b:Z

    iget-object p0, p0, Lhv6;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_ca

    check-cast p0, Lp8f;

    check-cast v1, Lqwf;

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Lvxi;

    if-nez v2, :cond_64

    iget-object p1, p0, Lvxi;->e:Ljava/lang/Object;

    check-cast p1, Lswf;

    invoke-virtual {p1}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p1, Lswf;->g:Li7f;

    iget-object p1, p1, Lswf;->f:Ljava/util/HashSet;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqwf;

    invoke-virtual {p1, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_43

    invoke-static {v3, v3}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v2

    :goto_33
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_43

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrwf;

    invoke-interface {v5, v4}, Lrwf;->a(Z)V

    goto :goto_33

    :cond_43
    invoke-virtual {p1, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5d

    invoke-static {v3, v3}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_4d
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5d

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrwf;

    invoke-interface {v1, v0}, Lrwf;->a(Z)V

    goto :goto_4d

    :cond_5d
    iget-object p1, p0, Lvxi;->d:Ljava/lang/Object;

    check-cast p1, Lqp2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_64
    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_68
    check-cast p0, Lr4i;

    check-cast v1, Lq4i;

    if-eqz v2, :cond_8f

    iget-object p1, p0, Lr4i;->i:Lpt1;

    const/4 v2, 0x0

    if-nez p1, :cond_74

    move-object p1, v2

    :cond_74
    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    new-instance v0, Lp71;

    const/16 v3, 0x16

    invoke-direct {v0, v1, p0, v2, v3}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {p1, v2, v2, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_9c

    :cond_8f
    sget-object p1, Ls4i;->c:Ls4i;

    iput-object p1, p0, Lr4i;->c:Ljava/lang/Object;

    invoke-virtual {p0}, Landroidx/fragment/app/i;->getDialog()Landroid/app/Dialog;

    move-result-object p0

    if-eqz p0, :cond_9c

    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    :cond_9c
    :goto_9c
    return-void

    :pswitch_9d
    check-cast p0, Ld5o;

    check-cast v1, Ll6e;

    iget-object p0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p0, Liv6;

    if-nez v2, :cond_c6

    iget-object p1, p0, Liv6;->d:Lq6e;

    invoke-virtual {p1, v1}, Lq6e;->k(Leri;)V

    iget-object p1, p0, Liv6;->f:Lr9g;

    if-eqz p1, :cond_c6

    iget-wide v0, v1, Ll6e;->b:J

    iget-object p1, p1, Lr9g;->b:Ljava/lang/Object;

    check-cast p1, Lpsi;

    iget-object v2, p1, Lpsi;->c:Lq6e;

    invoke-virtual {v2, v0, v1}, Lq6e;->c(J)Ll6e;

    move-result-object v0

    invoke-virtual {v2, v0}, Lq6e;->o(Leri;)V

    iget-object p1, p1, Lpsi;->l:Ljdj;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, v0}, Ljdj;->i(Ljava/lang/Object;)Z

    :cond_c6
    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_data_ca
    .packed-switch 0x0
        :pswitch_9d
        :pswitch_68
    .end packed-switch
.end method
