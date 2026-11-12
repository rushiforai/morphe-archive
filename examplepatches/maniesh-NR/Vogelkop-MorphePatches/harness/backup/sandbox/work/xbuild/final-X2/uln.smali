.class public final Luln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final a:Lnw3;

.field public final b:Lcom/opera/android/Lazy;

.field public final c:Lcom/opera/android/Lazy;

.field public final d:Lj4c;

.field public final e:Lmw3;

.field public final f:Lnw3;

.field public final g:Lmw3;

.field public final h:Lumi;

.field public final i:Lgjm;

.field public final j:Lj4c;

.field public final k:Lcom/opera/android/Lazy;

.field public final l:Le4i;


# direct methods
.method public constructor <init>(Lnw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lj4c;Lmw3;Lnw3;Lmw3;Lumi;Lgjm;Lj4c;Lcom/opera/android/Lazy;Le4i;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luln;->a:Lnw3;

    iput-object p2, p0, Luln;->b:Lcom/opera/android/Lazy;

    iput-object p3, p0, Luln;->c:Lcom/opera/android/Lazy;

    iput-object p4, p0, Luln;->d:Lj4c;

    iput-object p5, p0, Luln;->e:Lmw3;

    iput-object p6, p0, Luln;->f:Lnw3;

    iput-object p7, p0, Luln;->g:Lmw3;

    iput-object p8, p0, Luln;->h:Lumi;

    iput-object p9, p0, Luln;->i:Lgjm;

    iput-object p10, p0, Luln;->j:Lj4c;

    iput-object p11, p0, Luln;->k:Lcom/opera/android/Lazy;

    iput-object p12, p0, Luln;->l:Le4i;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Luln;->a:Lnw3;

    iget-object v2, v2, Lnw3;->b:Lcom/opera/android/OperaApplication;

    const-class v3, Lukn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, v0, Luln;->g:Lmw3;

    iget-object v5, v0, Luln;->f:Lnw3;

    iget-object v6, v0, Luln;->k:Lcom/opera/android/Lazy;

    iget-object v7, v0, Luln;->j:Lj4c;

    iget-object v8, v0, Luln;->e:Lmw3;

    iget-object v9, v0, Luln;->c:Lcom/opera/android/Lazy;

    iget-object v10, v0, Luln;->b:Lcom/opera/android/Lazy;

    if-eqz v3, :cond_60

    new-instance v11, Lukn;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lqln;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lonn;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v15

    invoke-virtual {v8}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lysj;

    invoke-virtual {v5}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lorm;

    invoke-virtual {v4}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Leej;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lk3i;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lx4i;

    iget-object v12, v0, Luln;->i:Lgjm;

    invoke-direct/range {v11 .. v20}, Lukn;-><init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Lysj;Lorm;Leej;Lk3i;Lx4i;)V

    return-object v11

    :cond_60
    const-class v3, Ljmn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_aa

    new-instance v11, Ljmn;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lqln;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lonn;

    iget-object v1, v0, Luln;->d:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Linn;

    iget-object v15, v1, Linn;->e:Lpde;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v16

    invoke-virtual {v8}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lysj;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk3i;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lx4i;

    iget-object v1, v0, Luln;->l:Le4i;

    iget-object v12, v0, Luln;->i:Lgjm;

    iget-object v0, v0, Luln;->h:Lumi;

    move-object/from16 v18, v0

    move-object/from16 v20, v1

    invoke-direct/range {v11 .. v20}, Ljmn;-><init>(Lgjm;Lqln;Lonn;Lpde;Lcom/opera/android/settings/SettingsManager;Lysj;Lumi;Lx4i;Le4i;)V

    return-object v11

    :cond_aa
    const-class v3, Lnkn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f4

    new-instance v11, Lnkn;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lqln;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lonn;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v15

    invoke-virtual {v8}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lysj;

    invoke-virtual {v5}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lorm;

    invoke-virtual {v4}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Leej;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lk3i;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lx4i;

    iget-object v12, v0, Luln;->i:Lgjm;

    invoke-direct/range {v11 .. v20}, Lnkn;-><init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Lysj;Lorm;Leej;Lk3i;Lx4i;)V

    return-object v11

    :cond_f4
    const-class v3, Ltln;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13e

    new-instance v11, Ltln;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lqln;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lonn;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v15

    invoke-virtual {v8}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lysj;

    invoke-virtual {v5}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lorm;

    invoke-virtual {v4}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Leej;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lk3i;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lx4i;

    iget-object v12, v0, Luln;->i:Lgjm;

    invoke-direct/range {v11 .. v20}, Ltln;-><init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Lysj;Lorm;Leej;Lk3i;Lx4i;)V

    return-object v11

    :cond_13e
    const/4 v0, 0x0

    return-object v0
.end method
