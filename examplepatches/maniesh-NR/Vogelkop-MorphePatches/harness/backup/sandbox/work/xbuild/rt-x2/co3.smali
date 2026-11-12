.class public final synthetic Lco3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lnvj;

.field public final synthetic c:J

.field public final synthetic d:F

.field public final synthetic e:F

.field public final synthetic f:J

.field public final synthetic g:J

.field public final synthetic h:Lqik;


# direct methods
.method public synthetic constructor <init>(ZLnvj;JFFJJLqik;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lco3;->a:Z

    iput-object p2, p0, Lco3;->b:Lnvj;

    iput-wide p3, p0, Lco3;->c:J

    iput p5, p0, Lco3;->d:F

    iput p6, p0, Lco3;->e:F

    iput-wide p7, p0, Lco3;->f:J

    iput-wide p9, p0, Lco3;->g:J

    iput-object p11, p0, Lco3;->h:Lqik;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lo3c;

    invoke-virtual {v1}, Lo3c;->a()V

    iget-object v2, v1, Lo3c;->a:Luh4;

    iget-boolean v3, v0, Lco3;->a:Z

    move-object v4, v1

    iget-object v1, v0, Lco3;->b:Lnvj;

    iget-wide v6, v0, Lco3;->c:J

    if-eqz v3, :cond_21

    const/4 v8, 0x0

    const/16 v9, 0xf6

    const-wide/16 v2, 0x0

    move-object v0, v4

    const-wide/16 v4, 0x0

    invoke-static/range {v0 .. v9}, Lmk7;->a0(Lo3c;Lnvj;JJJLnk7;I)V

    goto/16 :goto_93

    :cond_21
    const/16 v3, 0x20

    shr-long v8, v6, v3

    long-to-int v5, v8

    invoke-static {v5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v5

    iget v8, v0, Lco3;->d:F

    cmpg-float v5, v5, v8

    if-gez v5, :cond_7e

    invoke-interface {v2}, Lmk7;->e()J

    move-result-wide v8

    shr-long/2addr v8, v3

    long-to-int v3, v8

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    iget v9, v0, Lco3;->e:F

    sub-float v11, v3, v9

    invoke-interface {v2}, Lmk7;->e()J

    move-result-wide v12

    const-wide v14, 0xffffffffL

    and-long/2addr v12, v14

    long-to-int v0, v12

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    sub-float v12, v0, v9

    iget-object v14, v2, Luh4;->b:Ld5o;

    invoke-virtual {v14}, Ld5o;->D()J

    move-result-wide v2

    invoke-virtual {v14}, Ld5o;->A()Lsh4;

    move-result-object v0

    invoke-interface {v0}, Lsh4;->j()V

    :try_start_5c
    iget-object v0, v14, Ld5o;->a:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lwth;

    const/4 v13, 0x0

    move v10, v9

    invoke-virtual/range {v8 .. v13}, Lwth;->q(FFFFI)V
    :try_end_66
    .catchall {:try_start_5c .. :try_end_66} :catchall_78

    const/4 v8, 0x0

    const/16 v9, 0xf6

    move-wide v10, v2

    const-wide/16 v2, 0x0

    move-object v0, v4

    const-wide/16 v4, 0x0

    :try_start_6f
    invoke-static/range {v0 .. v9}, Lmk7;->a0(Lo3c;Lnvj;JJJLnk7;I)V
    :try_end_72
    .catchall {:try_start_6f .. :try_end_72} :catchall_76

    invoke-static {v14, v10, v11}, Lam2;->w(Ld5o;J)V

    goto :goto_93

    :catchall_76
    move-exception v0

    goto :goto_7a

    :catchall_78
    move-exception v0

    move-wide v10, v2

    :goto_7a
    invoke-static {v14, v10, v11}, Lam2;->w(Ld5o;J)V

    throw v0

    :cond_7e
    invoke-static {v6, v7, v8}, Llcp;->H(JF)J

    move-result-wide v6

    const/16 v9, 0xd0

    iget-wide v2, v0, Lco3;->f:J

    move-object v8, v4

    iget-wide v4, v0, Lco3;->g:J

    iget-object v0, v0, Lco3;->h:Lqik;

    move-object/from16 v16, v8

    move-object v8, v0

    move-object/from16 v0, v16

    invoke-static/range {v0 .. v9}, Lmk7;->a0(Lo3c;Lnvj;JJJLnk7;I)V

    :goto_93
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method
