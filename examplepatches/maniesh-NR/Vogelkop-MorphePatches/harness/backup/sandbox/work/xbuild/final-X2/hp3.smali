.class public final Lhp3;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic A:Ldw;

.field public final synthetic B:Lc37;

.field public final synthetic C:Lc37;

.field public final synthetic D:Lc37;

.field public final synthetic E:Lb49;

.field public final synthetic F:Ldw;

.field public final synthetic G:Lxm5;

.field public final synthetic H:Lqo3;

.field public final synthetic I:Lnv6;

.field public final synthetic J:Lqo3;

.field public final synthetic K:Lqo3;

.field public t:Z

.field public synthetic u:Ll99;

.field public synthetic v:[Ljava/lang/Object;

.field public final synthetic w:Ljp3;

.field public final synthetic x:Lwth;

.field public final synthetic y:Lb49;

.field public final synthetic z:Leq6;


# direct methods
.method public constructor <init>(Lmt5;Ljp3;Lwth;Lb49;Leq6;Ldw;Lc37;Lc37;Lc37;Lb49;Ldw;Lxm5;Lqo3;Lnv6;Lqo3;Lqo3;)V
    .registers 17

    iput-object p2, p0, Lhp3;->w:Ljp3;

    iput-object p3, p0, Lhp3;->x:Lwth;

    iput-object p4, p0, Lhp3;->y:Lb49;

    iput-object p5, p0, Lhp3;->z:Leq6;

    iput-object p6, p0, Lhp3;->A:Ldw;

    iput-object p7, p0, Lhp3;->B:Lc37;

    iput-object p8, p0, Lhp3;->C:Lc37;

    iput-object p9, p0, Lhp3;->D:Lc37;

    iput-object p10, p0, Lhp3;->E:Lb49;

    iput-object p11, p0, Lhp3;->F:Ldw;

    iput-object p12, p0, Lhp3;->G:Lxm5;

    iput-object p13, p0, Lhp3;->H:Lqo3;

    iput-object p14, p0, Lhp3;->I:Lnv6;

    iput-object p15, p0, Lhp3;->J:Lqo3;

    move-object/from16 p2, p16

    iput-object p2, p0, Lhp3;->K:Lqo3;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ll99;

    move-object/from16 v2, p2

    check-cast v2, [Ljava/lang/Object;

    move-object/from16 v4, p3

    check-cast v4, Lmt5;

    new-instance v3, Lhp3;

    iget-object v5, v0, Lhp3;->J:Lqo3;

    iget-object v6, v0, Lhp3;->K:Lqo3;

    move-object/from16 v18, v5

    iget-object v5, v0, Lhp3;->w:Ljp3;

    move-object/from16 v19, v6

    iget-object v6, v0, Lhp3;->x:Lwth;

    iget-object v7, v0, Lhp3;->y:Lb49;

    iget-object v8, v0, Lhp3;->z:Leq6;

    iget-object v9, v0, Lhp3;->A:Ldw;

    iget-object v10, v0, Lhp3;->B:Lc37;

    iget-object v11, v0, Lhp3;->C:Lc37;

    iget-object v12, v0, Lhp3;->D:Lc37;

    iget-object v13, v0, Lhp3;->E:Lb49;

    iget-object v14, v0, Lhp3;->F:Ldw;

    iget-object v15, v0, Lhp3;->G:Lxm5;

    move-object/from16 p1, v3

    iget-object v3, v0, Lhp3;->H:Lqo3;

    iget-object v0, v0, Lhp3;->I:Lnv6;

    move-object/from16 v17, v0

    move-object/from16 v16, v3

    move-object/from16 v3, p1

    invoke-direct/range {v3 .. v19}, Lhp3;-><init>(Lmt5;Ljp3;Lwth;Lb49;Leq6;Ldw;Lc37;Lc37;Lc37;Lb49;Ldw;Lxm5;Lqo3;Lnv6;Lqo3;Lqo3;)V

    iput-object v1, v3, Lhp3;->u:Ll99;

    iput-object v2, v3, Lhp3;->v:[Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v3, v0}, Lhp3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 28

    move-object/from16 v0, p0

    iget-object v1, v0, Lhp3;->z:Leq6;

    iget-object v1, v1, Leq6;->a:Ljava/lang/Object;

    check-cast v1, Lrlh;

    iget-object v2, v0, Lhp3;->y:Lb49;

    iget-object v2, v2, Lb49;->b:Lrlh;

    iget-object v3, v0, Lhp3;->u:Ll99;

    sget-object v4, Lpx5;->a:Lpx5;

    iget-boolean v5, v0, Lhp3;->t:Z

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v5, :cond_23

    if-ne v5, v7, :cond_1d

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_13a

    :cond_1d
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_23
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v5, v0, Lhp3;->w:Ljp3;

    iget-object v5, v5, Ljp3;->b:Ljava/lang/Object;

    check-cast v5, Lr22;

    new-instance v8, Lrsg;

    iget-object v9, v0, Lhp3;->x:Lwth;

    iget-object v9, v9, Lwth;->b:Ljava/lang/Object;

    check-cast v9, Lrlh;

    iget-object v9, v9, Lrlh;->a:Lnak;

    invoke-virtual {v9}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lq8l;

    iget-object v9, v9, Lq8l;->a:Lp8l;

    iget-object v10, v2, Lrlh;->a:Lnak;

    invoke-virtual {v10}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    iget-object v11, v1, Lrlh;->a:Lnak;

    invoke-virtual {v11}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    invoke-direct {v8, v9, v10, v11}, Lrsg;-><init>(Lp8l;ZZ)V

    invoke-virtual {v5, v8}, Lr22;->d(Lrsg;)Lno3;

    move-result-object v12

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    iget-object v1, v0, Lhp3;->A:Ldw;

    iget-object v1, v1, Ldw;->b:Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    iget-object v1, v0, Lhp3;->B:Lc37;

    iget-object v1, v1, Lc37;->b:Ljava/lang/Object;

    check-cast v1, Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    iget-object v1, v0, Lhp3;->C:Lc37;

    iget-object v1, v1, Lc37;->b:Ljava/lang/Object;

    check-cast v1, Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v16

    iget-object v1, v0, Lhp3;->D:Lc37;

    iget-object v1, v1, Lc37;->b:Ljava/lang/Object;

    check-cast v1, Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v17

    iget-object v1, v0, Lhp3;->E:Lb49;

    iget-object v1, v1, Lb49;->b:Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v18

    iget-object v1, v0, Lhp3;->F:Ldw;

    iget-object v1, v1, Ldw;->b:Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v19

    iget-object v1, v2, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    iget-object v1, v0, Lhp3;->G:Lxm5;

    iget-object v1, v1, Lxm5;->a:Ljava/lang/Object;

    check-cast v1, Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v21

    iget-object v1, v0, Lhp3;->H:Lqo3;

    invoke-interface {v1}, Lqo3;->m()Llak;

    move-result-object v1

    invoke-interface {v1}, Llak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v22

    iget-object v1, v0, Lhp3;->I:Lnv6;

    iget-object v1, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v23

    iget-object v1, v0, Lhp3;->J:Lqo3;

    invoke-interface {v1}, Lqo3;->m()Llak;

    move-result-object v1

    invoke-interface {v1}, Llak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    iget-object v1, v0, Lhp3;->K:Lqo3;

    invoke-interface {v1}, Lqo3;->m()Llak;

    move-result-object v1

    invoke-interface {v1}, Llak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    invoke-static/range {v12 .. v25}, Lfsp;->l(Lno3;ZZZZZZZZZZZZZ)Lkp3;

    move-result-object v1

    iput-object v6, v0, Lhp3;->u:Ll99;

    iput-object v6, v0, Lhp3;->v:[Ljava/lang/Object;

    iput-boolean v7, v0, Lhp3;->t:Z

    invoke-interface {v3, v1, v0}, Ll99;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v4, :cond_13a

    return-object v4

    :cond_13a
    :goto_13a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method
