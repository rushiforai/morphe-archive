.class public final Lucn;
.super Lmgn;
.source "SourceFile"


# instance fields
.field public final j:Lgjm;

.field public final k:Lysj;

.field public l:Lf6l;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;Loz3;Lysj;Lcom/opera/android/BrowserActivity;Lgbf;Lcom/opera/android/BrowserActivity;Lk6l;Lydn;Lysl;Lcom/opera/android/settings/SettingsManager;)V
    .registers 22

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    move-object/from16 v6, p8

    move-object/from16 v7, p9

    move-object/from16 v8, p10

    move-object/from16 v9, p11

    invoke-direct/range {v0 .. v9}, Lmgn;-><init>(Lcom/opera/android/BrowserActivity;Loz3;Lcom/opera/android/BrowserActivity;Lgbf;Lcom/opera/android/BrowserActivity;Lk6l;Lydn;Lysl;Lcom/opera/android/settings/SettingsManager;)V

    iput-object p2, p0, Lucn;->j:Lgjm;

    iput-object p4, p0, Lucn;->k:Lysj;

    return-void
.end method


# virtual methods
.method public final e()Z
    .registers 3

    iget-object v0, p0, Lmgn;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-super {p0}, Lmgn;->e()Z

    move-result v1

    if-eqz v1, :cond_14

    if-eqz v0, :cond_14

    invoke-virtual {p0, v0}, Lmgn;->d(Lb2l;)Z

    move-result p0

    if-nez p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lmgn;->c:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    new-instance v0, Lc23;

    invoke-direct {v0, p0}, Lc23;-><init>(Lucn;)V

    iget-object v1, p0, Lmgn;->f:Lk6l;

    invoke-virtual {v1, v0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object v0

    iput-object v0, p0, Lucn;->l:Lf6l;

    return-void
.end method

.method public final g()V
    .registers 3

    iget-object v0, p0, Lmgn;->c:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    iget-object v0, p0, Lucn;->l:Lf6l;

    if-eqz v0, :cond_15

    iget-object v1, p0, Lmgn;->f:Lk6l;

    invoke-virtual {v1, v0}, Lk6l;->x(Lj6l;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lucn;->l:Lf6l;

    :cond_15
    return-void
.end method
