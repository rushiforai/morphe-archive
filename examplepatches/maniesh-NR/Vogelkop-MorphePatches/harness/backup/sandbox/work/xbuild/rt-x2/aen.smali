.class public final Laen;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final a:Ltah;

.field public final b:Lgjm;

.field public final c:Lnw3;

.field public final d:Lmw3;

.field public final e:Lnw3;

.field public final f:Lnw3;

.field public final g:Lcom/opera/android/Lazy;

.field public final h:Lcom/opera/android/Lazy;

.field public final i:Lhw3;

.field public final j:Lmw3;

.field public final k:Lnw3;

.field public final l:Lmw3;

.field public final m:Lnw3;

.field public final n:Lnw3;

.field public final o:Lmw3;

.field public final p:Lx5f;


# direct methods
.method public constructor <init>(Ltah;Lgjm;Lnw3;Lmw3;Lnw3;Lnw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lhw3;Lmw3;Lnw3;Lmw3;Lnw3;Lnw3;Lmw3;Lx5f;)V
    .registers 17

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laen;->a:Ltah;

    iput-object p2, p0, Laen;->b:Lgjm;

    iput-object p3, p0, Laen;->c:Lnw3;

    iput-object p4, p0, Laen;->d:Lmw3;

    iput-object p5, p0, Laen;->e:Lnw3;

    iput-object p6, p0, Laen;->f:Lnw3;

    iput-object p7, p0, Laen;->g:Lcom/opera/android/Lazy;

    iput-object p8, p0, Laen;->h:Lcom/opera/android/Lazy;

    iput-object p9, p0, Laen;->i:Lhw3;

    iput-object p10, p0, Laen;->j:Lmw3;

    iput-object p11, p0, Laen;->k:Lnw3;

    iput-object p12, p0, Laen;->l:Lmw3;

    iput-object p13, p0, Laen;->m:Lnw3;

    iput-object p14, p0, Laen;->n:Lnw3;

    iput-object p15, p0, Laen;->o:Lmw3;

    move-object/from16 p1, p16

    iput-object p1, p0, Laen;->p:Lx5f;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Laen;->n:Lnw3;

    iget-object v2, v2, Lnw3;->b:Lcom/opera/android/OperaApplication;

    const-class v3, Lldn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, v0, Laen;->h:Lcom/opera/android/Lazy;

    if-eqz v3, :cond_38

    new-instance v5, Lldn;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v7

    iget-object v1, v0, Laen;->l:Lmw3;

    invoke-virtual {v1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Ltni;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lyug;

    iget-object v1, v0, Laen;->k:Lnw3;

    iget-object v1, v1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object v11

    iget-object v6, v0, Laen;->b:Lgjm;

    iget-object v9, v0, Laen;->g:Lcom/opera/android/Lazy;

    invoke-direct/range {v5 .. v11}, Lldn;-><init>(Lgjm;Lydn;Ltni;Lcom/opera/android/Lazy;Lyug;Lgmk;)V

    return-object v5

    :cond_38
    const-class v3, Lcgn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ba

    new-instance v5, Lcgn;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v7

    iget-object v1, v0, Laen;->c:Lnw3;

    iget-object v1, v1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object v8

    iget-object v3, v0, Laen;->m:Lnw3;

    iget-object v3, v3, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v9

    iget-object v3, v0, Laen;->d:Lmw3;

    invoke-virtual {v3}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Lz77;

    iget-object v3, v0, Laen;->e:Lnw3;

    iget-object v3, v3, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->p()Lxt8;

    move-result-object v11

    iget-object v3, v0, Laen;->g:Lcom/opera/android/Lazy;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lktg;

    iget-object v3, v0, Laen;->j:Lmw3;

    invoke-virtual {v3}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Ltvg;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Lyug;

    new-instance v15, Lghf;

    iget-object v3, v0, Laen;->f:Lnw3;

    iget-object v3, v3, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v3}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v3

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object v1

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v2

    const/4 v4, 0x0

    invoke-direct {v15, v3, v1, v2, v4}, Lghf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v0, Laen;->o:Lmw3;

    invoke-virtual {v1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lhxk;

    iget-object v1, v0, Laen;->i:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lpfn;

    iget-object v1, v0, Laen;->a:Ltah;

    invoke-virtual {v1}, Ltah;->R()Lggn;

    move-result-object v18

    iget-object v1, v0, Laen;->p:Lx5f;

    iget-object v6, v0, Laen;->b:Lgjm;

    move-object/from16 v19, v1

    invoke-direct/range {v5 .. v19}, Lcgn;-><init>(Lgjm;Lydn;Lxb;Lslk;Lz77;Lxt8;Lktg;Ltvg;Lyug;Lghf;Lhxk;Lpfn;Lggn;Lx5f;)V

    return-object v5

    :cond_ba
    const-class v0, Lmhf;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c8

    new-instance v0, Lmhf;

    invoke-direct {v0}, Lmhf;-><init>()V

    return-object v0

    :cond_c8
    const/4 v0, 0x0

    return-object v0
.end method
