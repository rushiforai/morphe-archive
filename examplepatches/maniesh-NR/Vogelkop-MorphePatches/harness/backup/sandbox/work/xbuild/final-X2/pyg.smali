.class public final Lpyg;
.super Lgtg;
.source "SourceFile"


# instance fields
.field public final d:Ljava/util/ArrayList;

.field public final e:Ljava/util/ArrayList;

.field public final f:Lzy9;

.field public final g:Lbp;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lzy9;Lr9g;Lil;)V
    .registers 6

    invoke-direct {p0, p3}, Lgtg;-><init>(Lr9g;)V

    new-instance p3, Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p3, p0, Lpyg;->e:Ljava/util/ArrayList;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p3, p0, Lpyg;->d:Ljava/util/ArrayList;

    iput-object p2, p0, Lpyg;->f:Lzy9;

    new-instance p1, Lbp;

    const/4 p2, 0x0

    new-array p2, p2, [Ldz;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ldz;

    if-eqz p4, :cond_24

    iget p3, p4, Lil;->a:I

    goto :goto_27

    :cond_24
    const p3, 0x7fffffff

    :goto_27
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p2, p1, Lbp;->b:Ljava/lang/Object;

    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p1, Lbp;->a:I

    iput-object p1, p0, Lpyg;->g:Lbp;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    invoke-virtual {p0}, Lpyg;->l()I

    move-result p0

    if-ltz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Ls50;
    .registers 3

    iget-object v0, p0, Lpyg;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    sget-object p0, Ls50;->e:Ls50;

    return-object p0

    :cond_b
    invoke-virtual {p0}, Lpyg;->l()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_15

    sget-object p0, Ls50;->f:Ls50;

    return-object p0

    :cond_15
    iget-object p0, p0, Lpyg;->d:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldz;

    invoke-interface {p0}, Lbz;->b()Ls50;

    move-result-object p0

    return-object p0
.end method

.method public final c()I
    .registers 5

    iget-object p0, p0, Lpyg;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_8
    :goto_8
    if-ge v2, v0, :cond_1a

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ldz;

    invoke-interface {v3}, Lbz;->c()I

    move-result v3

    if-le v3, v1, :cond_8

    move v1, v3

    goto :goto_8

    :cond_1a
    return v1
.end method

.method public final d(Laz;)Lyz;
    .registers 12

    iget-object v0, p0, Lpyg;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_8
    const/4 v4, 0x0

    if-ge v3, v1, :cond_56

    iget-object v5, p0, Lpyg;->e:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v8, v2

    move-object v7, v4

    :cond_13
    if-ge v8, v6, :cond_2d

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v8, v8, 0x1

    check-cast v7, Loyg;

    iget-object v7, v7, Loyg;->b:Landroid/util/SparseArray;

    invoke-virtual {v7, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lyz;

    if-eqz v9, :cond_2a

    invoke-virtual {v7, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2a
    move-object v7, v9

    if-eqz v9, :cond_13

    :cond_2d
    if-nez v7, :cond_39

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ldz;

    invoke-interface {v4, p1}, Lbz;->d(Laz;)Lyz;

    move-result-object v7

    :cond_39
    if-eqz v7, :cond_53

    iget-object p1, p0, Lpyg;->f:Lzy9;

    iget-object p1, p1, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/WeakHashMap;

    new-instance v0, Llyf;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v7, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v7

    :cond_53
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    :cond_56
    return-object v4
.end method

.method public final e(Lzy;Laz;)V
    .registers 5

    invoke-virtual {p0}, Lpyg;->a()Z

    move-result v0

    if-nez v0, :cond_2f

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object p0, p0, Lpyg;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "concurrent="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ", providers count="

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "\nads provider not available"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void

    :cond_2f
    new-instance v0, Loyg;

    invoke-direct {v0, p0, p1}, Loyg;-><init>(Lpyg;Lzy;)V

    iget-object p1, p0, Lpyg;->e:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lpyg;->g:Lbp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lirf;

    invoke-direct {p1, p0, v0, p2}, Lirf;-><init>(Lbp;Loyg;Laz;)V

    return-void
.end method

.method public final j(Lsx;Ldl;)V
    .registers 4

    iget-object v0, p0, Lpyg;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-super {p0, p1, p2}, Lgtg;->j(Lsx;Ldl;)V

    return-void

    :cond_c
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lsx;->onFailed(Ljava/lang/String;)V

    return-void
.end method

.method public final k(Ljava/lang/String;)Z
    .registers 7

    iget-object p0, p0, Lpyg;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_8
    if-ge v2, v0, :cond_25

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lbz;

    invoke-interface {v3}, Lbz;->a()Z

    move-result v4

    if-eqz v4, :cond_8

    instance-of p0, v3, Lgtg;

    if-eqz p0, :cond_24

    check-cast v3, Lgtg;

    invoke-virtual {v3, p1}, Lgtg;->k(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_25

    :cond_24
    return v1

    :cond_25
    const/4 p0, 0x1

    return p0
.end method

.method public final l()I
    .registers 4

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lpyg;->d:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_19

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldz;

    invoke-interface {v1}, Lbz;->a()Z

    move-result v1

    if-eqz v1, :cond_16

    return v0

    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_19
    const/4 p0, -0x1

    return p0
.end method
