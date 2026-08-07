.class public Ll/mre$b;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mre;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field protected final a:I

.field public b:Z

.field final synthetic c:Ll/mre;


# direct methods
.method public constructor <init>(Ll/mre;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mre$b;->c:Ll/mre;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x64

    .line 7
    .line 8
    iput p1, p0, Ll/mre$b;->a:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/mre$b;->b:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/mre$b;->b:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public run()V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x11
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mre$b;->c:Ll/mre;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mre;->a(Ll/mre;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/mre$b;->c:Ll/mre;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v1, v2}, Ll/mre;->b(Ll/mre;Z)Z

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/mre$b;->c:Ll/mre;

    .line 15
    .line 16
    invoke-static {v1}, Ll/mre;->a(Ll/mre;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 21
    .line 22
    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 24
    :cond_0
    iget-object v0, p0, Ll/mre$b;->c:Ll/mre;

    .line 25
    .line 26
    iget-object v1, v0, Ll/mre;->h:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_1
    iget-object v0, p0, Ll/mre$b;->c:Ll/mre;

    .line 30
    .line 31
    iget-object v0, v0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    :try_start_2
    iget-object v0, p0, Ll/mre$b;->c:Ll/mre;

    .line 40
    .line 41
    iget-object v0, v0, Ll/mre;->h:Ljava/lang/Object;

    .line 42
    .line 43
    const-wide/16 v2, 0x64

    .line 44
    .line 45
    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_4

    .line 51
    :catch_0
    move-exception v0

    .line 52
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/mre$b;->c:Ll/mre;

    .line 56
    .line 57
    iget-object v0, v0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    monitor-exit v1

    .line 66
    goto :goto_3

    .line 67
    :cond_2
    iget-object v0, p0, Ll/mre$b;->c:Ll/mre;

    .line 68
    .line 69
    iget-object v2, v0, Ll/mre;->e:Ljava/lang/Object;

    .line 70
    .line 71
    if-eqz v2, :cond_4

    .line 72
    .line 73
    iget-object v2, v0, Ll/mre;->c:Ll/vje;

    .line 74
    .line 75
    if-nez v2, :cond_3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 79
    .line 80
    iput-object v2, v0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    :goto_1
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 84
    .line 85
    iput-object v2, v0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 86
    .line 87
    :goto_2
    invoke-virtual {v0}, Ll/mre;->j()V

    .line 88
    .line 89
    .line 90
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    :goto_3
    iget-boolean v0, p0, Ll/mre$b;->b:Z

    .line 92
    .line 93
    if-nez v0, :cond_5

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_0

    .line 100
    .line 101
    :cond_5
    iget-object v0, p0, Ll/mre$b;->c:Ll/mre;

    .line 102
    .line 103
    invoke-static {v0}, Ll/mre;->c(Ll/mre;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/mre$b;->c:Ll/mre;

    .line 107
    .line 108
    invoke-static {p0}, Ll/mre;->d(Ll/mre;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :goto_4
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 113
    throw p0

    .line 114
    :catchall_1
    move-exception p0

    .line 115
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 116
    throw p0
.end method
