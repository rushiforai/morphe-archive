.class public Ll/h6f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k5f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h6f$b;
    }
.end annotation


# instance fields
.field public final a:Ll/e610;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final b:Ll/i610;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h610;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/h610;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/e610;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ll/e610;-><init>(Ll/h610;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/h6f;->a:Ll/e610;

    .line 15
    .line 16
    new-instance v1, Ll/i610;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ll/i610;-><init>(Ll/h610;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/h6f;->b:Ll/i610;

    .line 22
    .line 23
    return-void
.end method

.method public synthetic constructor <init>(Ll/h6f$a;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ll/h6f;-><init>()V

    return-void
.end method

.method public static c()Ll/h6f;
    .locals 1

    .line 1
    invoke-static {}, Ll/h6f$b;->a()Ll/h6f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 4
    .param p1    # Lcom/tantanapp/beatles/v2/data/MonitorEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getThrowable()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/h6f;->a:Ll/e610;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getCrashThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getNewExceptionType()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v1, v0, v2, v3}, Ll/e610;->c(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExceptions(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/h6f;->d(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/Throwable;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/du2;->g()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Class;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public final d(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getThrowable()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move-object v2, v1

    .line 7
    :cond_0
    if-eqz v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/h6f;->b(Ljava/lang/Throwable;)Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-nez v3, :cond_2

    .line 14
    .line 15
    :cond_1
    move-object v2, v0

    .line 16
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isNeedOtherThread()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_7

    .line 27
    .line 28
    instance-of v0, v2, Ljava/lang/OutOfMemoryError;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_3
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getThreads()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-nez v0, :cond_7

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isNeedOtherThread()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_7

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getExceptions()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_6

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getExceptions()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_6

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getExceptions()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :cond_4
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_6

    .line 74
    .line 75
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Lcom/tantanapp/beatles/v2/data/MonitorException;

    .line 80
    .line 81
    invoke-virtual {v2}, Lcom/tantanapp/beatles/v2/data/MonitorException;->getThreadId()Ljava/lang/Long;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    if-nez v1, :cond_5

    .line 88
    .line 89
    new-instance v1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    :cond_5
    invoke-virtual {v2}, Lcom/tantanapp/beatles/v2/data/MonitorException;->getThreadId()Ljava/lang/Long;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    iget-object p0, p0, Ll/h6f;->b:Ll/i610;

    .line 103
    .line 104
    invoke-virtual {p0, v1}, Ll/i610;->a(Ljava/util/List;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setThreads(Ljava/util/List;)V

    .line 109
    .line 110
    .line 111
    :cond_7
    :goto_1
    return-void
.end method
