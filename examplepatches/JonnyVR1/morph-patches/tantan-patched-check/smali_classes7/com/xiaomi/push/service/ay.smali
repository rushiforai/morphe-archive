.class public final Lcom/xiaomi/push/service/ay;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/xiaomi/push/service/aa;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/ay$a;
    }
.end annotation


# static fields
.field private static volatile a:Lcom/xiaomi/push/service/ay;


# instance fields
.field private a:J

.field a:Landroid/content/Context;

.field private a:Landroid/content/SharedPreferences;

.field private a:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/xiaomi/push/service/ay$a;",
            ">;"
        }
    .end annotation
.end field

.field private volatile a:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/xiaomi/push/service/ay;->a:Z

    .line 6
    .line 7
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/xiaomi/push/service/ay;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/xiaomi/push/service/ay;->a:Landroid/content/Context;

    .line 19
    .line 20
    const-string v1, "sync"

    .line 21
    .line 22
    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/xiaomi/push/service/ay;->a:Landroid/content/SharedPreferences;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ay;)Landroid/content/SharedPreferences;
    .locals 0

    .line 59
    iget-object p0, p0, Lcom/xiaomi/push/service/ay;->a:Landroid/content/SharedPreferences;

    return-object p0
.end method

.method public static synthetic a()Lcom/xiaomi/push/service/ay;
    .locals 1

    .line 50
    sget-object v0, Lcom/xiaomi/push/service/ay;->a:Lcom/xiaomi/push/service/ay;

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Lcom/xiaomi/push/service/ay;
    .locals 2

    .line 53
    sget-object v0, Lcom/xiaomi/push/service/ay;->a:Lcom/xiaomi/push/service/ay;

    if-nez v0, :cond_1

    .line 54
    const-class v0, Lcom/xiaomi/push/service/ay;

    monitor-enter v0

    .line 55
    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/ay;->a:Lcom/xiaomi/push/service/ay;

    if-nez v1, :cond_0

    .line 56
    new-instance v1, Lcom/xiaomi/push/service/ay;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/ay;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/push/service/ay;->a:Lcom/xiaomi/push/service/ay;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 57
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 58
    :cond_1
    :goto_2
    sget-object p0, Lcom/xiaomi/push/service/ay;->a:Lcom/xiaomi/push/service/ay;

    return-object p0
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ay;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/xiaomi/push/service/ay;->a:Ljava/util/concurrent/ConcurrentHashMap;

    return-object p0
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ay;Z)Z
    .locals 0

    .line 52
    iput-boolean p1, p0, Lcom/xiaomi/push/service/ay;->a:Z

    return p1
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 60
    iget-object p0, p0, Lcom/xiaomi/push/service/ay;->a:Landroid/content/SharedPreferences;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, ""

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public a()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/xiaomi/push/service/ay;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Lcom/xiaomi/push/service/ay;->a:J

    .line 11
    .line 12
    sub-long v2, v0, v2

    .line 13
    .line 14
    const-wide/32 v4, 0x36ee80

    .line 15
    .line 16
    .line 17
    cmp-long v2, v2, v4

    .line 18
    .line 19
    if-gez v2, :cond_1

    .line 20
    .line 21
    :goto_0
    return-void

    .line 22
    :cond_1
    iput-wide v0, p0, Lcom/xiaomi/push/service/ay;->a:J

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/xiaomi/push/service/ay;->a:Z

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    .line 32
    .line 33
    mul-double/2addr v0, v2

    .line 34
    double-to-int v0, v0

    .line 35
    iget-object v1, p0, Lcom/xiaomi/push/service/ay;->a:Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {v1}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, Lcom/xiaomi/push/service/ay$1;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Lcom/xiaomi/push/service/ay$1;-><init>(Lcom/xiaomi/push/service/ay;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2, v0}, Ll/tsq0;->h(Ljava/lang/Runnable;I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public a(Lcom/xiaomi/push/service/ay$a;)V
    .locals 4

    .line 62
    iget-object v0, p0, Lcom/xiaomi/push/service/ay;->a:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p1, Lcom/xiaomi/push/service/ay$a;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 63
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide/high16 v2, 0x403e000000000000L    # 30.0

    mul-double/2addr v0, v2

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0xa

    .line 64
    iget-object p0, p0, Lcom/xiaomi/push/service/ay;->a:Landroid/content/Context;

    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    move-result-object p0

    invoke-virtual {p0, p1, v0}, Ll/tsq0;->h(Ljava/lang/Runnable;I)V

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 61
    sget-object p0, Lcom/xiaomi/push/service/ay;->a:Lcom/xiaomi/push/service/ay;

    iget-object p0, p0, Lcom/xiaomi/push/service/ay;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p0}, Ll/n5r0;->a(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method
