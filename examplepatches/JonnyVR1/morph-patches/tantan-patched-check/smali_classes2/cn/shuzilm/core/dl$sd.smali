.class Lcn/shuzilm/core/dl$sd;
.super Ljava/util/TimerTask;
.source "SourceFile"


# instance fields
.field a:Landroid/net/nsd/NsdManager$DiscoveryListener;

.field b:Landroid/net/nsd/NsdManager;

.field c:I

.field d:Ljava/lang/String;

.field e:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;ILjava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcn/shuzilm/core/dl$sd;->a:Landroid/net/nsd/NsdManager$DiscoveryListener;

    .line 5
    .line 6
    iput-object p1, p0, Lcn/shuzilm/core/dl$sd;->b:Landroid/net/nsd/NsdManager;

    .line 7
    .line 8
    iput p3, p0, Lcn/shuzilm/core/dl$sd;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Lcn/shuzilm/core/dl$sd;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lcn/shuzilm/core/dl$sd;->e:Lorg/json/JSONObject;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcn/shuzilm/core/dl$sd;->b:Landroid/net/nsd/NsdManager;

    .line 2
    .line 3
    iget-object v1, p0, Lcn/shuzilm/core/dl$sd;->a:Landroid/net/nsd/NsdManager$DiscoveryListener;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcn/shuzilm/core/dl;->a(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcn/shuzilm/core/dl$sd;->c:I

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcn/shuzilm/core/dl$sd;->e:Lorg/json/JSONObject;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {}, Lcn/shuzilm/core/dl;->a()Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    add-int/2addr v2, v0

    .line 38
    const/16 v3, 0x1000

    .line 39
    .line 40
    if-ge v2, v3, :cond_0

    .line 41
    .line 42
    const/4 v2, 0x5

    .line 43
    if-le v0, v2, :cond_0

    .line 44
    .line 45
    invoke-static {}, Lcn/shuzilm/core/dl;->a()Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v2, p0, Lcn/shuzilm/core/dl$sd;->d:Ljava/lang/String;

    .line 50
    .line 51
    iget-object p0, p0, Lcn/shuzilm/core/dl$sd;->e:Lorg/json/JSONObject;

    .line 52
    .line 53
    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-static {}, Lcn/shuzilm/core/dl;->b()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    const/16 v0, 0x14

    .line 61
    .line 62
    if-le p0, v0, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-static {}, Lcn/shuzilm/core/dl;->c()Ljava/util/LinkedList;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    invoke-static {}, Lcn/shuzilm/core/dl;->c()Ljava/util/LinkedList;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Ljava/util/LinkedList;->size()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-lez p0, :cond_2

    .line 80
    .line 81
    invoke-static {}, Lcn/shuzilm/core/dl;->c()Ljava/util/LinkedList;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p0, Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_2

    .line 92
    .line 93
    new-instance v0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;

    .line 94
    .line 95
    invoke-direct {v0, p0, v1}, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;-><init>(Ljava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->discoverySubType()V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcn/shuzilm/core/dl;->d()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    .line 103
    .line 104
    :catchall_0
    :cond_2
    :goto_0
    return-void
.end method
