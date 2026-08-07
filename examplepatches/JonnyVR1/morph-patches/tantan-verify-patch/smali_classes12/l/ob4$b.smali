.class Ll/ob4$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rpr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ob4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$b;->a:Ll/ob4;

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
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ob4;->z0(Ll/ob4;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-object p0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 13
    .line 14
    invoke-static {p0}, Ll/ob4;->t(Ll/ob4;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    sub-long/2addr v1, v3

    .line 19
    invoke-static {v0, v1, v2}, Ll/ob4;->A0(Ll/ob4;J)J

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public b()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v0, v1, v2}, Ll/ob4;->u(Ll/ob4;J)J

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 11
    .line 12
    iget-object v0, v0, Ll/ob4;->H:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    iget-object v1, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 16
    .line 17
    iget-object v1, v1, Ll/ob4;->j0:Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-lez v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 26
    .line 27
    iget-object v1, v1, Ll/ob4;->j0:Ljava/util/LinkedList;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/immomo/components/interfaces/IProcessOutput;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    const/4 v1, 0x0

    .line 39
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    iget-object v0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-interface {v1}, Lcom/immomo/components/interfaces/IProcessOutput;->c()J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    invoke-static {v0, v2, v3}, Ll/ob4;->x0(Ll/ob4;J)J

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 52
    .line 53
    invoke-static {v0}, Ll/ob4;->t(Ll/ob4;)J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    iget-object p0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 58
    .line 59
    invoke-static {p0}, Ll/ob4;->w(Ll/ob4;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    sub-long/2addr v2, v4

    .line 64
    invoke-static {v0, v2, v3}, Ll/ob4;->y0(Ll/ob4;J)J

    .line 65
    .line 66
    .line 67
    return-object v1

    .line 68
    :cond_1
    const-wide/16 v2, 0x0

    .line 69
    .line 70
    invoke-static {v0, v2, v3}, Ll/ob4;->x0(Ll/ob4;J)J

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/ob4$b;->a:Ll/ob4;

    .line 74
    .line 75
    invoke-static {p0, v2, v3}, Ll/ob4;->y0(Ll/ob4;J)J

    .line 76
    .line 77
    .line 78
    return-object v1

    .line 79
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p0
.end method
