.class Lcom/tencent/iliveroom/a/a$23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->quitRoom()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, v0, Lcom/tencent/iliveroom/a/a;->l:Z

    .line 5
    .line 6
    iput-boolean v1, v0, Lcom/tencent/iliveroom/a/a;->g:Z

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->f(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->g(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->b(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->j(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Lcom/tencent/iliveroom/a/a$23$1;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/tencent/iliveroom/a/a$23$1;-><init>(Lcom/tencent/iliveroom/a/a$23;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/tencent/iliveroom/a/a/b;->a(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->m(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->j(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/b;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a/b;->c()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 74
    .line 75
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->n(Lcom/tencent/iliveroom/a/a;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->o(Lcom/tencent/iliveroom/a/a;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->h:Ljava/util/Set;

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/b/a;->b()V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 98
    .line 99
    const-wide/16 v1, 0x0

    .line 100
    .line 101
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;J)J

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 105
    .line 106
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;J)J

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 110
    .line 111
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;J)J

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 115
    .line 116
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a$b;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a$b;->b()V

    .line 121
    .line 122
    .line 123
    return-void
.end method
