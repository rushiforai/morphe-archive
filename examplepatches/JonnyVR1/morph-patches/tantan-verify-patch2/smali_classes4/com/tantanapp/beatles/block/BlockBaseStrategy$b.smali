.class public abstract Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/block/BlockBaseStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/text/SimpleDateFormat;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation
.end field

.field public b:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    const-string v0, "yyyy-MM-dd HH:mm:ss:SSSZ"

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->a:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    new-instance p1, Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 21
    .line 22
    new-instance p1, Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c:Ljava/util/LinkedList;

    .line 28
    .line 29
    new-instance p1, Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->d:Ljava/util/LinkedList;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->q:Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-wide v4, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 29
    .line 30
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v4, ""

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v2, v3}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_0

    .line 47
    .line 48
    iget-object v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 49
    .line 50
    iget-wide v2, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 51
    .line 52
    iget-wide v4, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 53
    .line 54
    cmp-long v1, v2, v4

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->j()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    new-instance v1, Ll/g43;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->f()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->g()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    sget-object v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->LOW:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/e43;->m()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->h()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    invoke-direct/range {v1 .. v6}, Ll/g43;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/c;->getEventType()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v1, v0}, Ll/eoi0;->a(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e()[Ljava/lang/StackTraceElement;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->i([Ljava/lang/StackTraceElement;Ll/g43;)Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 119
    .line 120
    iget-object v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->f:Ll/yni0;

    .line 121
    .line 122
    new-instance v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$a;

    .line 123
    .line 124
    invoke-direct {v2, p0, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$a;-><init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, v2}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/c;->n()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_2

    .line 144
    .line 145
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->v()V

    .line 148
    .line 149
    .line 150
    :cond_2
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->d:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->d:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r:Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-wide v3, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 27
    .line 28
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, ""

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 47
    .line 48
    iget-wide v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 49
    .line 50
    iget-wide v3, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 51
    .line 52
    cmp-long v1, v1, v3

    .line 53
    .line 54
    if-nez v1, :cond_0

    .line 55
    .line 56
    :cond_1
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->f:Ll/yni0;

    .line 59
    .line 60
    new-instance v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;

    .line 61
    .line 62
    invoke-direct {v2, p0, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;-><init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/c;->n()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->v()V

    .line 82
    .line 83
    .line 84
    :cond_3
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c:Ljava/util/LinkedList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(J)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->a:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    new-instance v0, Ljava/util/Date;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public e()[Ljava/lang/StackTraceElement;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 21
    .line 22
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c:Ljava/lang/String;

    .line 23
    .line 24
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    :goto_0
    if-ltz v0, :cond_1

    .line 20
    .line 21
    iget-object v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 28
    .line 29
    const-string v3, "startTime:"

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-wide v3, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 35
    .line 36
    invoke-virtual {p0, v3, v4}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->d(J)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v3, ",endTime:"

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-wide v3, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 49
    .line 50
    invoke-virtual {p0, v3, v4}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->d(J)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v3, "\n"

    .line 58
    .line 59
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v2, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 63
    .line 64
    invoke-static {v2}, Ll/e1g0;->a([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, "\n\n"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    add-int/lit8 v0, v0, -0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "UNKNOWN"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->f:Ljava/lang/String;

    .line 23
    .line 24
    return-object p0
.end method

.method public i([Ljava/lang/StackTraceElement;Ll/g43;)Lcom/tantanapp/beatles/v2/data/MonitorEvent;
    .locals 6

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/block/BlockException;

    .line 2
    .line 3
    const-string v1, "block may happend"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/tantanapp/beatles/block/BlockException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tantanapp/beatles/block/c;->getEventType()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/c;->a()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {p1, v1, p0, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setCrashThread(Ljava/lang/Thread;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Ll/g43;->c()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    const-string v0, "meminfo"

    .line 54
    .line 55
    invoke-virtual {p1, v0, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-virtual {p2}, Ll/g43;->d()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_1

    .line 67
    .line 68
    const-string p0, "stacktrace"

    .line 69
    .line 70
    invoke-virtual {p2}, Ll/g43;->d()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, p0, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    const-string p0, "blockType"

    .line 78
    .line 79
    invoke-virtual {p2}, Ll/g43;->e()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, p0, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setTag(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const-string p0, "blockLevel"

    .line 87
    .line 88
    invoke-virtual {p2}, Ll/g43;->b()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p1, p0, p2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setTag(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ljava/lang/Runtime;->maxMemory()J

    .line 100
    .line 101
    .line 102
    move-result-wide v0

    .line 103
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Ljava/lang/Runtime;->totalMemory()J

    .line 108
    .line 109
    .line 110
    move-result-wide v2

    .line 111
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Ljava/lang/Runtime;->freeMemory()J

    .line 116
    .line 117
    .line 118
    move-result-wide v4

    .line 119
    sub-long/2addr v2, v4

    .line 120
    const/high16 p0, 0x42c80000    # 100.0f

    .line 121
    .line 122
    long-to-float p2, v2

    .line 123
    mul-float/2addr p2, p0

    .line 124
    long-to-float p0, v0

    .line 125
    div-float/2addr p2, p0

    .line 126
    const/high16 p0, 0x42be0000    # 95.0f

    .line 127
    .line 128
    cmpl-float p0, p2, p0

    .line 129
    .line 130
    const-string p2, "isHighMemory"

    .line 131
    .line 132
    if-ltz p0, :cond_2

    .line 133
    .line 134
    const-string p0, "true"

    .line 135
    .line 136
    invoke-virtual {p1, p2, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setTag(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-object p1

    .line 140
    :cond_2
    const-string p0, "false"

    .line 141
    .line 142
    invoke-virtual {p1, p2, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setTag(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-object p1
.end method

.method public j()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e43;->o()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-ne v0, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public k(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;-><init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;)V

    .line 23
    .line 24
    .line 25
    move-object p0, v0

    .line 26
    :goto_0
    iget-wide v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 31
    .line 32
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 33
    .line 34
    iget-object v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 37
    .line 38
    iget-object v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c([Ljava/lang/StackTraceElement;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->f:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method
