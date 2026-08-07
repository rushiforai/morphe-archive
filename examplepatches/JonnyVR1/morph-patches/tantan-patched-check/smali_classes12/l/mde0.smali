.class public Ll/mde0;
.super Ll/lqi0;
.source "SourceFile"


# instance fields
.field private N:Ll/b3i0;

.field private final O:Ljava/lang/Object;

.field protected volatile P:Z

.field private Q:Ljava/lang/String;

.field R:I

.field S:I

.field T:I

.field U:I

.field V:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lqi0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mde0;->O:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/mde0;->R:I

    .line 13
    .line 14
    iput v0, p0, Ll/mde0;->S:I

    .line 15
    .line 16
    iput v0, p0, Ll/mde0;->T:I

    .line 17
    .line 18
    iput v0, p0, Ll/mde0;->U:I

    .line 19
    .line 20
    iput v0, p0, Ll/mde0;->V:I

    .line 21
    .line 22
    new-instance v0, Ll/b3i0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/b3i0;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/mde0;->N:Ll/b3i0;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public O()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/lqi0;->O()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mde0;->N:Ll/b3i0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/mde0;->Q:Ljava/lang/String;

    .line 7
    .line 8
    iget v2, p0, Ll/mde0;->R:I

    .line 9
    .line 10
    iget v3, p0, Ll/mde0;->S:I

    .line 11
    .line 12
    iget v4, p0, Ll/mde0;->T:I

    .line 13
    .line 14
    iget v5, p0, Ll/mde0;->U:I

    .line 15
    .line 16
    iget v6, p0, Ll/mde0;->V:I

    .line 17
    .line 18
    invoke-virtual/range {v0 .. v6}, Ll/b3i0;->h(Ljava/lang/String;IIIII)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public R(Ll/qpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mde0;->N:Ll/b3i0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/b3i0;->g(Ll/qpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public S(Ll/ppw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mde0;->N:Ll/b3i0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/b3i0;->f(Ll/ppw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public T(Ljava/lang/String;IIIIIZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mde0;->N:Ll/b3i0;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_4

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_4

    .line 16
    .line 17
    if-eqz p1, :cond_4

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_4

    .line 24
    .line 25
    iput-object p1, p0, Ll/mde0;->Q:Ljava/lang/String;

    .line 26
    .line 27
    iput p2, p0, Ll/mde0;->R:I

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p3, p1}, Ljava/lang/Math;->max(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Ll/mde0;->S:I

    .line 43
    .line 44
    invoke-static {p4, p1}, Ljava/lang/Math;->max(II)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    iput p2, p0, Ll/mde0;->T:I

    .line 57
    .line 58
    invoke-static {p5, p1}, Ljava/lang/Math;->max(II)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 63
    .line 64
    .line 65
    move-result p5

    .line 66
    invoke-static {p2, p5}, Ljava/lang/Math;->min(II)I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    invoke-static {p6, p1}, Ljava/lang/Math;->max(II)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 75
    .line 76
    .line 77
    move-result p5

    .line 78
    invoke-static {p1, p5}, Ljava/lang/Math;->min(II)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    add-int p5, p2, p3

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 85
    .line 86
    .line 87
    move-result p6

    .line 88
    if-gt p5, p6, :cond_0

    .line 89
    .line 90
    if-nez p2, :cond_1

    .line 91
    .line 92
    :cond_0
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    sub-int/2addr p2, p3

    .line 97
    :cond_1
    iput p2, p0, Ll/mde0;->U:I

    .line 98
    .line 99
    add-int p2, p1, p4

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 102
    .line 103
    .line 104
    move-result p3

    .line 105
    if-gt p2, p3, :cond_2

    .line 106
    .line 107
    if-nez p1, :cond_3

    .line 108
    .line 109
    :cond_2
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    sub-int/2addr p1, p4

    .line 114
    :cond_3
    iput p1, p0, Ll/mde0;->V:I

    .line 115
    .line 116
    iget-object p0, p0, Ll/mde0;->N:Ll/b3i0;

    .line 117
    .line 118
    invoke-virtual {p0, p7}, Ll/b3i0;->d(Z)V

    .line 119
    .line 120
    .line 121
    :cond_4
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mde0;->O:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/mde0;->P:Z

    .line 6
    .line 7
    invoke-super {p0}, Ll/hfj;->f()V

    .line 8
    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mde0;->O:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/mde0;->P:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Ll/mde0;->N:Ll/b3i0;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/b3i0;->c()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    invoke-super {p0}, Ll/lqi0;->h()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method
