.class public final Lpvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmkf;


# instance fields
.field public final a:Lcom/opera/android/Lazy;

.field public final b:Lwv1;

.field public final c:Llw3;

.field public final d:Lcom/opera/android/Lazy;

.field public final e:Lj4c;

.field public final f:Lcom/opera/android/Lazy;

.field public final g:Llw3;

.field public final h:Lwv1;

.field public final i:Llw3;

.field public final j:Lew3;

.field public final k:Lew3;

.field public final l:Lew3;

.field public final m:Lnu3;


# direct methods
.method public constructor <init>(Lcom/opera/android/Lazy;Lwv1;Llw3;Lcom/opera/android/Lazy;Lj4c;Lcom/opera/android/Lazy;Llw3;Lwv1;Llw3;Lew3;Lew3;Lew3;Lnu3;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpvg;->a:Lcom/opera/android/Lazy;

    iput-object p2, p0, Lpvg;->b:Lwv1;

    iput-object p3, p0, Lpvg;->c:Llw3;

    iput-object p4, p0, Lpvg;->d:Lcom/opera/android/Lazy;

    iput-object p5, p0, Lpvg;->e:Lj4c;

    iput-object p6, p0, Lpvg;->f:Lcom/opera/android/Lazy;

    iput-object p7, p0, Lpvg;->g:Llw3;

    iput-object p8, p0, Lpvg;->h:Lwv1;

    iput-object p9, p0, Lpvg;->i:Llw3;

    iput-object p10, p0, Lpvg;->j:Lew3;

    iput-object p11, p0, Lpvg;->k:Lew3;

    iput-object p12, p0, Lpvg;->l:Lew3;

    iput-object p13, p0, Lpvg;->m:Lnu3;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lpvg;->h:Lwv1;

    iget-object v2, v2, Lwv1;->b:Lb6h;

    iget-object v3, v0, Lpvg;->g:Llw3;

    iget-object v3, v3, Llw3;->b:Lcom/opera/android/OperaApplication;

    iget-object v4, v0, Lpvg;->c:Llw3;

    iget-object v4, v4, Llw3;->b:Lcom/opera/android/OperaApplication;

    const-class v5, Lvug;

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3f

    new-instance v6, Lvug;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v7

    iget-object v1, v0, Lpvg;->e:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lohg;

    iget-object v0, v0, Lpvg;->f:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lyvg;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v10

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lorm;

    invoke-direct/range {v6 .. v11}, Lvug;-><init>(Lslk;Lohg;Lyvg;Ljtg;Lorm;)V

    return-object v6

    :cond_3f
    const-class v5, La9d;

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b0

    new-instance v5, La9d;

    iget-object v1, v0, Lpvg;->a:Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Laf3;

    iget-object v7, v0, Lpvg;->b:Lwv1;

    iget-object v7, v7, Lwv1;->b:Lb6h;

    invoke-interface {v7}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lxb;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v8

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v9

    iget-object v3, v0, Lpvg;->d:Lcom/opera/android/Lazy;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Lfmk;

    iget-object v3, v0, Lpvg;->j:Lew3;

    invoke-virtual {v3}, Lew3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Lru9;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lorm;

    iget-object v2, v0, Lpvg;->k:Lew3;

    invoke-virtual {v2}, Lew3;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lz77;

    iget-object v2, v0, Lpvg;->l:Lew3;

    invoke-virtual {v2}, Lew3;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lysj;

    iget-object v2, v0, Lpvg;->m:Lnu3;

    invoke-virtual {v2}, Lnu3;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lyug;

    new-instance v2, Lqb7;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laf3;

    iget-object v0, v0, Lpvg;->i:Llw3;

    invoke-virtual {v0}, Llw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lskm;

    invoke-direct {v2, v1, v0}, Lqb7;-><init>(Laf3;Lskm;)V

    move-object/from16 v16, v2

    invoke-direct/range {v5 .. v16}, La9d;-><init>(Laf3;Lxb;Lslk;Ljtg;Lfmk;Lru9;Lorm;Lz77;Lysj;Lyug;Lqb7;)V

    return-object v5

    :cond_b0
    const/4 v0, 0x0

    return-object v0
.end method
