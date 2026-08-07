.class public Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/aspectj/runtime/internal/cflowstack/ThreadStack;


# static fields
.field private static final COLLECT_AT:I = 0x4e20

.field private static final MIN_COLLECT_AT:I = 0x64


# instance fields
.field private cached_stack:Ljava/util/Stack;

.field private cached_thread:Ljava/lang/Thread;

.field private change_count:I

.field private stacks:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Hashtable;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->stacks:Ljava/util/Hashtable;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->change_count:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public declared-synchronized getThreadStack()Ljava/util/Stack;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->cached_thread:Ljava/lang/Thread;

    .line 7
    .line 8
    if-eq v0, v1, :cond_4

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->cached_thread:Ljava/lang/Thread;

    .line 15
    .line 16
    iget-object v1, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->stacks:Ljava/util/Hashtable;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/util/Stack;

    .line 23
    .line 24
    iput-object v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->cached_stack:Ljava/util/Stack;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    new-instance v0, Ljava/util/Stack;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->cached_stack:Ljava/util/Stack;

    .line 34
    .line 35
    iget-object v1, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->stacks:Ljava/util/Hashtable;

    .line 36
    .line 37
    iget-object v2, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->cached_thread:Ljava/lang/Thread;

    .line 38
    .line 39
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    goto :goto_3

    .line 45
    :cond_0
    :goto_0
    iget v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->change_count:I

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    add-int/2addr v0, v1

    .line 49
    iput v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->change_count:I

    .line 50
    .line 51
    iget-object v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->stacks:Ljava/util/Hashtable;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iget v1, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->change_count:I

    .line 62
    .line 63
    const/16 v2, 0x4e20

    .line 64
    .line 65
    div-int/2addr v2, v0

    .line 66
    const/16 v0, 0x64

    .line 67
    .line 68
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-le v1, v0, :cond_4

    .line 73
    .line 74
    new-instance v0, Ljava/util/Stack;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->stacks:Ljava/util/Hashtable;

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_2

    .line 90
    .line 91
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Ljava/lang/Thread;

    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/Thread;->isAlive()Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-nez v3, :cond_1

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    :goto_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_3

    .line 116
    .line 117
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    check-cast v1, Ljava/lang/Thread;

    .line 122
    .line 123
    iget-object v2, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->stacks:Ljava/util/Hashtable;

    .line 124
    .line 125
    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_3
    const/4 v0, 0x0

    .line 130
    iput v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->change_count:I

    .line 131
    .line 132
    :cond_4
    iget-object v0, p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;->cached_stack:Ljava/util/Stack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    .line 134
    monitor-exit p0

    .line 135
    return-object v0

    .line 136
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 137
    throw v0
.end method

.method public removeThreadStack()V
    .locals 0

    return-void
.end method
