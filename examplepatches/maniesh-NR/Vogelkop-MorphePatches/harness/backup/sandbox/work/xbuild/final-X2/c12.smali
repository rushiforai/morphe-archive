.class public final Lc12;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lyk6;

.field public final c:Lq52;

.field public final d:Ltsd;

.field public final e:Lpde;

.field public final f:Z

.field public final g:Lekc;

.field public h:Lqyj;

.field public final i:Lwnm;


# direct methods
.method public constructor <init>(ZLyk6;Lq52;Ltsd;Lpde;ZLekc;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lc12;->a:Z

    iput-object p2, p0, Lc12;->b:Lyk6;

    iput-object p3, p0, Lc12;->c:Lq52;

    iput-object p4, p0, Lc12;->d:Ltsd;

    iput-object p5, p0, Lc12;->e:Lpde;

    iput-boolean p6, p0, Lc12;->f:Z

    iput-object p7, p0, Lc12;->g:Lekc;

    invoke-virtual {p0}, Lc12;->a()Lela;

    move-result-object p1

    iget-object p6, p2, Lyk6;->o:Lkze;

    iget-object p3, p3, Lq52;->c:Lkze;

    iget-object v0, p2, Lyk6;->v:Lkze;

    iget-object p2, p2, Lyk6;->t:Lkze;

    const/4 v1, 0x7

    new-array v1, v1, [Lekc;

    const/4 v2, 0x0

    aput-object p6, v1, v2

    const/4 p6, 0x1

    aput-object p3, v1, p6

    const/4 p3, 0x2

    aput-object v0, v1, p3

    const/4 p3, 0x3

    aput-object p4, v1, p3

    const/4 p3, 0x4

    aput-object p2, v1, p3

    const/4 p2, 0x5

    aput-object p5, v1, p2

    const/4 p2, 0x6

    aput-object p7, v1, p2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/lang/Iterable;

    new-instance v0, Lq2;

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v1, 0x0

    const-class v3, Lc12;

    const-string v4, "createHostState"

    const-string v5, "createHostState()Lcom/opera/android/genapi/ariarpc/HostState;"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance p0, Lwnm;

    new-instance p3, Lfza;

    const/16 p4, 0x11

    invoke-direct {p3, p4}, Lfza;-><init>(B)V

    invoke-direct {p0, p1, p2, p3, v0}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object p0, v2, Lc12;->i:Lwnm;

    return-void
.end method


# virtual methods
.method public final a()Lela;
    .registers 23

    move-object/from16 v0, p0

    iget-object v1, v0, Lc12;->b:Lyk6;

    iget-object v2, v1, Lyk6;->o:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v0, Lc12;->c:Lq52;

    iget-object v3, v3, Lq52;->c:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lo52;

    iget-object v4, v1, Lyk6;->v:Lkze;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v5, v0, Lc12;->d:Ltsd;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    iget-object v1, v1, Lyk6;->t:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lc12;->e:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr52;

    iget-object v6, v0, Lc12;->h:Lqyj;

    const/4 v12, 0x0

    if-eqz v6, :cond_51

    iget-object v6, v6, Lqyj;->j:Lode;

    if-eqz v6, :cond_51

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbzj;

    move-object v13, v6

    goto :goto_52

    :cond_51
    move-object v13, v12

    :goto_52
    iget-object v6, v0, Lc12;->g:Lekc;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb12;

    instance-of v6, v3, Ll52;

    if-eqz v6, :cond_6d

    new-instance v6, Lnhe;

    check-cast v3, Ll52;

    iget-object v3, v3, Ll52;->a:Lfpf;

    iget-object v7, v3, Lfpf;->a:Ljava/lang/String;

    iget-object v3, v3, Lfpf;->b:Ljava/lang/String;

    invoke-direct {v6, v7, v3}, Lnhe;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_6b
    move-object v15, v6

    goto :goto_a2

    :cond_6d
    instance-of v6, v3, Lj52;

    if-eqz v6, :cond_7d

    new-instance v6, Lzf1;

    check-cast v3, Lj52;

    iget-object v3, v3, Lj52;->a:Lcpf;

    iget-object v3, v3, Lcpf;->a:Ljava/lang/String;

    invoke-direct {v6, v3}, Lzf1;-><init>(Ljava/lang/String;)V

    goto :goto_6b

    :cond_7d
    instance-of v6, v3, Ln52;

    if-eqz v6, :cond_8d

    new-instance v6, Lwhi;

    check-cast v3, Ln52;

    iget-object v3, v3, Ln52;->a:Lehf;

    iget-object v3, v3, Lehf;->a:Ljava/lang/String;

    invoke-direct {v6, v3}, Lwhi;-><init>(Ljava/lang/String;)V

    goto :goto_6b

    :cond_8d
    sget-object v6, Lm52;->a:Lm52;

    invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_a1

    sget-object v6, Lk52;->a:Lk52;

    invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a1

    invoke-static {}, Lh9o;->p()V

    return-object v12

    :cond_a1
    move-object v15, v12

    :goto_a2
    new-instance v3, Lx1g;

    sget-object v14, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v3, v2}, Lx1g;-><init>(Ljava/lang/Boolean;)V

    new-instance v17, Le2g;

    iget-boolean v2, v0, Lc12;->a:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v5, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-static {v5, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    iget-boolean v0, v0, Lc12;->f:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    move-object/from16 v6, v17

    invoke-direct/range {v6 .. v11}, Le2g;-><init>(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    new-instance v0, Lvla;

    invoke-direct {v0, v4}, Lvla;-><init>(Ljava/lang/Boolean;)V

    new-instance v2, Ll8b;

    if-eqz v1, :cond_de

    iget-wide v4, v1, Lr52;->a:J

    iget-boolean v1, v1, Lr52;->b:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_e1

    :cond_de
    const-wide/16 v4, 0x0

    move-object v1, v12

    :goto_e1
    invoke-static {v1, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ea

    sget-object v1, Lnla;->d:Lnla;

    goto :goto_ec

    :cond_ea
    sget-object v1, Lnla;->c:Lnla;

    :goto_ec
    sget-object v6, Lmla;->a:Lmla;

    invoke-direct {v2, v4, v5, v1}, Ll8b;-><init>(JLnla;)V

    new-instance v20, Lila;

    sget-object v1, Lkla;->a:Lkla;

    invoke-direct/range {v20 .. v20}, Ljava/lang/Object;-><init>()V

    instance-of v1, v13, Lyyj;

    if-eqz v1, :cond_10f

    check-cast v13, Lyyj;

    iget-object v1, v13, Lyyj;->a:Ljava/lang/String;

    new-instance v12, Lezj;

    new-instance v4, Ltla;

    sget-object v5, Lula;->a:Lula;

    invoke-direct {v4, v1}, Ltla;-><init>(Ljava/lang/String;)V

    invoke-direct {v12, v4}, Lezj;-><init>(Ltla;)V

    :cond_10c
    :goto_10c
    move-object/from16 v21, v12

    goto :goto_146

    :cond_10f
    instance-of v1, v13, Lxyj;

    if-eqz v1, :cond_124

    check-cast v13, Lxyj;

    iget-object v1, v13, Lxyj;->a:Ljava/lang/String;

    new-instance v12, Lezj;

    new-instance v4, Ltla;

    sget-object v5, Lula;->a:Lula;

    invoke-direct {v4, v1}, Ltla;-><init>(Ljava/lang/String;)V

    invoke-direct {v12, v4}, Lezj;-><init>(Ltla;)V

    goto :goto_10c

    :cond_124
    instance-of v1, v13, Lvyj;

    if-nez v1, :cond_10c

    sget-object v1, Lwyj;->a:Lwyj;

    invoke-static {v13, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10c

    sget-object v1, Lzyj;->a:Lzyj;

    invoke-static {v13, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10c

    sget-object v1, Lazj;->a:Lazj;

    invoke-static {v13, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10c

    if-eqz v13, :cond_10c

    invoke-static {}, Lh9o;->p()V

    return-object v12

    :goto_146
    new-instance v14, Lela;

    move-object/from16 v18, v0

    move-object/from16 v19, v2

    move-object/from16 v16, v3

    invoke-direct/range {v14 .. v21}, Lela;-><init>(Litm;Lx1g;Le2g;Lvla;Ll8b;Lila;Lezj;)V

    return-object v14
.end method
