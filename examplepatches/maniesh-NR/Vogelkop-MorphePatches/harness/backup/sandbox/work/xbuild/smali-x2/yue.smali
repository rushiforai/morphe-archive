.class public final Lyue;
.super Ld53;
.source "SourceFile"

# interfaces
.implements Lj92;


# instance fields
.field public final d:Ll0n;

.field public final e:Ltw2;

.field public f:Lk92;

.field public final g:Luqe;


# direct methods
.method public constructor <init>(Luqe;Lqre;Ltw2;)V
    .registers 9

    if-nez p2, :cond_7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p2, 0x0

    goto :goto_18

    :cond_7
    new-instance v0, Ll0n;

    iget-object v1, p1, Luqe;->m:Lc15;

    new-instance v2, Lg77;

    iget-object v3, p1, Luqe;->g:Ls9i;

    iget-object v4, p1, Luqe;->f:Lx5f;

    invoke-direct {v2, v3, p2, v4}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Ll0n;-><init>(Lt7j;Lg77;)V

    move-object p2, v0

    :goto_18
    invoke-direct {p0}, Ld53;-><init>()V

    iput-object p2, p0, Lyue;->d:Ll0n;

    iput-object p3, p0, Lyue;->e:Ltw2;

    iput-object p0, p2, Ll0n;->c:Lj92;

    iget-object p2, p2, Ll0n;->d:Lvz5;

    if-eqz p2, :cond_27

    iput-object p0, p2, Lvz5;->i:Ljava/lang/Object;

    :cond_27
    iput-object p1, p0, Lyue;->g:Luqe;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object p0, p0, Lyue;->e:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxqe;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v1, 0x1

    check-cast v0, Ljava/util/List;

    invoke-virtual {p0, v0, v1}, Lxqe;->b(Ljava/util/List;Z)V

    return-void
.end method

.method public final b()Ljava/util/Collection;
    .registers 3

    iget-object p0, p0, Lyue;->f:Lk92;

    if-nez p0, :cond_7

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_7
    new-instance v0, Lcdg;

    invoke-direct {v0}, Lcdg;-><init>()V

    iget-object p0, p0, Lc53;->b:Loqe;

    const/4 v1, 0x1

    if-eqz p0, :cond_16

    iget-object p0, v0, Lcdg;->c:Ll5b;

    iput-boolean v1, p0, Ll5b;->b:Z

    goto :goto_1a

    :cond_16
    iget-object p0, v0, Lcdg;->a:Ll5b;

    iput-boolean v1, p0, Ll5b;->b:Z

    :goto_1a
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final c(Ljava/lang/Object;Loqe;Lv82;)Lc53;
    .registers 5

    new-instance v0, Lk92;

    invoke-direct {v0, p0, p1, p2, p3}, Lk92;-><init>(Lyue;Ljava/lang/Object;Loqe;Lv82;)V

    return-object v0
.end method

.method public final d(Ljava/util/ArrayList;)V
    .registers 3

    iget-object p0, p0, Lyue;->f:Lk92;

    if-eqz p0, :cond_8

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lk92;->d(Ljava/util/List;Z)V

    :cond_8
    return-void
.end method

.method public final f()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lyue;->e:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxqe;

    invoke-virtual {p0}, Lxqe;->a()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final g(Ljava/util/ArrayList;)V
    .registers 3

    iget-object p0, p0, Lyue;->f:Lk92;

    if-eqz p0, :cond_8

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lk92;->d(Ljava/util/List;Z)V

    :cond_8
    return-void
.end method

.method public final h()Z
    .registers 2

    iget-object p0, p0, Lyue;->g:Luqe;

    iget-object p0, p0, Luqe;->c:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p0

    invoke-virtual {p0}, Lfue;->d()V

    iget-object p0, p0, Lfue;->a:Lcue;

    sget-object v0, Lcue;->c:Lcue;

    if-ne p0, v0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method

.method public final i(Z)V
    .registers 4

    iget-object v0, p0, Lyue;->f:Lk92;

    if-eqz v0, :cond_3d

    if-nez p1, :cond_33

    invoke-virtual {v0}, Lk92;->b()Z

    move-result p1

    if-nez p1, :cond_33

    iget-object p1, p0, Lyue;->f:Lk92;

    iget-object v0, p1, Lc53;->b:Loqe;

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    const/4 v0, 0x1

    goto :goto_16

    :cond_15
    move v0, v1

    :goto_16
    if-eqz v0, :cond_25

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p1, v0, v1}, Lk92;->d(Ljava/util/List;Z)V

    iget-object p1, p0, Lyue;->f:Lk92;

    iget-object v0, p1, Lc53;->c:Lv82;

    invoke-virtual {v0, p1}, Lv82;->a(Lc53;)V

    goto :goto_3a

    :cond_25
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    iget-object v1, p1, Lc53;->c:Lv82;

    invoke-virtual {v1, p1, v0}, Lv82;->d(Lk92;Ljava/lang/Exception;)V

    goto :goto_3a

    :cond_33
    iget-object p1, p0, Lyue;->f:Lk92;

    iget-object v0, p1, Lc53;->c:Lv82;

    invoke-virtual {v0, p1}, Lv82;->a(Lc53;)V

    :goto_3a
    const/4 p1, 0x0

    iput-object p1, p0, Lyue;->f:Lk92;

    :cond_3d
    return-void
.end method

.method public final j(Ljava/util/List;)V
    .registers 2

    iget-object p0, p0, Lyue;->f:Lk92;

    if-nez p0, :cond_5

    return-void

    :cond_5
    check-cast p1, Ljava/util/ArrayList;

    iput-object p1, p0, Lk92;->d:Ljava/util/ArrayList;

    return-void
.end method

.method public final onFailure()V
    .registers 4

    iget-object v0, p0, Lyue;->f:Lk92;

    if-eqz v0, :cond_11

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    iget-object v2, v0, Lc53;->c:Lv82;

    invoke-virtual {v2, v0, v1}, Lv82;->d(Lk92;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lyue;->f:Lk92;

    :cond_11
    return-void
.end method
