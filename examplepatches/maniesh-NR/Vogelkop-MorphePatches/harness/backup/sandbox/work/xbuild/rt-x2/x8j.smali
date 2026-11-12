.class public final Lx8j;
.super Lk1g;
.source "SourceFile"


# instance fields
.field public final synthetic i:Ljava/util/List;

.field public final synthetic j:I

.field public final synthetic k:Lj9j;

.field public final synthetic l:Z

.field public final synthetic m:Ljk7;


# direct methods
.method public constructor <init>(Ljava/util/List;ILj9j;ILjk7;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx8j;->i:Ljava/util/List;

    iput p2, p0, Lx8j;->j:I

    iput-object p3, p0, Lx8j;->k:Lj9j;

    iput-boolean p4, p0, Lx8j;->l:Z

    iput-object p5, p0, Lx8j;->m:Ljk7;

    return-void
.end method


# virtual methods
.method public final C()I
    .registers 2

    iget-object v0, p0, Lx8j;->k:Lj9j;

    iget-object v0, v0, Lj9j;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-boolean p0, p0, Lx8j;->l:Z

    add-int/2addr v0, p0

    return v0
.end method

.method public final D()I
    .registers 2

    iget-object v0, p0, Lx8j;->i:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget p0, p0, Lx8j;->j:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final h(II)Z
    .registers 6

    iget v0, p0, Lx8j;->j:I

    sub-int/2addr p1, v0

    iget-boolean v0, p0, Lx8j;->l:Z

    sub-int/2addr p2, v0

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-gez p1, :cond_f

    if-gez p2, :cond_d

    return v0

    :cond_d
    move v2, v0

    goto :goto_10

    :cond_f
    move v2, v1

    :goto_10
    if-ltz p2, :cond_13

    move v0, v1

    :cond_13
    if-eq v2, v0, :cond_16

    return v1

    :cond_16
    iget-object v0, p0, Lx8j;->m:Ljk7;

    iget-object v0, v0, Ljk7;->d:Ljava/lang/Object;

    check-cast v0, Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lgyg;

    iget-object v1, p0, Lx8j;->i:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lx8j;->k:Lj9j;

    iget-object p0, p0, Lj9j;->b:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lgyg;->i(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final i(II)Z
    .registers 6

    iget v0, p0, Lx8j;->j:I

    sub-int/2addr p1, v0

    iget-boolean v0, p0, Lx8j;->l:Z

    sub-int/2addr p2, v0

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-gez p1, :cond_f

    if-gez p2, :cond_d

    return v0

    :cond_d
    move v2, v0

    goto :goto_10

    :cond_f
    move v2, v1

    :goto_10
    if-ltz p2, :cond_13

    move v0, v1

    :cond_13
    if-eq v2, v0, :cond_16

    return v1

    :cond_16
    iget-object v0, p0, Lx8j;->m:Ljk7;

    iget-object v0, v0, Ljk7;->d:Ljava/lang/Object;

    check-cast v0, Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lgyg;

    iget-object v1, p0, Lx8j;->i:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lx8j;->k:Lj9j;

    iget-object p0, p0, Lj9j;->b:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lgyg;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final u(II)Ljava/lang/Object;
    .registers 5

    iget v0, p0, Lx8j;->j:I

    sub-int/2addr p1, v0

    iget-boolean v0, p0, Lx8j;->l:Z

    sub-int/2addr p2, v0

    if-ltz p1, :cond_a

    if-gez p2, :cond_c

    :cond_a
    const/4 p0, 0x0

    return-object p0

    :cond_c
    iget-object v0, p0, Lx8j;->m:Ljk7;

    iget-object v0, v0, Ljk7;->d:Ljava/lang/Object;

    check-cast v0, Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lgyg;

    iget-object v1, p0, Lx8j;->i:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lx8j;->k:Lj9j;

    iget-object p0, p0, Lj9j;->b:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lgyg;->i(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
