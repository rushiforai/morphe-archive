.class public Ll/b4e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b4e$b;
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public final d:J

.field public final e:J

.field public final f:J

.field public final g:Ll/v2f;

.field public final h:Lcom/facebook/cache/common/CacheErrorLogger;

.field public final i:Lcom/facebook/cache/common/CacheEventListener;

.field public final j:Ll/e5e;

.field public final k:Landroid/content/Context;

.field public final l:Z


# direct methods
.method public constructor <init>(Ll/b4e$b;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/b4e$b;->e(Ll/b4e$b;)Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/b4e;->k:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {p1}, Ll/b4e$b;->b(Ll/b4e$b;)Ll/a7h0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 22
    :goto_1
    const-string v2, "Either a non-null context or a base directory path or supplier must be provided."

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/wn80;->j(ZLjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/b4e$b;->b(Ll/b4e$b;)Ll/a7h0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    new-instance v0, Ll/b4e$a;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/b4e$a;-><init>(Ll/b4e;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/b4e$b;->m(Ll/b4e$b;Ll/a7h0;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    invoke-static {p1}, Ll/b4e$b;->l(Ll/b4e$b;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Ll/b4e;->a:I

    .line 48
    .line 49
    invoke-static {p1}, Ll/b4e$b;->a(Ll/b4e$b;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ljava/lang/String;

    .line 58
    .line 59
    iput-object v0, p0, Ll/b4e;->b:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1}, Ll/b4e$b;->b(Ll/b4e$b;)Ll/a7h0;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ll/a7h0;

    .line 70
    .line 71
    iput-object v0, p0, Ll/b4e;->c:Ll/a7h0;

    .line 72
    .line 73
    invoke-static {p1}, Ll/b4e$b;->i(Ll/b4e$b;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v0

    .line 77
    iput-wide v0, p0, Ll/b4e;->d:J

    .line 78
    .line 79
    invoke-static {p1}, Ll/b4e$b;->j(Ll/b4e$b;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iput-wide v0, p0, Ll/b4e;->e:J

    .line 84
    .line 85
    invoke-static {p1}, Ll/b4e$b;->k(Ll/b4e$b;)J

    .line 86
    .line 87
    .line 88
    move-result-wide v0

    .line 89
    iput-wide v0, p0, Ll/b4e;->f:J

    .line 90
    .line 91
    invoke-static {p1}, Ll/b4e$b;->g(Ll/b4e$b;)Ll/v2f;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ll/v2f;

    .line 100
    .line 101
    iput-object v0, p0, Ll/b4e;->g:Ll/v2f;

    .line 102
    .line 103
    invoke-static {p1}, Ll/b4e$b;->c(Ll/b4e$b;)Lcom/facebook/cache/common/CacheErrorLogger;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    if-nez v0, :cond_3

    .line 108
    .line 109
    invoke-static {}, Lcom/facebook/cache/common/b;->b()Lcom/facebook/cache/common/b;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    goto :goto_2

    .line 114
    :cond_3
    invoke-static {p1}, Ll/b4e$b;->c(Ll/b4e$b;)Lcom/facebook/cache/common/CacheErrorLogger;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :goto_2
    iput-object v0, p0, Ll/b4e;->h:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 119
    .line 120
    invoke-static {p1}, Ll/b4e$b;->d(Ll/b4e$b;)Lcom/facebook/cache/common/CacheEventListener;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-nez v0, :cond_4

    .line 125
    .line 126
    invoke-static {}, Ll/ys40;->h()Ll/ys40;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    goto :goto_3

    .line 131
    :cond_4
    invoke-static {p1}, Ll/b4e$b;->d(Ll/b4e$b;)Lcom/facebook/cache/common/CacheEventListener;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    :goto_3
    iput-object v0, p0, Ll/b4e;->i:Lcom/facebook/cache/common/CacheEventListener;

    .line 136
    .line 137
    invoke-static {p1}, Ll/b4e$b;->f(Ll/b4e$b;)Ll/e5e;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    if-nez v0, :cond_5

    .line 142
    .line 143
    invoke-static {}, Ll/dt40;->b()Ll/dt40;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    goto :goto_4

    .line 148
    :cond_5
    invoke-static {p1}, Ll/b4e$b;->f(Ll/b4e$b;)Ll/e5e;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    :goto_4
    iput-object v0, p0, Ll/b4e;->j:Ll/e5e;

    .line 153
    .line 154
    invoke-static {p1}, Ll/b4e$b;->h(Ll/b4e$b;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    iput-boolean p1, p0, Ll/b4e;->l:Z

    .line 159
    .line 160
    return-void
.end method

.method public static bridge synthetic a(Ll/b4e;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e;->k:Landroid/content/Context;

    return-object p0
.end method

.method public static m(Landroid/content/Context;)Ll/b4e$b;
    .locals 2

    .line 1
    new-instance v0, Ll/b4e$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/b4e$b;-><init>(Landroid/content/Context;Ll/c4e;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/a7h0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a7h0<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b4e;->c:Ll/a7h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/facebook/cache/common/CacheErrorLogger;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e;->h:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/facebook/cache/common/CacheEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e;->i:Lcom/facebook/cache/common/CacheEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b4e;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public g()Ll/e5e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e;->j:Ll/e5e;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/v2f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b4e;->g:Ll/v2f;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/b4e;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b4e;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public k()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b4e;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Ll/b4e;->a:I

    .line 2
    .line 3
    return p0
.end method
