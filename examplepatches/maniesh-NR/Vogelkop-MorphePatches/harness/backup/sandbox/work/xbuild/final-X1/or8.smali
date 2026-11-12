.class public final Lor8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final a:Lumi;

.field public final b:Lgjm;

.field public final c:Ldw3;

.field public final d:Ldw3;

.field public final e:Ldw3;

.field public final f:Lew3;

.field public final g:Lew3;

.field public final h:Lew3;

.field public final i:Lew3;

.field public final j:Ldw3;

.field public final k:Ldw3;

.field public final l:Ldw3;

.field public final m:Lew3;

.field public final n:Lcom/opera/android/Lazy;

.field public final o:Lzv3;

.field public final p:Ldw3;

.field public final q:Lcom/opera/android/Lazy;


# direct methods
.method public constructor <init>(Lumi;Lgjm;Ldw3;Ldw3;Ldw3;Lew3;Lew3;Lew3;Lew3;Ldw3;Ldw3;Ldw3;Lew3;Lcom/opera/android/Lazy;Lzv3;Ldw3;Lcom/opera/android/Lazy;)V
    .registers 18

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lor8;->a:Lumi;

    iput-object p2, p0, Lor8;->b:Lgjm;

    iput-object p3, p0, Lor8;->c:Ldw3;

    iput-object p4, p0, Lor8;->d:Ldw3;

    iput-object p5, p0, Lor8;->e:Ldw3;

    iput-object p6, p0, Lor8;->f:Lew3;

    iput-object p7, p0, Lor8;->g:Lew3;

    iput-object p8, p0, Lor8;->h:Lew3;

    iput-object p9, p0, Lor8;->i:Lew3;

    iput-object p10, p0, Lor8;->j:Ldw3;

    iput-object p11, p0, Lor8;->k:Ldw3;

    iput-object p12, p0, Lor8;->l:Ldw3;

    iput-object p13, p0, Lor8;->m:Lew3;

    iput-object p14, p0, Lor8;->n:Lcom/opera/android/Lazy;

    iput-object p15, p0, Lor8;->o:Lzv3;

    move-object/from16 p1, p16

    iput-object p1, p0, Lor8;->p:Ldw3;

    move-object/from16 p1, p17

    iput-object p1, p0, Lor8;->q:Lcom/opera/android/Lazy;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 43

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lor8;->k:Ldw3;

    iget-object v2, v2, Ldw3;->b:Lcom/opera/android/OperaApplication;

    const-class v3, Lju;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x6

    const/4 v5, 0x5

    iget-object v6, v0, Lor8;->i:Lew3;

    iget-object v7, v0, Lor8;->j:Ldw3;

    iget-object v8, v0, Lor8;->d:Ldw3;

    iget-object v9, v0, Lor8;->o:Lzv3;

    if-eqz v3, :cond_183

    new-instance v15, Lqb7;

    iget-object v1, v8, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v1

    new-instance v3, Lu59;

    invoke-virtual {v6}, Lew3;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lysj;

    invoke-direct {v3, v6, v4}, Lu59;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v15, v1, v3}, Lqb7;-><init>(Lnr8;Lu59;)V

    iget-object v1, v0, Lor8;->n:Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnv2;

    new-instance v3, Lju;

    iget-object v6, v0, Lor8;->c:Ldw3;

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v10

    move-object/from16 v17, v10

    check-cast v17, Lrq8;

    iget-object v10, v0, Lor8;->e:Ldw3;

    invoke-virtual {v10}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v11

    move-object/from16 v18, v11

    check-cast v18, Lcom/opera/android/bookmarks/h;

    new-instance v11, Ltw2;

    invoke-virtual {v7}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorm;

    invoke-direct {v11, v12, v5}, Ltw2;-><init>(Ljava/lang/Object;B)V

    move-object v12, v10

    new-instance v10, Lnt;

    iget-object v8, v8, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v8

    invoke-virtual {v6}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v6

    move-object v14, v6

    check-cast v14, Lrq8;

    iget-object v6, v0, Lor8;->g:Lew3;

    invoke-virtual {v6}, Lew3;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Libf;

    invoke-virtual {v12}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/opera/android/bookmarks/h;

    iget-object v13, v0, Lor8;->m:Lew3;

    invoke-virtual {v13}, Lew3;->get()Ljava/lang/Object;

    move-result-object v13

    move-object/from16 v21, v13

    check-cast v21, Lk6l;

    move-object v13, v15

    new-instance v15, Lcom/opera/android/suggestion/SuggestionManagerBridge;

    invoke-direct {v15}, Lcom/opera/android/suggestion/SuggestionManagerBridge;-><init>()V

    move/from16 v16, v4

    iget-object v4, v6, Libf;->b:[Lfr;

    iget-object v6, v6, Libf;->b:[Lfr;

    const/16 v19, 0x2

    move/from16 v30, v5

    aget-object v5, v4, v19

    move-object/from16 p1, v1

    iget v1, v5, Lfr;->b:I

    iget v5, v5, Lfr;->c:I

    const/16 v19, 0x3

    aget-object v4, v4, v19

    move-object/from16 v31, v2

    iget v2, v4, Lfr;->b:I

    iget v4, v4, Lfr;->c:I

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v12, 0x14

    invoke-static {v12, v1, v5, v2, v4}, LJ/N;->MWt5ZYqx(IIIII)J

    move-result-wide v1

    invoke-static {v1, v2}, LJ/N;->Mj3RWkw$(J)J

    move-result-wide v22

    iget-wide v1, v15, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    invoke-static {v1, v2}, LJ/N;->MsnOjWk7(J)J

    move-result-wide v24

    sget-object v1, Lkqk;->b:Lkqk;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v26

    const/16 v27, 0x1

    invoke-static/range {v22 .. v27}, LJ/N;->ME2$Sfed(JJIZ)V

    new-instance v32, Lvl3;

    const/4 v2, 0x4

    aget-object v2, v6, v2

    iget v4, v2, Lfr;->b:I

    iget v2, v2, Lfr;->c:I

    aget-object v5, v6, v30

    iget v12, v5, Lfr;->b:I

    iget v5, v5, Lfr;->c:I

    aget-object v1, v6, v16

    move/from16 v34, v2

    iget v2, v1, Lfr;->b:I

    iget v1, v1, Lfr;->c:I

    const/16 v16, 0x7

    move/from16 v38, v1

    aget-object v1, v6, v16

    move/from16 v37, v2

    iget v2, v1, Lfr;->b:I

    iget v1, v1, Lfr;->c:I

    move/from16 v40, v1

    move/from16 v39, v2

    move/from16 v33, v4

    move/from16 v36, v5

    move/from16 v35, v12

    invoke-direct/range {v32 .. v40}, Lvl3;-><init>(IIIIIIII)V

    move-object/from16 v1, v32

    sget-object v2, Lkqk;->f:Lkqk;

    const/4 v4, 0x1

    invoke-virtual {v15, v1, v2, v4}, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a(Llt8;Lkqk;Z)V

    new-instance v19, Lx8l;

    const/16 v1, 0x8

    aget-object v1, v6, v1

    iget v2, v1, Lfr;->b:I

    iget v1, v1, Lfr;->c:I

    const/16 v4, 0x9

    aget-object v4, v6, v4

    iget v5, v4, Lfr;->b:I

    iget v4, v4, Lfr;->c:I

    const/16 v12, 0xa

    aget-object v12, v6, v12

    move/from16 v23, v1

    iget v1, v12, Lfr;->b:I

    iget v12, v12, Lfr;->c:I

    const/16 v16, 0xb

    aget-object v6, v6, v16

    move/from16 v26, v1

    iget v1, v6, Lfr;->b:I

    iget v6, v6, Lfr;->c:I

    move/from16 v28, v1

    iget-object v1, v0, Lor8;->a:Lumi;

    move-object/from16 v20, v1

    move/from16 v22, v2

    move/from16 v25, v4

    move/from16 v24, v5

    move/from16 v29, v6

    move/from16 v27, v12

    invoke-direct/range {v19 .. v29}, Lx8l;-><init>(Lumi;Lk6l;IIIIIIII)V

    move-object/from16 v1, v19

    sget-object v2, Lkqk;->n:Lkqk;

    const/4 v4, 0x1

    invoke-virtual {v15, v1, v2, v4}, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a(Llt8;Lkqk;Z)V

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Ltr8;

    move-object v1, v11

    iget-object v11, v0, Lor8;->a:Lumi;

    move-object v12, v8

    invoke-direct/range {v10 .. v16}, Lnt;-><init>(Lumi;Lnr8;Lqb7;Lrq8;Lcom/opera/android/suggestion/SuggestionManagerBridge;Ltr8;)V

    new-instance v2, Lot;

    invoke-direct {v2, v10, v1}, Lot;-><init>(Lnt;Ltw2;)V

    iget-object v1, v0, Lor8;->h:Lew3;

    invoke-virtual {v1}, Lew3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lipk;

    new-instance v4, Ltw2;

    invoke-virtual {v7}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorm;

    move/from16 v6, v30

    invoke-direct {v4, v5, v6}, Ltw2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual/range {v31 .. v31}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v19

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v20, v5

    check-cast v20, Ltr8;

    iget-object v11, v0, Lor8;->a:Lumi;

    move-object/from16 v14, p1

    move-object/from16 v16, v2

    move-object v10, v3

    move-object v15, v13

    move-object/from16 v12, v17

    move-object/from16 v13, v18

    move-object/from16 v17, v1

    move-object/from16 v18, v4

    invoke-direct/range {v10 .. v20}, Lju;-><init>(Lumi;Lrq8;Lcom/opera/android/bookmarks/h;Lnv2;Lqb7;Lot;Lipk;Ltw2;Lcom/opera/android/settings/SettingsManager;Ltr8;)V

    return-object v10

    :cond_183
    move-object/from16 v31, v2

    move/from16 v16, v4

    const-class v0, Lxs;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c3

    new-instance v0, Lxs;

    new-instance v1, Lqb7;

    iget-object v2, v8, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v2

    new-instance v3, Lu59;

    invoke-virtual {v6}, Lew3;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lysj;

    move/from16 v5, v16

    invoke-direct {v3, v4, v5}, Lu59;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v2, v3}, Lqb7;-><init>(Lnr8;Lu59;)V

    new-instance v2, Ltw2;

    invoke-virtual {v7}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorm;

    const/4 v6, 0x5

    invoke-direct {v2, v3, v6}, Ltw2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual/range {v31 .. v31}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ltr8;

    invoke-direct {v0, v1, v2, v3, v4}, Lxs;-><init>(Lqb7;Ltw2;Lcom/opera/android/settings/SettingsManager;Ltr8;)V

    return-object v0

    :cond_1c3
    const/4 v0, 0x0

    return-object v0
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 10

    const-class v0, Lss;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lor8;->b:Lgjm;

    if-eqz v0, :cond_10

    new-instance p0, Lss;

    invoke-direct {p0, v1}, Lss;-><init>(Lgjm;)V

    return-object p0

    :cond_10
    const-class v0, Lct;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    new-instance p0, Lct;

    invoke-direct {p0, v1}, Lct;-><init>(Lgjm;)V

    return-object p0

    :cond_1e
    const-class v0, Lsyk;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6a

    new-instance v0, Lsyk;

    iget-object p1, p0, Lor8;->l:Ldw3;

    invoke-virtual {p1}, Ldw3;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lskm;

    iget-object p1, p0, Lor8;->k:Ldw3;

    iget-object p1, p1, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iget-object p1, p0, Lor8;->f:Lew3;

    invoke-virtual {p1}, Lew3;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lqr8;

    iget-object p1, p0, Lor8;->n:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Lnv2;

    iget-object p1, p0, Lor8;->p:Ldw3;

    iget-object p1, p1, Ldw3;->b:Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->U0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v6, p1

    check-cast v6, Lzzj;

    iget-object p1, p0, Lor8;->q:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgx8;

    iget-object v7, p1, Lgx8;->c:Lpde;

    iget-object v1, p0, Lor8;->b:Lgjm;

    invoke-direct/range {v0 .. v7}, Lsyk;-><init>(Lgjm;Lskm;Lcom/opera/android/settings/SettingsManager;Lqr8;Lnv2;Lzzj;Lpde;)V

    return-object v0

    :cond_6a
    const/4 p0, 0x0

    return-object p0
.end method
