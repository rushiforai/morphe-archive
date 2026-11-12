.class public final Lyug;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Let3;

.field public final b:Lq2;

.field public final c:Lq2;


# direct methods
.method public constructor <init>(Let3;Lq2;Lq2;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyug;->a:Let3;

    iput-object p2, p0, Lyug;->b:Lq2;

    iput-object p3, p0, Lyug;->c:Lq2;

    return-void
.end method

.method public static synthetic c(Lyug;ILltg;I)V
    .registers 4

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_6

    sget-object p2, Lltg;->d:Lltg;

    :cond_6
    const/4 p3, 0x0

    invoke-virtual {p0, p1, p2, p3}, Lyug;->b(ILltg;Z)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x6

    invoke-static {p0, p1, v0, v1}, Lyug;->c(Lyug;ILltg;I)V

    return-void
.end method

.method public final b(ILltg;Z)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    iget-object v3, v0, Lyug;->a:Let3;

    invoke-virtual {v3}, Let3;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqtg;

    iget v4, v3, Lqtg;->a:I

    iget-object v5, v0, Lyug;->b:Lq2;

    const/4 v6, 0x1

    if-ne v4, v6, :cond_2a

    iget v0, v3, Lqtg;->b:I

    invoke-virtual {v5}, Lq2;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgjm;

    new-instance v4, Lptg;

    const-string v5, "DEFAULT"

    move/from16 v8, p1

    invoke-direct {v4, v8, v1, v5, v0}, Lptg;-><init>(ILltg;Ljava/lang/String;I)V

    invoke-virtual {v3, v4, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :cond_2a
    move/from16 v8, p1

    invoke-virtual {v5}, Lq2;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgjm;

    new-instance v4, Lavg;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v3, v4, v2}, Lgjm;->e(Ln37;Z)V

    iget-object v0, v0, Lyug;->c:Lq2;

    invoke-virtual {v0}, Lq2;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnvg;

    iget-object v2, v0, Lnvg;->c:Lp8f;

    iget-object v3, v0, Lnvg;->d:Lgmk;

    invoke-virtual {v2}, Lp8f;->v()Z

    move-result v4

    const/4 v5, 0x2

    if-eqz v4, :cond_5d

    iget-object v4, v0, Lnvg;->c:Lp8f;

    invoke-virtual {v4}, Lp8f;->v()Z

    move-result v7

    if-eqz v7, :cond_5d

    iget-object v7, v3, Lgmk;->a:Lkze;

    invoke-virtual {v7, v0}, Lekc;->p(Lf7f;)V

    invoke-virtual {v4, v5}, Lp8f;->C(I)V

    :cond_5d
    invoke-virtual {v2}, Lp8f;->v()Z

    move-result v4

    if-eqz v4, :cond_66

    invoke-virtual {v2, v5}, Lp8f;->C(I)V

    :cond_66
    new-instance v7, Lmvg;

    iget-object v10, v1, Lltg;->a:Ljava/lang/String;

    iget-object v11, v1, Lltg;->b:Ljava/lang/String;

    iget-object v12, v1, Lltg;->c:Ljava/lang/String;

    sget-object v13, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v15, 0x2

    const/16 v9, 0x8

    move-object v14, v13

    invoke-direct/range {v7 .. v15}, Lmvg;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;I)V

    invoke-virtual {v2, v7}, Lp8f;->G(Lmvg;)V

    iget-byte v1, v0, Lnvg;->h:B

    if-eqz v1, :cond_8c

    const/4 v1, 0x0

    iput-byte v1, v0, Lnvg;->h:B

    iget-object v1, v3, Lgmk;->a:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luvg;

    invoke-virtual {v0, v1}, Lnvg;->b(Luvg;)V

    :cond_8c
    iget-object v1, v3, Lgmk;->a:Lkze;

    iget-object v2, v0, Lnvg;->a:Landroidx/fragment/app/r;

    invoke-virtual {v1, v2, v0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v0, Lnvg;->f:Lvvg;

    iget-byte v1, v0, Lvvg;->a:B

    if-eq v1, v5, :cond_9b

    if-ne v6, v1, :cond_9c

    :cond_9b
    return-void

    :cond_9c
    iput-byte v6, v0, Lvvg;->a:B

    const/16 v0, 0x2a

    const-string v1, "candidate"

    invoke-static {v0, v1}, Lks3;->I(ILjava/lang/String;)V

    return-void
.end method
