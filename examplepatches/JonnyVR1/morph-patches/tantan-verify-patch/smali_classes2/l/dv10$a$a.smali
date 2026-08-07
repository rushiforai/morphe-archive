.class public Ll/dv10$a$a;
.super Ll/er2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dv10$a;->g(Landroid/util/Pair;Ll/yk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/util/Pair;

.field public final synthetic b:Ll/dv10$a;


# direct methods
.method public constructor <init>(Ll/dv10$a;Landroid/util/Pair;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dv10$a$a;->a:Landroid/util/Pair;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/er2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dv10$a;->d(Ll/dv10$a;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/dr2;->c(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 5
    .line 6
    invoke-static {v1}, Ll/dv10$a;->a(Ll/dv10$a;)Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Ll/dv10$a$a;->a:Landroid/util/Pair;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v3, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 20
    .line 21
    invoke-static {v3}, Ll/dv10$a;->a(Ll/dv10$a;)Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    iget-object v4, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 30
    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    :try_start_1
    invoke-static {v4}, Ll/dv10$a;->b(Ll/dv10$a;)Ll/dr2;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    move-object v4, v2

    .line 38
    :goto_0
    move-object v5, v4

    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_3

    .line 42
    :cond_0
    invoke-static {v4}, Ll/dv10$a;->e(Ll/dv10$a;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v4, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 47
    .line 48
    invoke-static {v4}, Ll/dv10$a;->f(Ll/dv10$a;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iget-object v5, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 53
    .line 54
    invoke-static {v5}, Ll/dv10$a;->d(Ll/dv10$a;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    move-object v6, v3

    .line 59
    move-object v3, v2

    .line 60
    move-object v2, v6

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move-object v3, v2

    .line 63
    move-object v4, v3

    .line 64
    goto :goto_0

    .line 65
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    invoke-static {v2}, Ll/dr2;->f(Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v4}, Ll/dr2;->g(Ljava/util/List;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v5}, Ll/dr2;->c(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    if-eqz v3, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 78
    .line 79
    iget-object v0, v0, Ll/dv10$a;->h:Ll/dv10;

    .line 80
    .line 81
    invoke-static {v0}, Ll/dv10;->e(Ll/dv10;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    invoke-virtual {v3}, Ll/dr2;->H()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->LOW:Lcom/facebook/imagepipeline/common/Priority;

    .line 94
    .line 95
    invoke-virtual {v3, v0}, Ll/dr2;->o(Lcom/facebook/imagepipeline/common/Priority;)Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Ll/dr2;->g(Ljava/util/List;)V

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_2
    invoke-virtual {v3}, Ll/dr2;->h()V

    .line 104
    .line 105
    .line 106
    :cond_3
    :goto_2
    if-eqz v1, :cond_4

    .line 107
    .line 108
    iget-object p0, p0, Ll/dv10$a$a;->a:Landroid/util/Pair;

    .line 109
    .line 110
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast p0, Ll/z06;

    .line 113
    .line 114
    invoke-interface {p0}, Ll/z06;->a()V

    .line 115
    .line 116
    .line 117
    :cond_4
    return-void

    .line 118
    :goto_3
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 119
    throw p0
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dv10$a;->e(Ll/dv10$a;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/dr2;->f(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dv10$a$a;->b:Ll/dv10$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dv10$a;->f(Ll/dv10$a;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/dr2;->g(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
