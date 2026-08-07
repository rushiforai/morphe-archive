.class public Ll/fk90;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/y1m;

.field public b:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fk90;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk90;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/String;)Lcom/tantanapp/httpdns/probe/IPProbeService$Status;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk90;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tantanapp/httpdns/probe/IPProbeService$Status;->PROBING:Lcom/tantanapp/httpdns/probe/IPProbeService$Status;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Lcom/tantanapp/httpdns/probe/IPProbeService$Status;->NO_PROBING:Lcom/tantanapp/httpdns/probe/IPProbeService$Status;

    .line 13
    .line 14
    return-object p0
.end method

.method public c(Lcom/tantanapp/httpdns/model/DomainModel;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/fk90;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/fk90;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    iget-object v2, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v2, p1, Lcom/tantanapp/httpdns/model/DomainModel;->totalIpModelList:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/tantanapp/httpdns/model/IpModel;

    .line 47
    .line 48
    iget-object v4, v3, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v4, v3, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-nez v4, :cond_1

    .line 60
    .line 61
    new-instance v5, Ll/z1m;

    .line 62
    .line 63
    iget-object v6, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v7, v3, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v4, p1, Lcom/tantanapp/httpdns/model/DomainModel;->healthCheckModel:Ll/f0l;

    .line 68
    .line 69
    iget v8, v4, Ll/f0l;->c:I

    .line 70
    .line 71
    iget v9, v4, Ll/f0l;->d:I

    .line 72
    .line 73
    iget v10, v4, Ll/f0l;->e:I

    .line 74
    .line 75
    iget v11, v4, Ll/f0l;->f:I

    .line 76
    .line 77
    iget v12, v4, Ll/f0l;->b:I

    .line 78
    .line 79
    invoke-direct/range {v5 .. v12}, Ll/z1m;-><init>(Ljava/lang/String;Ljava/lang/String;IIIII)V

    .line 80
    .line 81
    .line 82
    new-instance v4, Ll/gk90;

    .line 83
    .line 84
    iget-object v6, p0, Ll/fk90;->a:Ll/y1m;

    .line 85
    .line 86
    invoke-direct {v4, p0, v5, v6}, Ll/gk90;-><init>(Ll/fk90;Ll/z1m;Ll/y1m;)V

    .line 87
    .line 88
    .line 89
    iget-object v3, v3, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ll/hoi0;->a()Ll/hoi0;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3, v4}, Ll/hoi0;->b(Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_3

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Ll/fk90;->f(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    return-void
.end method

.method public d(Ll/y1m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fk90;->a:Ll/y1m;

    .line 2
    .line 3
    return-void
.end method

.method public e(Lcom/tantanapp/httpdns/model/DomainModel;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/fk90;->b(Ljava/lang/String;)Lcom/tantanapp/httpdns/probe/IPProbeService$Status;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/tantanapp/httpdns/probe/IPProbeService$Status;->PROBING:Lcom/tantanapp/httpdns/probe/IPProbeService$Status;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/fk90;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->totalIpModelList:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/tantanapp/httpdns/model/IpModel;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/fk90;->f(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/hoi0;->a()Ll/hoi0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/hoi0;->e(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
