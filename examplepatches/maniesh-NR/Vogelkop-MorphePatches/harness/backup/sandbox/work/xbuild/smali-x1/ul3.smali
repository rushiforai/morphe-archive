.class public final Lul3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lin3;

.field public final b:Lx5f;

.field public final c:Li53;

.field public final d:Lcom/opera/android/Lazy;

.field public final e:Lgx3;

.field public final f:Lgx3;

.field public final g:Lfx3;

.field public final h:Lole;

.field public i:Lcom/opera/android/undo/UndoBar;


# direct methods
.method public constructor <init>(Lin3;Lx5f;Li53;Lcom/opera/android/Lazy;Lgx3;Lgx3;Lfx3;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lul3;->a:Lin3;

    iput-object p2, p0, Lul3;->b:Lx5f;

    iput-object p3, p0, Lul3;->c:Li53;

    iput-object p4, p0, Lul3;->d:Lcom/opera/android/Lazy;

    iput-object p5, p0, Lul3;->e:Lgx3;

    iput-object p6, p0, Lul3;->f:Lgx3;

    iput-object p7, p0, Lul3;->g:Lfx3;

    new-instance p1, Lole;

    invoke-direct {p1, p0}, Lole;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lul3;->h:Lole;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 13

    iget-object v0, p0, Lul3;->f:Lgx3;

    invoke-virtual {v0}, Lgx3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_de

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_de

    invoke-virtual {v0}, Ld7l;->n0()Z

    move-result v1

    if-nez v1, :cond_de

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lul3;->a:Lin3;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v3, Lin3;->b:Ljava/util/ArrayList;

    iget-object v5, v3, Lin3;->a:Li53;

    invoke-static {v1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_38

    move-object v1, v2

    :cond_38
    invoke-virtual {v5, v1}, Li53;->c(Ljava/lang/String;)Lal3;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_45

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_46

    :cond_45
    move-object v1, v2

    :cond_46
    if-eqz v1, :cond_4c

    invoke-virtual {p0, v1}, Lul3;->b(Lal3;)V

    return-void

    :cond_4c
    invoke-virtual {v0}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v1

    iget-object v6, v0, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_63

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_67

    :cond_63
    invoke-virtual {v0}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v0

    :goto_67
    move-object v6, v5

    check-cast v6, Lcom/opera/android/bookmarks/h;

    iget-object v7, v6, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    const-string v8, "last_folder"

    const-wide/16 v9, -0x1

    invoke-interface {v7, v8, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    const/4 v11, 0x1

    invoke-virtual {v6, v7, v8, v11}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v6

    instance-of v7, v6, Lml3;

    if-eqz v7, :cond_86

    check-cast v6, Lml3;

    goto :goto_87

    :cond_86
    move-object v6, v2

    :goto_87
    if-nez v6, :cond_90

    move-object v6, v5

    check-cast v6, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v6}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v6

    :cond_90
    invoke-virtual {v5, v0}, Li53;->c(Ljava/lang/String;)Lal3;

    move-result-object v5

    invoke-static {v4}, Ly9m;->p(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4, v5}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a2

    invoke-virtual {v3}, Lin3;->a()V

    goto :goto_ad

    :cond_a2
    invoke-static {v9, v10, v1, v0}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v0

    invoke-static {v0, v6}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lpl3;

    :goto_ad
    const/4 v0, 0x0

    if-nez v2, :cond_c7

    iget-object p0, p0, Lul3;->i:Lcom/opera/android/undo/UndoBar;

    if-eqz p0, :cond_de

    iget-object v1, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v1, v1, Lmgh;->b:Ljava/lang/Object;

    check-cast v1, Lmhk;

    iput v0, v1, Lmhk;->b:I

    iget-object v1, v1, Lmhk;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    invoke-virtual {p0, v0}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    return-void

    :cond_c7
    iget-object v1, p0, Lul3;->e:Lgx3;

    invoke-virtual {v1}, Lgx3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqim;

    iget-object v1, v1, Lqim;->e:Lysj;

    new-instance v3, Ltl3;

    invoke-direct {v3, p0, v2, v0}, Ltl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v1, v3, p0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_de
    return-void
.end method

.method public final b(Lal3;)V
    .registers 13

    iget-object v0, p0, Lul3;->e:Lgx3;

    invoke-virtual {v0}, Lgx3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqim;

    iget-object v0, v0, Lqim;->b:Lll9;

    iget-object v1, p0, Lul3;->g:Lfx3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgjm;

    invoke-interface {p1}, Lol3;->g()Z

    move-result v2

    sget-object v3, Lw80;->c:Lw80;

    iget-object p0, p0, Lul3;->h:Lole;

    const/4 v4, 0x0

    if-eqz v2, :cond_26

    new-instance v2, Las;

    invoke-direct {v2, v1}, Las;-><init>(Lgjm;)V

    invoke-static {p1, v4, v2, v3, p0}, Lss7;->L0(Lal3;Lml3;Lss7;Lw80;Lole;)V

    goto :goto_2e

    :cond_26
    new-instance v2, Lts7;

    invoke-direct {v2}, Lts7;-><init>()V

    invoke-static {p1, v4, v2, v3, p0}, Lss7;->L0(Lal3;Lml3;Lss7;Lw80;Lole;)V

    :goto_2e
    const/4 p0, 0x0

    new-array p0, p0, [Ln6h;

    new-instance v4, Lwzg;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const/4 v1, 0x4

    invoke-direct {v4, v2, p1, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lzhj;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const/4 v5, 0x0

    const/4 v6, 0x2

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v10}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v0, v3}, Lll9;->b(Lzhj;)V

    return-void
.end method
