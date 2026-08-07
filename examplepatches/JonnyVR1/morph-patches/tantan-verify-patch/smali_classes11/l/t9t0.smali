.class public abstract Ll/t9t0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/t9t0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "ScionComponent.class"
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized d(Landroid/content/Context;)Ll/t9t0;
    .locals 4

    .line 1
    const-class v0, Ll/t9t0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/t9t0;->a:Ll/t9t0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-object v1

    .line 10
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/ebt0;->i()Ll/grw0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1, p0}, Ll/grw0;->k(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/l9t0;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-direct {v2, v3}, Ll/l9t0;-><init>(Ll/d9t0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, p0}, Ll/l9t0;->b(Landroid/content/Context;)Ll/l9t0;

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v2, p0}, Ll/l9t0;->c(Lcom/google/android/gms/common/util/Clock;)Ll/l9t0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v1}, Ll/l9t0;->a(Ll/grw0;)Ll/l9t0;

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/bxy0;->p()Ll/s9t0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v2, p0}, Ll/l9t0;->d(Ll/s9t0;)Ll/l9t0;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ll/l9t0;->e()Ll/t9t0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sput-object p0, Ll/t9t0;->a:Ll/t9t0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/t9t0;->a()Ll/x8t0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/x8t0;->a()V

    .line 65
    .line 66
    .line 67
    sget-object p0, Ll/t9t0;->a:Ll/t9t0;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/t9t0;->c()Ll/x9t0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget-object v1, Ll/sgs0;->q0:Ll/dgs0;

    .line 74
    .line 75
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 93
    .line 94
    .line 95
    sget-object v1, Ll/sgs0;->s0:Ll/dgs0;

    .line 96
    .line 97
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/b;->W(Ljava/lang/String;)Ljava/util/Map;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    if-eqz v3, :cond_2

    .line 124
    .line 125
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, v3}, Ll/x9t0;->c(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :catchall_0
    move-exception p0

    .line 136
    goto :goto_2

    .line 137
    :cond_2
    new-instance v2, Ll/v9t0;

    .line 138
    .line 139
    invoke-direct {v2, p0, v1}, Ll/v9t0;-><init>(Ll/x9t0;Ljava/util/Map;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v2}, Ll/x9t0;->d(Ll/v9t0;)V

    .line 143
    .line 144
    .line 145
    :goto_1
    sget-object p0, Ll/t9t0;->a:Ll/t9t0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    .line 147
    monitor-exit v0

    .line 148
    return-object p0

    .line 149
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 150
    throw p0
.end method


# virtual methods
.method public abstract a()Ll/x8t0;
.end method

.method public abstract b()Ll/b9t0;
.end method

.method public abstract c()Ll/x9t0;
.end method
