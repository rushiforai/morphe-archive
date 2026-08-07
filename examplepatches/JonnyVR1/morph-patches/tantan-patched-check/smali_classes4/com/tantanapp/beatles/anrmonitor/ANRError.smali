.class Lcom/tantanapp/beatles/anrmonitor/ANRError;
.super Ljava/lang/Error;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;
    }
.end annotation


# instance fields
.field public final mDuration:J


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Application Not Responding for at least "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " ms."

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p0, v0, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    iput-wide p2, p0, Lcom/tantanapp/beatles/anrmonitor/ANRError;->mDuration:J

    .line 24
    .line 25
    return-void
.end method

.method public static New(JLjava/lang/String;Z)Lcom/tantanapp/beatles/anrmonitor/ANRError;
    .locals 5

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/TreeMap;

    .line 10
    .line 11
    new-instance v2, Lcom/tantanapp/beatles/anrmonitor/ANRError$a;

    .line 12
    .line 13
    invoke-direct {v2, v0}, Lcom/tantanapp/beatles/anrmonitor/ANRError$a;-><init>(Ljava/lang/Thread;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/util/Map$Entry;

    .line 42
    .line 43
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    if-eq v4, v0, :cond_1

    .line 48
    .line 49
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Ljava/lang/Thread;

    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v4, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_0

    .line 64
    .line 65
    if-nez p3, :cond_1

    .line 66
    .line 67
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, [Ljava/lang/StackTraceElement;

    .line 72
    .line 73
    array-length v4, v4

    .line 74
    if-lez v4, :cond_0

    .line 75
    .line 76
    :cond_1
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    check-cast v4, Ljava/lang/Thread;

    .line 81
    .line 82
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, [Ljava/lang/StackTraceElement;

    .line 87
    .line 88
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-nez p2, :cond_3

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    :cond_3
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    const/4 p3, 0x0

    .line 114
    move-object v0, p3

    .line 115
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, Ljava/util/Map$Entry;

    .line 126
    .line 127
    new-instance v2, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;

    .line 128
    .line 129
    new-instance v3, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;

    .line 130
    .line 131
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    check-cast v4, Ljava/lang/Thread;

    .line 136
    .line 137
    invoke-static {v4}, Lcom/tantanapp/beatles/anrmonitor/ANRError;->getThreadTitle(Ljava/lang/Thread;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    check-cast v1, [Ljava/lang/StackTraceElement;

    .line 146
    .line 147
    invoke-direct {v3, v4, v1, p3}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;-><init>(Ljava/lang/String;[Ljava/lang/StackTraceElement;Lcom/tantanapp/beatles/anrmonitor/ANRError$a;)V

    .line 148
    .line 149
    .line 150
    invoke-direct {v2, v3, v0, p3}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;-><init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;Lcom/tantanapp/beatles/anrmonitor/ANRError$a;)V

    .line 151
    .line 152
    .line 153
    move-object v0, v2

    .line 154
    goto :goto_1

    .line 155
    :cond_4
    new-instance p2, Lcom/tantanapp/beatles/anrmonitor/ANRError;

    .line 156
    .line 157
    invoke-direct {p2, v0, p0, p1}, Lcom/tantanapp/beatles/anrmonitor/ANRError;-><init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;J)V

    .line 158
    .line 159
    .line 160
    return-object p2
.end method

.method public static NewMainOnly(J)Lcom/tantanapp/beatles/anrmonitor/ANRError;
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Lcom/tantanapp/beatles/anrmonitor/ANRError;

    .line 14
    .line 15
    new-instance v3, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;

    .line 16
    .line 17
    new-instance v4, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/beatles/anrmonitor/ANRError;->getThreadTitle(Ljava/lang/Thread;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-direct {v4, v0, v1, v5}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;-><init>(Ljava/lang/String;[Ljava/lang/StackTraceElement;Lcom/tantanapp/beatles/anrmonitor/ANRError$a;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {v3, v4, v5, v5}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;-><init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;Lcom/tantanapp/beatles/anrmonitor/ANRError$a;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {v2, v3, p0, p1}, Lcom/tantanapp/beatles/anrmonitor/ANRError;-><init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;J)V

    .line 31
    .line 32
    .line 33
    return-object v2
.end method

.method private static getThreadTitle(Ljava/lang/Thread;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " (state = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, ")"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method


# virtual methods
.method public fillInStackTrace()Ljava/lang/Throwable;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/StackTraceElement;

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method
