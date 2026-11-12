.class public final synthetic Laj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcj3;

.field public final synthetic c:Lpqh;


# direct methods
.method public synthetic constructor <init>(Lcj3;Lpqh;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Laj3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laj3;->b:Lcj3;

    iput-object p2, p0, Laj3;->c:Lpqh;

    return-void
.end method

.method public synthetic constructor <init>(Lpqh;Lcj3;)V
    .registers 4

    .line 11
    const/4 v0, 0x0

    iput-byte v0, p0, Laj3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laj3;->c:Lpqh;

    iput-object p2, p0, Laj3;->b:Lcj3;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Laj3;->a:B

    iget-object v1, p0, Laj3;->c:Lpqh;

    iget-object p0, p0, Laj3;->b:Lcj3;

    packed-switch v0, :pswitch_data_d2

    check-cast p1, Lm9d;

    if-eqz p1, :cond_c5

    iget-object v0, p1, Lm9d;->a:Ljava/util/LinkedHashSet;

    iget-object v1, v1, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    new-instance v2, Lp4j;

    invoke-direct {v2}, Lp4j;-><init>()V

    iget-object v3, p1, Lm9d;->c:Lp4j;

    iget-object v4, p1, Lm9d;->b:Ljava/util/LinkedHashSet;

    new-instance v5, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v0, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_48

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lvj3;

    new-instance v9, Lbj3;

    iget-object v10, v8, Lvj3;->a:Lsj3;

    iget-object v8, v8, Lvj3;->b:Ltj3;

    invoke-interface {v8}, Ltj3;->a()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v10, v8}, Lbj3;-><init>(Lsj3;Ljava/lang/String;)V

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    :cond_48
    invoke-virtual {v2, v5}, Lp4j;->addAll(Ljava/util/Collection;)Z

    new-instance v5, Ljava/util/ArrayList;

    invoke-static {v4, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_58
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_71

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lwj3;

    new-instance v8, Lbj3;

    iget-object v9, v7, Lwj3;->a:Lsj3;

    iget-object v7, v7, Lwj3;->b:Ljava/lang/String;

    invoke-direct {v8, v9, v7}, Lbj3;-><init>(Lsj3;Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_58

    :cond_71
    invoke-virtual {v2, v5}, Lp4j;->addAll(Ljava/util/Collection;)Z

    invoke-static {v2}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v2

    iput-object v2, p0, Lcj3;->g:Ljava/util/Set;

    iget-object v2, p0, Lcj3;->d:Ljze;

    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_85
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_97

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Luj3;

    iget-object v7, v7, Luj3;->a:Lvj3;

    invoke-interface {v5, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_85

    :cond_97
    invoke-static {v0, v5}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljze;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Lcj3;->e:Lkze;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    iput-object v3, p0, Lcj3;->j:Ljava/util/Set;

    iput-object v4, p0, Lcj3;->h:Ljava/util/Set;

    invoke-virtual {p0, v1}, Lcj3;->a(Landroid/net/Uri;)V

    iget-object v0, p0, Lcj3;->a:Ltcl;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lt02;

    const/16 v2, 0x1c

    invoke-direct {v0, p1, v2}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lcj3;->f:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    :cond_c5
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c8
    check-cast p1, Landroid/net/Uri;

    iput-object p1, v1, Lpqh;->a:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcj3;->a(Landroid/net/Uri;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_d2
    .packed-switch 0x0
        :pswitch_c8
    .end packed-switch
.end method
