.class Ll/j410$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j410;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/j410;


# direct methods
.method public constructor <init>(Ll/j410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j410$a;->a:Ll/j410;

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
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :cond_0
    :goto_0
    iget-object v2, p0, Ll/j410$a;->a:Ll/j410;

    .line 4
    .line 5
    invoke-static {v2}, Ll/j410;->b(Ll/j410;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_3

    .line 10
    .line 11
    if-nez v1, :cond_3

    .line 12
    .line 13
    :try_start_0
    iget-object v1, p0, Ll/j410$a;->a:Ll/j410;

    .line 14
    .line 15
    invoke-static {v1}, Ll/j410;->c(Ll/j410;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    :try_start_1
    iget-object v2, p0, Ll/j410$a;->a:Ll/j410;

    .line 21
    .line 22
    invoke-static {v2}, Ll/j410;->c(Ll/j410;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p0, Ll/j410$a;->a:Ll/j410;

    .line 27
    .line 28
    iget v3, v3, Ll/j410;->h:I

    .line 29
    .line 30
    int-to-long v3, v3

    .line 31
    invoke-virtual {v2, v3, v4}, Ljava/lang/Object;->wait(J)V

    .line 32
    .line 33
    .line 34
    monitor-exit v1

    .line 35
    goto :goto_1

    .line 36
    :catchall_0
    move-exception v2

    .line 37
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 39
    :catch_0
    move-exception v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    :goto_1
    iget-object v1, p0, Ll/j410$a;->a:Ll/j410;

    .line 44
    .line 45
    iget-object v2, v1, Ll/j410;->j:Ljava/util/ArrayList;

    .line 46
    .line 47
    iget-object v3, v1, Ll/j410;->r:Ll/wyl;

    .line 48
    .line 49
    invoke-virtual {v1, v3}, Ll/j410;->o(Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/j410$a;->a:Ll/j410;

    .line 57
    .line 58
    invoke-static {v1}, Ll/j410;->d(Ll/j410;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/j410$a;->a:Ll/j410;

    .line 62
    .line 63
    iget-object v2, v1, Ll/j410;->r:Ll/wyl;

    .line 64
    .line 65
    const/16 v3, 0x64

    .line 66
    .line 67
    invoke-virtual {v1, v2, v3}, Ll/j410;->g(Ljava/lang/Object;I)J

    .line 68
    .line 69
    .line 70
    move-result-wide v1

    .line 71
    const-wide/16 v3, 0x0

    .line 72
    .line 73
    cmp-long v1, v1, v3

    .line 74
    .line 75
    const/4 v2, 0x1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    move v1, v2

    .line 79
    goto :goto_2

    .line 80
    :cond_1
    move v1, v0

    .line 81
    :goto_2
    iget-object v3, p0, Ll/j410$a;->a:Ll/j410;

    .line 82
    .line 83
    iget-object v3, v3, Ll/j410;->r:Ll/wyl;

    .line 84
    .line 85
    if-eqz v3, :cond_0

    .line 86
    .line 87
    if-nez v1, :cond_0

    .line 88
    .line 89
    const/16 v1, 0x1021

    .line 90
    .line 91
    const/4 v4, 0x0

    .line 92
    invoke-interface {v3, v1, v0, v4}, Ll/wyl;->j1(IILjava/lang/Object;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v3

    .line 96
    const-wide/16 v5, 0x1

    .line 97
    .line 98
    cmp-long v1, v3, v5

    .line 99
    .line 100
    if-nez v1, :cond_2

    .line 101
    .line 102
    move v1, v2

    .line 103
    goto :goto_3

    .line 104
    :cond_2
    move v1, v0

    .line 105
    :goto_3
    if-eqz v1, :cond_0

    .line 106
    .line 107
    const-string v2, ""

    .line 108
    .line 109
    new-instance v3, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v4, "exit wathc base . needStopOrMeetErrcode14 "

    .line 112
    .line 113
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-static {v2, v3}, Ll/t9c;->f(Ljava/lang/String;Ljava/lang/Object;)I

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    return-void
.end method
