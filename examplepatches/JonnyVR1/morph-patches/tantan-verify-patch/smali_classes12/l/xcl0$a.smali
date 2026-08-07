.class public Ll/xcl0$a;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xcl0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field protected a:Z

.field private b:Ljava/lang/Object;

.field final synthetic c:Ll/xcl0;


# direct methods
.method public constructor <init>(Ll/xcl0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/xcl0$a;->a:Z

    .line 8
    .line 9
    new-instance p1, Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/xcl0$a;->b:Ljava/lang/Object;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/xcl0$a;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    :cond_0
    iget-object v0, p0, Ll/xcl0$a;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/xcl0$a;->b:Ljava/lang/Object;

    .line 5
    .line 6
    const-wide/16 v2, 0x5

    .line 7
    .line 8
    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :catch_0
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    iget-object v0, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/xcl0;->a(Ll/xcl0;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/xcl0;->c(Ll/xcl0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    monitor-enter v0

    .line 31
    :try_start_2
    iget-object v1, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 32
    .line 33
    invoke-static {v1}, Ll/xcl0;->d(Ll/xcl0;)Ljava/util/LinkedList;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 38
    .line 39
    .line 40
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 41
    iget-object v0, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-static {v0, v1}, Ll/xcl0;->b(Ll/xcl0;Z)Z

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catchall_1
    move-exception p0

    .line 49
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 50
    throw p0

    .line 51
    :cond_1
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    iget-object v2, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 56
    .line 57
    invoke-static {v2}, Ll/xcl0;->e(Ll/xcl0;)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    const/4 v3, 0x1

    .line 62
    if-ne v2, v3, :cond_2

    .line 63
    .line 64
    iget-object v2, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 65
    .line 66
    invoke-static {v2}, Ll/xcl0;->f(Ll/xcl0;)J

    .line 67
    .line 68
    .line 69
    move-result-wide v2

    .line 70
    const-wide/16 v4, 0x0

    .line 71
    .line 72
    cmp-long v2, v2, v4

    .line 73
    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    iget-object v2, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 77
    .line 78
    invoke-static {v2}, Ll/xcl0;->f(Ll/xcl0;)J

    .line 79
    .line 80
    .line 81
    move-result-wide v2

    .line 82
    sub-long v2, v0, v2

    .line 83
    .line 84
    const-wide/16 v4, 0x7d0

    .line 85
    .line 86
    cmp-long v2, v2, v4

    .line 87
    .line 88
    if-lez v2, :cond_2

    .line 89
    .line 90
    const-string v2, "EditProcess"

    .line 91
    .line 92
    const-string v3, "VideoControllerPlayer Force Reset"

    .line 93
    .line 94
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 98
    .line 99
    invoke-static {v2}, Ll/xcl0;->h(Ll/xcl0;)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 103
    .line 104
    invoke-static {v2, v0, v1}, Ll/xcl0;->g(Ll/xcl0;J)J

    .line 105
    .line 106
    .line 107
    :cond_2
    iget-object v0, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 108
    .line 109
    invoke-static {v0}, Ll/xcl0;->i(Ll/xcl0;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    const/4 v1, -0x1

    .line 114
    if-eq v0, v1, :cond_3

    .line 115
    .line 116
    iget-object v0, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 117
    .line 118
    invoke-static {v0}, Ll/xcl0;->j(Ll/xcl0;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iget-object v1, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 123
    .line 124
    invoke-static {v1}, Ll/xcl0;->i(Ll/xcl0;)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-lt v0, v1, :cond_3

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_3
    iget-object v0, p0, Ll/xcl0$a;->c:Ll/xcl0;

    .line 132
    .line 133
    invoke-static {v0}, Ll/xcl0;->k(Ll/xcl0;)V

    .line 134
    .line 135
    .line 136
    :goto_2
    iget-boolean v0, p0, Ll/xcl0$a;->a:Z

    .line 137
    .line 138
    if-eqz v0, :cond_0

    .line 139
    .line 140
    const-string p0, "EditProcess"

    .line 141
    .line 142
    const-string v0, "VideoControllerPlayer ---render---"

    .line 143
    .line 144
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :goto_3
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 149
    throw p0
.end method
