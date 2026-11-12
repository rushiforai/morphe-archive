.class public final Lgq3;
.super Lzz1;
.source "SourceFile"


# instance fields
.field public final n:Lzv3;

.field public final o:Lize;

.field public final p:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lndc;Lzv3;Lize;Ljava/lang/Runnable;Lesk;Lmlj;Lcom/opera/api/Callback;Lkotlin/jvm/functions/Function2;Lesk;Lg7m;Lk42;Lv5n;Lgjm;)V
    .registers 27

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    move-object/from16 v5, p8

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    move-object/from16 v8, p11

    move-object/from16 v9, p12

    move-object/from16 v10, p13

    move-object/from16 v11, p14

    invoke-direct/range {v0 .. v11}, Lzz1;-><init>(Landroid/content/Context;Lndc;Lesk;Lmlj;Lcom/opera/api/Callback;Lkotlin/jvm/functions/Function2;Lesk;Lg7m;Lk42;Lv5n;Lgjm;)V

    iput-object p3, p0, Lgq3;->n:Lzv3;

    move-object/from16 p1, p4

    iput-object p1, p0, Lgq3;->o:Lize;

    move-object/from16 p1, p5

    iput-object p1, p0, Lgq3;->p:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    iget-object p0, p0, Lgq3;->p:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final d(Ljava/lang/String;Z)V
    .registers 11

    sget-object p2, Lvz1;->a:Lpsp;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lpsp;->n(Ljava/lang/String;)Lvz1;

    move-result-object p2

    if-eqz p2, :cond_f

    invoke-virtual {p0, p2}, Lzz1;->f(Lvz1;)V

    return-void

    :cond_f
    iget-object p2, p0, Lgq3;->o:Lize;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_20

    const/4 p2, 0x2

    :goto_1e
    move v2, p2

    goto :goto_22

    :cond_20
    const/4 p2, 0x3

    goto :goto_1e

    :goto_22
    iget-object p2, p0, Lgq3;->n:Lzv3;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Luv0;

    new-instance v6, Loc2;

    const/16 p2, 0x10

    invoke-direct {v6, p0, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    const/4 v7, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-static/range {v0 .. v7}, Luv0;->b(Luv0;Ljava/lang/String;ILb2l;ZZLoc2;I)V

    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 10

    iget-object v0, p0, Lgq3;->o:Lize;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x2

    :goto_f
    move v3, v0

    goto :goto_13

    :cond_11
    const/4 v0, 0x3

    goto :goto_f

    :goto_13
    iget-object p0, p0, Lgq3;->n:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Luv0;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v4, p1

    move-object v2, p2

    invoke-virtual/range {v1 .. v6}, Luv0;->c(Ljava/util/List;ILjava/lang/String;ZLb2l;)V

    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Lgq3;->b()V

    iget-object v0, p0, Lgq3;->o:Lize;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x2

    goto :goto_14

    :cond_13
    const/4 v0, 0x3

    :goto_14
    iget-object p0, p0, Lgq3;->n:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luv0;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, p1, v1}, Luv0;->a(IILjava/lang/String;Z)V

    return-void
.end method
