.class public Ll/uu2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/f6f;

.field public static b:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uu2;->b(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 2
    .line 3
    const-string v1, "exception"

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {v0, v1, p2, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setCrashThread(Ljava/lang/Thread;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ll/uu2;->a:Ll/f6f;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/c610;->j(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static c(Ll/f6f;)V
    .locals 0

    .line 1
    sput-object p0, Ll/uu2;->a:Ll/f6f;

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    sput-boolean p0, Ll/uu2;->b:Z

    .line 5
    .line 6
    return-void
.end method

.method public static d()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/uu2;->b:Z

    .line 2
    .line 3
    return v0
.end method

.method public static e(Ll/vrf;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/vrf;->a()Ljava/util/HashMap;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/util/Map$Entry;

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1, v2, v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/vrf;->c()Ljava/util/HashMap;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-lez v1, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ljava/util/Map$Entry;

    .line 79
    .line 80
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ljava/lang/String;

    .line 85
    .line 86
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Lorg/json/JSONObject;

    .line 91
    .line 92
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {p1, v2, v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    invoke-virtual {p0}, Ll/vrf;->b()Ljava/util/ArrayList;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    if-eqz p0, :cond_3

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-lez v0, :cond_3

    .line 111
    .line 112
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->addFiles(Ljava/util/ArrayList;)V

    .line 113
    .line 114
    .line 115
    :cond_3
    :goto_2
    return-void
.end method

.method public static f(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/uu2;->g(Ljava/lang/Throwable;Ljava/lang/String;Ll/ili;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static g(Ljava/lang/Throwable;Ljava/lang/String;Ll/ili;)V
    .locals 2

    .line 1
    sget-boolean v0, Ll/uu2;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p2, :cond_1

    .line 7
    .line 8
    invoke-interface {p2, p0}, Ll/ili;->a(Ljava/lang/Throwable;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {}, Ll/xni0;->d()Ll/yni0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/uu2$a;

    .line 24
    .line 25
    invoke-direct {v1, p0, p2, p1}, Ll/uu2$a;-><init>(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static h(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/uu2;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Ll/uu2;->a:Ll/f6f;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/c610;->j(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static i(Lcom/tantanapp/beatles/v2/data/MonitorEvent;Ll/vrf;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/uu2;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1, p0}, Ll/uu2;->e(Ll/vrf;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 7
    .line 8
    .line 9
    sget-object p1, Ll/uu2;->a:Ll/f6f;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/c610;->j(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
