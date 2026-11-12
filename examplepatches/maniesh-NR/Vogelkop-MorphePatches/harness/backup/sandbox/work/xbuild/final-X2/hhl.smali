.class public final synthetic Lhhl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic a:Lgbc;

.field public final synthetic b:Ldil;

.field public final synthetic c:Lmil;

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Li9f;

.field public final synthetic g:Lokm;

.field public final synthetic h:Llw5;

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lgbc;Ldil;Lmil;ZZLi9f;Lokm;Llw5;I)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhhl;->a:Lgbc;

    iput-object p2, p0, Lhhl;->b:Ldil;

    iput-object p3, p0, Lhhl;->c:Lmil;

    iput-boolean p4, p0, Lhhl;->d:Z

    iput-boolean p5, p0, Lhhl;->e:Z

    iput-object p6, p0, Lhhl;->f:Li9f;

    iput-object p7, p0, Lhhl;->g:Lokm;

    iput-object p8, p0, Lhhl;->h:Llw5;

    iput p9, p0, Lhhl;->i:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lc8e;

    move-object/from16 v1, p2

    check-cast v1, Lih5;

    move-object/from16 v2, p3

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Lvt9;

    const v2, 0x32c59664

    invoke-virtual {v1, v2}, Lvt9;->W(I)V

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lhh5;->a:Lzpa;

    if-ne v2, v3, :cond_29

    new-instance v2, Lwjl;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_29
    move-object v10, v2

    check-cast v10, Lwjl;

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v3, :cond_3a

    new-instance v2, Lqi6;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_3a
    move-object v13, v2

    check-cast v13, Lqi6;

    new-instance v16, Lghl;

    iget-object v5, v0, Lhhl;->a:Lgbc;

    iget-object v6, v0, Lhhl;->b:Ldil;

    iget-object v7, v0, Lhhl;->c:Lmil;

    iget-boolean v8, v0, Lhhl;->d:Z

    iget-boolean v9, v0, Lhhl;->e:Z

    iget-object v11, v0, Lhhl;->f:Li9f;

    iget-object v12, v0, Lhhl;->g:Lokm;

    iget-object v14, v0, Lhhl;->h:Llw5;

    iget v15, v0, Lhhl;->i:I

    move-object/from16 v4, v16

    invoke-direct/range {v4 .. v15}, Lghl;-><init>(Lgbc;Ldil;Lmil;ZZLwjl;Li9f;Lokm;Lqi6;Llw5;I)V

    invoke-virtual {v1, v4}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-nez v0, :cond_62

    if-ne v2, v3, :cond_78

    :cond_62
    new-instance v14, Llrk;

    const/16 v20, 0x0

    const/16 v21, 0x5

    const/4 v15, 0x1

    const-class v17, Lghl;

    const-string v18, "process"

    const-string v19, "process-ZmokQxo(Landroid/view/KeyEvent;)Z"

    move-object/from16 v16, v4

    invoke-direct/range {v14 .. v21}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v1, v14}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v2, v14

    :cond_78
    check-cast v2, Lmtb;

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-static {v2}, Lf03;->M(Lkotlin/jvm/functions/Function1;)Lc8e;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lvt9;->p(Z)V

    return-object v0
.end method
