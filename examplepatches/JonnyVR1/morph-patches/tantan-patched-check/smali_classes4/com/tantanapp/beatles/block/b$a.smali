.class public Lcom/tantanapp/beatles/block/b$a;
.super Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/block/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic f:Lcom/tantanapp/beatles/block/b;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;-><init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r:Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 14
    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-wide v3, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 21
    .line 22
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, ""

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 41
    .line 42
    iget-wide v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 43
    .line 44
    iget-wide v3, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 45
    .line 46
    cmp-long v0, v1, v3

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    :cond_0
    new-instance v1, Ll/g43;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->f()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->g()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    sget-object v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->LOW:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    iget-object v0, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/e43;->m()I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->h()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-direct/range {v1 .. v6}, Ll/g43;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e()[Ljava/lang/StackTraceElement;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->i([Ljava/lang/StackTraceElement;Ll/g43;)Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v1, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->f:Ll/yni0;

    .line 92
    .line 93
    new-instance v2, Lcom/tantanapp/beatles/block/b$a$a;

    .line 94
    .line 95
    invoke-direct {v2, p0, v0}, Lcom/tantanapp/beatles/block/b$a$a;-><init>(Lcom/tantanapp/beatles/block/b$a;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v2}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/b$a;->m()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public l(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->k(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/e43;->l()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    int-to-long v0, p1

    .line 23
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->g(J)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c:Ljava/util/LinkedList;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public n()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/b$a;->f:Lcom/tantanapp/beatles/block/b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->k(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/LinkedList;->peekFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-wide v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 20
    .line 21
    iget-wide v3, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 22
    .line 23
    cmp-long v1, v1, v3

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/b$a;->m()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method
