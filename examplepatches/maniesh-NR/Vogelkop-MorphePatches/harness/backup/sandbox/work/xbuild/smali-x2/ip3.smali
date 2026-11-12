.class public final Lip3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf99;


# instance fields
.field public final synthetic a:[Lf99;

.field public final synthetic b:Ljp3;

.field public final synthetic c:Lwth;

.field public final synthetic d:Lb49;

.field public final synthetic e:Leq6;

.field public final synthetic f:Ldw;

.field public final synthetic g:Lc37;

.field public final synthetic h:Lc37;

.field public final synthetic i:Lc37;

.field public final synthetic j:Lb49;

.field public final synthetic k:Ldw;

.field public final synthetic l:Lxm5;

.field public final synthetic m:Lqo3;

.field public final synthetic n:Lnv6;

.field public final synthetic o:Lqo3;

.field public final synthetic p:Lqo3;


# direct methods
.method public constructor <init>([Lf99;Ljp3;Lwth;Lb49;Leq6;Ldw;Lc37;Lc37;Lc37;Lb49;Ldw;Lxm5;Lqo3;Lnv6;Lqo3;Lqo3;)V
    .registers 17

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lip3;->a:[Lf99;

    iput-object p2, p0, Lip3;->b:Ljp3;

    iput-object p3, p0, Lip3;->c:Lwth;

    iput-object p4, p0, Lip3;->d:Lb49;

    iput-object p5, p0, Lip3;->e:Leq6;

    iput-object p6, p0, Lip3;->f:Ldw;

    iput-object p7, p0, Lip3;->g:Lc37;

    iput-object p8, p0, Lip3;->h:Lc37;

    iput-object p9, p0, Lip3;->i:Lc37;

    iput-object p10, p0, Lip3;->j:Lb49;

    iput-object p11, p0, Lip3;->k:Ldw;

    iput-object p12, p0, Lip3;->l:Lxm5;

    iput-object p13, p0, Lip3;->m:Lqo3;

    iput-object p14, p0, Lip3;->n:Lnv6;

    iput-object p15, p0, Lip3;->o:Lqo3;

    move-object/from16 p1, p16

    iput-object p1, p0, Lip3;->p:Lqo3;

    return-void
.end method


# virtual methods
.method public final collect(Ll99;Lmt5;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    instance-of v2, v1, Lgp3;

    if-eqz v2, :cond_17

    move-object v2, v1

    check-cast v2, Lgp3;

    iget v3, v2, Lgp3;->u:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_17

    sub-int/2addr v3, v4

    iput v3, v2, Lgp3;->u:I

    goto :goto_1c

    :cond_17
    new-instance v2, Lgp3;

    invoke-direct {v2, v0, v1}, Lgp3;-><init>(Lip3;Lmt5;)V

    :goto_1c
    iget-object v1, v2, Lgp3;->t:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget v4, v2, Lgp3;->u:I

    const/4 v5, 0x1

    if-eqz v4, :cond_32

    if-ne v4, v5, :cond_2b

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7d

    :cond_2b
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    :cond_32
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v1, Lis2;

    const/4 v4, 0x4

    iget-object v6, v0, Lip3;->a:[Lf99;

    invoke-direct {v1, v6, v4}, Lis2;-><init>([Lf99;B)V

    new-instance v7, Lhp3;

    iget-object v4, v0, Lip3;->o:Lqo3;

    iget-object v8, v0, Lip3;->p:Lqo3;

    move-object/from16 v23, v8

    iget-object v9, v0, Lip3;->b:Ljp3;

    iget-object v10, v0, Lip3;->c:Lwth;

    iget-object v11, v0, Lip3;->d:Lb49;

    iget-object v12, v0, Lip3;->e:Leq6;

    iget-object v13, v0, Lip3;->f:Ldw;

    iget-object v14, v0, Lip3;->g:Lc37;

    iget-object v15, v0, Lip3;->h:Lc37;

    iget-object v8, v0, Lip3;->i:Lc37;

    iget-object v5, v0, Lip3;->j:Lb49;

    move-object/from16 v22, v4

    iget-object v4, v0, Lip3;->k:Ldw;

    move-object/from16 v18, v4

    iget-object v4, v0, Lip3;->l:Lxm5;

    move-object/from16 v19, v4

    iget-object v4, v0, Lip3;->m:Lqo3;

    iget-object v0, v0, Lip3;->n:Lnv6;

    move-object/from16 v21, v0

    move-object/from16 v20, v4

    move-object/from16 v17, v5

    move-object/from16 v16, v8

    const/4 v8, 0x0

    invoke-direct/range {v7 .. v23}, Lhp3;-><init>(Lmt5;Ljp3;Lwth;Lb49;Leq6;Ldw;Lc37;Lc37;Lc37;Lb49;Ldw;Lxm5;Lqo3;Lnv6;Lqo3;Lqo3;)V

    const/4 v0, 0x1

    iput v0, v2, Lgp3;->u:I

    move-object/from16 v0, p1

    invoke-static {v2, v0, v7, v1, v6}, Lc09;->f(Lmt5;Ll99;Lcr9;Lkotlin/jvm/functions/Function0;[Lf99;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v3, :cond_7d

    return-object v3

    :cond_7d
    :goto_7d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method
