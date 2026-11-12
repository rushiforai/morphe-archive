.class public final Lk6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lxbf;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ljava/util/HashMap;

.field public final d:Lghf;

.field public final e:Leq6;

.field public final f:Lltc;

.field public final g:Lazn;

.field public final h:Lz2g;

.field public final i:Lld7;

.field public final j:Lwd7;

.field public final k:Lld7;

.field public final l:Lqp2;

.field public final m:Lz6l;

.field public n:I

.field public o:Lb2l;

.field public p:Ld7l;

.field public final q:Lh7f;

.field public final r:Li6l;

.field public final s:Lg6l;

.field public final t:Landroid/os/Handler;

.field public final u:Ld6l;

.field public final v:Lu7k;

.field public final w:Lxg;

.field public final x:Lb5l;

.field public y:I


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/BrowserFragment;Lumi;Lxbf;Lcom/opera/android/Lazy;Lcom/opera/android/settings/SettingsManager;Leq6;Lnw3;Lhwf;Lnw3;Lxnh;Lox3;Lqp2;Lox3;Lplh;Ldj9;Lj4c;)V
    .registers 32

    move-object/from16 v0, p3

    move-object/from16 v3, p5

    move-object/from16 v7, p7

    move-object/from16 v9, p9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lk6l;->b:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lk6l;->c:Ljava/util/HashMap;

    new-instance v1, Lghf;

    invoke-direct {v1, p0}, Lghf;-><init>(Lk6l;)V

    iput-object v1, p0, Lk6l;->d:Lghf;

    new-instance v1, Lz6l;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v1, v4, v5}, Lz6l;-><init>(J)V

    iput-object v1, p0, Lk6l;->m:Lz6l;

    new-instance v1, Lh7f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lk6l;->q:Lh7f;

    new-instance v10, Li6l;

    invoke-direct {v10, p0}, Li6l;-><init>(Lk6l;)V

    iput-object v10, p0, Lk6l;->r:Li6l;

    new-instance v11, Lg6l;

    invoke-direct {v11}, Lg6l;-><init>()V

    iput-object v11, p0, Lk6l;->s:Lg6l;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lk6l;->t:Landroid/os/Handler;

    new-instance v12, Ld6l;

    invoke-direct {v12, p0}, Ld6l;-><init>(Lk6l;)V

    iput-object v12, p0, Lk6l;->u:Ld6l;

    new-instance v1, Lu7k;

    invoke-direct {v1, p0}, Lu7k;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lk6l;->v:Lu7k;

    new-instance v1, Lxg;

    invoke-direct {v1, p0}, Lxg;-><init>(Lk6l;)V

    iput-object v1, p0, Lk6l;->w:Lxg;

    iput-object v0, p0, Lk6l;->a:Lxbf;

    move-object/from16 v1, p6

    iput-object v1, p0, Lk6l;->e:Leq6;

    new-instance v2, Lqke;

    invoke-direct {v2, p0, v3, v7}, Lqke;-><init>(Lk6l;Lcom/opera/android/settings/SettingsManager;Lnw3;)V

    new-instance v1, Lltc;

    move-object/from16 v4, p8

    invoke-direct {v1, v2, v4, v9}, Lltc;-><init>(Lqke;Lhwf;Lnw3;)V

    iput-object v1, p0, Lk6l;->f:Lltc;

    new-instance v1, Lazn;

    invoke-virtual/range {p1 .. p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v4

    sget-object v5, Lio7;->z:Lio7;

    sget-object v6, Lgeb;->k:Lpza;

    invoke-static {v4, v5, v6}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lgeb;

    move-object v6, p0

    move-object/from16 v4, p10

    move-object/from16 v5, p11

    invoke-direct/range {v1 .. v8}, Lazn;-><init>(Lqke;Lcom/opera/android/settings/SettingsManager;Lxnh;Lox3;Lk6l;Lnw3;Lgeb;)V

    move-object v13, v3

    move-object v14, v7

    iput-object v1, p0, Lk6l;->g:Lazn;

    new-instance v1, Lz2g;

    invoke-direct {v1, v2, v13, v5}, Lz2g;-><init>(Lqke;Lcom/opera/android/settings/SettingsManager;Lox3;)V

    iput-object v1, p0, Lk6l;->h:Lz2g;

    new-instance v1, Lld7;

    invoke-direct {v1, v2}, Lld7;-><init>(Lqke;)V

    iput-object v1, p0, Lk6l;->i:Lld7;

    new-instance v1, Lwd7;

    invoke-virtual/range {p1 .. p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v3

    move-object/from16 v4, p13

    move-object/from16 v6, p14

    move-object/from16 v7, p15

    move-object v5, v2

    move-object v2, v3

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v7}, Lwd7;-><init>(Landroidx/fragment/app/r;Lumi;Lox3;Lqke;Lplh;Ldj9;)V

    move-object v2, v5

    iput-object v1, p0, Lk6l;->j:Lwd7;

    new-instance v1, Lld7;

    move-object/from16 v3, p16

    invoke-direct {v1, v2, v3}, Lld7;-><init>(Lqke;Lj4c;)V

    iput-object v1, p0, Lk6l;->k:Lld7;

    move-object/from16 v1, p12

    iput-object v1, p0, Lk6l;->l:Lqp2;

    new-instance v1, Lyg;

    invoke-direct {v1, p0, v14, v9}, Lyg;-><init>(Lk6l;Lnw3;Lnw3;)V

    invoke-static {v10}, Lac8;->c(Ljava/lang/Object;)V

    sget-object v1, Lowe;->c:Lowe;

    invoke-virtual {v1, v12}, Lowe;->a(Lnwe;)V

    new-instance v1, Lb5l;

    new-instance v2, Ls99;

    const/4 v3, 0x1

    invoke-direct {v2, v13, v3}, Ls99;-><init>(Lcom/opera/android/settings/SettingsManager;B)V

    invoke-static/range {p4 .. p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Ls4k;

    move-object/from16 v5, p4

    invoke-direct {v4, v5, v3}, Ls4k;-><init>(Lcom/opera/android/Lazy;B)V

    invoke-direct {v1, v2, p0, v0, v4}, Lb5l;-><init>(Ls99;Lk6l;Lxbf;Ls4k;)V

    iput-object v1, p0, Lk6l;->x:Lb5l;

    invoke-virtual {p0, v1}, Lk6l;->c(Lj6l;)V

    iget-object p0, v11, Lg6l;->a:Lh7f;

    invoke-virtual {p0, v1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final A()Lb2l;
    .registers 1

    iget-object p0, p0, Lk6l;->o:Lb2l;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lb2l;

    return-object p0
.end method

.method public final B(Lb2l;)V
    .registers 3

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lk6l;->C(Lb2l;I)V

    return-void
.end method

.method public final C(Lb2l;I)V
    .registers 7

    if-nez p1, :cond_8

    const-string v0, "Active tab set to null"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    iget-object v0, p0, Lk6l;->o:Lb2l;

    if-eq p1, v0, :cond_4f

    if-eqz v0, :cond_15

    move-object v1, v0

    check-cast v1, Ld7l;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ld7l;->W(Z)V

    :cond_15
    iput-object p1, p0, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_4f

    move-object v1, p1

    check-cast v1, Ld7l;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ld7l;->W(Z)V

    if-eqz v0, :cond_27

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v1

    goto :goto_29

    :cond_27
    sget-object v1, Lp6l;->a:Lp6l;

    :goto_29
    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object v3

    if-eq v3, v1, :cond_34

    iget v1, p0, Lk6l;->y:I

    add-int/2addr v1, v2

    iput v1, p0, Lk6l;->y:I

    :cond_34
    iget-object p0, p0, Lk6l;->q:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_3a
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj6l;

    :try_start_46
    invoke-interface {v1, v0, p1, p2}, Lj6l;->H(Lb2l;Lb2l;I)V
    :try_end_49
    .catch Ljava/lang/RuntimeException; {:try_start_46 .. :try_end_49} :catch_4a

    goto :goto_3a

    :catch_4a
    move-exception v1

    invoke-static {v1}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_3a

    :cond_4f
    return-void
.end method

.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lj6l;

    invoke-virtual {p0, p1}, Lk6l;->c(Lj6l;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lj6l;

    invoke-virtual {p0, p1}, Lk6l;->x(Lj6l;)V

    return-void
.end method

.method public final a(La2l;)Lf6l;
    .registers 3

    new-instance v0, Lf6l;

    invoke-direct {v0, p1}, Lf6l;-><init>(La2l;)V

    invoke-virtual {p0, v0}, Lk6l;->c(Lj6l;)V

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_11

    check-cast p0, Ld7l;

    invoke-virtual {p0, p1}, Ld7l;->e0(La2l;)V

    :cond_11
    return-object v0
.end method

.method public final b(La2l;)V
    .registers 2

    iget-object p0, p0, Lk6l;->s:Lg6l;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Lj6l;)V
    .registers 2

    iget-object p0, p0, Lk6l;->q:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final e(ILd7l;Z)V
    .registers 6

    invoke-virtual {p0, p2, p1}, Lk6l;->g(Ld7l;I)V

    iget-object p1, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_e

    if-eqz p3, :cond_12

    :cond_e
    const/4 p3, 0x3

    invoke-virtual {p0, p2, p3}, Lk6l;->C(Lb2l;I)V

    :cond_12
    iget-object p2, p0, Lk6l;->q:Lh7f;

    invoke-static {p2, p2}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p2

    :goto_18
    invoke-virtual {p2}, Lg7f;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_32

    invoke-virtual {p2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lj6l;

    :try_start_24
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    iget v0, p0, Lk6l;->n:I

    invoke-interface {p3, v0}, Lj6l;->d(I)V
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_24 .. :try_end_2c} :catch_2d

    goto :goto_18

    :catch_2d
    move-exception p3

    invoke-static {p3}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_18

    :cond_32
    return-void
.end method

.method public final f(Lb2l;Ld7l;Z)V
    .registers 5

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    if-eqz p1, :cond_b

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_f

    :cond_b
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_f
    invoke-virtual {p0, p1, p2, p3}, Lk6l;->e(ILd7l;Z)V

    return-void
.end method

.method public final g(Ld7l;I)V
    .registers 7

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lk6l;->q()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    goto :goto_19

    :cond_11
    invoke-virtual {p0}, Lk6l;->q()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    :goto_19
    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v1, p1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lk6l;->c:Ljava/util/HashMap;

    invoke-virtual {v2, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v1

    if-eqz v1, :cond_3b

    iget v1, p0, Lk6l;->n:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lk6l;->n:I

    :cond_3b
    iget-object v1, p0, Lk6l;->q:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_41
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_57

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj6l;

    const/4 v3, 0x0

    :try_start_4e
    invoke-interface {v2, p1, p2, v3}, Lj6l;->o(Lb2l;IZ)V
    :try_end_51
    .catch Ljava/lang/RuntimeException; {:try_start_4e .. :try_end_51} :catch_52

    goto :goto_41

    :catch_52
    move-exception v2

    invoke-static {v2}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_41

    :cond_57
    iget-object v1, p0, Lk6l;->s:Lg6l;

    invoke-virtual {p1, v1}, Ld7l;->e0(La2l;)V

    if-lez p2, :cond_67

    add-int/lit8 p2, p2, -0x1

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lb2l;

    goto :goto_68

    :cond_67
    const/4 p2, 0x0

    :goto_68
    iget-object p0, p0, Lk6l;->x:Lb5l;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_b7

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    move-object v1, p2

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v1

    if-ne v0, v1, :cond_b7

    iget-object v0, p0, Lb5l;->b:Lk6l;

    iget-object v0, v0, Lk6l;->d:Lghf;

    iget-object v0, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh6l;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_b8

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_a3
    iget-object v0, p1, Ld7l;->l:Llqm;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_b4

    const/16 v1, 0xd

    if-eq v0, v1, :cond_b4

    const/16 v1, 0x2a

    if-ne v0, v1, :cond_b7

    :cond_b4
    invoke-virtual {p0, p2, p1}, Lb5l;->W(Lb2l;Ld7l;)V

    :cond_b7
    :pswitch_b7
    return-void

    :pswitch_data_b8
    .packed-switch 0x0
        :pswitch_b7
        :pswitch_b7
        :pswitch_b7
        :pswitch_b7
        :pswitch_b7
        :pswitch_b7
        :pswitch_b7
        :pswitch_b7
    .end packed-switch
.end method

.method public final h(Lh6l;)V
    .registers 5

    iget-object p0, p0, Lk6l;->d:Lghf;

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v1, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v1, Lbde;

    if-nez v1, :cond_1f

    new-instance v1, Lbde;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lghf;->c:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lk6l;->c(Lj6l;)V

    iget-object v1, v0, Lk6l;->s:Lg6l;

    iget-object v2, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v2, Lbde;

    invoke-virtual {v1, v2}, Lg6l;->F(Ljava/lang/Object;)V

    :cond_1f
    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, v0, Lk6l;->q:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_2c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_41

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj6l;

    :try_start_38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_3b
    .catch Ljava/lang/RuntimeException; {:try_start_38 .. :try_end_3b} :catch_3c

    goto :goto_2c

    :catch_3c
    move-exception p1

    invoke-static {p1}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_2c

    :cond_41
    return-void
.end method

.method public final i(Lb2l;Z)Ld7l;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lk6l;->a:Lxbf;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v3, v1

    check-cast v3, Ld7l;

    invoke-virtual {v3}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v4

    iget-object v5, v3, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->m()Z

    move-result v11

    iget-object v5, v2, Lxbf;->b:Ljava/lang/Object;

    move-object v7, v5

    check-cast v7, Lvzk;

    invoke-virtual {v7, v11}, Lvzk;->L(Z)I

    move-result v8

    iget-object v5, v3, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v9

    if-nez v11, :cond_8d

    iget-object v5, v2, Lxbf;->g:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/browser/SessionStore;

    if-eqz v5, :cond_8d

    move-object v5, v4

    check-cast v5, Liuh;

    iget-object v6, v5, Liuh;->b:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v6}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v10

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v6}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v6

    const/4 v13, 0x0

    :goto_42
    if-ge v13, v10, :cond_81

    invoke-virtual {v5, v13}, Liuh;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v14

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->b()Z

    move-result v15

    if-eqz v15, :cond_74

    new-instance v16, Lzy3;

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->getId()I

    move-result v17

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object v18

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object v19

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->getTitle()Ljava/lang/String;

    move-result-object v20

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->a()Z

    move-result v21

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->c()[B

    move-result-object v22

    invoke-interface {v14}, Lcom/opera/android/browser/NavigationEntry;->e()[B

    move-result-object v23

    invoke-direct/range {v16 .. v23}, Lzy3;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[B)V

    move-object/from16 v14, v16

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_74
    if-eq v6, v13, :cond_78

    if-gez v6, :cond_7e

    :cond_78
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    :cond_7e
    add-int/lit8 v13, v13, 0x1

    goto :goto_42

    :cond_81
    new-instance v5, Lcom/opera/android/browser/BrowserTabState;

    invoke-direct {v5, v12, v6, v8, v9}, Lcom/opera/android/browser/BrowserTabState;-><init>(Ljava/util/ArrayList;IILcom/opera/android/browser/TabInfo;)V

    iget-object v2, v2, Lxbf;->g:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/browser/SessionStore;

    invoke-virtual {v2, v5}, Lcom/opera/android/browser/SessionStore;->c(Lcom/opera/android/browser/BrowserTabState;)V

    :cond_8d
    new-instance v6, Lilj;

    move-object v10, v4

    check-cast v10, Liuh;

    invoke-direct/range {v6 .. v11}, Lilj;-><init>(Lvzk;ILcom/opera/android/browser/TabInfo;Liuh;Z)V

    new-instance v2, Ld7l;

    invoke-direct {v2, v6, v3}, Ld7l;-><init>(Lilj;Ld7l;)V

    move/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Lk6l;->f(Lb2l;Ld7l;Z)V

    iget-object v0, v0, Lk6l;->x:Lb5l;

    invoke-virtual {v0, v1, v2}, Lb5l;->W(Lb2l;Ld7l;)V

    return-object v2
.end method

.method public final j()V
    .registers 10

    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget-object v1, p0, Lk6l;->a:Lxbf;

    const/4 v2, 0x0

    sget-object v3, Llqm;->l:Llqm;

    invoke-virtual {v1, v0, v2, v3}, Lxbf;->u(Lcom/opera/android/browser/TabInfo;ZLlqm;)Ld7l;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lk6l;->g(Ld7l;I)V

    const/4 v4, 0x3

    invoke-virtual {p0, v0, v4}, Lk6l;->C(Lb2l;I)V

    iget-object v4, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1a
    :goto_1a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_42

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb2l;

    if-eq v6, v0, :cond_1a

    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    move-object v7, v6

    check-cast v7, Ld7l;

    iget-object v7, v7, Ld7l;->j:Le7l;

    invoke-interface {v7}, Lb9l;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v8, p0, Lk6l;->c:Ljava/util/HashMap;

    invoke-virtual {v8, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v7, 0x1

    invoke-virtual {p0, v6, v7}, Lk6l;->y(Lb2l;Z)V

    goto :goto_1a

    :cond_42
    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_55

    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    invoke-virtual {v1, v0, v2, v3}, Lxbf;->u(Lcom/opera/android/browser/TabInfo;ZLlqm;)Ld7l;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lk6l;->g(Ld7l;I)V

    :cond_55
    iget-object v0, p0, Lk6l;->q:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_5b
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_75

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj6l;

    :try_start_67
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    iget v3, p0, Lk6l;->n:I

    invoke-interface {v2, v3}, Lj6l;->d(I)V
    :try_end_6f
    .catch Ljava/lang/RuntimeException; {:try_start_67 .. :try_end_6f} :catch_70

    goto :goto_5b

    :catch_70
    move-exception v2

    invoke-static {v2}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_5b

    :cond_75
    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_79
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj6l;

    :try_start_85
    invoke-interface {v0}, Lj6l;->z()V
    :try_end_88
    .catch Ljava/lang/RuntimeException; {:try_start_85 .. :try_end_88} :catch_89

    goto :goto_79

    :catch_89
    move-exception v0

    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_79

    :cond_8e
    return-void
.end method

.method public final k(Lb2l;)V
    .registers 9

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_12

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_12

    move v1, v3

    goto :goto_13

    :cond_12
    move v1, v2

    :goto_13
    move-object v4, p1

    check-cast v4, Ld7l;

    iget-object v4, v4, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->m()Z

    move-result v4

    if-nez v4, :cond_36

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget v5, p0, Lk6l;->n:I

    sub-int/2addr v4, v5

    if-ne v4, v3, :cond_36

    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object v4

    iget-object v5, p0, Lk6l;->a:Lxbf;

    sget-object v6, Llqm;->l:Llqm;

    invoke-virtual {v5, v4, v2, v6}, Lxbf;->u(Lcom/opera/android/browser/TabInfo;ZLlqm;)Ld7l;

    move-result-object v4

    invoke-virtual {p0, v4, v2}, Lk6l;->g(Ld7l;I)V

    :cond_36
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    iget-object v5, p0, Lk6l;->q:Lh7f;

    if-eqz v4, :cond_84

    iget-object v4, p0, Lk6l;->o:Lb2l;

    if-ne p1, v4, :cond_4e

    sget-object v4, Lu3l;->c:Lo3l;

    invoke-virtual {p0, p1, v4}, Lk6l;->o(Lb2l;Lu3l;)Lb2l;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v4, v3}, Lk6l;->C(Lb2l;I)V

    :cond_4e
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-object v3, p1

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lk6l;->c:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, v2}, Lk6l;->y(Lb2l;Z)V

    invoke-static {v5, v5}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_6a
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_84

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj6l;

    :try_start_76
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    iget v3, p0, Lk6l;->n:I

    invoke-interface {v2, v3}, Lj6l;->d(I)V
    :try_end_7e
    .catch Ljava/lang/RuntimeException; {:try_start_76 .. :try_end_7e} :catch_7f

    goto :goto_6a

    :catch_7f
    move-exception v2

    invoke-static {v2}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_6a

    :cond_84
    if-eqz v1, :cond_9f

    invoke-static {v5, v5}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_8a
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_9f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj6l;

    :try_start_96
    invoke-interface {p1}, Lj6l;->z()V
    :try_end_99
    .catch Ljava/lang/RuntimeException; {:try_start_96 .. :try_end_99} :catch_9a

    goto :goto_8a

    :catch_9a
    move-exception p1

    invoke-static {p1}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_8a

    :cond_9f
    return-void
.end method

.method public final l(Ljava/util/Set;)V
    .registers 8

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    iget-object v2, p0, Lk6l;->o:Lb2l;

    invoke-interface {p1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_31

    iget-object v2, p0, Lk6l;->o:Lb2l;

    sget-object v4, Lu3l;->a:Ls3l;

    new-instance v4, Lq3l;

    invoke-direct {v4, p1}, Lq3l;-><init>(Ljava/util/Set;)V

    invoke-virtual {p0, v2, v4}, Lk6l;->o(Lb2l;Lu3l;)Lb2l;

    move-result-object v2

    if-nez v2, :cond_2d

    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object v2

    iget-object v4, p0, Lk6l;->a:Lxbf;

    sget-object v5, Llqm;->l:Llqm;

    invoke-virtual {v4, v2, v3, v5}, Lxbf;->u(Lcom/opera/android/browser/TabInfo;ZLlqm;)Ld7l;

    move-result-object v2

    invoke-virtual {p0, v2, v3}, Lk6l;->g(Ld7l;I)V

    :cond_2d
    const/4 v4, 0x1

    invoke-virtual {p0, v2, v4}, Lk6l;->C(Lb2l;I)V

    :cond_31
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Le6l;

    invoke-direct {v4, p1, v3}, Le6l;-><init>(Ljava/util/Set;B)V

    invoke-static {v0, v4}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object p1

    invoke-static {v2, p1}, Lsfe;->z(Ljava/util/AbstractCollection;Lzlb;)V

    sget-object p1, Lx6l;->a:Lx6l;

    invoke-static {v2, p1}, Lexg;->A(Ljava/util/ArrayList;Lnxg;)V

    sget-object p1, Lh6l;->f:Lh6l;

    invoke-virtual {p0, p1}, Lk6l;->h(Lh6l;)V

    new-instance v0, Lpv1;

    const/4 v3, 0x7

    invoke-direct {v0, p0, v3}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    invoke-virtual {p0, p1}, Lk6l;->n(Lh6l;)V

    if-eqz v1, :cond_75

    iget-object p0, p0, Lk6l;->q:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_60
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_75

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj6l;

    :try_start_6c
    invoke-interface {p1}, Lj6l;->z()V
    :try_end_6f
    .catch Ljava/lang/RuntimeException; {:try_start_6c .. :try_end_6f} :catch_70

    goto :goto_60

    :catch_70
    move-exception p1

    invoke-static {p1}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_60

    :cond_75
    return-void
.end method

.method public final m(Z)Ld7l;
    .registers 9

    sget-object v3, Llqm;->o:Llqm;

    if-nez p1, :cond_4c

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lk6l;->e:Leq6;

    if-eqz v0, :cond_4c

    iget-object v0, v0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lgrf;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfrf;

    iget-object v1, v1, Lfrf;->a:Ljava/lang/String;

    invoke-static {v1}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4c

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfrf;

    iget-object v0, v0, Lfrf;->a:Ljava/lang/String;

    invoke-static {v0}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1, v3}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v4

    iget-object v0, p0, Lk6l;->a:Lxbf;

    if-nez v4, :cond_40

    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    invoke-virtual {v0, p0, p1, v3}, Lxbf;->u(Lcom/opera/android/browser/TabInfo;ZLlqm;)Ld7l;

    move-result-object p0

    return-object p0

    :cond_40
    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object v1

    const/4 v5, 0x1

    const/4 v6, 0x0

    move v2, p1

    invoke-virtual/range {v0 .. v6}, Lxbf;->v(Lcom/opera/android/browser/TabInfo;ZLlqm;Llsc;ZLjava/util/List;)Ld7l;

    move-result-object p0

    return-object p0

    :cond_4c
    move v2, p1

    iget-object p0, p0, Lk6l;->a:Lxbf;

    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    invoke-virtual {p0, p1, v2, v3}, Lxbf;->u(Lcom/opera/android/browser/TabInfo;ZLlqm;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final n(Lh6l;)V
    .registers 6

    iget-object p0, p0, Lk6l;->d:Lghf;

    iget-object p1, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p1, Lk6l;

    iget-object v0, p1, Lk6l;->q:Lh7f;

    iget-object v1, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6b

    const/4 v2, 0x1

    invoke-static {v2, v1}, Lvep;->r(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lh6l;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v2

    :goto_1d
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_32

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj6l;

    :try_start_29
    invoke-interface {v3}, Lj6l;->k()V
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_29 .. :try_end_2c} :catch_2d

    goto :goto_1d

    :catch_2d
    move-exception v3

    invoke-static {v3}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_1d

    :cond_32
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6b

    iget-object v1, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v1, Lbde;

    if-eqz v1, :cond_6b

    invoke-virtual {p1, v1}, Lk6l;->x(Lj6l;)V

    iget-object p1, p1, Lk6l;->s:Lg6l;

    iget-object v2, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v2, Lbde;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p1, Lg6l;->a:Lh7f;

    invoke-virtual {p1, v2}, Lh7f;->c(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lghf;->c:Ljava/lang/Object;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_56
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_6b

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj6l;

    :try_start_62
    invoke-interface {p1, v1}, Lj6l;->K(Lbde;)V
    :try_end_65
    .catch Ljava/lang/RuntimeException; {:try_start_62 .. :try_end_65} :catch_66

    goto :goto_56

    :catch_66
    move-exception p1

    invoke-static {p1}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_56

    :cond_6b
    return-void
.end method

.method public final o(Lb2l;Lu3l;)Lb2l;
    .registers 7

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_e

    sget-object v0, Lu3l;->b:Ls3l;

    goto :goto_10

    :cond_e
    sget-object v0, Lu3l;->a:Ls3l;

    :goto_10
    move-object v1, p1

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v1

    iget v1, v1, Lcom/opera/android/browser/TabInfo;->d:I

    iget-object p0, p0, Lk6l;->v:Lu7k;

    if-eqz v1, :cond_36

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lp3l;

    invoke-direct {v2, p2, v0}, Lp3l;-><init>(Lu3l;Lu3l;)V

    new-instance v3, Lr3l;

    invoke-direct {v3, v1}, Lr3l;-><init>(I)V

    new-instance v1, Lp3l;

    invoke-direct {v1, v2, v3}, Lp3l;-><init>(Lu3l;Lu3l;)V

    invoke-virtual {p0, p1, v1}, Lu7k;->n(Lb2l;Lu3l;)Lb2l;

    move-result-object v1

    goto :goto_37

    :cond_36
    const/4 v1, 0x0

    :goto_37
    if-nez v1, :cond_45

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lp3l;

    invoke-direct {v1, p2, v0}, Lp3l;-><init>(Lu3l;Lu3l;)V

    invoke-virtual {p0, p1, v1}, Lu7k;->n(Lb2l;Lu3l;)Lb2l;

    move-result-object v1

    :cond_45
    if-nez v1, :cond_54

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object v0

    sget-object v2, Lp6l;->b:Lp6l;

    if-ne v0, v2, :cond_54

    invoke-virtual {p0, p1, p2}, Lu7k;->n(Lb2l;Lu3l;)Lb2l;

    move-result-object p0

    return-object p0

    :cond_54
    return-object v1
.end method

.method public final p()Lxg;
    .registers 1

    iget-object p0, p0, Lk6l;->w:Lxg;

    return-object p0
.end method

.method public final q()I
    .registers 2

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget p0, p0, Lk6l;->n:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public final r(I)Lb2l;
    .registers 2

    iget-object p0, p0, Lk6l;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    return-object p0
.end method

.method public final s(Lp6l;)I
    .registers 3

    sget-object v0, Lp6l;->b:Lp6l;

    if-ne p1, v0, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    invoke-virtual {p0, p1}, Lk6l;->t(Z)I

    move-result p0

    return p0
.end method

.method public final t(Z)I
    .registers 2

    if-eqz p1, :cond_5

    iget p0, p0, Lk6l;->n:I

    return p0

    :cond_5
    iget-object p1, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget p0, p0, Lk6l;->n:I

    sub-int/2addr p1, p0

    return p1
.end method

.method public final u(II)V
    .registers 5

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb2l;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v0, p0, Lk6l;->q:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_11
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj6l;

    :try_start_1d
    invoke-interface {v1, p1, p2}, Lj6l;->h(Lb2l;I)V
    :try_end_20
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_20} :catch_21

    goto :goto_11

    :catch_21
    move-exception v1

    invoke-static {v1}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_11

    :cond_26
    iget-object p1, p0, Lk6l;->d:Lghf;

    iget-object p1, p1, Lghf;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_35

    invoke-static {p0}, Lexg;->d(Lk6l;)V

    :cond_35
    return-void
.end method

.method public final v(La2l;)V
    .registers 2

    iget-object p0, p0, Lk6l;->s:Lg6l;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final x(Lj6l;)V
    .registers 3

    iget-object v0, p0, Lk6l;->q:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    instance-of v0, p1, Lf6l;

    if-eqz v0, :cond_16

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_16

    check-cast p1, Lf6l;

    iget-object p1, p1, Lf6l;->a:La2l;

    check-cast p0, Ld7l;

    invoke-virtual {p0, p1}, Ld7l;->s0(La2l;)V

    :cond_16
    return-void
.end method

.method public final y(Lb2l;Z)V
    .registers 8

    iget-object v0, p0, Lk6l;->t:Landroid/os/Handler;

    iget-object v1, p0, Lk6l;->p:Ld7l;

    const/4 v2, 0x0

    if-ne p1, v1, :cond_9

    iput-object v2, p0, Lk6l;->p:Ld7l;

    :cond_9
    move-object v1, p1

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v1

    if-eqz v1, :cond_35

    iget v1, p0, Lk6l;->n:I

    const/4 v3, 0x1

    sub-int/2addr v1, v3

    iput v1, p0, Lk6l;->n:I

    if-nez v1, :cond_35

    iget-object v1, p0, Lk6l;->l:Lqp2;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lhj;->a:Li7f;

    invoke-static {}, LJ/N;->Mgtu0Tn5()V

    sget-object v1, Lvl8;->b:Lvl8;

    iget-object v1, v1, Lvl8;->a:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    sget-object v1, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    invoke-static {v3}, LJ/N;->MGrsowqE(Z)V

    invoke-static {v3, v2}, Lj14;->t(ZLyqd;)V

    :cond_35
    const/4 v1, 0x0

    const/16 v2, 0x15

    :try_start_38
    iget-object v3, p0, Lk6l;->q:Lh7f;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lg7f;

    invoke-direct {v4, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_42
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_57

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj6l;
    :try_end_4e
    .catchall {:try_start_38 .. :try_end_4e} :catchall_60

    :try_start_4e
    invoke-interface {v3, p1, p2}, Lj6l;->L(Lb2l;Z)V
    :try_end_51
    .catch Ljava/lang/RuntimeException; {:try_start_4e .. :try_end_51} :catch_52
    .catchall {:try_start_4e .. :try_end_51} :catchall_60

    goto :goto_42

    :catch_52
    move-exception v3

    :try_start_53
    invoke-static {v3}, Lks3;->D(Ljava/lang/Throwable;)V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_60

    goto :goto_42

    :cond_57
    new-instance p2, Lwr9;

    invoke-direct {p2, v2, p0, p1, v1}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_60
    move-exception p2

    new-instance v3, Lwr9;

    invoke-direct {v3, v2, p0, p1, v1}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw p2
.end method

.method public final z()V
    .registers 2

    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->u()V

    goto :goto_a

    :cond_1c
    return-void
.end method
