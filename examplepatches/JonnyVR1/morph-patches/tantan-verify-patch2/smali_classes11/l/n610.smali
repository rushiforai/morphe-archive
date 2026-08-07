.class public Ll/n610;
.super Ll/pgk;
.source "SourceFile"


# instance fields
.field private H:Ll/h9k;

.field private I:Ll/kt2;

.field J:Ll/pu40;

.field private K:Z

.field private L:Ll/pq70;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/pgk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kt2;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/kt2;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/n610;->I:Ll/kt2;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/hfj;->C(Ll/efj;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/n610;->I:Ll/kt2;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/pgk;->R(Ll/kt2;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/n610;->I:Ll/kt2;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/pgk;->S(Ll/kt2;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public W(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/hfj;->I()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Ll/n610;->K:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/n610;->I:Ll/kt2;

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ll/hfj;->M(Ll/efj;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/n610;->I:Ll/kt2;

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ll/pgk;->V(Ll/kt2;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/n610;->I:Ll/kt2;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/pgk;->Q(Ll/kt2;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/pu40;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/pu40;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/n610;->J:Ll/pu40;

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ll/hfj;->C(Ll/efj;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/pq70;

    .line 36
    .line 37
    const v2, 0x3ca3d70a    # 0.02f

    .line 38
    .line 39
    .line 40
    const/high16 v3, 0x3f800000    # 1.0f

    .line 41
    .line 42
    invoke-direct {v1, v2, v3}, Ll/pq70;-><init>(FF)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Ll/n610;->L:Ll/pq70;

    .line 46
    .line 47
    new-instance v1, Ll/h9k;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/h9k;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Ll/n610;->H:Ll/h9k;

    .line 53
    .line 54
    iget-object v1, p0, Ll/n610;->I:Ll/kt2;

    .line 55
    .line 56
    iget-object v2, p0, Ll/n610;->J:Ll/pu40;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ll/hfj;->C(Ll/efj;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/n610;->I:Ll/kt2;

    .line 62
    .line 63
    iget-object v2, p0, Ll/n610;->L:Ll/pq70;

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ll/hfj;->C(Ll/efj;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/n610;->L:Ll/pq70;

    .line 69
    .line 70
    iget-object v2, p0, Ll/n610;->H:Ll/h9k;

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ll/hfj;->C(Ll/efj;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/n610;->H:Ll/h9k;

    .line 76
    .line 77
    iget-object v2, p0, Ll/n610;->J:Ll/pu40;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ll/hfj;->C(Ll/efj;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/n610;->J:Ll/pu40;

    .line 83
    .line 84
    iget-object v2, p0, Ll/n610;->I:Ll/kt2;

    .line 85
    .line 86
    const/4 v3, 0x0

    .line 87
    invoke-virtual {v1, v2, v3}, Ll/is10;->Q(Ll/hfj;I)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/n610;->J:Ll/pu40;

    .line 91
    .line 92
    iget-object v2, p0, Ll/n610;->H:Ll/h9k;

    .line 93
    .line 94
    const/4 v3, 0x1

    .line 95
    invoke-virtual {v1, v2, v3}, Ll/is10;->Q(Ll/hfj;I)V

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Ll/n610;->J:Ll/pu40;

    .line 99
    .line 100
    invoke-virtual {v1, p0}, Ll/hfj;->C(Ll/efj;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/n610;->J:Ll/pu40;

    .line 104
    .line 105
    invoke-virtual {p0, v1}, Ll/pgk;->S(Ll/kt2;)V

    .line 106
    .line 107
    .line 108
    iput-boolean v3, p0, Ll/n610;->K:Z

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :catchall_0
    move-exception p0

    .line 112
    goto :goto_1

    .line 113
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/n610;->H:Ll/h9k;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ll/h9k;->R(Landroid/graphics/Bitmap;)V

    .line 116
    .line 117
    .line 118
    monitor-exit v0

    .line 119
    return-void

    .line 120
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    throw p0
.end method

.method public X(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n610;->L:Ll/pq70;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/pq70;->O(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/pgk;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/n610;->J:Ll/pu40;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/is10;->f()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/n610;->I:Ll/kt2;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/hfj;->f()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method
