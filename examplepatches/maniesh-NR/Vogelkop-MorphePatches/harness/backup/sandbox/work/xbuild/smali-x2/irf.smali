.class public final Lirf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Loyg;

.field public final b:Laz;

.field public final c:Landroid/util/SparseArray;

.field public d:Z

.field public e:I

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public final synthetic j:Lbp;


# direct methods
.method public constructor <init>(Lbp;Loyg;Laz;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lirf;->j:Lbp;

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lirf;->c:Landroid/util/SparseArray;

    iput-object p2, p0, Lirf;->a:Loyg;

    iput-object p3, p0, Lirf;->b:Laz;

    invoke-virtual {p0}, Lirf;->c()V

    return-void
.end method


# virtual methods
.method public final a(Ld50;)Z
    .registers 6

    iget-boolean v0, p0, Lirf;->d:Z

    const/4 v1, 0x0

    if-nez v0, :cond_50

    iget v0, p0, Lirf;->e:I

    iget v2, p0, Lirf;->g:I

    if-lt v0, v2, :cond_50

    iget-boolean v0, p0, Lirf;->h:Z

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Lirf;->d()V

    return v1

    :cond_13
    iget v0, p0, Lirf;->f:I

    add-int/2addr v0, v2

    iget-object v2, p0, Lirf;->j:Lbp;

    iget-object v2, v2, Lbp;->b:Ljava/lang/Object;

    check-cast v2, [Ldz;

    array-length v2, v2

    const/4 v3, 0x1

    if-ge v0, v2, :cond_31

    iget-boolean v2, p0, Lirf;->i:Z

    if-nez v2, :cond_50

    iput v1, p0, Lirf;->e:I

    iput v0, p0, Lirf;->f:I

    if-eqz p1, :cond_2d

    invoke-virtual {p1}, Ld50;->run()V

    :cond_2d
    invoke-virtual {p0}, Lirf;->c()V

    return v3

    :cond_31
    :goto_31
    iget-object v0, p0, Lirf;->c:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_42

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    :cond_42
    invoke-virtual {p0}, Lirf;->d()V

    if-eqz p1, :cond_4a

    invoke-virtual {p1}, Ld50;->run()V

    :cond_4a
    iget-object p0, p0, Lirf;->a:Loyg;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return v3

    :cond_50
    return v1
.end method

.method public final b(ILjava/lang/String;)V
    .registers 5

    iget-boolean v0, p0, Lirf;->d:Z

    if-nez v0, :cond_27

    iget v0, p0, Lirf;->e:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lirf;->e:I

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p2, :cond_11

    const-string v0, ""

    goto :goto_12

    :cond_11
    move-object v0, p2

    :goto_12
    iget-object v1, p0, Lirf;->c:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance v0, Ld50;

    const/16 v1, 0x8

    invoke-direct {v0, p0, p1, p2, v1}, Ld50;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lirf;->a(Ld50;)Z

    move-result p0

    if-nez p0, :cond_27

    invoke-virtual {v0}, Ld50;->run()V

    :cond_27
    return-void
.end method

.method public final c()V
    .registers 10

    iget v0, p0, Lirf;->f:I

    iget-object v1, p0, Lirf;->j:Lbp;

    iget-object v2, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v2, [Ldz;

    iget-object v3, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v3, [Ldz;

    array-length v2, v2

    iget v1, v1, Lbp;->a:I

    add-int v4, v0, v1

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v2, v0

    iput v2, p0, Lirf;->g:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lirf;->i:Z

    const/4 v2, -0x1

    const/4 v4, 0x0

    move v5, v4

    :goto_1e
    iget-boolean v6, p0, Lirf;->d:Z

    if-nez v6, :cond_64

    iget v6, p0, Lirf;->g:I

    if-ge v5, v6, :cond_64

    iget v6, p0, Lirf;->f:I

    add-int/2addr v6, v5

    aget-object v7, v3, v6

    invoke-interface {v7}, Lbz;->a()Z

    move-result v7

    if-nez v7, :cond_43

    const-string v7, "ads provider not available"

    invoke-virtual {p0, v6, v7}, Lirf;->b(ILjava/lang/String;)V

    iget v6, p0, Lirf;->f:I

    iget v7, p0, Lirf;->g:I

    add-int/2addr v6, v7

    array-length v8, v3

    if-ge v6, v8, :cond_61

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lirf;->g:I

    goto :goto_61

    :cond_43
    if-gez v2, :cond_54

    aget-object v2, v3, v6

    invoke-interface {v2}, Ldz;->f()Z

    move-result v2

    if-eqz v2, :cond_54

    const v2, 0x7fffffff

    if-ge v1, v2, :cond_54

    move v2, v1

    goto :goto_55

    :cond_54
    move v2, v0

    :goto_55
    aget-object v7, v3, v6

    new-instance v8, Lhrf;

    invoke-direct {v8, p0, v6}, Lhrf;-><init>(Lirf;I)V

    iget-object v6, p0, Lirf;->b:Laz;

    invoke-interface {v7, v8, v6, v2}, Ldz;->h(Lzy;Laz;I)V

    :cond_61
    :goto_61
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    :cond_64
    iput-boolean v4, p0, Lirf;->i:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lirf;->a(Ld50;)Z

    return-void
.end method

.method public final d()V
    .registers 2

    iget-boolean v0, p0, Lirf;->d:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    iput-boolean v0, p0, Lirf;->d:Z

    iget-object p0, p0, Lirf;->a:Loyg;

    iget-object p0, p0, Loyg;->a:Lzy;

    if-eqz p0, :cond_10

    invoke-interface {p0}, Lzy;->c()V

    :cond_10
    return-void
.end method
