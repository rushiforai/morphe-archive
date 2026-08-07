.class public Ll/smc0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bzm;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/lyt;

.field public final c:Ll/t24;

.field public final d:Ll/l4f;

.field public final e:Ll/jx5;

.field public final f:Ll/t0q;

.field public final g:Ll/x250;

.field public final h:Ll/a10;

.field public final i:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

.field public final j:Ll/hzq;

.field public final k:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;

.field public final l:Ll/zxi0;

.field public final m:Ll/c0j0;

.field public final n:Ll/ixl;

.field public final o:Ll/vzv;

.field public final p:Ll/etf0;

.field public final q:Ll/ndm;

.field public r:Ll/r3w;


# direct methods
.method public constructor <init>(Ll/th3;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/smc0;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/zxi0;

    .line 12
    .line 13
    new-instance v2, Ll/msd;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/msd;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-direct {v1, v2}, Ll/zxi0;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/smc0;->l:Ll/zxi0;

    .line 22
    .line 23
    iget-object v1, p1, Ll/th3;->c:Ll/c0j0;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iput-object v1, p0, Ll/smc0;->m:Ll/c0j0;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {}, Ll/c0j0;->a()Ll/c0j0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Ll/smc0;->m:Ll/c0j0;

    .line 35
    .line 36
    :goto_0
    iget-object v1, p1, Ll/th3;->e:Ll/lyt;

    .line 37
    .line 38
    iput-object v1, p0, Ll/smc0;->b:Ll/lyt;

    .line 39
    .line 40
    iget-object v1, p1, Ll/th3;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

    .line 41
    .line 42
    iput-object v1, p0, Ll/smc0;->i:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

    .line 43
    .line 44
    iget-object v1, p1, Ll/th3;->g:Ll/vzv;

    .line 45
    .line 46
    iput-object v1, p0, Ll/smc0;->o:Ll/vzv;

    .line 47
    .line 48
    iget-object v1, p1, Ll/th3;->d:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;

    .line 49
    .line 50
    iput-object v1, p0, Ll/smc0;->k:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;

    .line 51
    .line 52
    iget-object v1, p1, Ll/th3;->h:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p1, Ll/th3;->i:Ll/qum;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/qum;->d()Ll/hzq;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Ll/smc0;->j:Ll/hzq;

    .line 64
    .line 65
    iget-object v0, p1, Ll/th3;->i:Ll/qum;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/qum;->c()Ll/t0q;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Ll/smc0;->f:Ll/t0q;

    .line 72
    .line 73
    iget-object v0, p1, Ll/th3;->i:Ll/qum;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/qum;->e()Ll/x250;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/smc0;->g:Ll/x250;

    .line 80
    .line 81
    iget-object v0, p1, Ll/th3;->i:Ll/qum;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/qum;->b()Ll/a10;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Ll/smc0;->h:Ll/a10;

    .line 88
    .line 89
    iget-object v0, p1, Ll/th3;->f:Ll/ixl;

    .line 90
    .line 91
    iput-object v0, p0, Ll/smc0;->n:Ll/ixl;

    .line 92
    .line 93
    iget-object v0, p1, Ll/th3;->j:Ll/etf0;

    .line 94
    .line 95
    iput-object v0, p0, Ll/smc0;->p:Ll/etf0;

    .line 96
    .line 97
    new-instance v0, Ll/l4f;

    .line 98
    .line 99
    invoke-direct {v0}, Ll/l4f;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Ll/smc0;->d:Ll/l4f;

    .line 103
    .line 104
    new-instance v0, Ll/t24;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ll/t24;-><init>(Ll/smc0;)V

    .line 107
    .line 108
    .line 109
    iput-object v0, p0, Ll/smc0;->c:Ll/t24;

    .line 110
    .line 111
    new-instance v0, Ll/jx5;

    .line 112
    .line 113
    iget-object v1, p1, Ll/th3;->a:Landroid/app/Application;

    .line 114
    .line 115
    invoke-direct {v0, p0, v1}, Ll/jx5;-><init>(Ll/smc0;Landroid/app/Application;)V

    .line 116
    .line 117
    .line 118
    iput-object v0, p0, Ll/smc0;->e:Ll/jx5;

    .line 119
    .line 120
    new-instance v0, Ll/ndm;

    .line 121
    .line 122
    invoke-direct {v0}, Ll/ndm;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object v0, p0, Ll/smc0;->q:Ll/ndm;

    .line 126
    .line 127
    iget-object p1, p1, Ll/th3;->k:Ll/r3w;

    .line 128
    .line 129
    iput-object p1, p0, Ll/smc0;->r:Ll/r3w;

    .line 130
    .line 131
    return-void
.end method


# virtual methods
.method public a(Ll/qy3;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/qy3;->a(Ll/smc0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()Ll/a10;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->h:Ll/a10;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->i:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/t24;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->c:Ll/t24;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->k:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/jx5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->e:Ll/jx5;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/l4f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->d:Ll/l4f;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/ndm;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->q:Ll/ndm;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ll/ixl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->n:Ll/ixl;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/bzm;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/smc0;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/t0q;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->f:Ll/t0q;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Ll/hzq;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->j:Ll/hzq;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Ll/vzv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->o:Ll/vzv;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ll/x250;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->g:Ll/x250;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/r3w;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->r:Ll/r3w;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Ll/etf0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->p:Ll/etf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ll/lyt;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->b:Ll/lyt;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ll/zxi0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->l:Ll/zxi0;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Ll/c0j0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smc0;->m:Ll/c0j0;

    .line 2
    .line 3
    return-object p0
.end method
