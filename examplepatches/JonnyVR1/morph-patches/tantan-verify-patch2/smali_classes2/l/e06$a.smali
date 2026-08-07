.class public Ll/e06$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e06;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Ll/e06;


# direct methods
.method public constructor <init>(Ll/e06;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e06$a;->a:Ll/e06;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/e06;Ll/f06;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/e06$a;-><init>(Ll/e06;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const-string v0, "%s: worker finished; %d workers left"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/e06$a;->a:Ll/e06;

    .line 4
    .line 5
    invoke-static {v1}, Ll/e06;->e(Ll/e06;)Ljava/util/concurrent/BlockingQueue;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/Runnable;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-static {}, Ll/e06;->k()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "%s: Worker has nothing to run"

    .line 28
    .line 29
    iget-object v3, p0, Ll/e06$a;->a:Ll/e06;

    .line 30
    .line 31
    invoke-static {v3}, Ll/e06;->b(Ll/e06;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v1, v2, v3}, Ll/huf;->o(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object v1, p0, Ll/e06$a;->a:Ll/e06;

    .line 39
    .line 40
    invoke-static {v1}, Ll/e06;->d(Ll/e06;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v2, p0, Ll/e06$a;->a:Ll/e06;

    .line 49
    .line 50
    invoke-static {v2}, Ll/e06;->e(Ll/e06;)Ljava/util/concurrent/BlockingQueue;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_1

    .line 59
    .line 60
    iget-object p0, p0, Ll/e06$a;->a:Ll/e06;

    .line 61
    .line 62
    invoke-static {p0}, Ll/e06;->g(Ll/e06;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-static {}, Ll/e06;->k()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget-object p0, p0, Ll/e06$a;->a:Ll/e06;

    .line 71
    .line 72
    invoke-static {p0}, Ll/e06;->b(Ll/e06;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {v2, v0, p0, v1}, Ll/huf;->p(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :goto_1
    iget-object v2, p0, Ll/e06$a;->a:Ll/e06;

    .line 85
    .line 86
    invoke-static {v2}, Ll/e06;->d(Ll/e06;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    iget-object v3, p0, Ll/e06$a;->a:Ll/e06;

    .line 95
    .line 96
    invoke-static {v3}, Ll/e06;->e(Ll/e06;)Ljava/util/concurrent/BlockingQueue;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-nez v3, :cond_2

    .line 105
    .line 106
    iget-object p0, p0, Ll/e06$a;->a:Ll/e06;

    .line 107
    .line 108
    invoke-static {p0}, Ll/e06;->g(Ll/e06;)V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_2
    invoke-static {}, Ll/e06;->k()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    iget-object p0, p0, Ll/e06$a;->a:Ll/e06;

    .line 117
    .line 118
    invoke-static {p0}, Ll/e06;->b(Ll/e06;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-static {v3, v0, p0, v2}, Ll/huf;->p(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :goto_2
    throw v1
.end method
