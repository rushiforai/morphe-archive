.class public abstract Lbpf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhp7;

.field public static final b:Lapf;

.field public static final c:Lapf;

.field public static final d:Lhp7;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkof;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lkof;-><init>(B)V

    new-instance v1, Lhp7;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lbpf;->a:Lhp7;

    sget-object v0, Lrkf;->a:Lu02;

    invoke-static {v0}, Lbpf;->a(Lu02;)Lapf;

    move-result-object v0

    sput-object v0, Lbpf;->b:Lapf;

    sget-object v0, Lrkf;->b:Lu02;

    invoke-static {v0}, Lbpf;->a(Lu02;)Lapf;

    move-result-object v0

    sput-object v0, Lbpf;->c:Lapf;

    new-instance v0, Lkof;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lkof;-><init>(B)V

    new-instance v1, Lhp7;

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lbpf;->d:Lhp7;

    return-void
.end method

.method public static final a(Lu02;)Lapf;
    .registers 21

    move-object/from16 v0, p0

    new-instance v1, Lapf;

    iget-object v2, v0, Lu02;->a:Ljava/lang/Object;

    check-cast v2, Llh9;

    sget-object v3, Ljed;->a:Lved;

    sget v4, Ljed;->b:F

    sget v5, Ljed;->c:F

    sget v6, Ljed;->d:F

    invoke-static {v2, v3, v4, v5, v6}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v2

    iget-object v3, v0, Lu02;->b:Ljava/lang/Object;

    check-cast v3, Llh9;

    sget-object v4, Lked;->a:Lved;

    sget v5, Lked;->b:F

    sget v6, Lked;->c:F

    const/4 v7, 0x0

    invoke-static {v3, v4, v5, v6, v7}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v3

    iget-object v4, v0, Lu02;->c:Ljava/lang/Object;

    check-cast v4, Llh9;

    sget-object v5, Lled;->a:Lved;

    sget v6, Lled;->b:F

    sget v8, Lled;->c:F

    invoke-static {v4, v5, v6, v8, v7}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v4

    iget-object v5, v0, Lu02;->d:Ljava/lang/Object;

    check-cast v5, Llh9;

    sget-object v6, Lmed;->a:Lved;

    sget v8, Lmed;->b:F

    sget v9, Lmed;->c:F

    invoke-static {v5, v6, v8, v9, v7}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v5

    iget-object v6, v0, Lu02;->e:Ljava/lang/Object;

    check-cast v6, Llh9;

    sget-object v8, Lned;->a:Lved;

    sget v9, Lned;->b:F

    sget v10, Lned;->c:F

    invoke-static {v6, v8, v9, v10, v7}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v6

    iget-object v8, v0, Lu02;->f:Ljava/lang/Object;

    check-cast v8, Llh9;

    sget-object v9, Loed;->a:Lved;

    sget v10, Loed;->b:F

    sget v11, Loed;->c:F

    invoke-static {v8, v9, v10, v11, v7}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v8

    iget-object v9, v0, Lu02;->g:Ljava/lang/Object;

    check-cast v9, Llh9;

    sget-object v10, Lsed;->a:Lved;

    sget v11, Lsed;->b:F

    sget v12, Lsed;->c:F

    invoke-static {v9, v10, v11, v12, v7}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v7

    iget-object v9, v0, Lu02;->h:Ljava/lang/Object;

    check-cast v9, Llh9;

    sget-object v10, Lted;->a:Lved;

    sget v11, Lted;->b:F

    sget v12, Lted;->c:F

    sget v13, Lted;->d:F

    invoke-static {v9, v10, v11, v12, v13}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v9

    iget-object v10, v0, Lu02;->i:Ljava/lang/Object;

    check-cast v10, Llh9;

    sget-object v11, Lued;->a:Lved;

    sget v12, Lued;->b:F

    sget v13, Lued;->c:F

    sget v14, Lued;->d:F

    invoke-static {v10, v11, v12, v13, v14}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v10

    iget-object v11, v0, Lu02;->j:Ljava/lang/Object;

    check-cast v11, Llh9;

    sget-object v12, Lged;->a:Lved;

    sget v13, Lged;->b:F

    sget v14, Lged;->c:F

    sget v15, Lged;->d:F

    invoke-static {v11, v12, v13, v14, v15}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v11

    iget-object v12, v0, Lu02;->k:Ljava/lang/Object;

    check-cast v12, Llh9;

    sget-object v13, Lhed;->a:Lved;

    sget v14, Lhed;->b:F

    sget v15, Lhed;->c:F

    move-object/from16 v16, v1

    sget v1, Lhed;->d:F

    invoke-static {v12, v13, v14, v15, v1}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v1

    iget-object v12, v0, Lu02;->l:Ljava/lang/Object;

    check-cast v12, Llh9;

    sget-object v13, Lied;->a:Lved;

    sget v14, Lied;->b:F

    sget v15, Lied;->c:F

    move-object/from16 v17, v1

    sget v1, Lied;->d:F

    invoke-static {v12, v13, v14, v15, v1}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v12

    iget-object v1, v0, Lu02;->m:Ljava/lang/Object;

    check-cast v1, Llh9;

    sget-object v13, Lped;->a:Lved;

    sget v14, Lped;->b:F

    sget v15, Lped;->c:F

    move-object/from16 v18, v2

    sget v2, Lped;->d:F

    invoke-static {v1, v13, v14, v15, v2}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v13

    iget-object v1, v0, Lu02;->n:Ljava/lang/Object;

    check-cast v1, Llh9;

    sget-object v2, Lqed;->a:Lved;

    sget v14, Lqed;->b:F

    sget v15, Lqed;->c:F

    move-object/from16 v19, v3

    sget v3, Lqed;->d:F

    invoke-static {v1, v2, v14, v15, v3}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v14

    iget-object v0, v0, Lu02;->o:Ljava/lang/Object;

    check-cast v0, Llh9;

    sget-object v1, Lred;->a:Lved;

    sget v2, Lred;->b:F

    sget v3, Lred;->c:F

    sget v15, Lred;->d:F

    invoke-static {v0, v1, v2, v3, v15}, Lbpf;->b(Llh9;Lved;FFF)Likl;

    move-result-object v15

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v8

    move-object v8, v9

    move-object v9, v10

    move-object v10, v11

    move-object/from16 v0, v16

    move-object/from16 v11, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct/range {v0 .. v15}, Lapf;-><init>(Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;)V

    return-object v0
.end method

.method public static final b(Llh9;Lved;FFF)Likl;
    .registers 23

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_18

    const/4 v2, 0x1

    if-eq v0, v2, :cond_15

    if-ne v0, v1, :cond_10

    sget-object v0, Lki9;->g:Lki9;

    :goto_e
    move-object v7, v0

    goto :goto_1b

    :cond_10
    invoke-static {}, Lh9o;->p()V

    const/4 v0, 0x0

    return-object v0

    :cond_15
    sget-object v0, Lki9;->f:Lki9;

    goto :goto_e

    :cond_18
    sget-object v0, Lki9;->e:Lki9;

    goto :goto_e

    :goto_1b
    const-wide v2, 0x100000000L

    move/from16 v0, p2

    invoke-static {v2, v3, v0}, Lrih;->s(JF)J

    move-result-wide v5

    move/from16 v0, p3

    invoke-static {v2, v3, v0}, Lrih;->s(JF)J

    move-result-wide v12

    move/from16 v0, p4

    invoke-static {v2, v3, v0}, Lrih;->s(JF)J

    move-result-wide v9

    new-instance v0, Lrec;

    sget v4, Loec;->b:F

    const/4 v8, 0x0

    invoke-direct {v0, v4, v8, v8}, Lrec;-><init>(FII)V

    new-instance v15, Ldhg;

    invoke-direct {v15}, Ldhg;-><init>()V

    new-instance v14, Lwil;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lrih;->s(JF)J

    move-result-wide v2

    invoke-direct {v14, v2, v3, v1}, Lwil;-><init>(JI)V

    new-instance v2, Likl;

    const/4 v11, 0x0

    const v17, 0xe1ff59

    const-wide/16 v3, 0x0

    move-object/from16 v8, p0

    move-object/from16 v16, v0

    invoke-direct/range {v2 .. v17}, Likl;-><init>(JJLki9;Llh9;JIJLwil;Ldhg;Lrec;I)V

    return-object v2
.end method
