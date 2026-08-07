.class public Lcom/xiaomi/push/service/ao;
.super Lcom/xiaomi/push/service/ax$a;
.source "SourceFile"

# interfaces
.implements Ll/xwq0$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/ao$b;,
        Lcom/xiaomi/push/service/ao$a;
    }
.end annotation


# instance fields
.field private a:J

.field private a:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/push/service/ax$a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/xiaomi/push/service/ao;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 8

    .line 141
    new-instance v0, Lcom/xiaomi/push/service/ao;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/ao;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    .line 142
    invoke-static {}, Lcom/xiaomi/push/service/ax;->a()Lcom/xiaomi/push/service/ax;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax$a;)V

    .line 143
    const-class v1, Ll/xwq0;

    monitor-enter v1

    .line 144
    :try_start_0
    invoke-static {v0}, Ll/xwq0;->a(Ll/xwq0$c;)V

    .line 145
    new-instance v4, Lcom/xiaomi/push/service/ao$a;

    invoke-direct {v4}, Lcom/xiaomi/push/service/ao$a;-><init>()V

    const-string v5, "0"

    const-string v6, "push"

    const-string v7, "2.2"

    const/4 v3, 0x0

    move-object v2, p0

    invoke-static/range {v2 .. v7}, Ll/xwq0;->a(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;)Ll/xwq0;
    .locals 0

    .line 148
    new-instance p0, Lcom/xiaomi/push/service/ao$b;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/xiaomi/push/service/ao$b;-><init>(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;)V

    return-object p0
.end method

.method public a(Ll/ezq0;)V
    .locals 0

    .line 147
    return-void
.end method

.method public a(Ll/gzq0;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/gzq0;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/gzq0;->n()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-wide v2, p0, Lcom/xiaomi/push/service/ao;->a:J

    .line 18
    .line 19
    sub-long/2addr v0, v2

    .line 20
    const-wide/32 v2, 0x36ee80

    .line 21
    .line 22
    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-lez v0, :cond_2

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "fetch bucket :"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ll/gzq0;->n()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v0

    .line 52
    iput-wide v0, p0, Lcom/xiaomi/push/service/ao;->a:J

    .line 53
    .line 54
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/xwq0;->a()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ll/xwq0;->b()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/xiaomi/push/service/ao;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->a()Ll/u1r0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/u1r0;->f()Ll/v1r0;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ll/v1r0;->c()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p1, v1}, Ll/xwq0;->b(Ljava/lang/String;)Ll/swq0;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/swq0;->b()Ljava/util/ArrayList;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_1

    .line 99
    .line 100
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/u1r0;->c()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_0

    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_2

    .line 122
    .line 123
    const-string p1, "bucket changed, force reconnect"

    .line 124
    .line 125
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/xiaomi/push/service/ao;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 129
    .line 130
    const/4 v0, 0x0

    .line 131
    const/4 v1, 0x0

    .line 132
    invoke-virtual {p1, v1, v0}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/xiaomi/push/service/ao;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 136
    .line 137
    invoke-virtual {p0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(Z)V

    .line 138
    .line 139
    .line 140
    :cond_2
    return-void
.end method
