.class Ll/g410$m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o410$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;-><init>(Ll/uow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g410$m;->a:Ll/g410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/g410;->r(Ll/g410;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 10
    .line 11
    iget-object v0, v0, Ll/g410;->i:Ljava/util/List;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v1, p0, Ll/g410$m;->a:Ll/g410;

    .line 15
    .line 16
    iget-object v1, v1, Ll/g410;->i:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_4

    .line 37
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 39
    .line 40
    invoke-static {v0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 47
    .line 48
    invoke-static {v0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Ll/o410$d;->a()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 56
    .line 57
    invoke-static {v0}, Ll/g410;->v(Ll/g410;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 65
    .line 66
    iget-object v0, v0, Ll/g410;->i:Ljava/util/List;

    .line 67
    .line 68
    monitor-enter v0

    .line 69
    :try_start_1
    iget-object v2, p0, Ll/g410$m;->a:Ll/g410;

    .line 70
    .line 71
    iget-object v2, v2, Ll/g410;->i:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-eqz v3, :cond_2

    .line 82
    .line 83
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 88
    .line 89
    iget-object v4, p0, Ll/g410$m;->a:Ll/g410;

    .line 90
    .line 91
    iget-object v5, v4, Ll/g410;->b:Ll/o410;

    .line 92
    .line 93
    invoke-static {v4}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {v4}, Ll/bfj;->a()Ll/gfj;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v5, v4}, Ll/o410;->I(Ll/wej;)Ll/g510;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    iget-object v5, p0, Ll/g410$m;->a:Ll/g410;

    .line 106
    .line 107
    iget-object v5, v5, Ll/g410;->h:Ll/uow;

    .line 108
    .line 109
    invoke-interface {v3, v4, v5}, Lcom/momo/pipline/MomoInterface/MomoCodec;->Y(Ll/g510;Ll/uow;)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :catchall_1
    move-exception p0

    .line 114
    goto :goto_2

    .line 115
    :cond_2
    iget-object v2, p0, Ll/g410$m;->a:Ll/g410;

    .line 116
    .line 117
    iget-object v2, v2, Ll/g410;->b:Ll/o410;

    .line 118
    .line 119
    invoke-virtual {v2}, Ll/o410;->N()V

    .line 120
    .line 121
    .line 122
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 123
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 124
    .line 125
    invoke-static {v0, v1}, Ll/g410;->w(Ll/g410;Z)Z

    .line 126
    .line 127
    .line 128
    goto :goto_3

    .line 129
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 130
    throw p0

    .line 131
    :cond_3
    :goto_3
    iget-object p0, p0, Ll/g410$m;->a:Ll/g410;

    .line 132
    .line 133
    invoke-static {p0, v1}, Ll/g410;->s(Ll/g410;Z)Z

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :goto_4
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 138
    throw p0

    .line 139
    :cond_4
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/g410$m;->a:Ll/g410;

    .line 10
    .line 11
    invoke-static {p0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/o410$d;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/g410;->x(Ll/g410;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/g410;->x(Ll/g410;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/bfj;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/bfj;->b()Ll/zej;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    iget-object v2, p0, Ll/g410$m;->a:Ll/g410;

    .line 42
    .line 43
    iget-object v2, v2, Ll/g410;->g:Ll/rsy;

    .line 44
    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/bfj;->b()Ll/zej;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v2, v3}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    invoke-virtual {v1}, Ll/bfj;->b()Ll/zej;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Ll/zej;->destroy()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 63
    .line 64
    invoke-static {v0}, Ll/g410;->x(Ll/g410;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 69
    .line 70
    .line 71
    :cond_3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 76
    .line 77
    const-string v2, "onEglDestory"

    .line 78
    .line 79
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 83
    .line 84
    invoke-static {v0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    iget-object p0, p0, Ll/g410$m;->a:Ll/g410;

    .line 91
    .line 92
    invoke-static {p0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Ll/o410$d;->c()V

    .line 97
    .line 98
    .line 99
    :cond_4
    return-void
.end method

.method public d(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g410$m;->a:Ll/g410;

    .line 2
    .line 3
    iget-object v1, v0, Ll/g410;->g:Ll/rsy;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/g410$m;->a:Ll/g410;

    .line 14
    .line 15
    invoke-static {p0}, Ll/g410;->u(Ll/g410;)Ll/o410$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p1, p2}, Ll/o410$d;->d(II)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
