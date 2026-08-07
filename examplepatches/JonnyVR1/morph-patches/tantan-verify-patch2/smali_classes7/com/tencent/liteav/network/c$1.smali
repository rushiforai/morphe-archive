.class Lcom/tencent/liteav/network/c$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/c;->a(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:I

.field final synthetic c:Lcom/tencent/liteav/network/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/c;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/c$1;->c:Lcom/tencent/liteav/network/c;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/tencent/liteav/network/c$1;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p4, p0, Lcom/tencent/liteav/network/c$1;->b:I

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    const-string v0, "use"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/network/c$1;->c:Lcom/tencent/liteav/network/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/tencent/liteav/network/c;->a:Lcom/tencent/liteav/network/b;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    :goto_0
    const/4 v4, 0x7

    .line 18
    if-ge v3, v4, :cond_4

    .line 19
    .line 20
    const/4 v4, 0x5

    .line 21
    const-string v5, "TXCIntelligentRoute"

    .line 22
    .line 23
    if-ge v3, v4, :cond_1

    .line 24
    .line 25
    :try_start_0
    const-string v4, "https://tcdns.myqcloud.com/queryip"

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :catch_0
    move-exception v4

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    const-string v4, "https://tcdnsipv6.myqcloud.com/queryip"

    .line 31
    .line 32
    :goto_1
    iget-object v6, p0, Lcom/tencent/liteav/network/c$1;->c:Lcom/tencent/liteav/network/c;

    .line 33
    .line 34
    iget-object v7, p0, Lcom/tencent/liteav/network/c$1;->a:Ljava/lang/String;

    .line 35
    .line 36
    iget v8, p0, Lcom/tencent/liteav/network/c$1;->b:I

    .line 37
    .line 38
    invoke-static {v6, v7, v8, v4}, Lcom/tencent/liteav/network/c;->a(Lcom/tencent/liteav/network/c;Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    :try_start_1
    new-instance v6, Lorg/json/JSONObject;

    .line 43
    .line 44
    invoke-direct {v6, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    if-eqz v7, :cond_2

    .line 52
    .line 53
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 57
    if-nez v6, :cond_2

    .line 58
    .line 59
    goto :goto_4

    .line 60
    :catch_1
    move-exception v6

    .line 61
    :try_start_2
    const-string v7, "get value from json failed."

    .line 62
    .line 63
    invoke-static {v5, v7, v6}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object v6, p0, Lcom/tencent/liteav/network/c$1;->c:Lcom/tencent/liteav/network/c;

    .line 67
    .line 68
    invoke-static {v6, v4}, Lcom/tencent/liteav/network/c;->a(Lcom/tencent/liteav/network/c;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-lez v4, :cond_3

    .line 79
    .line 80
    goto :goto_4

    .line 81
    :cond_3
    const-wide/16 v6, 0x3e8

    .line 82
    .line 83
    invoke-static {v6, v7, v2}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 84
    .line 85
    .line 86
    goto :goto_3

    .line 87
    :goto_2
    const-string v6, "get json string failed."

    .line 88
    .line 89
    invoke-static {v5, v6, v4}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    :goto_4
    iget-object p0, p0, Lcom/tencent/liteav/network/c$1;->c:Lcom/tencent/liteav/network/c;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/tencent/liteav/network/c;->a:Lcom/tencent/liteav/network/b;

    .line 98
    .line 99
    invoke-interface {p0, v2, v1}, Lcom/tencent/liteav/network/b;->onFetchDone(ILjava/util/ArrayList;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method
