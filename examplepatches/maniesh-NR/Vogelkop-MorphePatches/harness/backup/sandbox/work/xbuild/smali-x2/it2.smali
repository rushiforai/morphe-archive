.class public final Lit2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final A:Lks3;

.field public final a:Lumi;

.field public final b:Lgjm;

.field public final c:Lyv3;

.field public final d:Lyv3;

.field public final e:Ldw3;

.field public final f:Lcom/opera/android/Lazy;

.field public final g:Lcom/opera/android/Lazy;

.field public final h:Lcom/opera/android/Lazy;

.field public final i:Ldw3;

.field public final j:Ldw3;

.field public final k:Lcom/opera/android/Lazy;

.field public final l:Lji;

.field public final m:Lcom/opera/android/Lazy;

.field public final n:Lji;

.field public final o:Lwv1;

.field public final p:Lji;

.field public final q:Lyv3;

.field public final r:Lyv3;

.field public final s:Lyv3;

.field public final t:Lcom/opera/android/Lazy;

.field public final u:Lji;

.field public final v:Lyv3;

.field public final w:Ldw3;

.field public final x:Lcom/opera/android/Lazy;

.field public final y:Lcom/opera/android/Lazy;

.field public final z:Lcom/opera/android/Lazy;


# direct methods
.method public constructor <init>(Lumi;Lgjm;Lyv3;Lyv3;Ldw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Ldw3;Ldw3;Lcom/opera/android/Lazy;Lji;Lcom/opera/android/Lazy;Lji;Lwv1;Lji;Lyv3;Lyv3;Lyv3;Lyv3;Lcom/opera/android/Lazy;Lji;Lyv3;Ldw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;)V
    .registers 38

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lit2;->a:Lumi;

    iput-object p2, p0, Lit2;->b:Lgjm;

    iput-object p3, p0, Lit2;->c:Lyv3;

    iput-object p4, p0, Lit2;->d:Lyv3;

    iput-object p5, p0, Lit2;->e:Ldw3;

    move-object/from16 v2, p6

    iput-object v2, p0, Lit2;->f:Lcom/opera/android/Lazy;

    move-object/from16 p1, p7

    iput-object p1, p0, Lit2;->g:Lcom/opera/android/Lazy;

    move-object/from16 p1, p8

    iput-object p1, p0, Lit2;->h:Lcom/opera/android/Lazy;

    move-object/from16 p1, p9

    iput-object p1, p0, Lit2;->i:Ldw3;

    move-object/from16 p1, p10

    iput-object p1, p0, Lit2;->j:Ldw3;

    move-object/from16 p1, p11

    iput-object p1, p0, Lit2;->k:Lcom/opera/android/Lazy;

    move-object/from16 p1, p12

    iput-object p1, p0, Lit2;->l:Lji;

    move-object/from16 v3, p13

    iput-object v3, p0, Lit2;->m:Lcom/opera/android/Lazy;

    move-object/from16 v5, p14

    iput-object v5, p0, Lit2;->n:Lji;

    move-object/from16 p1, p15

    iput-object p1, p0, Lit2;->o:Lwv1;

    move-object/from16 v4, p16

    iput-object v4, p0, Lit2;->p:Lji;

    move-object/from16 p1, p17

    iput-object p1, p0, Lit2;->q:Lyv3;

    move-object/from16 p1, p18

    iput-object p1, p0, Lit2;->r:Lyv3;

    move-object/from16 p1, p19

    iput-object p1, p0, Lit2;->s:Lyv3;

    move-object/from16 p1, p21

    iput-object p1, p0, Lit2;->t:Lcom/opera/android/Lazy;

    move-object/from16 v7, p22

    iput-object v7, p0, Lit2;->u:Lji;

    move-object/from16 p1, p23

    iput-object p1, p0, Lit2;->v:Lyv3;

    move-object/from16 v8, p24

    iput-object v8, p0, Lit2;->w:Ldw3;

    move-object/from16 v9, p25

    iput-object v9, p0, Lit2;->x:Lcom/opera/android/Lazy;

    move-object/from16 p1, p26

    iput-object p1, p0, Lit2;->y:Lcom/opera/android/Lazy;

    move-object/from16 p1, p27

    iput-object p1, p0, Lit2;->z:Lcom/opera/android/Lazy;

    new-instance v0, Lks3;

    move-object v1, p5

    move-object/from16 v6, p20

    invoke-direct/range {v0 .. v9}, Lks3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lit2;->A:Lks3;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lit2;->e:Ldw3;

    iget-object v2, v2, Ldw3;->b:Lcom/opera/android/OperaApplication;

    const-class v3, Lt6g;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, v0, Lit2;->q:Lyv3;

    iget-object v5, v0, Lit2;->v:Lyv3;

    iget-object v6, v0, Lit2;->i:Ldw3;

    iget-object v7, v0, Lit2;->m:Lcom/opera/android/Lazy;

    iget-object v8, v0, Lit2;->x:Lcom/opera/android/Lazy;

    iget-object v9, v0, Lit2;->c:Lyv3;

    if-eqz v3, :cond_8e

    new-instance v10, Lt6g;

    invoke-virtual {v9}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lot2;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lyu2;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lx5g;

    new-instance v14, Lzg7;

    new-instance v1, Lghf;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx5g;

    invoke-direct {v1, v2}, Lghf;-><init>(Lx5g;)V

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorm;

    invoke-direct {v14, v1, v2}, Lzg7;-><init>(Lghf;Lorm;)V

    invoke-virtual {v5}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lru9;

    iget-object v1, v0, Lit2;->w:Ldw3;

    invoke-virtual {v1}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lcq5;

    iget-object v1, v0, Lit2;->o:Lwv1;

    iget-object v1, v1, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lxb;

    iget-object v1, v0, Lit2;->n:Lji;

    iget-object v1, v1, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v18

    iget-object v1, v0, Lit2;->p:Lji;

    iget-object v1, v1, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v19

    invoke-virtual {v4}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lhxk;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lorm;

    iget-object v0, v0, Lit2;->a:Lumi;

    move-object/from16 v22, v0

    invoke-direct/range {v10 .. v22}, Lt6g;-><init>(Lot2;Lyu2;Lx5g;Lzg7;Lru9;Lcq5;Lxb;Ldb;Lzwk;Lhxk;Lorm;Lumi;)V

    return-object v10

    :cond_8e
    const-class v3, Lm6g;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v10, v0, Lit2;->r:Lyv3;

    iget-object v11, v0, Lit2;->d:Lyv3;

    if-eqz v3, :cond_f6

    new-instance v12, Lm6g;

    invoke-virtual {v9}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lot2;

    invoke-virtual {v11}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Ld8j;

    invoke-virtual {v4}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lhxk;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v17

    iget-object v1, v0, Lit2;->A:Lks3;

    invoke-virtual {v1}, Lks3;->w()Lk6g;

    move-result-object v18

    iget-object v1, v0, Lit2;->f:Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lx5g;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lyu2;

    invoke-virtual {v10}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Lysj;

    iget-object v1, v0, Lit2;->u:Lji;

    invoke-virtual {v1}, Lji;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v23, v1

    check-cast v23, Ln6g;

    invoke-virtual {v5}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v24, v1

    check-cast v24, Lru9;

    iget-object v13, v0, Lit2;->b:Lgjm;

    invoke-direct/range {v12 .. v24}, Lm6g;-><init>(Lgjm;Lot2;Ld8j;Lhxk;Lcom/opera/android/settings/SettingsManager;Lk6g;Lcom/opera/android/autofill/PasswordManager;Lx5g;Lyu2;Lysj;Ln6g;Lru9;)V

    return-object v12

    :cond_f6
    const-class v3, Lxu;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_118

    new-instance v1, Lxu;

    iget-object v0, v0, Lit2;->t:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luab;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx5g;

    invoke-virtual {v11}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ld8j;

    invoke-direct {v1, v0, v2, v3}, Lxu;-><init>(Luab;Lx5g;Ld8j;)V

    return-object v1

    :cond_118
    const-class v3, Lbr2;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, v0, Lit2;->g:Lcom/opera/android/Lazy;

    iget-object v5, v0, Lit2;->y:Lcom/opera/android/Lazy;

    if-eqz v3, :cond_13e

    new-instance v1, Lbr2;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwk4;

    invoke-virtual {v9}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lot2;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/opera/android/autofill/AutofillManager;

    iget-object v0, v0, Lit2;->b:Lgjm;

    invoke-direct {v1, v0, v2, v3, v4}, Lbr2;-><init>(Lgjm;Lwk4;Lot2;Lcom/opera/android/autofill/AutofillManager;)V

    return-object v1

    :cond_13e
    const-class v3, Lh3b;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_175

    new-instance v12, Lh3b;

    invoke-virtual {v9}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lot2;

    iget-object v1, v0, Lit2;->s:Lyv3;

    invoke-virtual {v1}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lz77;

    invoke-virtual {v10}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lysj;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lorm;

    iget-object v0, v0, Lit2;->j:Ldw3;

    invoke-virtual {v0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v17, v0

    check-cast v17, Lskm;

    invoke-direct/range {v12 .. v17}, Lh3b;-><init>(Lot2;Lz77;Lysj;Lorm;Lskm;)V

    return-object v12

    :cond_175
    const-class v3, Ldl4;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v6, v0, Lit2;->k:Lcom/opera/android/Lazy;

    if-eqz v3, :cond_1b5

    new-instance v12, Ldl4;

    invoke-virtual {v9}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lot2;

    invoke-virtual {v11}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Ld8j;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v15

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lgv2;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lnkm;

    iget-object v1, v0, Lit2;->z:Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lwh2;

    iget-object v0, v0, Lit2;->b:Lgjm;

    move-object/from16 v18, v0

    invoke-direct/range {v12 .. v19}, Ldl4;-><init>(Lot2;Ld8j;Lcom/opera/android/settings/SettingsManager;Lgv2;Lnkm;Lgjm;Lwh2;)V

    return-object v12

    :cond_1b5
    const-class v0, Lcx;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f2

    new-instance v12, Lcx;

    invoke-virtual {v9}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lot2;

    invoke-virtual {v11}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Ld8j;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v15

    new-instance v0, Lsw;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v0, v1}, Lgv2;-><init>(Lcom/opera/android/autofill/AutofillManager;)V

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lnkm;

    move-object/from16 v16, v0

    invoke-direct/range {v12 .. v18}, Lcx;-><init>(Lot2;Ld8j;Lcom/opera/android/settings/SettingsManager;Lsw;Lcom/opera/android/autofill/AutofillManager;Lnkm;)V

    return-object v12

    :cond_1f2
    const/4 v0, 0x0

    return-object v0
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-class v2, Lt5g;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, v0, Lit2;->m:Lcom/opera/android/Lazy;

    iget-object v4, v0, Lit2;->b:Lgjm;

    if-eqz v2, :cond_1c

    new-instance v0, Lt5g;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyu2;

    invoke-direct {v0, v4, v1}, Lt5g;-><init>(Lgjm;Lyu2;)V

    return-object v0

    :cond_1c
    const-class v2, Lf6g;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v5, v0, Lit2;->s:Lyv3;

    iget-object v6, v0, Lit2;->i:Ldw3;

    if-eqz v2, :cond_42

    new-instance v1, Lf6g;

    invoke-virtual {v5}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz77;

    iget-object v0, v0, Lit2;->r:Lyv3;

    invoke-virtual {v0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lysj;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorm;

    invoke-direct {v1, v4, v2, v0, v3}, Lf6g;-><init>(Lgjm;Lz77;Lysj;Lorm;)V

    return-object v1

    :cond_42
    const-class v2, Lru;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_56

    new-instance v0, Lru;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    invoke-direct {v0, v4, v1}, Lru;-><init>(Lgjm;Lorm;)V

    return-object v0

    :cond_56
    const-class v2, Lg3b;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_64

    new-instance v0, Lg3b;

    invoke-direct {v0, v4}, Lg3b;-><init>(Lgjm;)V

    return-object v0

    :cond_64
    const-class v2, Lzk4;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v7, v0, Lit2;->z:Lcom/opera/android/Lazy;

    if-eqz v2, :cond_7a

    new-instance v0, Lzk4;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwh2;

    invoke-direct {v0, v4, v1}, Lzk4;-><init>(Lgjm;Lwh2;)V

    return-object v0

    :cond_7a
    const-class v2, Lmp2;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v8, v0, Lit2;->h:Lcom/opera/android/Lazy;

    iget-object v9, v0, Lit2;->g:Lcom/opera/android/Lazy;

    if-eqz v2, :cond_a1

    new-instance v0, Lmp2;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgw;

    const v4, 0x7f1401fb

    invoke-direct {v0, v1, v2, v3, v4}, Lmr2;-><init>(Lorm;Lcom/opera/android/autofill/AutofillManager;Lgw;I)V

    return-object v0

    :cond_a1
    const-class v2, Luw;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_af

    new-instance v0, Luw;

    invoke-direct {v0, v4}, Luw;-><init>(Lgjm;)V

    return-object v0

    :cond_af
    const-class v2, Lkp2;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const/4 v10, 0x0

    if-eqz v2, :cond_d4

    new-instance v0, Lkp2;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgw;

    invoke-static {v10}, Lyi4;->n(Ljava/lang/String;)Lcom/opera/android/autofill/Address;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lkp2;-><init>(Lorm;Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V

    return-object v0

    :cond_d4
    const-class v2, Lxq2;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e8

    new-instance v0, Lxq2;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwh2;

    invoke-direct {v0, v4, v1}, Lxq2;-><init>(Lgjm;Lwh2;)V

    return-object v0

    :cond_e8
    const-class v2, Lwr2;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v7, v0, Lit2;->d:Lyv3;

    if-eqz v2, :cond_10a

    new-instance v0, Lwr2;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorm;

    invoke-virtual {v7}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ld8j;

    invoke-direct {v0, v1, v2, v3}, Lwr2;-><init>(Lcom/opera/android/autofill/AutofillManager;Lorm;Ld8j;)V

    return-object v0

    :cond_10a
    const-class v2, Ljh3;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_154

    new-instance v11, Ljh3;

    invoke-virtual {v7}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Ld8j;

    iget-object v1, v0, Lit2;->f:Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lyu2;

    new-instance v2, Lw4g;

    iget-object v0, v0, Lit2;->l:Lji;

    invoke-virtual {v0}, Lji;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvnj;

    invoke-direct {v2, v0}, Lw4g;-><init>(Lvnj;)V

    invoke-virtual {v5}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v17, v0

    check-cast v17, Lz77;

    new-instance v12, Lpsp;

    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lqp2;

    const/16 v0, 0xd

    invoke-direct {v13, v1, v0}, Lqp2;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v16, v2

    invoke-direct/range {v11 .. v17}, Ljh3;-><init>(Lpsp;Lqp2;Ld8j;Lyu2;Lw4g;Lz77;)V

    return-object v11

    :cond_154
    const-class v0, Lnmm;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_162

    new-instance v0, Lnmm;

    invoke-direct {v0, v4}, Lnmm;-><init>(Lgjm;)V

    return-object v0

    :cond_162
    return-object v10
.end method
