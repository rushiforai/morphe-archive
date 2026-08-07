.class public final Ll/hmc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ry3;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hmc0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/rg50;

.field public b:Ll/oij0;

.field public final c:Ll/x1d0;

.field public final d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ll/rg50;Ll/x1d0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hmc0;->a:Ll/rg50;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hmc0;->c:Ll/x1d0;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/hmc0;->d:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/hmc0;)Ll/oij0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0;->b:Ll/oij0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static d(Ll/rg50;Ll/x1d0;Z)Ll/hmc0;
    .locals 1

    .line 1
    new-instance v0, Ll/hmc0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/hmc0;-><init>(Ll/rg50;Ll/x1d0;Z)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/oij0;

    .line 7
    .line 8
    invoke-direct {p1, p0, v0}, Ll/oij0;-><init>(Ll/rg50;Ll/ry3;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, v0, Ll/hmc0;->b:Ll/oij0;

    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public b()Ll/hmc0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hmc0;->a:Ll/rg50;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hmc0;->c:Ll/x1d0;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/hmc0;->d:Z

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/hmc0;->d(Ll/rg50;Ll/x1d0;Z)Ll/hmc0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public c()Ll/i5d0;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/hmc0;->a:Ll/rg50;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/rg50;->s()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/y5d0;

    .line 16
    .line 17
    iget-object v2, p0, Ll/hmc0;->a:Ll/rg50;

    .line 18
    .line 19
    invoke-direct {v0, v2}, Ll/y5d0;-><init>(Ll/rg50;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/nf3;

    .line 26
    .line 27
    iget-object v2, p0, Ll/hmc0;->a:Ll/rg50;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/rg50;->l()Ll/eu6;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v0, v2}, Ll/nf3;-><init>(Ll/eu6;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/ay3;

    .line 40
    .line 41
    iget-object v2, p0, Ll/hmc0;->a:Ll/rg50;

    .line 42
    .line 43
    invoke-virtual {v2}, Ll/rg50;->t()Ll/lzm;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-direct {v0, v2}, Ll/ay3;-><init>(Ll/lzm;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/yw5;

    .line 54
    .line 55
    iget-object v2, p0, Ll/hmc0;->a:Ll/rg50;

    .line 56
    .line 57
    invoke-direct {v0, v2}, Ll/yw5;-><init>(Ll/rg50;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-boolean v0, p0, Ll/hmc0;->d:Z

    .line 64
    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Ll/hmc0;->a:Ll/rg50;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/rg50;->u()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 74
    .line 75
    .line 76
    :cond_0
    new-instance v0, Ll/s54;

    .line 77
    .line 78
    iget-boolean v2, p0, Ll/hmc0;->d:Z

    .line 79
    .line 80
    invoke-direct {v0, v2}, Ll/s54;-><init>(Z)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/tmc0;

    .line 87
    .line 88
    iget-object v2, p0, Ll/hmc0;->b:Ll/oij0;

    .line 89
    .line 90
    iget-object v5, p0, Ll/hmc0;->c:Ll/x1d0;

    .line 91
    .line 92
    iget-object v3, p0, Ll/hmc0;->a:Ll/rg50;

    .line 93
    .line 94
    invoke-virtual {v3}, Ll/rg50;->f()I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    iget-object v3, p0, Ll/hmc0;->a:Ll/rg50;

    .line 99
    .line 100
    invoke-virtual {v3}, Ll/rg50;->D()I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    iget-object v3, p0, Ll/hmc0;->a:Ll/rg50;

    .line 105
    .line 106
    invoke-virtual {v3}, Ll/rg50;->L()I

    .line 107
    .line 108
    .line 109
    move-result v9

    .line 110
    const/4 v3, 0x0

    .line 111
    const/4 v4, 0x0

    .line 112
    move-object v6, p0

    .line 113
    invoke-direct/range {v0 .. v9}, Ll/tmc0;-><init>(Ljava/util/List;Ll/oij0;Ll/n6f;ILl/x1d0;Ll/ry3;III)V

    .line 114
    .line 115
    .line 116
    const/4 p0, 0x0

    .line 117
    const/4 v1, 0x0

    .line 118
    :try_start_0
    iget-object v2, v6, Ll/hmc0;->c:Ll/x1d0;

    .line 119
    .line 120
    invoke-interface {v0, v2}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iget-object v2, v6, Ll/hmc0;->b:Ll/oij0;

    .line 125
    .line 126
    invoke-virtual {v2}, Ll/oij0;->i()Z

    .line 127
    .line 128
    .line 129
    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    if-nez v2, :cond_1

    .line 131
    .line 132
    iget-object v1, v6, Ll/hmc0;->b:Ll/oij0;

    .line 133
    .line 134
    invoke-virtual {v1, p0}, Ll/oij0;->l(Ljava/io/IOException;)Ljava/io/IOException;

    .line 135
    .line 136
    .line 137
    return-object v0

    .line 138
    :cond_1
    :try_start_1
    invoke-static {v0}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 139
    .line 140
    .line 141
    new-instance v0, Ljava/io/IOException;

    .line 142
    .line 143
    const-string v2, "Canceled"

    .line 144
    .line 145
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    throw v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    :catchall_0
    move-exception v0

    .line 150
    goto :goto_0

    .line 151
    :catch_0
    move-exception v0

    .line 152
    const/4 v1, 0x1

    .line 153
    :try_start_2
    iget-object v2, v6, Ll/hmc0;->b:Ll/oij0;

    .line 154
    .line 155
    invoke-virtual {v2, v0}, Ll/oij0;->l(Ljava/io/IOException;)Ljava/io/IOException;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 160
    :goto_0
    if-nez v1, :cond_2

    .line 161
    .line 162
    iget-object v1, v6, Ll/hmc0;->b:Ll/oij0;

    .line 163
    .line 164
    invoke-virtual {v1, p0}, Ll/oij0;->l(Ljava/io/IOException;)Ljava/io/IOException;

    .line 165
    .line 166
    .line 167
    :cond_2
    throw v0
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0;->b:Ll/oij0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oij0;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/hmc0;->b()Ll/hmc0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0;->c:Ll/x1d0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/rnl;->G()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public execute()Ll/i5d0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/hmc0;->e:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/hmc0;->e:Z

    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    iget-object v0, p0, Ll/hmc0;->b:Ll/oij0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/oij0;->p()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/hmc0;->b:Ll/oij0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/oij0;->b()V

    .line 18
    .line 19
    .line 20
    :try_start_1
    iget-object v0, p0, Ll/hmc0;->a:Ll/rg50;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/rg50;->m()Ll/o5e;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p0}, Ll/o5e;->b(Ll/hmc0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/hmc0;->c()Ll/i5d0;

    .line 30
    .line 31
    .line 32
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    iget-object v1, p0, Ll/hmc0;->a:Ll/rg50;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/rg50;->m()Ll/o5e;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, p0}, Ll/o5e;->g(Ll/hmc0;)V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    iget-object v1, p0, Ll/hmc0;->a:Ll/rg50;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/rg50;->m()Ll/o5e;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1, p0}, Ll/o5e;->g(Ll/hmc0;)V

    .line 51
    .line 52
    .line 53
    throw v0

    .line 54
    :catchall_1
    move-exception v0

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    :try_start_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 57
    .line 58
    const-string v1, "Already Executed"

    .line 59
    .line 60
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw v0

    .line 64
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 65
    throw v0
.end method

.method public f()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hmc0;->isCanceled()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, "canceled "

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v1, ""

    .line 16
    .line 17
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v1, p0, Ll/hmc0;->d:Z

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-string v1, "web socket"

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const-string v1, "call"

    .line 28
    .line 29
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, " to "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/hmc0;->e()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public h(Ll/w84;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/hmc0;->e:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/hmc0;->e:Z

    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    iget-object v0, p0, Ll/hmc0;->b:Ll/oij0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/oij0;->b()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/hmc0;->a:Ll/rg50;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/rg50;->m()Ll/o5e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/hmc0$a;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/hmc0$a;-><init>(Ll/hmc0;Ll/w84;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/o5e;->a(Ll/hmc0$a;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    const-string v0, "Already Executed"

    .line 35
    .line 36
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p1

    .line 40
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p1
.end method

.method public isCanceled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0;->b:Ll/oij0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oij0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public declared-synchronized isExecuted()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/hmc0;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public request()Ll/x1d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0;->c:Ll/x1d0;

    .line 2
    .line 3
    return-object p0
.end method
