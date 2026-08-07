.class public Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->checkHostName(Landroid/content/Context;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->a:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->c:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Landroid/content/Context;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->c:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->b:Ljava/util/Set;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->b:Ljava/util/Set;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    new-instance v0, Lcom/tencent/could/component/common/ai/net/DnsResolver;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 44
    .line 45
    invoke-direct {v0, v1}, Lcom/tencent/could/component/common/ai/net/DnsResolver;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ljava/lang/Thread;

    .line 49
    .line 50
    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 54
    .line 55
    .line 56
    const-wide/16 v2, 0x1388

    .line 57
    .line 58
    invoke-virtual {v1, v2, v3}, Ljava/lang/Thread;->join(J)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->b:Ljava/util/Set;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->b:Ljava/util/Set;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 78
    .line 79
    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_2
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/net/DnsResolver;->getHasAddress()Ljava/net/InetAddress;

    .line 83
    .line 84
    .line 85
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 87
    .line 88
    if-nez v0, :cond_3

    .line 89
    .line 90
    :try_start_1
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->a:Landroid/content/Context;

    .line 91
    .line 92
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 93
    .line 94
    const-string v4, ""

    .line 95
    .line 96
    const-wide/16 v5, 0x0

    .line 97
    .line 98
    invoke-static/range {v1 .. v6}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->a:Landroid/content/Context;

    .line 103
    .line 104
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->b:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 111
    .line 112
    .line 113
    move-result-wide v5

    .line 114
    invoke-static/range {v1 .. v6}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :goto_0
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 119
    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v2, "checkHostName, error: "

    .line 123
    .line 124
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const-string v1, "TxNetWorkHelper"

    .line 139
    .line 140
    invoke-virtual {p0, v1, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method
