.class public final synthetic Lr31;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lr31;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lr31;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_1a2

    check-cast p1, Lyz;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p3, Lkotlin/jvm/functions/Function2;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lej;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p1, Lw10;

    if-nez v0, :cond_21

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p3, p0, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7b

    :cond_21
    check-cast p1, Lw10;

    iget-object p1, p1, Lw10;->u:Lcie;

    iget-object v0, p1, Lbzo;->d:Lw06;

    if-nez v0, :cond_2b

    const/4 v0, -0x1

    goto :goto_33

    :cond_2b
    sget-object v2, Ldj;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v2, v0

    :goto_33
    packed-switch v0, :pswitch_data_1b0

    :pswitch_36
    invoke-static {}, Lh9o;->p()V

    goto :goto_7d

    :pswitch_3a
    iget-object v0, p1, Lcie;->i0:Ljava/lang/String;

    iget-object p1, p1, Lcie;->j0:Ljava/lang/String;

    filled-new-array {v0, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4f
    :goto_4f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_66

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4f

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4f

    :cond_66
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_72

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p3, p0, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7b

    :cond_72
    invoke-virtual {p0, v0, p2, p3}, Lej;->a(Ljava/util/ArrayList;ZLkotlin/jvm/functions/Function2;)V

    goto :goto_7b

    :pswitch_76
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p3, p0, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_7b
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_7d
    return-object v1

    :pswitch_7e
    check-cast p1, Lepc;

    check-cast p2, Lbp7;

    check-cast p3, Ltrc;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqrc;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lprc;

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    const/4 v0, 0x2

    const/4 v2, 0x1

    if-eqz p3, :cond_a2

    if-eq p3, v2, :cond_a0

    if-ne p3, v0, :cond_9c

    sget-object p3, Lorc;->c:Lorc;

    goto :goto_a4

    :cond_9c
    invoke-static {}, Lh9o;->p()V

    goto :goto_cf

    :cond_a0
    move-object p3, v1

    goto :goto_a4

    :cond_a2
    sget-object p3, Lorc;->a:Lorc;

    :goto_a4
    if-nez p3, :cond_cb

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_c9

    if-eq p2, v2, :cond_c6

    if-ne p2, v0, :cond_c2

    if-eqz p1, :cond_b4

    iget-object v1, p1, Lepc;->a:Ljava/lang/String;

    :cond_b4
    const-string p1, "idle"

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_bf

    sget-object p3, Lorc;->b:Lorc;

    goto :goto_cb

    :cond_bf
    sget-object p3, Lorc;->a:Lorc;

    goto :goto_cb

    :cond_c2
    invoke-static {}, Lh9o;->p()V

    goto :goto_cf

    :cond_c6
    sget-object p3, Lorc;->c:Lorc;

    goto :goto_cb

    :cond_c9
    sget-object p3, Lorc;->a:Lorc;

    :cond_cb
    :goto_cb
    invoke-direct {p0, p3}, Lprc;-><init>(Lorc;)V

    move-object v1, p0

    :goto_cf
    return-object v1

    :pswitch_d0
    check-cast p1, Ljava/util/List;

    check-cast p2, Ljava/util/Set;

    check-cast p3, Ljava/util/List;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ltr8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_f3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_105

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsr8;

    iget-object v1, v1, Lsr8;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f3

    :cond_105
    invoke-interface {p0, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    check-cast p2, Ljava/util/Collection;

    invoke-interface {p0, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    check-cast p3, Ljava/lang/Iterable;

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_113
    :goto_113
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_140

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    sget-object p3, Lp6l;->a:Lp6l;

    invoke-virtual {p2, p3}, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->i(Lp6l;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p0, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p2, p2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object p2, p2, Ltqi;->f:Ljava/lang/String;

    const-string p3, "https"

    invoke-static {p3, p2}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object p2

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->h()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-lez p3, :cond_113

    invoke-interface {p0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_113

    :cond_140
    return-object p0

    :pswitch_141
    check-cast p1, Ljava/lang/Throwable;

    check-cast p2, Los4;

    iget-object p1, p2, Los4;->a:Ljava/lang/Object;

    check-cast p3, Lkotlin/coroutines/CoroutineContext;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lp04;

    iget-object p0, p0, Lp04;->b:Lkotlin/jvm/functions/Function1;

    invoke-static {p1}, Los4;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, p1, p3}, Lmkh;->j(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_159
    check-cast p1, Ljava/lang/Throwable;

    check-cast p3, Lkotlin/coroutines/CoroutineContext;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lp04;

    iget-object p0, p0, Lp04;->b:Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p2, p3}, Lmkh;->j(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_169
    if-nez p1, :cond_19e

    check-cast p2, Lbpj;

    iget-wide p1, p2, Lbpj;->a:J

    check-cast p3, Lkotlin/jvm/functions/Function1;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lv31;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->fontScale:F

    new-instance v3, Lq27;

    invoke-direct {v3, v2, v0}, Lq27;-><init>(FF)V

    new-instance v0, Lzf5;

    invoke-direct {v0, v3, p1, p2, p3}, Lzf5;-><init>(Lq27;JLkotlin/jvm/functions/Function1;)V

    sget-object p1, Ld41;->a:Ld41;

    invoke-virtual {p1, p0, v1, v0}, Ld41;->a(Landroid/view/View;Lsh7;Lzf5;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_1a1

    :cond_19e
    invoke-static {}, Lh9o;->t()V

    :goto_1a1
    return-object v1

    :pswitch_data_1a2
    .packed-switch 0x0
        :pswitch_169
        :pswitch_159
        :pswitch_141
        :pswitch_d0
        :pswitch_7e
    .end packed-switch

    :pswitch_data_1b0
    .packed-switch -0x1
        :pswitch_76
        :pswitch_36
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_76
        :pswitch_3a
    .end packed-switch
.end method
