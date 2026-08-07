.class public Ll/k4r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile b:Ll/k4r0;


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/k4r0;->a:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method

.method private static a(Landroid/content/Context;)Ll/k4r0;
    .locals 2

    .line 1
    sget-object v0, Ll/k4r0;->b:Ll/k4r0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/k4r0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/k4r0;->b:Ll/k4r0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/k4r0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/k4r0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/k4r0;->b:Ll/k4r0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Ll/k4r0;->b:Ll/k4r0;

    .line 27
    .line 28
    return-object p0
.end method

.method public static b(Landroid/content/Context;Lcom/xiaomi/push/hb;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {p0, p1, v0, v1}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static c(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, p1, v0, p2}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private d(Lcom/xiaomi/push/hb;IZ)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/k4r0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/l4r0;->i()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 18
    .line 19
    sget-object v1, Lcom/xiaomi/push/gf;->e:Lcom/xiaomi/push/gf;

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    new-instance p3, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "click to start activity result:"

    .line 34
    .line 35
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-static {p3}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Lcom/xiaomi/push/he;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p3}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-direct {v1, p3, v0}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 64
    .line 65
    .line 66
    sget-object p3, Lcom/xiaomi/push/gp;->ae:Lcom/xiaomi/push/gp;

    .line 67
    .line 68
    iget-object p3, p3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v1, p3}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    invoke-virtual {v1, p3}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 78
    .line 79
    .line 80
    iget-object p3, p1, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v1, p3}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 83
    .line 84
    .line 85
    new-instance p3, Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object p3, v1, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 91
    .line 92
    const-string v0, "result"

    .line 93
    .line 94
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-interface {p3, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/k4r0;->a:Landroid/content/Context;

    .line 102
    .line 103
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sget-object v2, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 108
    .line 109
    iget-object v7, p1, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v8, p1, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    .line 112
    .line 113
    const/4 v9, 0x1

    .line 114
    const/4 v10, 0x0

    .line 115
    const/4 v3, 0x0

    .line 116
    const/4 v4, 0x0

    .line 117
    const/4 v5, 0x0

    .line 118
    const/4 v6, 0x1

    .line 119
    invoke-virtual/range {v0 .. v10}, Lcom/xiaomi/mipush/sdk/f;->D(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;ZZ)V

    .line 120
    .line 121
    .line 122
    :cond_0
    return-void
.end method

.method public static e(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-direct {p0, p1, v0, p2}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static f(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x3

    .line 6
    invoke-direct {p0, p1, v0, p2}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static g(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x4

    .line 6
    invoke-direct {p0, p1, v0, p2}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static h(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->q()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->t()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->y()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 v0, 0x7

    .line 37
    invoke-direct {p0, p1, v0, p2}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 v0, 0x5

    .line 46
    invoke-direct {p0, p1, v0, p2}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    :goto_0
    invoke-static {p0}, Ll/k4r0;->a(Landroid/content/Context;)Ll/k4r0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 v0, 0x6

    .line 55
    invoke-direct {p0, p1, v0, p2}, Ll/k4r0;->d(Lcom/xiaomi/push/hb;IZ)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
