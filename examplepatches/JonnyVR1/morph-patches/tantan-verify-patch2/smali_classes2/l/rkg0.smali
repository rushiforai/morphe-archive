.class public abstract Ll/rkg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vjg0;


# instance fields
.field public final a:Ll/dsg0;


# direct methods
.method public constructor <init>(Ll/dsg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rkg0;->a:Ll/dsg0;

    .line 5
    .line 6
    iput-object p0, p1, Ll/dsg0;->a:Ll/rkg0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final e(Ll/aug0;IJ)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rkg0;->a:Ll/dsg0;

    .line 2
    .line 3
    iget-object p3, p0, Ll/dsg0;->c:Ll/ifg0;

    .line 4
    .line 5
    iget-object p4, p1, Ll/aug0;->f:Ll/bog0;

    .line 6
    .line 7
    if-nez p4, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    iget-object p4, p4, Ll/jwg0;->c:Ll/agg0;

    .line 14
    .line 15
    iget v0, p1, Ll/aug0;->b:I

    .line 16
    .line 17
    iget-object p4, p4, Ll/agg0;->b:Ll/izg0;

    .line 18
    .line 19
    iget-object p4, p4, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 20
    .line 21
    invoke-virtual {p4, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    check-cast p4, Ll/bog0;

    .line 26
    .line 27
    iput-object p4, p1, Ll/aug0;->f:Ll/bog0;

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p3, p1}, Ll/ifg0;->a(Ll/aug0;)Ll/ozg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Ll/wkg0;

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object p3, p0, Ll/dsg0;->b:Ll/xwg0;

    .line 39
    .line 40
    if-eqz p3, :cond_2

    .line 41
    .line 42
    move-object p0, p1

    .line 43
    check-cast p0, Ll/sug0;

    .line 44
    .line 45
    iget-object p4, p0, Ll/sug0;->f:Landroid/util/SparseArray;

    .line 46
    .line 47
    invoke-virtual {p4, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    check-cast p4, Ll/yeg0;

    .line 52
    .line 53
    monitor-enter p4

    .line 54
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 55
    .line 56
    .line 57
    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    iget-object p3, p3, Ll/xwg0;->a:Ll/log0;

    .line 59
    .line 60
    if-eqz p3, :cond_3

    .line 61
    .line 62
    iget-object p1, p1, Ll/wkg0;->b:Ll/bog0;

    .line 63
    .line 64
    iget-object p1, p1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Ll/akg0;

    .line 71
    .line 72
    iget-object p0, p0, Ll/sug0;->f:Landroid/util/SparseArray;

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ll/yeg0;

    .line 79
    .line 80
    return-void

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    monitor-exit p4

    .line 83
    throw p0

    .line 84
    :cond_2
    iget-object p0, p0, Ll/dsg0;->a:Ll/rkg0;

    .line 85
    .line 86
    if-eqz p0, :cond_3

    .line 87
    .line 88
    iget-object p0, p1, Ll/wkg0;->b:Ll/bog0;

    .line 89
    .line 90
    iget-object p0, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Ll/akg0;

    .line 97
    .line 98
    :cond_3
    :goto_0
    return-void
.end method

.method public final f(Ll/aug0;Ll/bog0;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/rkg0;->a:Ll/dsg0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/dsg0;->c:Ll/ifg0;

    .line 4
    .line 5
    iget-object v1, v0, Ll/ifg0;->c:Ll/zrg0;

    .line 6
    .line 7
    iget v2, p1, Ll/aug0;->b:I

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/sug0;

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ll/sug0;-><init>(I)V

    .line 15
    .line 16
    .line 17
    monitor-enter v0

    .line 18
    :try_start_0
    iget-object v2, v0, Ll/ifg0;->a:Ll/ozg0;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    iput-object v1, v0, Ll/ifg0;->a:Ll/ozg0;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    iget-object v2, v0, Ll/ifg0;->b:Landroid/util/SparseArray;

    .line 28
    .line 29
    iget p1, p1, Ll/aug0;->b:I

    .line 30
    .line 31
    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    if-eqz p2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1, p2}, Ll/sug0;->a(Ll/bog0;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    iget-object p0, p0, Ll/dsg0;->b:Ll/xwg0;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Ll/xwg0;->a:Ll/log0;

    .line 45
    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-interface {p0, p2}, Ll/qog0;->b(Ll/bog0;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void

    .line 52
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw p0
.end method

.method public final g(Ll/aug0;Ll/bog0;I)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rkg0;->a:Ll/dsg0;

    .line 2
    .line 3
    iget-object p3, p0, Ll/dsg0;->c:Ll/ifg0;

    .line 4
    .line 5
    iget-object v0, p3, Ll/ifg0;->c:Ll/zrg0;

    .line 6
    .line 7
    iget v1, p1, Ll/aug0;->b:I

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/sug0;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/sug0;-><init>(I)V

    .line 15
    .line 16
    .line 17
    monitor-enter p3

    .line 18
    :try_start_0
    iget-object v1, p3, Ll/ifg0;->a:Ll/ozg0;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iput-object v0, p3, Ll/ifg0;->a:Ll/ozg0;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    iget-object v1, p3, Ll/ifg0;->b:Landroid/util/SparseArray;

    .line 28
    .line 29
    iget p1, p1, Ll/aug0;->b:I

    .line 30
    .line 31
    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    if-eqz p2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Ll/sug0;->a(Ll/bog0;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    iget-object p0, p0, Ll/dsg0;->b:Ll/xwg0;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Ll/xwg0;->a:Ll/log0;

    .line 45
    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-interface {p0, p2}, Ll/qog0;->b(Ll/bog0;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void

    .line 52
    :goto_1
    :try_start_1
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw p0
.end method

.method public final h(Ll/aug0;IJ)V
    .locals 6

    .line 1
    iget-object p0, p0, Ll/rkg0;->a:Ll/dsg0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/dsg0;->c:Ll/ifg0;

    .line 4
    .line 5
    iget-object v1, p1, Ll/aug0;->f:Ll/bog0;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Ll/jwg0;->c:Ll/agg0;

    .line 14
    .line 15
    iget v2, p1, Ll/aug0;->b:I

    .line 16
    .line 17
    iget-object v1, v1, Ll/agg0;->b:Ll/izg0;

    .line 18
    .line 19
    iget-object v1, v1, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/bog0;

    .line 26
    .line 27
    iput-object v1, p1, Ll/aug0;->f:Ll/bog0;

    .line 28
    .line 29
    :cond_0
    invoke-virtual {v0, p1}, Ll/ifg0;->a(Ll/aug0;)Ll/ozg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Ll/wkg0;

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_1
    iget-object v0, p1, Ll/wkg0;->d:Landroid/util/SparseArray;

    .line 39
    .line 40
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/Long;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    add-long/2addr v0, p3

    .line 51
    iget-object v2, p1, Ll/wkg0;->d:Landroid/util/SparseArray;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v2, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-wide v0, p1, Ll/wkg0;->c:J

    .line 61
    .line 62
    add-long/2addr v0, p3

    .line 63
    iput-wide v0, p1, Ll/wkg0;->c:J

    .line 64
    .line 65
    iget-object p0, p0, Ll/dsg0;->b:Ll/xwg0;

    .line 66
    .line 67
    if-eqz p0, :cond_3

    .line 68
    .line 69
    move-object v0, p1

    .line 70
    check-cast v0, Ll/sug0;

    .line 71
    .line 72
    iget-object v1, v0, Ll/sug0;->f:Landroid/util/SparseArray;

    .line 73
    .line 74
    invoke-virtual {v1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ll/yeg0;

    .line 79
    .line 80
    monitor-enter v1

    .line 81
    :try_start_0
    iget-wide v2, v1, Ll/yeg0;->a:J

    .line 82
    .line 83
    const-wide/16 v4, 0x0

    .line 84
    .line 85
    cmp-long v2, v2, v4

    .line 86
    .line 87
    if-nez v2, :cond_2

    .line 88
    .line 89
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    iput-wide v2, v1, Ll/yeg0;->a:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :catchall_0
    move-exception p0

    .line 97
    goto :goto_1

    .line 98
    :cond_2
    :goto_0
    monitor-exit v1

    .line 99
    iget-object v1, v0, Ll/sug0;->e:Ll/yeg0;

    .line 100
    .line 101
    invoke-virtual {v1, p3, p4}, Ll/yeg0;->a(J)V

    .line 102
    .line 103
    .line 104
    iget-object p3, p0, Ll/xwg0;->a:Ll/log0;

    .line 105
    .line 106
    if-eqz p3, :cond_3

    .line 107
    .line 108
    iget-object p3, p1, Ll/wkg0;->d:Landroid/util/SparseArray;

    .line 109
    .line 110
    invoke-virtual {p3, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    check-cast p3, Ljava/lang/Long;

    .line 115
    .line 116
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    .line 118
    .line 119
    iget-object p3, v0, Ll/sug0;->f:Landroid/util/SparseArray;

    .line 120
    .line 121
    invoke-virtual {p3, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    check-cast p2, Ll/yeg0;

    .line 126
    .line 127
    iget-object p0, p0, Ll/xwg0;->a:Ll/log0;

    .line 128
    .line 129
    iget-wide p1, p1, Ll/wkg0;->c:J

    .line 130
    .line 131
    invoke-interface {p0, p1, p2}, Ll/qog0;->d(J)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :goto_1
    monitor-exit v1

    .line 136
    throw p0

    .line 137
    :cond_3
    :goto_2
    return-void
.end method

.method public final i(Ll/aug0;ILjava/lang/Exception;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/rkg0;->a:Ll/dsg0;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Ll/dsg0;->c:Ll/ifg0;

    .line 5
    .line 6
    iget-object v1, p1, Ll/aug0;->f:Ll/bog0;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Ll/jwg0;->c:Ll/agg0;

    .line 15
    .line 16
    iget v2, p1, Ll/aug0;->b:I

    .line 17
    .line 18
    iget-object v1, v1, Ll/agg0;->b:Ll/izg0;

    .line 19
    .line 20
    iget-object v1, v1, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/bog0;

    .line 27
    .line 28
    iput-object v1, p1, Ll/aug0;->f:Ll/bog0;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    iget-object v1, p1, Ll/aug0;->f:Ll/bog0;

    .line 34
    .line 35
    invoke-virtual {v0, p1, v1}, Ll/ifg0;->b(Ll/aug0;Ll/bog0;)Ll/ozg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/wkg0;

    .line 40
    .line 41
    iget-object v1, p0, Ll/dsg0;->b:Ll/xwg0;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1, p1, p2, p3, v0}, Ll/xwg0;->a(Ll/aug0;ILjava/lang/Exception;Ll/wkg0;)V

    .line 46
    .line 47
    .line 48
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :cond_1
    iget-object p1, p0, Ll/dsg0;->a:Ll/rkg0;

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    return-void

    .line 56
    :cond_2
    monitor-exit p0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit p0

    .line 59
    throw p1
.end method
