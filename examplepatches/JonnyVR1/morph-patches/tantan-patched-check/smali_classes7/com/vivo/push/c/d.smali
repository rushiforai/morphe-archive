.class public Lcom/vivo/push/c/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile d:Lcom/vivo/push/c/d;


# instance fields
.field private a:Lcom/vivo/push/c/b;

.field private b:Lcom/vivo/push/c/c;

.field private c:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/vivo/push/c/d;->a:Lcom/vivo/push/c/b;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/vivo/push/util/ContextDelegate;->getContext(Landroid/content/Context;)Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/vivo/push/c/d;->c:Landroid/content/Context;

    .line 17
    .line 18
    new-instance p1, Lcom/vivo/push/c/e;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/vivo/push/c/d;->c:Landroid/content/Context;

    .line 21
    .line 22
    invoke-direct {p1, v0}, Lcom/vivo/push/c/e;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/vivo/push/c/d;->a:Lcom/vivo/push/c/b;

    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/vivo/push/c/d;->b:Lcom/vivo/push/c/c;

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    new-instance p1, Lcom/vivo/push/c/a;

    .line 32
    .line 33
    invoke-direct {p1}, Lcom/vivo/push/c/a;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/vivo/push/c/d;->b:Lcom/vivo/push/c/c;

    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/vivo/push/c/d;
    .locals 2

    .line 1
    sget-object v0, Lcom/vivo/push/c/d;->d:Lcom/vivo/push/c/d;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/vivo/push/c/d;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/vivo/push/c/d;->d:Lcom/vivo/push/c/d;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    new-instance v1, Lcom/vivo/push/c/d;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/vivo/push/c/d;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/vivo/push/c/d;->d:Lcom/vivo/push/c/d;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit v0

    .line 25
    goto :goto_2

    .line 26
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0

    .line 28
    :cond_1
    :goto_2
    sget-object p0, Lcom/vivo/push/c/d;->d:Lcom/vivo/push/c/d;

    .line 29
    .line 30
    return-object p0
.end method


# virtual methods
.method public final a()Lcom/vivo/push/c/b;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/vivo/push/c/d;->a:Lcom/vivo/push/c/b;

    return-object p0
.end method
