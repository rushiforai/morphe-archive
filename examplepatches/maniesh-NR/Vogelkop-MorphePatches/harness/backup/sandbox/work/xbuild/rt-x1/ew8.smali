.class public final Lew8;
.super Lnv9;
.source "SourceFile"

# interfaces
.implements Liue;


# instance fields
.field public final o:Ljue;

.field public final p:Llvc;

.field public final q:Lbw8;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lr16;Low8;Ljue;Lx5f;Lfqe;)V
    .registers 16

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {p5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lzv8;

    const/4 v0, 0x0

    invoke-direct {v5, p5, v0}, Lzv8;-><init>(Lx5f;B)V

    sget-object v7, Lvb0;->c:Lvb0;

    sget-object v8, Lvb0;->d:Lvb0;

    const-class v1, Law8;

    sget-object v6, Lvb0;->b:Lvb0;

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v8}, Lnv9;-><init>(Ljava/lang/Class;Lr16;Low8;Ltcc;Lqp5;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p4, v0, Lew8;->o:Ljue;

    iget-object p0, p4, Ljue;->b:Li7f;

    invoke-virtual {p0, v0}, Li7f;->b(Ljava/lang/Object;)Z

    new-instance p0, Llvc;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p2

    invoke-direct {p0, p6, p2}, Llvc;-><init>(Lfqe;Lfue;)V

    iput-object p0, v0, Lew8;->p:Llvc;

    new-instance v1, Lbw8;

    const-string v5, "news_local_news_suggestion_card_clicked"

    const-string v6, "news_local_news_suggestion_card_sp_visits"

    const-string v3, "news_local_news_card_handler"

    const-string v4, "news_local_news_suggestion_card_shown"

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lbw8;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, v0, Lew8;->q:Lbw8;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 3

    iget-object p0, p0, Lew8;->q:Lbw8;

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final O(Z)V
    .registers 3

    if-eqz p1, :cond_a

    invoke-virtual {p0}, Lew8;->y()Z

    move-result p1

    if-eqz p1, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    iget-boolean v0, p0, Lnv9;->i:Z

    if-eqz p1, :cond_15

    if-nez v0, :cond_1a

    invoke-virtual {p0}, Lnv9;->B()V

    return-void

    :cond_15
    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Lnv9;->w()V

    :cond_1a
    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 5

    const v0, 0x7f0d01a9

    if-ne p2, v0, :cond_10

    new-instance v0, Ldw8;

    const/4 v1, 0x0

    invoke-static {p1, p2, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ldw8;-><init>(Lew8;Landroid/view/View;)V

    return-object v0

    :cond_10
    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 4

    invoke-super {p0}, Lnv9;->onDestroy()V

    iget-object v0, p0, Lew8;->p:Llvc;

    iget-object v1, v0, Llvc;->b:Lfue;

    iget-object v2, v0, Llvc;->d:Lkvc;

    invoke-virtual {v1, v2}, Lfue;->e(Ldue;)V

    const/4 v1, 0x0

    iput-object v1, v0, Llvc;->g:Luqe;

    iget-object v0, p0, Lew8;->o:Ljue;

    iget-object v0, v0, Ljue;->b:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    const p0, 0x7f0d01a9

    return p0
.end method

.method public final u()Z
    .registers 1

    iget-object p0, p0, Lew8;->q:Lbw8;

    invoke-virtual {p0}, Lk8;->X()Z

    move-result p0

    return p0
.end method

.method public final y()Z
    .registers 8

    invoke-super {p0}, Lnv9;->y()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5b

    iget-object v0, p0, Lew8;->o:Ljue;

    iget-object v2, v0, Ljue;->c:Lbwf;

    if-eqz v2, :cond_5b

    iget-object v0, v0, Ljue;->d:Lkue;

    iget-object v0, v0, Lkue;->g:Lz4k;

    iget-object v0, v0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lc5k;

    iget-object v0, v0, Lc5k;->A:Lbx8;

    iget-object v0, v0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :cond_1e
    if-ge v4, v3, :cond_39

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lzw8;

    iget-object v6, v5, Lzw8;->a:Lbwf;

    invoke-virtual {v2, v6}, Lbwf;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1e

    iget-object v5, v5, Lzw8;->b:Lxw8;

    if-eqz v5, :cond_1e

    iget-boolean v5, v5, Lxw8;->E:Z

    if-eqz v5, :cond_1e

    goto :goto_5b

    :cond_39
    iget-object p0, p0, Lew8;->q:Lbw8;

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    iget-object v2, p0, Lbw8;->o:Ljava/lang/String;

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_5b

    invoke-virtual {p0}, Lbw8;->u0()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_5a

    const/4 v2, 0x3

    if-eq p0, v2, :cond_5a

    const/4 v2, 0x5

    if-ne p0, v2, :cond_5b

    :cond_5a
    return v0

    :cond_5b
    :goto_5b
    return v1
.end method

.method public final z()V
    .registers 3

    iget-object v0, p0, Lnv9;->k:Lnrl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lnrl;->a:Z

    iget-object p0, p0, Lew8;->q:Lbw8;

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
