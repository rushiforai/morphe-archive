.class public final Lzwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;
.implements Lw6f;


# instance fields
.field public final a:Lh7f;

.field public b:Z

.field public c:Le3j;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lzwk;->a:Lh7f;

    return-void
.end method

.method public static b()Lwyk;
    .registers 3

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v0

    if-nez v0, :cond_11

    new-instance v0, Lwyk;

    sget-object v1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-direct {v0, v1, v1}, Lwyk;-><init>(Ljava/util/Set;Ljava/util/Set;)V

    return-object v0

    :cond_11
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0, v1}, LJ/N;->M4jBymYh(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lwyk;

    invoke-direct {v2, v0, v1}, Lwyk;-><init>(Ljava/util/Set;Ljava/util/Set;)V

    return-object v2
.end method

.method public static c(I)Z
    .registers 4

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v0

    if-nez v0, :cond_b

    const/4 p0, 0x0

    return p0

    :cond_b
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0, v1}, LJ/N;->M4jBymYh(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lne6;

    const-string v2, ""

    invoke-direct {v1, p0, v2}, Lne6;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static e()Z
    .registers 3

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-static {}, LJ/N;->MhJnoDjg()I

    move-result v1

    if-eq v1, v0, :cond_19

    const/4 v2, 0x2

    if-eq v1, v2, :cond_19

    const/4 v2, 0x4

    if-eq v1, v2, :cond_19

    const/4 v2, 0x6

    if-eq v1, v2, :cond_19

    :cond_18
    const/4 v0, 0x0

    :cond_19
    return v0
.end method

.method public static f()Z
    .registers 3

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-static {}, LJ/N;->MhJnoDjg()I

    move-result v1

    if-eq v1, v0, :cond_1d

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1d

    const/4 v2, 0x6

    if-eq v1, v2, :cond_17

    :cond_15
    const/4 v0, 0x0

    return v0

    :cond_17
    invoke-static {}, Lzwk;->i()Z

    move-result v1

    xor-int/2addr v1, v0

    return v1

    :cond_1d
    return v0
.end method

.method public static g()Z
    .registers 2

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-static {}, LJ/N;->MYS4ja7X()Z

    move-result v1

    if-nez v1, :cond_1c

    invoke-static {}, LJ/N;->MwnyOuYt()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-static {}, LJ/N;->MIiwR271()Z

    move-result v1

    if-eqz v1, :cond_1c

    return v0

    :cond_1c
    const/4 v0, 0x0

    return v0
.end method

.method public static h()Z
    .registers 2

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v1

    if-nez v1, :cond_a

    return v0

    :cond_a
    invoke-static {}, LJ/N;->MYS4ja7X()Z

    move-result v0

    return v0
.end method

.method public static i()Z
    .registers 3

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-static {}, LJ/N;->MhJnoDjg()I

    move-result v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_22

    invoke-static {}, LJ/N;->MIiwR271()Z

    move-result v1

    if-nez v1, :cond_23

    invoke-static {}, LJ/N;->MYS4ja7X()Z

    move-result v1

    if-nez v1, :cond_23

    invoke-static {}, Lzwk;->g()Z

    move-result v1

    if-nez v1, :cond_23

    :cond_22
    const/4 v0, 0x0

    :cond_23
    return v0
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lywk;

    invoke-virtual {p0, p1}, Lzwk;->a(Lywk;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lywk;

    invoke-virtual {p0, p1}, Lzwk;->j(Lywk;)V

    return-void
.end method

.method public final a(Lywk;)V
    .registers 2

    iget-object p0, p0, Lzwk;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final j(Lywk;)V
    .registers 2

    iget-object p0, p0, Lzwk;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final k(Ljava/util/Set;)V
    .registers 7

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [I

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    move v2, v1

    :goto_15
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lne6;

    add-int/lit8 v4, v2, 0x1

    iget v3, v3, Lne6;->a:I

    aput v3, v0, v2

    move v2, v4

    goto :goto_15

    :cond_29
    invoke-static {v0}, LJ/N;->MCwUkZBk(Ljava/lang/Object;)V

    new-instance p1, Lg7f;

    iget-object p0, p0, Lzwk;->a:Lh7f;

    invoke-direct {p1, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_33
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_43

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lywk;

    invoke-interface {p0, v1}, Lywk;->e(Z)V

    goto :goto_33

    :cond_43
    return-void
.end method

.method public final o(Z)V
    .registers 7

    iget-object p1, p0, Lzwk;->c:Le3j;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld3j;

    const/16 v0, 0x17

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Ld3j;->d(IZ)Lc3j;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_17

    iget-object p1, p1, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p1, Ljava/lang/String;

    goto :goto_18

    :cond_17
    move-object p1, v0

    :goto_18
    iget-object v2, p0, Lzwk;->c:Le3j;

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld3j;

    const/16 v3, 0x18

    invoke-virtual {v2, v3, v1}, Ld3j;->d(IZ)Lc3j;

    move-result-object v2

    if-eqz v2, :cond_31

    iget-object v3, v2, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v3, Ljava/lang/String;

    iget-object v2, v2, Lqsh;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    goto :goto_33

    :cond_31
    move-object v2, v0

    move-object v3, v2

    :goto_33
    iget-object p0, p0, Lzwk;->c:Le3j;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/16 v4, 0x19

    invoke-virtual {p0, v4, v1}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_48

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    goto :goto_49

    :cond_48
    move-object p0, v0

    :goto_49
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_50

    move-object p1, v0

    :cond_50
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_57

    move-object v3, v0

    :cond_57
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5e

    move-object p0, v0

    :cond_5e
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_65

    move-object v0, v2

    :cond_65
    invoke-static {p1, v3, p0, v0}, LJ/N;->Mi6QnKEr(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
