.class public Ll/osh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/osh0$a;
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a1j0;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/z0j0;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/concurrent/ThreadPoolExecutor;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:J

.field public final j:J

.field public final k:Ll/x4m;

.field public final l:Z

.field public final m:I

.field public final n:I

.field public final o:Z

.field public final p:Z

.field public final q:Z

.field public final r:I

.field public final s:Z

.field public final t:Z


# direct methods
.method public constructor <init>(Ll/osh0$a;)V
    .locals 4

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
    iput-object v0, p0, Ll/osh0;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/osh0;->c:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p1}, Ll/osh0$a;->q(Ll/osh0$a;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iput v2, p0, Ll/osh0;->a:I

    .line 23
    .line 24
    invoke-static {p1}, Ll/osh0$a;->a(Ll/osh0$a;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iput-object v2, p0, Ll/osh0;->d:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1}, Ll/osh0$a;->n(Ll/osh0$a;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iput-object v2, p0, Ll/osh0;->e:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1}, Ll/osh0$a;->m(Ll/osh0$a;)Ljava/util/concurrent/ThreadPoolExecutor;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object v2, p0, Ll/osh0;->f:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 41
    .line 42
    invoke-static {p1}, Ll/osh0$a;->p(Ll/osh0$a;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iput-object v2, p0, Ll/osh0;->g:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1}, Ll/osh0$a;->o(Ll/osh0$a;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iput-object v2, p0, Ll/osh0;->h:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p1}, Ll/osh0$a;->t(Ll/osh0$a;)J

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    iput-wide v2, p0, Ll/osh0;->i:J

    .line 59
    .line 60
    invoke-static {p1}, Ll/osh0$a;->e(Ll/osh0$a;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    iput-boolean v2, p0, Ll/osh0;->l:Z

    .line 65
    .line 66
    new-instance v2, Ll/vyv;

    .line 67
    .line 68
    invoke-direct {v2}, Ll/vyv;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-static {p1}, Ll/osh0$a;->d(Ll/osh0$a;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    new-instance v0, Ll/j0j0;

    .line 82
    .line 83
    invoke-direct {v0}, Ll/j0j0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    new-instance v0, Ll/txi0;

    .line 90
    .line 91
    invoke-direct {v0}, Ll/txi0;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    invoke-static {p1}, Ll/osh0$a;->b(Ll/osh0$a;)Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 102
    .line 103
    .line 104
    invoke-static {p1}, Ll/osh0$a;->r(Ll/osh0$a;)J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    iput-wide v0, p0, Ll/osh0;->j:J

    .line 109
    .line 110
    invoke-static {p1}, Ll/osh0$a;->l(Ll/osh0$a;)Ll/zwl;

    .line 111
    .line 112
    .line 113
    invoke-static {p1}, Ll/osh0$a;->c(Ll/osh0$a;)Ll/x4m;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Ll/osh0;->k:Ll/x4m;

    .line 118
    .line 119
    invoke-static {p1}, Ll/osh0$a;->u(Ll/osh0$a;)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p0, Ll/osh0;->m:I

    .line 124
    .line 125
    invoke-static {p1}, Ll/osh0$a;->s(Ll/osh0$a;)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iput v0, p0, Ll/osh0;->n:I

    .line 130
    .line 131
    invoke-static {p1}, Ll/osh0$a;->i(Ll/osh0$a;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    iput-boolean v0, p0, Ll/osh0;->o:Z

    .line 136
    .line 137
    invoke-static {p1}, Ll/osh0$a;->g(Ll/osh0$a;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iput-boolean v0, p0, Ll/osh0;->p:Z

    .line 142
    .line 143
    invoke-static {p1}, Ll/osh0$a;->k(Ll/osh0$a;)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    iput v0, p0, Ll/osh0;->r:I

    .line 148
    .line 149
    invoke-static {p1}, Ll/osh0$a;->h(Ll/osh0$a;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iput-boolean v0, p0, Ll/osh0;->q:Z

    .line 154
    .line 155
    invoke-static {p1}, Ll/osh0$a;->f(Ll/osh0$a;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput-boolean v0, p0, Ll/osh0;->s:Z

    .line 160
    .line 161
    invoke-static {p1}, Ll/osh0$a;->j(Ll/osh0$a;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    iput-boolean p1, p0, Ll/osh0;->t:Z

    .line 166
    .line 167
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/z0j0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/osh0;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/x4m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0;->k:Ll/x4m;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/a1j0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/osh0;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/osh0;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Ll/zwl;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public k()Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0;->f:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0;->o:Z

    .line 2
    .line 3
    return p0
.end method
