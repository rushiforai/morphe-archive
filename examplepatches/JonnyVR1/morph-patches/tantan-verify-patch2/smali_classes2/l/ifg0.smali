.class public final Ll/ifg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public volatile a:Ll/ozg0;

.field public final b:Landroid/util/SparseArray;

.field public final c:Ll/zrg0;


# direct methods
.method public constructor <init>(Ll/zrg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ifg0;->b:Landroid/util/SparseArray;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ifg0;->c:Ll/zrg0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Ll/aug0;)Ll/ozg0;
    .locals 1

    .line 1
    iget p1, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Ll/ifg0;->a:Ll/ozg0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/ifg0;->a:Ll/ozg0;

    .line 9
    .line 10
    check-cast v0, Ll/wkg0;

    .line 11
    .line 12
    iget v0, v0, Ll/wkg0;->a:I

    .line 13
    .line 14
    if-ne v0, p1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/ifg0;->a:Ll/ozg0;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/ifg0;->b:Landroid/util/SparseArray;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ll/ozg0;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    return-object v0

    .line 35
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p1
.end method

.method public final b(Ll/aug0;Ll/bog0;)Ll/ozg0;
    .locals 2

    .line 1
    iget p1, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Ll/ifg0;->a:Ll/ozg0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/ifg0;->a:Ll/ozg0;

    .line 9
    .line 10
    check-cast v0, Ll/wkg0;

    .line 11
    .line 12
    iget v0, v0, Ll/wkg0;->a:I

    .line 13
    .line 14
    if-ne v0, p1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/ifg0;->a:Ll/ozg0;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ll/ifg0;->a:Ll/ozg0;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v0, p0, Ll/ifg0;->b:Landroid/util/SparseArray;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/ozg0;

    .line 31
    .line 32
    iget-object v1, p0, Ll/ifg0;->b:Landroid/util/SparseArray;

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 35
    .line 36
    .line 37
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/ifg0;->c:Ll/zrg0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/sug0;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Ll/sug0;-><init>(I)V

    .line 48
    .line 49
    .line 50
    if-eqz p2, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0, p2}, Ll/sug0;->a(Ll/bog0;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-object p0

    .line 56
    :cond_2
    return-object v0

    .line 57
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw p1
.end method
