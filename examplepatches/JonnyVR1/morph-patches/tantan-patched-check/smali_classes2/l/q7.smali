.class public abstract Ll/q7;
.super Lcom/facebook/datasource/AbstractDataSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/facebook/datasource/AbstractDataSource<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000Z\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u000e\u0008\'\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u00028\u00000\u00022\u00020\u0003B\'\u0008\u0004\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ)\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u000c\u001a\u0004\u0018\u00018\u00002\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0014\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J%\u0010\u0016\u001a\u0010\u0012\u0004\u0012\u00020\u0015\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00142\u0006\u0010\u0010\u001a\u00020\u000fH\u0004\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0015\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u001bH\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0017\u0010 \u001a\u00020\u00112\u0006\u0010\u001f\u001a\u00020\u001eH\u0002\u00a2\u0006\u0004\u0008 \u0010!J\u000f\u0010\"\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\"\u0010#R\u0017\u0010\u0007\u001a\u00020\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008$\u0010%\u001a\u0004\u0008&\u0010\'R\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008(\u0010)\u001a\u0004\u0008*\u0010+\u00a8\u0006,"
    }
    d2 = {
        "Ll/q7;",
        "T",
        "Lcom/facebook/datasource/AbstractDataSource;",
        "",
        "Ll/wk90;",
        "producer",
        "Ll/eve0;",
        "settableProducerContext",
        "Ll/k2d0;",
        "requestListener",
        "<init>",
        "(Ll/wk90;Ll/eve0;Ll/k2d0;)V",
        "result",
        "",
        "status",
        "Ll/yk90;",
        "producerContext",
        "",
        "F",
        "(Ljava/lang/Object;ILl/yk90;)V",
        "",
        "",
        "B",
        "(Ll/yk90;)Ljava/util/Map;",
        "",
        "close",
        "()Z",
        "Ll/z06;",
        "A",
        "()Ll/z06;",
        "",
        "throwable",
        "E",
        "(Ljava/lang/Throwable;)V",
        "D",
        "()V",
        "h",
        "Ll/eve0;",
        "C",
        "()Ll/eve0;",
        "i",
        "Ll/k2d0;",
        "getRequestListener",
        "()Ll/k2d0;",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final h:Ll/eve0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final i:Ll/k2d0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wk90;Ll/eve0;Ll/k2d0;)V
    .locals 3
    .param p1    # Ll/wk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/eve0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/k2d0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "TT;>;",
            "Ll/eve0;",
            "Ll/k2d0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/facebook/datasource/AbstractDataSource;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/q7;->h:Ll/eve0;

    .line 14
    .line 15
    iput-object p3, p0, Ll/q7;->i:Ll/k2d0;

    .line 16
    .line 17
    invoke-static {}, Ll/i9j;->d()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v1, "AbstractProducerToDataSourceAdapter()->produceResult"

    .line 22
    .line 23
    const-string v2, "AbstractProducerToDataSourceAdapter()->onRequestStart"

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p2}, Ll/dr2;->getExtras()Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/facebook/datasource/AbstractDataSource;->n(Ljava/util/Map;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/i9j;->d()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    invoke-interface {p3, p2}, Ll/k2d0;->b(Ll/yk90;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v2}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :try_start_0
    invoke-interface {p3, p2}, Ll/k2d0;->b(Ll/yk90;)V

    .line 48
    .line 49
    .line 50
    sget-object p3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 51
    .line 52
    invoke-static {}, Ll/i9j;->b()V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-nez p3, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/q7;->A()Ll/z06;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p1, p0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-static {v1}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :try_start_1
    invoke-virtual {p0}, Ll/q7;->A()Ll/z06;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p1, p0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    .line 81
    invoke-static {}, Ll/i9j;->b()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :catchall_0
    move-exception p0

    .line 86
    invoke-static {}, Ll/i9j;->b()V

    .line 87
    .line 88
    .line 89
    throw p0

    .line 90
    :catchall_1
    move-exception p0

    .line 91
    invoke-static {}, Ll/i9j;->b()V

    .line 92
    .line 93
    .line 94
    throw p0

    .line 95
    :cond_2
    const-string v0, "AbstractProducerToDataSourceAdapter()"

    .line 96
    .line 97
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :try_start_2
    invoke-virtual {p2}, Ll/dr2;->getExtras()Ljava/util/Map;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p0, v0}, Lcom/facebook/datasource/AbstractDataSource;->n(Ljava/util/Map;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/i9j;->d()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_3

    .line 112
    .line 113
    invoke-interface {p3, p2}, Ll/k2d0;->b(Ll/yk90;)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    invoke-static {v2}, Ll/i9j;->a(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 118
    .line 119
    .line 120
    :try_start_3
    invoke-interface {p3, p2}, Ll/k2d0;->b(Ll/yk90;)V

    .line 121
    .line 122
    .line 123
    sget-object p3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 124
    .line 125
    :try_start_4
    invoke-static {}, Ll/i9j;->b()V

    .line 126
    .line 127
    .line 128
    :goto_1
    invoke-static {}, Ll/i9j;->d()Z

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    if-nez p3, :cond_4

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/q7;->A()Ll/z06;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-interface {p1, p0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_4
    invoke-static {v1}, Ll/i9j;->a(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 143
    .line 144
    .line 145
    :try_start_5
    invoke-virtual {p0}, Ll/q7;->A()Ll/z06;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-interface {p1, p0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 150
    .line 151
    .line 152
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 153
    .line 154
    :try_start_6
    invoke-static {}, Ll/i9j;->b()V

    .line 155
    .line 156
    .line 157
    :goto_2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 158
    .line 159
    invoke-static {}, Ll/i9j;->b()V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :catchall_2
    move-exception p0

    .line 164
    :try_start_7
    invoke-static {}, Ll/i9j;->b()V

    .line 165
    .line 166
    .line 167
    throw p0

    .line 168
    :catchall_3
    move-exception p0

    .line 169
    invoke-static {}, Ll/i9j;->b()V

    .line 170
    .line 171
    .line 172
    throw p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 173
    :catchall_4
    move-exception p0

    .line 174
    invoke-static {}, Ll/i9j;->b()V

    .line 175
    .line 176
    .line 177
    throw p0
.end method

.method public static final synthetic x(Ll/q7;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q7;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic y(Ll/q7;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q7;->E(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic z(Ll/q7;F)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/facebook/datasource/AbstractDataSource;->r(F)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public final A()Ll/z06;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/z06<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q7$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/q7$a;-><init>(Ll/q7;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final B(Ll/yk90;)Ljava/util/Map;
    .locals 0
    .param p1    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/yk90;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/lyk;->getExtras()Ljava/util/Map;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final C()Ll/eve0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q7;->h:Ll/eve0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final declared-synchronized D()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/datasource/AbstractDataSource;->j()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    invoke-static {v0}, Ll/wn80;->i(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw v0
.end method

.method public final E(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q7;->h:Ll/eve0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/q7;->B(Ll/yk90;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-super {p0, p1, v0}, Lcom/facebook/datasource/AbstractDataSource;->p(Ljava/lang/Throwable;Ljava/util/Map;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/q7;->i:Ll/k2d0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/q7;->h:Ll/eve0;

    .line 16
    .line 17
    invoke-interface {v0, p0, p1}, Ll/k2d0;->g(Ll/yk90;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public F(Ljava/lang/Object;ILl/yk90;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-virtual {p0, p3}, Ll/q7;->B(Ll/yk90;)Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-super {p0, p1, p2, p3}, Lcom/facebook/datasource/AbstractDataSource;->u(Ljava/lang/Object;ZLjava/util/Map;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/q7;->i:Ll/k2d0;

    .line 21
    .line 22
    iget-object p0, p0, Ll/q7;->h:Ll/eve0;

    .line 23
    .line 24
    invoke-interface {p1, p0}, Ll/k2d0;->c(Ll/yk90;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public close()Z
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/facebook/datasource/AbstractDataSource;->close()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0}, Lcom/facebook/datasource/AbstractDataSource;->e()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/q7;->i:Ll/k2d0;

    .line 16
    .line 17
    iget-object v1, p0, Ll/q7;->h:Ll/eve0;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ll/k2d0;->h(Ll/yk90;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/q7;->h:Ll/eve0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dr2;->h()V

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 p0, 0x1

    .line 28
    return p0
.end method
