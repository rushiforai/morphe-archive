.class public final Le7p;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lc4p;


# direct methods
.method public synthetic constructor <init>(Lc4p;B)V
    .registers 3

    iput-byte p2, p0, Le7p;->i:B

    iput-object p1, p0, Le7p;->j:Lc4p;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Le7p;->i:B

    const/4 v1, 0x0

    iget-object p0, p0, Le7p;->j:Lc4p;

    packed-switch v0, :pswitch_data_25a

    iget-object p0, p0, Lc4p;->g:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_34

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ln4p;

    iget v2, v2, Ln4p;->b:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_16

    goto :goto_2a

    :cond_29
    move-object v0, v1

    :goto_2a
    check-cast v0, Ln4p;

    if-eqz v0, :cond_34

    iget-object p0, v0, Ln4p;->c:Lk4p;

    if-eqz p0, :cond_34

    iget-object v1, p0, Lk4p;->b:Ljava/lang/String;

    :cond_34
    return-object v1

    :pswitch_35
    iget-object p0, p0, Lc4p;->g:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_7a

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_43
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ln4p;

    iget v2, v2, Ln4p;->b:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_43

    goto :goto_57

    :cond_56
    move-object v0, v1

    :goto_57
    check-cast v0, Ln4p;

    if-eqz v0, :cond_7a

    iget-object p0, v0, Ln4p;->c:Lk4p;

    if-eqz p0, :cond_7a

    iget-object p0, p0, Lk4p;->b:Ljava/lang/String;

    if-eqz p0, :cond_7a

    invoke-static {p0}, Lkotlin/text/b;->f(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p0

    if-eqz p0, :cond_7a

    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmpl-double v0, v2, v4

    if-lez v0, :cond_7a

    const-wide/high16 v4, 0x4014000000000000L    # 5.0

    cmpg-double v0, v2, v4

    if-gtz v0, :cond_7a

    move-object v1, p0

    :cond_7a
    return-object v1

    :pswitch_7b
    iget-object p0, p0, Lc4p;->g:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_a7

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_89
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ln4p;

    iget v2, v2, Ln4p;->b:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_89

    goto :goto_9d

    :cond_9c
    move-object v0, v1

    :goto_9d
    check-cast v0, Ln4p;

    if-eqz v0, :cond_a7

    iget-object p0, v0, Ln4p;->c:Lk4p;

    if-eqz p0, :cond_a7

    iget-object v1, p0, Lk4p;->b:Ljava/lang/String;

    :cond_a7
    return-object v1

    :pswitch_a8
    iget-object p0, p0, Lc4p;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_d4

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_b6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c9

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lt4p;

    iget v2, v2, Lt4p;->b:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_b6

    goto :goto_ca

    :cond_c9
    move-object v0, v1

    :goto_ca
    check-cast v0, Lt4p;

    if-eqz v0, :cond_d4

    iget-object p0, v0, Lt4p;->c:Lq4p;

    if-eqz p0, :cond_d4

    iget-object v1, p0, Lq4p;->b:Ljava/lang/String;

    :cond_d4
    return-object v1

    :pswitch_d5
    iget-object p0, p0, Lc4p;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_101

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_e3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lt4p;

    iget v2, v2, Lt4p;->b:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_e3

    goto :goto_f7

    :cond_f6
    move-object v0, v1

    :goto_f7
    check-cast v0, Lt4p;

    if-eqz v0, :cond_101

    iget-object p0, v0, Lt4p;->c:Lq4p;

    if-eqz p0, :cond_101

    iget-object v1, p0, Lq4p;->b:Ljava/lang/String;

    :cond_101
    return-object v1

    :pswitch_102
    iget-object p0, p0, Lc4p;->c:Ljava/util/List;

    if-eqz p0, :cond_12f

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10f
    :goto_10f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_121

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Lg5p;

    if-eqz v3, :cond_10f

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10f

    :cond_121
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lg5p;

    if-eqz p0, :cond_12f

    iget-object p0, p0, Lg5p;->c:Ld5p;

    if-eqz p0, :cond_12f

    iget-object v1, p0, Ld5p;->a:Ljava/lang/String;

    :cond_12f
    return-object v1

    :pswitch_130
    iget-object p0, p0, Lc4p;->c:Ljava/util/List;

    if-eqz p0, :cond_14f

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_13d
    :goto_13d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_14f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Lm5p;

    if-eqz v2, :cond_13d

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13d

    :cond_14f
    return-object v1

    :pswitch_150
    iget-object p0, p0, Lc4p;->c:Ljava/util/List;

    if-eqz p0, :cond_16f

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_15d
    :goto_15d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ln4p;

    if-eqz v2, :cond_15d

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15d

    :cond_16f
    return-object v1

    :pswitch_170
    iget-object p0, p0, Lc4p;->c:Ljava/util/List;

    if-eqz p0, :cond_18f

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_17d
    :goto_17d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Lt4p;

    if-eqz v2, :cond_17d

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17d

    :cond_18f
    return-object v1

    :pswitch_190
    iget-object p0, p0, Lc4p;->a:La5p;

    iget-object p0, p0, La5p;->c:Ljava/util/List;

    if-eqz p0, :cond_1b6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_19f
    :goto_19f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b8

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_19f

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19f

    :cond_1b6
    sget-object v0, Ll08;->a:Ll08;

    :cond_1b8
    return-object v0

    :pswitch_1b9
    iget-object p0, p0, Lc4p;->d:Ljava/util/List;

    sget-object v0, Lu4p;->c:Lu4p;

    invoke-static {p0, v0}, Lc4p;->a(Ljava/util/List;Lu4p;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_1c2
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    iget-object v1, p0, Lc4p;->d:Ljava/util/List;

    sget-object v2, Lu4p;->b:Lu4p;

    invoke-static {v1, v2}, Lc4p;->a(Ljava/util/List;Lu4p;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lehc;->addAll(Ljava/util/Collection;)Z

    iget-object p0, p0, Lc4p;->e:Ljava/util/List;

    if-eqz p0, :cond_1f8

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1de
    :goto_1de
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1de

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1de

    :cond_1f5
    invoke-virtual {v0, v1}, Lehc;->addAll(Ljava/util/Collection;)Z

    :cond_1f8
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0

    :pswitch_1fd
    iget-object p0, p0, Lc4p;->h:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_22a

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_20b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lm5p;

    iget v2, v2, Lm5p;->b:I

    const/16 v3, 0x9

    if-ne v2, v3, :cond_20b

    goto :goto_220

    :cond_21f
    move-object v0, v1

    :goto_220
    check-cast v0, Lm5p;

    if-eqz v0, :cond_22a

    iget-object p0, v0, Lm5p;->c:Lj5p;

    if-eqz p0, :cond_22a

    iget-object v1, p0, Lj5p;->a:Ljava/lang/String;

    :cond_22a
    return-object v1

    :pswitch_22b
    iget-object p0, p0, Lc4p;->g:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_258

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_239
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ln4p;

    iget v2, v2, Ln4p;->b:I

    const/16 v3, 0x8

    if-ne v2, v3, :cond_239

    goto :goto_24e

    :cond_24d
    move-object v0, v1

    :goto_24e
    check-cast v0, Ln4p;

    if-eqz v0, :cond_258

    iget-object p0, v0, Ln4p;->c:Lk4p;

    if-eqz p0, :cond_258

    iget-object v1, p0, Lk4p;->b:Ljava/lang/String;

    :cond_258
    return-object v1

    nop

    :pswitch_data_25a
    .packed-switch 0x0
        :pswitch_22b
        :pswitch_1fd
        :pswitch_1c2
        :pswitch_1b9
        :pswitch_190
        :pswitch_170
        :pswitch_150
        :pswitch_130
        :pswitch_102
        :pswitch_d5
        :pswitch_a8
        :pswitch_7b
        :pswitch_35
    .end packed-switch
.end method
