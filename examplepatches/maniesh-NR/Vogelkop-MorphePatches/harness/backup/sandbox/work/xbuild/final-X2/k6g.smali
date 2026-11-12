.class public final Lk6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lcom/opera/android/autofill/PasswordManager;

.field public final c:Lx5g;

.field public final d:Lyu2;

.field public final e:Lzwk;

.field public final f:Lyv3;

.field public final g:Ln6g;

.field public final h:Lcq5;

.field public final i:Lv9j;

.field public final j:Ls9;

.field public final k:Lj6g;

.field public final l:Lz5g;

.field public final m:Lt77;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/autofill/PasswordManager;Lx5g;Lyu2;Lzwk;Ldb;Lyv3;Ln6g;Lcq5;)V
    .registers 18

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk6g;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lk6g;->b:Lcom/opera/android/autofill/PasswordManager;

    iput-object p3, p0, Lk6g;->c:Lx5g;

    iput-object p4, p0, Lk6g;->d:Lyu2;

    iput-object p5, p0, Lk6g;->e:Lzwk;

    iput-object p7, p0, Lk6g;->f:Lyv3;

    move-object/from16 p2, p8

    iput-object p2, p0, Lk6g;->g:Ln6g;

    move-object/from16 p2, p9

    iput-object p2, p0, Lk6g;->h:Lcq5;

    new-instance p2, Lv9j;

    invoke-direct {p2, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p2, p0, Lk6g;->i:Lv9j;

    new-instance p2, Ls9;

    const/16 p3, 0x1b

    invoke-direct {p2, p0, p3}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lk6g;->j:Ls9;

    new-instance p2, Lj6g;

    new-instance v0, Le6g;

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v1, 0x0

    const-class v3, Lk6g;

    const-string v4, "updateState"

    const-string v5, "updateState()V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {p2, p6, p1, p5, v0}, Lj6g;-><init>(Ldb;Lcom/opera/android/settings/SettingsManager;Lzwk;Le6g;)V

    iput-object p2, p0, Lk6g;->k:Lj6g;

    new-instance p1, Lz5g;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lz5g;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lk6g;->l:Lz5g;

    new-instance p1, Lt77;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Lt77;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lk6g;->m:Lt77;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 12

    new-instance v0, Lh6g;

    iget-object v1, p0, Lk6g;->b:Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MaxktGXn()Z

    move-result v1

    iget-object v2, p0, Lk6g;->a:Lcom/opera/android/settings/SettingsManager;

    if-eqz v1, :cond_1e

    const-string v1, "password_manager_autosave"

    invoke-virtual {v2, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    sget-object v1, Ljji;->b:Ljji;

    :goto_19
    move-object v3, v2

    goto :goto_21

    :cond_1b
    sget-object v1, Ljji;->c:Ljji;

    goto :goto_19

    :cond_1e
    sget-object v1, Ljji;->d:Ljji;

    goto :goto_19

    :goto_21
    invoke-static {}, LJ/N;->Mkdlpo6n()Z

    move-result v2

    move-object v4, v3

    new-instance v3, Lns2;

    iget-object v5, p0, Lk6g;->d:Lyu2;

    invoke-virtual {v5}, Lyu2;->b()Z

    move-result v6

    invoke-virtual {v5}, Lyu2;->a()Z

    move-result v5

    invoke-direct {v3, v6, v5}, Lns2;-><init>(ZZ)V

    move-object v5, v4

    new-instance v4, Lryc;

    iget-object v6, p0, Lk6g;->f:Lyv3;

    invoke-virtual {v6}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->p()Ln7j;

    move-result-object v5

    invoke-direct {v4, v6, v5}, Lryc;-><init>(ZLn7j;)V

    new-instance v5, Llxk;

    iget-object v6, p0, Lk6g;->k:Lj6g;

    iget-object v6, v6, Lj6g;->e:Li6g;

    iget-boolean v7, v6, Li6g;->a:Z

    iget-boolean v6, v6, Li6g;->b:Z

    invoke-direct {v5, v7, v6}, Llxk;-><init>(ZZ)V

    iget-object v6, p0, Lk6g;->c:Lx5g;

    iget-object v6, v6, Lx5g;->f:La4g;

    if-eqz v6, :cond_65

    iget-object v6, v6, La4g;->a:Ljava/util/List;

    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    goto :goto_66

    :cond_65
    const/4 v6, 0x0

    :goto_66
    if-nez v6, :cond_6a

    sget-object v6, Ll08;->a:Ll08;

    :cond_6a
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    iget-object v7, p0, Lk6g;->g:Ln6g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x1e

    const/4 v10, 0x0

    if-lt v8, v9, :cond_8b

    invoke-static {}, Lm5h;->q()Z

    move-result v8

    if-eqz v8, :cond_8b

    iget-object v7, v7, Ln6g;->a:Landroid/content/Context;

    const-string v8, "OFA_SHORTCUT_PASSWORDS"

    invoke-static {v7, v8}, Lm5h;->A(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_8b

    const/4 v10, 0x1

    :cond_8b
    move v7, v10

    iget-object v8, p0, Lk6g;->h:Lcq5;

    invoke-virtual {v8}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lf8f;

    invoke-virtual {v8}, Lf8f;->g()Z

    move-result v8

    invoke-direct/range {v0 .. v8}, Lh6g;-><init>(Ljji;ZLns2;Lryc;Llxk;IZZ)V

    iget-object p0, p0, Lk6g;->i:Lv9j;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j()V
    .registers 1

    invoke-virtual {p0}, Lk6g;->a()V

    return-void
.end method

.method public final m(Lkze;)V
    .registers 4

    iget-object v0, p0, Lk6g;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lk6g;->j:Ls9;

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v0, p0, Lk6g;->c:Lx5g;

    iget-object v1, p0, Lk6g;->l:Lz5g;

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v0, p0, Lk6g;->e:Lzwk;

    iget-object v1, p0, Lk6g;->k:Lj6g;

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v0, p0, Lk6g;->h:Lcq5;

    invoke-static {v0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v0

    iget-object p0, p0, Lk6g;->m:Lt77;

    invoke-static {v0, p1, p0}, La26;->S(Lekc;Likc;Lf7f;)V

    return-void
.end method
