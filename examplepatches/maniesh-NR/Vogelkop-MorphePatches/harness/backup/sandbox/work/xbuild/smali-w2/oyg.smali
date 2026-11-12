.class public final Loyg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lzy;

.field public final b:Landroid/util/SparseArray;

.field public final c:Landroid/util/SparseArray;

.field public final synthetic d:Lpyg;


# direct methods
.method public constructor <init>(Lpyg;Lzy;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loyg;->d:Lpyg;

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Loyg;->b:Landroid/util/SparseArray;

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Loyg;->c:Landroid/util/SparseArray;

    iput-object p2, p0, Loyg;->a:Lzy;

    return-void
.end method


# virtual methods
.method public final a(Lirf;)V
    .registers 10

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Loyg;->b:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v3

    const/4 v4, -0x1

    if-gez v3, :cond_d

    move v1, v4

    goto :goto_16

    :cond_d
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_16

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_16
    :goto_16
    if-ne v1, v4, :cond_1d

    iget-boolean v3, p1, Lirf;->d:Z

    if-nez v3, :cond_1d

    return-void

    :cond_1d
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lyz;

    const/4 v4, 0x0

    if-eqz v3, :cond_29

    invoke-virtual {v2, v1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_29
    iget-object v5, p0, Loyg;->a:Lzy;

    iget-object v6, p0, Loyg;->d:Lpyg;

    iget-object v7, v6, Lpyg;->e:Ljava/util/ArrayList;

    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lirf;->d()V

    iput-object v4, p0, Loyg;->a:Lzy;

    if-eqz v3, :cond_71

    iget-object p0, v6, Lpyg;->f:Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/WeakHashMap;

    new-instance p1, Llyf;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p1, v4, v1}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v3, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v5, v3}, Lzy;->a(Lyz;)Z

    move-result p0

    if-nez p0, :cond_59

    invoke-virtual {v3}, Lyz;->b()V

    :cond_59
    :goto_59
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result p0

    if-ge v0, p0, :cond_6d

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyz;

    if-eqz p0, :cond_6a

    invoke-virtual {p0}, Lyz;->b()V

    :cond_6a
    add-int/lit8 v0, v0, 0x1

    goto :goto_59

    :cond_6d
    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    return-void

    :cond_71
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    :goto_76
    iget-object v1, p0, Loyg;->c:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_8f

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_76

    :cond_8f
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v5, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void
.end method
