.class public final Lq1b;
.super Lw0b;
.source "SourceFile"


# instance fields
.field public a:Lk6f;

.field public b:Z


# virtual methods
.method public final a(Ljava/lang/Object;)Lw0b;
    .registers 3

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lq1b;->c(ILjava/lang/Object;)V

    return-object p0
.end method

.method public final c(ILjava/lang/Object;)V
    .registers 10

    iget-object v0, p0, Lq1b;->a:Lk6f;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_8

    return-void

    :cond_8
    iget-boolean v0, p0, Lq1b;->b:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_40

    new-instance v0, Lk6f;

    iget-object v2, p0, Lq1b;->a:Lk6f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget v3, v2, Lk6f;->c:I

    invoke-virtual {v0, v3}, Lk6f;->d(I)V

    iget v3, v2, Lk6f;->c:I

    const/4 v4, -0x1

    if-eqz v3, :cond_3c

    move v3, v1

    :cond_1f
    :goto_1f
    if-eq v3, v4, :cond_3e

    iget v5, v2, Lk6f;->c:I

    invoke-static {v3, v5}, Lz4o;->A(II)V

    iget-object v5, v2, Lk6f;->a:[Ljava/lang/Object;

    aget-object v5, v5, v3

    iget v6, v2, Lk6f;->c:I

    invoke-static {v3, v6}, Lz4o;->A(II)V

    iget-object v6, v2, Lk6f;->b:[I

    aget v6, v6, v3

    invoke-virtual {v0, v6, v5}, Lk6f;->e(ILjava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    iget v5, v2, Lk6f;->c:I

    if-lt v3, v5, :cond_1f

    :cond_3c
    move v3, v4

    goto :goto_1f

    :cond_3e
    iput-object v0, p0, Lq1b;->a:Lk6f;

    :cond_40
    iput-boolean v1, p0, Lq1b;->b:Z

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lq1b;->a:Lk6f;

    invoke-virtual {p0, p2}, Lk6f;->b(Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0, p2}, Lk6f;->e(ILjava/lang/Object;)V

    return-void
.end method
