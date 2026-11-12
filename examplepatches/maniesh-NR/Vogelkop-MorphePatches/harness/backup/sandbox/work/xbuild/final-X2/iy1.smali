.class public final Liy1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lcy1;

.field public final c:Ldz1;

.field public final d:Lq32;

.field public final e:Lx12;

.field public final f:Lny1;

.field public final g:Lqy1;

.field public final h:Lgy1;

.field public final i:Li52;

.field public final j:La52;

.field public final k:Ljy1;

.field public final l:Ljy1;

.field public final m:Lqde;

.field public final n:Ljava/util/ArrayList;

.field public final o:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Lndc;Lumi;Lcy1;Ldz1;Lq32;Lx12;Lny1;Lqy1;Lgy1;Li52;La52;Ljy1;Ljy1;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Liy1;->a:Lumi;

    iput-object p3, p0, Liy1;->b:Lcy1;

    iput-object p4, p0, Liy1;->c:Ldz1;

    iput-object p5, p0, Liy1;->d:Lq32;

    iput-object p6, p0, Liy1;->e:Lx12;

    iput-object p7, p0, Liy1;->f:Lny1;

    iput-object p8, p0, Liy1;->g:Lqy1;

    iput-object p9, p0, Liy1;->h:Lgy1;

    iput-object p10, p0, Liy1;->i:Li52;

    iput-object p11, p0, Liy1;->j:La52;

    iput-object p12, p0, Liy1;->k:Ljy1;

    iput-object p13, p0, Liy1;->l:Ljy1;

    new-instance p2, Lqde;

    sget-object p3, Ll08;->a:Ll08;

    invoke-direct {p2, p3}, Lqde;-><init>(Ll08;)V

    iput-object p2, p0, Liy1;->m:Lqde;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Liy1;->n:Ljava/util/ArrayList;

    new-instance p3, Ljava/util/LinkedHashSet;

    invoke-direct {p3}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p3, p0, Liy1;->o:Ljava/util/LinkedHashSet;

    iget-object p3, p4, Ldz1;->g:Lrlh;

    invoke-static {p3}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object p3

    new-instance p4, Lyx1;

    const/4 p5, 0x0

    invoke-direct {p4, p0, p5}, Lyx1;-><init>(Liy1;B)V

    new-instance p5, Lug;

    const/4 p6, 0x3

    invoke-direct {p5, p4, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p3, p1, p5}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p3, Lyx1;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lyx1;-><init>(Liy1;B)V

    new-instance p0, Lug;

    invoke-direct {p0, p3, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    iget-object p0, p0, Liy1;->m:Lqde;

    iget-object v0, p0, Lqde;->l:Ljava/util/ArrayList;

    new-instance v1, Lk51;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Lk51;-><init>(B)V

    new-instance v2, Lzx1;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    new-instance v1, Lfz1;

    invoke-direct {v1, p1, p2, p3}, Lfz1;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Liy1;->m:Lqde;

    iget-object v1, v0, Lqde;->l:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Liy1;->n:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_15
    if-ge v1, v0, :cond_26

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lfy1;

    iget-object v2, v2, Lfy1;->b:Ld3k;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    goto :goto_15

    :cond_26
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public final c(Ljava/lang/String;)Ljava/io/File;
    .registers 3

    sget-object p0, Lsnf;->c:Ljava/lang/String;

    const-string v0, "webp"

    invoke-static {p0, p1, v0}, Lulp;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public final d(Ljava/lang/String;Lpy1;Lux1;Ljava/lang/String;Lo29;)V
    .registers 11

    move-object v0, p3

    iget-object p3, p2, Lpy1;->b:Ljava/io/File;

    iget-object v1, p0, Liy1;->m:Lqde;

    iget-object v2, v1, Lqde;->l:Ljava/util/ArrayList;

    new-instance v3, Lsx1;

    new-instance v4, Lqx1;

    invoke-direct {v4, p5, p3, p4}, Lqx1;-><init>(Lo29;Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, p1, v4, v0}, Lvx1;-><init>(Ljava/lang/String;Lwxe;Lux1;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p5

    invoke-virtual {v1, p5}, Lekc;->r(Ljava/lang/Object;)V

    new-instance p5, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v1, p0, Liy1;->a:Lumi;

    invoke-direct {p5, v0, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lq3;

    const/16 v1, 0xc

    invoke-direct {v0, p0, p2, v1}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p5, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    move-object p2, p1

    move-object p1, p0

    new-instance p0, Lrg;

    const/4 p5, 0x2

    invoke-direct/range {p0 .. p5}, Lrg;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final e(Ljava/lang/String;Lo0g;Lux1;)V
    .registers 11

    instance-of v0, p2, Lv12;

    if-eqz v0, :cond_a

    move-object v0, p2

    check-cast v0, Lv12;

    iget-object v0, v0, Lv12;->j:Ljava/io/File;

    goto :goto_1d

    :cond_a
    instance-of v0, p2, Lu12;

    if-eqz v0, :cond_14

    move-object v0, p2

    check-cast v0, Lu12;

    iget-object v0, v0, Lu12;->j:Ljava/io/File;

    goto :goto_1d

    :cond_14
    instance-of v0, p2, Lw12;

    if-eqz v0, :cond_5b

    move-object v0, p2

    check-cast v0, Lw12;

    iget-object v0, v0, Lw12;->j:Ljava/io/File;

    :goto_1d
    iget-object v1, p0, Liy1;->m:Lqde;

    iget-object v2, v1, Lqde;->l:Ljava/util/ArrayList;

    new-instance v3, Lsx1;

    new-instance v4, Lqx1;

    const-string v5, "image/webp"

    sget-object v6, Lo29;->k:Lo29;

    invoke-direct {v4, v6, v0, v5}, Lqx1;-><init>(Lo29;Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, p1, v4, p3}, Lvx1;-><init>(Ljava/lang/String;Lwxe;Lux1;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p3

    invoke-virtual {v1, p3}, Lekc;->r(Ljava/lang/Object;)V

    new-instance p3, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Liy1;->a:Lumi;

    invoke-direct {p3, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lq3;

    const/16 v2, 0xd

    invoke-direct {v1, p0, p2, v2}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p2

    new-instance p3, Lf9;

    const/4 v1, 0x6

    invoke-direct {p3, p0, p1, v0, v1}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :cond_5b
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final f(Lux1;Lcom/opera/api/Callback;)V
    .registers 11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Liy1;->c(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Liy1;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lwx1;

    const/4 v2, 0x0

    invoke-direct {v1, v4, v2}, Lwx1;-><init>(Ljava/io/File;B)V

    invoke-virtual {v0, v1}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    new-instance v2, Lai;

    move-object v3, p0

    move-object v7, p1

    move-object v5, p2

    invoke-direct/range {v2 .. v7}, Lai;-><init>(Liy1;Ljava/io/File;Lcom/opera/api/Callback;Ljava/lang/String;Lux1;)V

    invoke-virtual {v0, v2}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final g(Ljava/lang/String;Z)V
    .registers 11

    iget-object v0, p0, Liy1;->m:Lqde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Ljx1;

    invoke-interface {v4}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    goto :goto_26

    :cond_25
    move-object v2, v3

    :goto_26
    check-cast v2, Ljx1;

    iget-object v1, v0, Lqde;->l:Ljava/util/ArrayList;

    new-instance v4, Ltx0;

    const/4 v5, 0x6

    invoke-direct {v4, p1, v5}, Ltx0;-><init>(Ljava/lang/String;B)V

    new-instance v5, Lzx1;

    const/4 v6, 0x1

    invoke-direct {v5, v4, v6}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Liy1;->n:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v4, 0x0

    :cond_47
    if-ge v4, v1, :cond_5b

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    move-object v7, v5

    check-cast v7, Lfy1;

    iget-object v7, v7, Lfy1;->a:Ljava/lang/String;

    invoke-static {v7, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_47

    goto :goto_5c

    :cond_5b
    move-object v5, v3

    :goto_5c
    check-cast v5, Lfy1;

    if-eqz v5, :cond_68

    iget-object p1, v5, Lfy1;->b:Ld3k;

    invoke-virtual {p1, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_68
    if-eqz p2, :cond_91

    if-eqz v2, :cond_91

    instance-of p1, v2, Lvx1;

    if-eqz p1, :cond_91

    check-cast v2, Lvx1;

    iget-object p1, v2, Lvx1;->b:Lwxe;

    instance-of p2, p1, Lqx1;

    if-eqz p2, :cond_91

    check-cast p1, Lqx1;

    iget-object p1, p1, Lqx1;->m:Ljava/io/File;

    new-instance p2, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object p0, p0, Liy1;->a:Lumi;

    invoke-direct {p2, v0, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lwx1;

    invoke-direct {p0, p1, v6}, Lwx1;-><init>(Ljava/io/File;B)V

    invoke-virtual {p2, p0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    :cond_91
    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .registers 14

    iget-object v0, p0, Liy1;->m:Lqde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Ljx1;

    invoke-interface {v4}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    goto :goto_26

    :cond_25
    move-object v2, v3

    :goto_26
    check-cast v2, Ljx1;

    if-eqz v2, :cond_131

    instance-of v1, v2, Lpx1;

    if-eqz v1, :cond_125

    check-cast v2, Lpx1;

    iget-object v1, v2, Lvx1;->b:Lwxe;

    if-eqz v1, :cond_121

    instance-of v2, v1, Lqx1;

    iget-object v4, p0, Liy1;->o:Ljava/util/LinkedHashSet;

    const/4 v5, 0x0

    if-eqz v2, :cond_87

    invoke-interface {v4, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v2, v0, Lqde;->l:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v6, v5

    :goto_45
    if-ge v6, v4, :cond_72

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v8, v5, 0x1

    if-ltz v5, :cond_6e

    check-cast v7, Ljx1;

    instance-of v9, v7, Lvx1;

    if-eqz v9, :cond_6c

    move-object v9, v7

    check-cast v9, Lvx1;

    iget-object v9, v9, Lvx1;->a:Ljava/lang/String;

    invoke-static {v9, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6c

    check-cast v7, Lvx1;

    new-instance v9, Lsx1;

    invoke-direct {v9, v7}, Lsx1;-><init>(Lvx1;)V

    invoke-virtual {v2, v5, v9}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_6c
    move v5, v8

    goto :goto_45

    :cond_6e
    invoke-static {}, Lj95;->n()V

    throw v3

    :cond_72
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    check-cast v1, Lqx1;

    iget-object v0, v1, Lqx1;->m:Ljava/io/File;

    iget-object v1, v1, Lqx1;->n:Ljava/lang/String;

    if-nez v1, :cond_83

    const-string v1, ""

    :cond_83
    invoke-virtual {p0, v0, p1, v1}, Liy1;->i(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_87
    instance-of v2, v1, Ltx1;

    if-eqz v2, :cond_121

    invoke-interface {v4, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v2, v0, Lqde;->l:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v6, v5

    move v7, v6

    :goto_96
    if-ge v7, v4, :cond_c3

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v9, v6, 0x1

    if-ltz v6, :cond_bf

    check-cast v8, Ljx1;

    instance-of v10, v8, Lvx1;

    if-eqz v10, :cond_bd

    move-object v10, v8

    check-cast v10, Lvx1;

    iget-object v10, v10, Lvx1;->a:Ljava/lang/String;

    invoke-static {v10, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_bd

    check-cast v8, Lvx1;

    new-instance v10, Lsx1;

    invoke-direct {v10, v8}, Lsx1;-><init>(Lvx1;)V

    invoke-virtual {v2, v6, v10}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_bd
    move v6, v9

    goto :goto_96

    :cond_bf
    invoke-static {}, Lj95;->n()V

    throw v3

    :cond_c3
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    check-cast v1, Ltx1;

    iget-object v9, v1, Ltx1;->o:Ljava/lang/String;

    if-eqz v9, :cond_e2

    iget-object v10, v1, Ltx1;->p:Ljava/lang/String;

    if-eqz v10, :cond_e2

    iget-object v2, v1, Ltx1;->n:Lz92;

    if-eqz v2, :cond_e2

    iget-object v8, v1, Ltx1;->m:Landroid/net/Uri;

    iget-object v11, v2, Lz92;->a:Ljava/lang/String;

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Liy1;->j(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_e2
    move-object v7, p1

    iget-object p0, v0, Lqde;->l:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    move v1, v5

    :goto_ea
    if-ge v1, p1, :cond_119

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, v5, 0x1

    if-ltz v5, :cond_115

    check-cast v2, Ljx1;

    instance-of v6, v2, Lvx1;

    if-eqz v6, :cond_113

    move-object v6, v2

    check-cast v6, Lvx1;

    iget-object v6, v6, Lvx1;->a:Ljava/lang/String;

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_113

    check-cast v2, Lvx1;

    new-instance v6, Lpx1;

    sget-object v8, Ley1;->a:Ley1;

    invoke-direct {v6, v2, v8}, Lpx1;-><init>(Lvx1;Ley1;)V

    invoke-virtual {p0, v5, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_113
    move v5, v4

    goto :goto_ea

    :cond_115
    invoke-static {}, Lj95;->n()V

    throw v3

    :cond_119
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_121
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_125
    instance-of p0, v2, Lrx1;

    if-nez p0, :cond_131

    instance-of p0, v2, Lsx1;

    if-nez p0, :cond_131

    instance-of p0, v2, Lfz1;

    if-eqz p0, :cond_132

    :cond_131
    return-void

    :cond_132
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final i(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    new-instance v0, Lfy1;

    iget-object v2, p0, Liy1;->c:Ldz1;

    iget-object v8, v2, Ldz1;->e:La64;

    new-instance v1, Ls71;

    const/4 v6, 0x0

    const/4 v7, 0x2

    move-object v4, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v7}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    const/4 p2, 0x0

    invoke-static {v8, p2, p2, v1, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    invoke-direct {v0, v3, p1}, Lfy1;-><init>(Ljava/lang/String;Ld3k;)V

    iget-object p0, p0, Liy1;->n:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final j(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 17

    new-instance v0, Lfy1;

    iget-object v2, p0, Liy1;->c:Ldz1;

    iget-object v10, v2, Ldz1;->d:La64;

    new-instance v1, Lld1;

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v1 .. v9}, Lld1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p2, 0x3

    const/4 p3, 0x0

    invoke-static {v10, p3, p3, v1, p2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Lfy1;-><init>(Ljava/lang/String;Ld3k;)V

    iget-object p0, p0, Liy1;->n:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
