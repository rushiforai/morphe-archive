.class public final Ltjc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt3g;


# instance fields
.field public final a:Lumi;

.field public final b:Lfx0;

.field public final c:Landroid/content/Context;

.field public final d:Ln9h;

.field public final e:Ljava/util/ArrayList;

.field public final f:Lqie;

.field public g:Z

.field public h:Lg0d;


# direct methods
.method public constructor <init>(Landroid/content/ContextWrapper;Lumi;Lfx0;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltjc;->a:Lumi;

    iput-object p3, p0, Ltjc;->b:Lfx0;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ltjc;->c:Landroid/content/Context;

    new-instance p3, Ln9h;

    invoke-direct {p3, p1}, Ln9h;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Ltjc;->d:Ln9h;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ltjc;->e:Ljava/util/ArrayList;

    new-instance p1, Lqie;

    const/16 v0, 0x13

    invoke-direct {p1, v0}, Lqie;-><init>(B)V

    iput-object p1, p0, Ltjc;->f:Lqie;

    iget-object p1, p3, Ln9h;->b:Ljava/lang/Object;

    check-cast p1, La64;

    new-instance v0, Lbz1;

    const/16 v1, 0x19

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p3}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p3, 0x3

    invoke-static {p1, v2, v2, v0, p3}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    new-instance p1, Lrml;

    sget-object p3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p1, p3, p2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p2, Lrjc;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lrjc;-><init>(Ltjc;B)V

    invoke-virtual {p1, p2}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    new-instance p2, Lrjc;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lrjc;-><init>(Ltjc;B)V

    invoke-virtual {p1, p2}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method


# virtual methods
.method public final a(Lq3g;Ltu;)V
    .registers 6

    iget-boolean v0, p0, Ltjc;->g:Z

    if-eqz v0, :cond_1e

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ltjc;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lyo7;

    const/16 v2, 0xd

    invoke-direct {v1, p0, p1, p2, v2}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Ltjc;->f:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :cond_1e
    new-instance v0, Lhv;

    const/16 v1, 0x14

    invoke-direct {v0, p0, p1, p2, v1}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ltjc;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Ls3g;Lve9;)V
    .registers 6

    iget-boolean v0, p0, Ltjc;->g:Z

    if-eqz v0, :cond_1e

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ltjc;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lyo7;

    const/16 v2, 0xc

    invoke-direct {v1, p0, p1, p2, v2}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Ltjc;->f:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :cond_1e
    new-instance v0, Lhv;

    const/16 v1, 0x13

    invoke-direct {v0, p0, p1, p2, v1}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ltjc;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Ls3g;Lsu;)V
    .registers 5

    new-instance v0, Lhv;

    const/16 v1, 0x15

    invoke-direct {v0, p0, p1, p2, v1}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-boolean p1, p0, Ltjc;->g:Z

    if-eqz p1, :cond_25

    new-instance p1, Lrml;

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v1, p0, Ltjc;->a:Lumi;

    invoke-direct {p1, p2, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p2, Lnna;

    const/16 v1, 0x1a

    invoke-direct {p2, v0, v1}, Lnna;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Ltjc;->f:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :cond_25
    iget-object p0, p0, Ltjc;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final d(Lr3g;Lhu5;)V
    .registers 6

    iget-boolean v0, p0, Ltjc;->g:Z

    if-eqz v0, :cond_1e

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ltjc;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lyo7;

    const/16 v2, 0xe

    invoke-direct {v1, p0, p1, p2, v2}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Ltjc;->f:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :cond_1e
    new-instance v0, Lhv;

    const/16 v1, 0x16

    invoke-direct {v0, p0, p1, p2, v1}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ltjc;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;ZLcom/opera/api/Callback;)V
    .registers 16

    iget-object v0, p0, Ltjc;->h:Lg0d;

    const/4 v1, 0x0

    if-eqz v0, :cond_79

    if-nez p1, :cond_9

    const-string p1, ""

    :cond_9
    iget-object v2, v0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v3, Lszc;->c:Lh58;

    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v3, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lszc;

    iget-object v5, v5, Lszc;->a:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_2e
    const/4 v10, 0x0

    new-array v3, v10, [Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, [Ljava/lang/String;

    sget-object v3, Lszc;->b:[Lszc;

    filled-new-array {p2, p1}, [Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v3, "logins"

    const-string v5, "signon_realm == ? AND username_value == ? "

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    check-cast p1, Ljava/io/Closeable;

    :try_start_4b
    move-object p2, p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {v0, p2, p3}, Lg0d;->m(Landroid/database/Cursor;Z)Ly9m;

    move-result-object p2

    instance-of p3, p2, Lb0d;

    if-eqz p3, :cond_6a

    check-cast p2, Lb0d;

    iget-object p2, p2, Lb0d;->q:Lehc;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    const/4 v0, 0x1

    if-ne p3, v0, :cond_66

    invoke-interface {p2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    goto :goto_67

    :cond_66
    move-object p2, v1

    :goto_67
    check-cast p2, Lv3g;
    :try_end_69
    .catchall {:try_start_4b .. :try_end_69} :catchall_70

    goto :goto_6b

    :cond_6a
    move-object p2, v1

    :goto_6b
    invoke-static {p1, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    move-object v1, p2

    goto :goto_79

    :catchall_70
    move-exception v0

    move-object p0, v0

    :try_start_72
    throw p0
    :try_end_73
    .catchall {:try_start_72 .. :try_end_73} :catchall_73

    :catchall_73
    move-exception v0

    move-object p2, v0

    invoke-static {p1, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2

    :cond_79
    :goto_79
    new-instance p1, Lrml;

    iget-object p2, p0, Ltjc;->a:Lumi;

    invoke-direct {p1, v1, p2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p2, Lry7;

    const/16 p3, 0x1c

    invoke-direct {p2, p4, p0, p3}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final f(Lq3g;Ltu;)V
    .registers 16

    iget-object v0, p1, Lq3g;->c:Ljava/lang/String;

    iget-object v1, p0, Ltjc;->h:Lg0d;

    const/4 v2, 0x0

    const/16 v3, 0xa

    const/4 v4, 0x0

    if-eqz v1, :cond_6c

    iget-object v5, v1, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v6, Lszc;->c:Lh58;

    new-instance v7, Ljava/util/ArrayList;

    invoke-static {v6, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v6}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lszc;

    iget-object v8, v8, Lszc;->a:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    :cond_2d
    new-array v6, v2, [Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, [Ljava/lang/String;

    sget-object v6, Lszc;->b:[Lszc;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    const-string v12, "origin_url"

    const-string v6, "logins"

    const-string v8, "blacklisted_by_user == ?"

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    check-cast v5, Ljava/io/Closeable;

    :try_start_4e
    move-object v6, v5

    check-cast v6, Landroid/database/Cursor;

    invoke-virtual {v1, v6, v2}, Lg0d;->m(Landroid/database/Cursor;Z)Ly9m;

    move-result-object v1

    instance-of v6, v1, Lb0d;

    if-eqz v6, :cond_5e

    check-cast v1, Lb0d;

    iget-object v1, v1, Lb0d;->q:Lehc;
    :try_end_5d
    .catchall {:try_start_4e .. :try_end_5d} :catchall_63

    goto :goto_5f

    :cond_5e
    move-object v1, v4

    :goto_5f
    invoke-static {v5, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto :goto_6d

    :catchall_63
    move-exception v0

    move-object p0, v0

    :try_start_65
    throw p0
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_66

    :catchall_66
    move-exception v0

    move-object p1, v0

    invoke-static {v5, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1

    :cond_6c
    move-object v1, v4

    :goto_6d
    if-nez v1, :cond_71

    sget-object v1, Ll08;->a:Ll08;

    :cond_71
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_75
    :goto_75
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lv3g;

    iget-object v7, v6, Lv3g;->c:Ljava/lang/String;

    invoke-static {v7}, Lc09;->m(Ljava/lang/String;)Lun8;

    move-result-object v7

    invoke-virtual {v7}, Lun8;->a()Z

    move-result v7

    if-eqz v7, :cond_75

    const-string v7, "opera-app-name"

    invoke-static {v6, v7}, Lui6;->v(Lv3g;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_75

    iput-object v7, v6, Lv3g;->g:Ljava/lang/String;

    const-string v7, "opera-app-icon"

    invoke-static {v6, v7}, Lui6;->v(Lv3g;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_75

    iput-object v7, v6, Lv3g;->h:Ljava/lang/String;

    goto :goto_75

    :cond_a2
    check-cast v1, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_ad
    :goto_ad
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_fa

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lv3g;

    if-nez v0, :cond_ee

    iget-object v8, v7, Lv3g;->c:Ljava/lang/String;

    const-string v9, "android"

    invoke-static {v8, v9, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_ee

    :try_start_c6
    iget-object v8, v7, Lv3g;->c:Ljava/lang/String;

    const-string v9, "opera-user"

    invoke-static {v8, v9, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_d3

    iget-object v8, p1, Lq3g;->b:Ljava/net/URI;

    goto :goto_d5

    :cond_d3
    iget-object v8, p1, Lq3g;->a:Ljava/net/URI;

    :goto_d5
    iget-object v7, v7, Lv3g;->c:Ljava/lang/String;

    invoke-static {v7}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v7

    if-eqz v8, :cond_e6

    invoke-virtual {v8}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v8

    goto :goto_e7

    :cond_e6
    move-object v8, v4

    :goto_e7
    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7
    :try_end_eb
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c6 .. :try_end_eb} :catch_ec

    goto :goto_f4

    :catch_ec
    move v7, v2

    goto :goto_f4

    :cond_ee
    iget-object v7, v7, Lv3g;->c:Ljava/lang/String;

    invoke-static {v0, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_f4
    if-eqz v7, :cond_ad

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ad

    :cond_fa
    new-instance p1, Ljava/util/ArrayList;

    invoke-static {v5, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_107
    if-ge v2, v0, :cond_119

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Lv3g;

    invoke-virtual {p0, v1}, Ltjc;->i(Lv3g;)Lsjc;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_107

    :cond_119
    new-instance v0, Lrml;

    iget-object p0, p0, Ltjc;->a:Lumi;

    invoke-direct {v0, p1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lnna;

    const/16 p1, 0x1b

    invoke-direct {p0, p2, p1}, Lnna;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final g(Ls3g;)V
    .registers 45

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v1, Ls3g;->a:Ljava/lang/String;

    iget-object v3, v1, Ls3g;->c:Ljava/lang/String;

    if-nez v2, :cond_10

    new-instance v0, Lcd6;

    invoke-direct {v0}, Lcd6;-><init>()V

    return-void

    :cond_10
    new-instance v4, Lv3g;

    const/16 v41, -0x1

    const/16 v42, 0x1f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    const-wide/16 v18, 0x0

    const-wide/16 v20, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    const-wide/16 v37, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    invoke-direct/range {v4 .. v42}, Lv3g;-><init>(Ljava/lang/Long;Lx3g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[BJJJJZLy3g;I[BLjv9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JZZII)V

    sget-object v5, Ly3g;->b:Ly3g;

    iput-object v5, v4, Lv3g;->u:Ly3g;

    iget-object v5, v1, Ls3g;->b:Ljava/lang/String;

    iput-object v5, v4, Lv3g;->c:Ljava/lang/String;

    if-eqz v3, :cond_78

    iput-object v3, v4, Lv3g;->d:Ljava/lang/String;

    const-string v5, "http"

    const-string v6, "https"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    iget-object v6, v4, Lv3g;->d:Ljava/lang/String;

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_78

    iput-object v3, v4, Lv3g;->e:Ljava/lang/String;

    :cond_78
    iput-object v2, v4, Lv3g;->k:Ljava/lang/String;

    iget-object v1, v1, Ls3g;->e:Ljava/lang/String;

    iput-object v1, v4, Lv3g;->n:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v4, Lv3g;->s:J

    iput-wide v1, v4, Lv3g;->p:J

    iput-wide v1, v4, Lv3g;->q:J

    iput-wide v1, v4, Lv3g;->r:J

    iget-object v1, v0, Ltjc;->h:Lg0d;

    if-eqz v1, :cond_10f

    invoke-virtual {v1, v4}, Lg0d;->l(Lv3g;)Le0d;

    move-result-object v2

    :try_start_92
    iget-object v1, v1, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "logins"

    sget-object v5, Lszc;->b:[Lszc;

    const-string v5, "origin_url == ? AND username_element == ? AND username_value == ? AND password_element == ? AND signon_realm == ?"

    iget-object v6, v4, Lv3g;->d:Ljava/lang/String;

    iget-object v7, v4, Lv3g;->j:Ljava/lang/String;

    iget-object v8, v4, Lv3g;->k:Ljava/lang/String;

    iget-object v9, v4, Lv3g;->m:Ljava/lang/String;

    iget-object v10, v4, Lv3g;->c:Ljava/lang/String;

    filled-new-array {v6, v7, v8, v9, v10}, [Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1
    :try_end_ac
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_92 .. :try_end_ac} :catch_d4

    if-nez v1, :cond_b8

    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Lf0d;->b:Lf0d;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_dd

    :cond_b8
    iget-wide v1, v2, Le0d;->a:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, -0x2

    invoke-static {v4, v1, v2}, Lv3g;->a(Lv3g;Ljava/lang/Long;I)Lv3g;

    move-result-object v1

    new-instance v2, Ld0d;

    invoke-direct {v2, v1}, Ld0d;-><init>(Lv3g;)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lf0d;->a:Lf0d;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_dd

    :catch_d4
    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Lf0d;->c:Lf0d;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_dd
    iget-object v1, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iget-object v2, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v2, Lf0d;

    sget-object v3, Lf0d;->a:Lf0d;

    if-ne v2, v3, :cond_104

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v4, :cond_fa

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ld0d;

    if-eqz v1, :cond_fa

    move v3, v4

    :cond_fa
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_119

    :cond_104
    new-instance v1, Lcd6;

    invoke-direct {v1}, Lcd6;-><init>()V

    new-instance v2, Lrw7;

    invoke-direct {v2, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_119

    :cond_10f
    new-instance v1, Lcd6;

    invoke-direct {v1}, Lcd6;-><init>()V

    new-instance v2, Lrw7;

    invoke-direct {v2, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_119
    new-instance v1, Lrml;

    iget-object v0, v0, Ltjc;->a:Lumi;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lg8c;

    const/16 v2, 0xb

    invoke-direct {v0, v2}, Lg8c;-><init>(B)V

    invoke-virtual {v1, v0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    return-void
.end method

.method public final h(Ls3g;Lve9;)V
    .registers 44

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Lv3g;

    const/16 v39, -0x1

    const/16 v40, 0x1f

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    const-wide/16 v18, 0x0

    const-wide/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const-wide/16 v35, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    invoke-direct/range {v2 .. v40}, Lv3g;-><init>(Ljava/lang/Long;Lx3g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[BJJJJZLy3g;I[BLjv9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JZZII)V

    sget-object v3, Ly3g;->b:Ly3g;

    iput-object v3, v2, Lv3g;->u:Ly3g;

    iget-object v3, v1, Ls3g;->b:Ljava/lang/String;

    iput-object v3, v2, Lv3g;->c:Ljava/lang/String;

    iget-object v3, v1, Ls3g;->c:Ljava/lang/String;

    if-eqz v3, :cond_6e

    iput-object v3, v2, Lv3g;->d:Ljava/lang/String;

    const-string v4, "http"

    const-string v5, "https"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    iget-object v5, v2, Lv3g;->d:Ljava/lang/String;

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6e

    iput-object v3, v2, Lv3g;->e:Ljava/lang/String;

    :cond_6e
    iget-object v3, v1, Ls3g;->d:Ljava/lang/String;

    if-eqz v3, :cond_74

    iput-object v3, v2, Lv3g;->k:Ljava/lang/String;

    :cond_74
    iget-object v1, v1, Ls3g;->e:Ljava/lang/String;

    iput-object v1, v2, Lv3g;->n:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v2, Lv3g;->s:J

    iput-wide v3, v2, Lv3g;->p:J

    iput-wide v3, v2, Lv3g;->q:J

    iput-wide v3, v2, Lv3g;->r:J

    iget-object v1, v0, Ltjc;->h:Lg0d;

    if-eqz v1, :cond_39f

    iget-object v3, v1, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v4, v2, Lv3g;->c:Ljava/lang/String;

    invoke-static {v4}, Lc09;->m(Ljava/lang/String;)Lun8;

    move-result-object v4

    invoke-virtual {v4}, Lun8;->a()Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-nez v4, :cond_a0

    iget-object v4, v2, Lv3g;->d:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_bc

    :cond_a0
    iget-object v4, v2, Lv3g;->c:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_bc

    iget-object v4, v2, Lv3g;->d:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_c7

    iget-object v4, v2, Lv3g;->d:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_c7

    :cond_bc
    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Lrzc;->b:Lrzc;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_36a

    :cond_c7
    const/4 v4, 0x0

    const/4 v7, -0x1

    invoke-static {v2, v4, v7}, Lv3g;->a(Lv3g;Ljava/lang/Long;I)Lv3g;

    move-result-object v8

    iget-object v9, v8, Lv3g;->n:Ljava/lang/String;

    sget-object v10, Lyzc;->t:Lyzc;

    iget-object v11, v1, Lg0d;->d:Lvzc;

    if-eqz v11, :cond_e6

    invoke-virtual {v11}, Lvzc;->a()Ljava/security/Key;

    move-result-object v11

    if-eqz v11, :cond_e6

    invoke-static {v9, v11}, Lwyh;->u(Ljava/lang/String;Ljava/security/Key;)[B

    move-result-object v9

    if-eqz v9, :cond_e6

    new-instance v10, Lzzc;

    invoke-direct {v10, v9}, Lzzc;-><init>([B)V

    :cond_e6
    instance-of v9, v10, Lzzc;

    if-eqz v9, :cond_361

    check-cast v10, Lzzc;

    iget-object v9, v10, Lzzc;->t:[B

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    new-instance v11, Landroid/content/ContentValues;

    sget-object v12, Lszc;->c:Lh58;

    invoke-virtual {v12}, La4;->d()I

    move-result v12

    invoke-direct {v11, v12}, Landroid/content/ContentValues;-><init>(I)V

    sget-object v12, Lg0d;->h:[B

    const-string v13, "origin_url"

    iget-object v14, v8, Lv3g;->d:Ljava/lang/String;

    invoke-virtual {v11, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "action_url"

    iget-object v14, v8, Lv3g;->e:Ljava/lang/String;

    invoke-virtual {v11, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "username_element"

    iget-object v14, v8, Lv3g;->j:Ljava/lang/String;

    invoke-virtual {v11, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "username_value"

    iget-object v14, v8, Lv3g;->k:Ljava/lang/String;

    invoke-virtual {v11, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "password_element"

    iget-object v14, v8, Lv3g;->m:Ljava/lang/String;

    invoke-virtual {v11, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "password_value"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    iget-object v9, v8, Lv3g;->o:[B

    if-nez v9, :cond_12e

    new-array v9, v5, [B

    :cond_12e
    const-string v13, "keychain_identifier"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v9, "submit_element"

    iget-object v13, v8, Lv3g;->i:Ljava/lang/String;

    invoke-virtual {v11, v9, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "signon_realm"

    iget-object v13, v8, Lv3g;->c:Ljava/lang/String;

    invoke-virtual {v11, v9, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v13, v8, Lv3g;->s:J

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v13, "date_created"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-boolean v9, v8, Lv3g;->t:Z

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const-string v13, "blacklisted_by_user"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-object v9, v8, Lv3g;->b:Lx3g;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v13, "scheme"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v9, v8, Lv3g;->u:Ly3g;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v13, "password_type"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v9, v8, Lv3g;->v:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v13, "times_used"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v9, v8, Lv3g;->w:[B

    if-nez v9, :cond_186

    sget-object v9, Lg0d;->i:[B

    :cond_186
    const-string v13, "form_data"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v9, "display_name"

    iget-object v13, v8, Lv3g;->y:Ljava/lang/String;

    invoke-virtual {v11, v9, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "icon_url"

    iget-object v13, v8, Lv3g;->z:Ljava/lang/String;

    invoke-virtual {v11, v9, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "federation_url"

    iget-object v13, v8, Lv3g;->A:Ljava/lang/String;

    invoke-virtual {v11, v9, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v9, v8, Lv3g;->B:Z

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const-string v13, "skip_zero_click"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-object v9, v8, Lv3g;->x:Ljv9;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v13, "generation_upload_status"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v9, v8, Lv3g;->l:[B

    if-nez v9, :cond_1bf

    move-object v9, v12

    :cond_1bf
    const-string v13, "possible_username_pairs"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    iget-wide v13, v8, Lv3g;->p:J

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v13, "date_last_used"

    invoke-virtual {v11, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v9, v8, Lv3g;->C:[B

    if-eqz v9, :cond_1d4

    move-object v12, v9

    :cond_1d4
    const-string v9, "moving_blocked_for"

    invoke-virtual {v11, v9, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    iget-wide v12, v8, Lv3g;->r:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v12, "date_password_modified"

    invoke-virtual {v11, v12, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v9, "sender_email"

    iget-object v12, v8, Lv3g;->F:Ljava/lang/String;

    invoke-virtual {v11, v9, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "sender_name"

    iget-object v12, v8, Lv3g;->G:Ljava/lang/String;

    invoke-virtual {v11, v9, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "sender_profile_image_url"

    iget-object v12, v8, Lv3g;->H:Ljava/lang/String;

    invoke-virtual {v11, v9, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v12, v8, Lv3g;->I:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v12, "date_received"

    invoke-virtual {v11, v12, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-boolean v9, v8, Lv3g;->J:Z

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const-string v12, "sharing_notification_displayed"

    invoke-virtual {v11, v12, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-wide v12, v8, Lv3g;->q:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v12, "date_last_filled"

    invoke-virtual {v11, v12, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-boolean v9, v8, Lv3g;->K:Z

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const-string v12, "actor_login_approved"

    invoke-virtual {v11, v12, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v9, "logins"

    invoke-virtual {v3, v9, v4, v11}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v12

    const-wide/16 v14, -0x1

    cmp-long v16, v12, v14

    if-eqz v16, :cond_24d

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v8, Lv3g;->a:Ljava/lang/Long;

    iget-object v2, v8, Lv3g;->E:Ljava/util/List;

    invoke-virtual {v1, v12, v13, v2}, Lg0d;->n(JLjava/util/List;)V

    new-instance v1, Lc0d;

    invoke-direct {v1, v8, v5, v5}, Lc0d;-><init>(Lv3g;ZZ)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Lrzc;->a:Lrzc;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v10, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_36a

    :cond_24d
    invoke-virtual {v1, v2}, Lg0d;->l(Lv3g;)Le0d;

    move-result-object v2

    iget-object v12, v8, Lv3g;->n:Ljava/lang/String;

    iget-object v13, v2, Le0d;->b:Ljava/lang/String;

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    xor-int/2addr v12, v6

    move-wide/from16 v16, v14

    invoke-virtual {v3, v9, v4, v11}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v14

    cmp-long v9, v14, v16

    if-eqz v9, :cond_357

    invoke-static {v8, v4, v7}, Lv3g;->a(Lv3g;Ljava/lang/Long;I)Lv3g;

    move-result-object v7

    iget-wide v5, v2, Le0d;->a:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v7, Lv3g;->a:Ljava/lang/Long;

    new-instance v2, Ld0d;

    invoke-direct {v2, v7}, Ld0d;-><init>(Lv3g;)V

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v8, Lv3g;->a:Ljava/lang/Long;

    iget-object v2, v8, Lv3g;->D:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_341

    iget-object v2, v8, Lv3g;->D:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    :goto_291
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const-string v11, "insecure_credentials"

    if-eqz v7, :cond_311

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ln9b;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lo9b;

    new-instance v9, Landroid/content/ContentValues;

    sget-object v19, Ltzc;->c:Lh58;

    invoke-virtual/range {v19 .. v19}, La4;->d()I

    move-result v4

    invoke-direct {v9, v4}, Landroid/content/ContentValues;-><init>(I)V

    const-string v4, "parent_id"

    move-object/from16 v19, v5

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v9, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-virtual {v13}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "insecurity_type"

    invoke-virtual {v9, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-wide v4, v7, Lo9b;->a:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-string v5, "create_time"

    invoke-virtual {v9, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-boolean v4, v7, Lo9b;->b:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "is_muted"

    invoke-virtual {v9, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-boolean v4, v7, Lo9b;->c:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "trigger_notification_from_backend"

    invoke-virtual {v9, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const/4 v4, 0x5

    const/4 v5, 0x0

    invoke-virtual {v3, v11, v5, v9, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v20

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x23

    if-lt v4, v7, :cond_306

    invoke-static {v3}, Lkg1;->f(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v20

    const-wide/16 v22, 0x0

    cmp-long v4, v20, v22

    if-lez v4, :cond_30e

    goto :goto_30a

    :cond_306
    cmp-long v4, v20, v16

    if-eqz v4, :cond_30e

    :goto_30a
    move-object/from16 v5, v19

    const/4 v6, 0x1

    goto :goto_291

    :cond_30e
    move-object/from16 v5, v19

    goto :goto_291

    :cond_311
    sget-object v4, Ln9b;->c:Lh58;

    invoke-static {v4, v4}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v4

    :cond_317
    :goto_317
    invoke-virtual {v4}, Lw4;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_342

    invoke-virtual {v4}, Lw4;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ln9b;

    invoke-interface {v2, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_317

    sget-object v7, Ltzc;->b:[Ltzc;

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v7, v5}, [Ljava/lang/String;

    move-result-object v5

    const-string v7, "parent_id == ? AND insecurity_type == ?"

    invoke-virtual {v3, v11, v7, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_317

    const/4 v6, 0x1

    goto :goto_317

    :cond_341
    const/4 v6, 0x0

    :cond_342
    iget-object v2, v8, Lv3g;->E:Ljava/util/List;

    invoke-virtual {v1, v14, v15, v2}, Lg0d;->n(JLjava/util/List;)V

    new-instance v1, Lc0d;

    invoke-direct {v1, v8, v12, v6}, Lc0d;-><init>(Lv3g;ZZ)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Lrzc;->a:Lrzc;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v10, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_36a

    :cond_357
    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Lrzc;->d:Lrzc;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_36a

    :cond_361
    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Lrzc;->c:Lrzc;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_36a
    iget-object v1, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iget-object v2, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v2, Lrzc;

    sget-object v3, Lrzc;->a:Lrzc;

    if-ne v2, v3, :cond_394

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v9, 0x1

    if-ne v2, v9, :cond_388

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lc0d;

    if-eqz v1, :cond_389

    move v5, v9

    goto :goto_38a

    :cond_388
    const/4 v2, 0x0

    :cond_389
    move v5, v2

    :goto_38a
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_3a9

    :cond_394
    new-instance v1, Lcd6;

    invoke-direct {v1}, Lcd6;-><init>()V

    new-instance v2, Lrw7;

    invoke-direct {v2, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_3a9

    :cond_39f
    new-instance v1, Lcd6;

    invoke-direct {v1}, Lcd6;-><init>()V

    new-instance v2, Lrw7;

    invoke-direct {v2, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_3a9
    new-instance v1, Lrml;

    iget-object v0, v0, Ltjc;->a:Lumi;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lnna;

    const/16 v2, 0x19

    move-object/from16 v3, p2

    invoke-direct {v0, v3, v2}, Lnna;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    return-void
.end method

.method public final i(Lv3g;)Lsjc;
    .registers 14

    iget-object v2, p1, Lv3g;->g:Ljava/lang/String;

    iget-object v0, p1, Lv3g;->d:Ljava/lang/String;

    iget-object v1, p1, Lv3g;->c:Ljava/lang/String;

    invoke-static {v1}, Lc09;->m(Ljava/lang/String;)Lun8;

    move-result-object v1

    invoke-virtual {v1}, Lun8;->a()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2c

    invoke-virtual {v1}, Lun8;->a()Z

    move-result v0

    const-string v3, ""

    if-eqz v0, :cond_26

    iget-object v0, v1, Lun8;->a:Landroid/net/Uri;

    if-eqz v0, :cond_22

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_23

    :cond_22
    move-object v0, v4

    :goto_23
    if-eqz v0, :cond_26

    move-object v3, v0

    :cond_26
    const-string v0, "https://play.google.com/store/apps/details?id="

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2c
    iget-object v1, p1, Lv3g;->c:Ljava/lang/String;

    invoke-static {v1}, Lc09;->m(Ljava/lang/String;)Lun8;

    move-result-object v1

    invoke-virtual {v1}, Lun8;->a()Z

    move-result v1

    if-eqz v1, :cond_4c

    new-instance v0, Lsjc;

    iget-object p0, p1, Lv3g;->a:Ljava/lang/Long;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p1, Lv3g;->c:Ljava/lang/String;

    iget-object v4, p1, Lv3g;->k:Ljava/lang/String;

    iget-object v5, p1, Lv3g;->n:Ljava/lang/String;

    iget-object v6, p1, Lv3g;->d:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lsjc;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_4c
    iget-object v1, p1, Lv3g;->c:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_56

    const/4 v1, 0x0

    goto :goto_68

    :cond_56
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->normalizeScheme()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "opera-user"

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    :goto_68
    new-instance v5, Lsjc;

    iget-object v2, p1, Lv3g;->a:Ljava/lang/Long;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    if-eqz v1, :cond_7a

    iget-object p0, p1, Lv3g;->c:Ljava/lang/String;

    invoke-static {p0}, Lz5i;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    move-object v7, p0

    goto :goto_bb

    :cond_7a
    iget-object p0, p0, Ltjc;->d:Ln9h;

    iget-object v1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v1, La64;

    new-instance v2, Lfb9;

    const/16 v3, 0x15

    invoke-direct {v2, p0, v0, v4, v3}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v1, v4, v4, v2, p0}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object p0

    new-instance v1, Ljava/util/concurrent/CompletableFuture;

    invoke-direct {v1}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    new-instance v2, Lwhf;

    const/16 v3, 0x19

    invoke-direct {v2, p0, v3}, Lwhf;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lt9m;

    const/4 v4, 0x2

    invoke-direct {v3, v2, v4}, Lt9m;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Ljava/util/concurrent/CompletableFuture;->handle(Ljava/util/function/BiFunction;)Ljava/util/concurrent/CompletableFuture;

    new-instance v2, Lry7;

    const/16 v3, 0xd

    invoke-direct {v2, v1, p0, v3}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v2}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    invoke-virtual {v1}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_ba

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_ba

    move-object v0, p0

    :cond_ba
    move-object v7, v0

    :goto_bb
    iget-object v8, p1, Lv3g;->c:Ljava/lang/String;

    iget-object v9, p1, Lv3g;->k:Ljava/lang/String;

    iget-object v10, p1, Lv3g;->n:Ljava/lang/String;

    iget-object v11, p1, Lv3g;->d:Ljava/lang/String;

    invoke-direct/range {v5 .. v11}, Lsjc;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v5
.end method

.method public final remove(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ls3g;

    iget-boolean v0, p0, Ltjc;->g:Z

    if-eqz v0, :cond_20

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ltjc;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lry7;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, p1, v2}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Ltjc;->f:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :cond_20
    new-instance v0, Lgv8;

    const/16 v1, 0x12

    invoke-direct {v0, p0, p1, v1}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ltjc;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
