.class public Ll/p6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ksl;


# instance fields
.field public a:Ll/ftd0;

.field public final b:I

.field public final c:I

.field public d:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/httpdns/model/DomainModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    iput v0, p0, Ll/p6e;->b:I

    .line 7
    .line 8
    const/16 v1, 0x20

    .line 9
    .line 10
    iput v1, p0, Ll/p6e;->c:I

    .line 11
    .line 12
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    const/high16 v2, 0x42000000    # 32.0f

    .line 15
    .line 16
    invoke-direct {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IF)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 20
    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    new-instance p2, Ll/ftd0;

    .line 24
    .line 25
    invoke-direct {p2, p1}, Ll/ftd0;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Ll/p6e;->a:Ll/ftd0;

    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/tantanapp/httpdns/model/DomainModel;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/tantanapp/httpdns/model/DomainModel;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/p6e;->a:Ll/ftd0;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/ftd0;->a(Ljava/lang/String;)Lcom/tantanapp/httpdns/model/DomainModel;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public b(Lcom/tantanapp/httpdns/model/DomainModel;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p1, Lcom/tantanapp/httpdns/model/DomainModel;->queryTime:J

    .line 6
    .line 7
    iget-object v0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/tantanapp/httpdns/model/DomainModel;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->healthCheckModel:Ll/f0l;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/tantanapp/httpdns/model/DomainModel;->healthCheckModel:Ll/f0l;

    .line 24
    .line 25
    iput-object v1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->healthCheckModel:Ll/f0l;

    .line 26
    .line 27
    :cond_0
    iget-object v1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->totalIpModelList:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/tantanapp/httpdns/model/IpModel;

    .line 44
    .line 45
    iget-object v3, v0, Lcom/tantanapp/httpdns/model/DomainModel;->totalIpModelList:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p1, v2, v3}, Lcom/tantanapp/httpdns/model/DomainModel;->markIpValid(Lcom/tantanapp/httpdns/model/IpModel;Ljava/util/ArrayList;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v0, p0, Ll/p6e;->a:Ll/ftd0;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ll/ftd0;->f(Lcom/tantanapp/httpdns/model/DomainModel;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    iget-object p0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 59
    .line 60
    iget-object v0, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    new-instance p0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v0, "cache data:"

    .line 68
    .line 69
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p1, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, " success!!!"

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public c(Ll/z1m;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v1, p1, Ll/z1m;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    iget-object v0, p1, Ll/z1m;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/tantanapp/httpdns/model/DomainModel;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tantanapp/httpdns/model/DomainModel;->totalIpModelList:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/tantanapp/httpdns/model/IpModel;

    .line 38
    .line 39
    iget-object v1, v0, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, p1, Ll/z1m;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    iget-boolean p0, p1, Ll/z1m;->h:Z

    .line 50
    .line 51
    iput-boolean p0, v0, Lcom/tantanapp/httpdns/model/IpModel;->valide:Z

    .line 52
    .line 53
    new-instance p0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string p1, "\u63a2\u6d4b\u7ed3\u679c:\u57df\u540d: "

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, v0, Lcom/tantanapp/httpdns/model/IpModel;->domain:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p1, " ip:"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object p1, v0, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p1, " \u662f\u5426\u6709\u6548: "

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-boolean p1, v0, Lcom/tantanapp/httpdns/model/IpModel;->valide:Z

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method

.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6e;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Lcom/tantanapp/httpdns/model/DomainModel;)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/httpdns/model/DomainModel;->getIpByDomainModel()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
