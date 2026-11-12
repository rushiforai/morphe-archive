.class public final Lfnh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lb59;

.field public c:Lk6l;

.field public final d:Lxbf;

.field public final e:Lcom/opera/android/settings/SettingsManager;

.field public final f:Lcom/opera/android/browser/SessionStore;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Lk6l;Lxbf;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/browser/SessionStore;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfnh;->a:Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "recently_closed_tabs"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lfnh;->b:Lb59;

    iput-object p3, p0, Lfnh;->c:Lk6l;

    iput-object p4, p0, Lfnh;->d:Lxbf;

    iput-object p5, p0, Lfnh;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object p6, p0, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    new-instance p1, Ldnh;

    invoke-direct {p1, p0}, Ldnh;-><init>(Lfnh;)V

    invoke-virtual {p3, p1}, Lk6l;->c(Lj6l;)V

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/String;Lcom/opera/android/browser/TabInfo;IZ)V
    .registers 26

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p4

    move/from16 v3, p5

    iget-object v4, v0, Lfnh;->c:Lk6l;

    if-nez v4, :cond_d

    return-void

    :cond_d
    iget-object v4, v0, Lfnh;->e:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object v4

    sget-object v5, Lq7j;->c:Lq7j;

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-ne v4, v5, :cond_1b

    move v4, v6

    goto :goto_1c

    :cond_1b
    move v4, v7

    :goto_1c
    iget-object v5, v0, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    iget-wide v8, v5, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v8, v9, v1}, LJ/N;->MZcxFvhT(JI)Z

    move-result v10

    const/4 v11, 0x0

    if-eqz v10, :cond_72

    iget-object v13, v0, Lfnh;->d:Lxbf;

    iget-object v10, v13, Lxbf;->b:Ljava/lang/Object;

    check-cast v10, Lvzk;

    invoke-virtual {v10, v7}, Lvzk;->L(Z)I

    move-result v10

    invoke-static {v8, v9, v1, v10}, LJ/N;->M1uN$9Ct(JII)Z

    move-result v12

    invoke-static {v8, v9, v1}, LJ/N;->M6QsDkLe(JI)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/opera/android/browser/TabInfo;

    invoke-static {v8, v9, v1}, LJ/N;->MKH2wY$N(JI)V

    if-nez v12, :cond_44

    invoke-static {v8, v9, v10}, LJ/N;->MKH2wY$N(JI)V

    goto :goto_72

    :cond_44
    new-instance v12, Ld7l;

    new-instance v1, Lilj;

    iget-object v8, v13, Lxbf;->b:Ljava/lang/Object;

    check-cast v8, Lvzk;

    new-instance v9, Lbp;

    invoke-direct {v9, v5, v10}, Lbp;-><init>(Lcom/opera/android/browser/SessionStore;I)V

    invoke-direct {v1, v8, v9, v10, v14}, Lilj;-><init>(Lvzk;Ljke;ILcom/opera/android/browser/TabInfo;)V

    iget-object v5, v13, Lxbf;->e:Ljava/lang/Object;

    move-object v15, v5

    check-cast v15, Ltw2;

    iget-object v5, v13, Lxbf;->f:Ljava/lang/Object;

    move-object/from16 v16, v5

    check-cast v16, Laal;

    iget-object v5, v13, Lxbf;->c:Ljava/lang/Object;

    move-object/from16 v17, v5

    check-cast v17, Liga;

    iget-object v5, v13, Lxbf;->d:Ljava/lang/Object;

    move-object/from16 v18, v5

    check-cast v18, Lrc6;

    sget-object v19, Llqm;->j:Llqm;

    move-object v14, v1

    invoke-direct/range {v12 .. v19}, Ld7l;-><init>(Lxbf;Lilj;Ltw2;Laal;Liga;Lrc6;Llqm;)V

    move-object v11, v12

    :cond_72
    :goto_72
    if-nez v11, :cond_9a

    if-nez v3, :cond_7a

    if-nez v4, :cond_7a

    move v0, v7

    goto :goto_7b

    :cond_7a
    move v0, v6

    :goto_7b
    sget-object v1, Llqm;->d:Llqm;

    move-object/from16 v4, p2

    invoke-static {v4, v1, v6}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v1

    invoke-virtual {v1, v6}, Lvx3;->c(Z)V

    invoke-virtual {v1, v0}, Lvx3;->a(Z)V

    invoke-virtual {v1, v7}, Lvx3;->d(Z)V

    iput-boolean v3, v1, Lvx3;->f:Z

    iput v2, v1, Lvx3;->j:I

    move-object/from16 v0, p3

    iput-object v0, v1, Lvx3;->h:Lcom/opera/android/browser/TabInfo;

    iput-boolean v7, v1, Lvx3;->r:Z

    invoke-static {v1}, Lam2;->v(Lvx3;)V

    return-void

    :cond_9a
    iget-object v0, v0, Lfnh;->c:Lk6l;

    invoke-virtual {v0, v2, v11, v3}, Lk6l;->e(ILd7l;Z)V

    return-void
.end method

.method public final b(Lenh;Lb2l;Z)V
    .registers 11

    move-object v0, p2

    check-cast v0, Ld7l;

    iget-boolean v0, v0, Ld7l;->m:Z

    if-eqz v0, :cond_b

    iget-object p2, p0, Lfnh;->c:Lk6l;

    iget-object p2, p2, Lk6l;->o:Lb2l;

    :cond_b
    iget-object v0, p0, Lfnh;->c:Lk6l;

    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1b

    return-void

    :cond_1b
    iget v2, p1, Lenh;->c:I

    iget-object v3, p1, Lenh;->b:Ljava/lang/String;

    add-int/lit8 v5, p2, 0x1

    const/4 v4, 0x0

    move-object v1, p0

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Lfnh;->a(ILjava/lang/String;Lcom/opera/android/browser/TabInfo;IZ)V

    return-void
.end method
