.class public final Lcom/vivo/push/util/y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/vivo/push/util/d;


# static fields
.field private static final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static d:Lcom/vivo/push/util/y;


# instance fields
.field private e:Landroid/content/Context;

.field private f:Lcom/vivo/push/util/d;

.field private g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/vivo/push/util/y;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/vivo/push/util/y;->b:Ljava/util/HashMap;

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/vivo/push/util/y;->c:Ljava/util/HashMap;

    .line 21
    .line 22
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/vivo/push/util/y;->g:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/vivo/push/util/y;->e:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/vivo/push/util/y;->a(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput-boolean p1, p0, Lcom/vivo/push/util/y;->g:Z

    .line 14
    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v0, "init status is "

    .line 18
    .line 19
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/vivo/push/util/y;->g:Z

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, ";  curCache is "

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/vivo/push/util/y;->f:Lcom/vivo/push/util/d;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "SystemCache"

    .line 42
    .line 43
    invoke-static {p1, p0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static declared-synchronized b(Landroid/content/Context;)Lcom/vivo/push/util/y;
    .locals 2

    .line 1
    const-class v0, Lcom/vivo/push/util/y;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/vivo/push/util/y;->d:Lcom/vivo/push/util/y;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/vivo/push/util/y;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {v1, p0}, Lcom/vivo/push/util/y;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/vivo/push/util/y;->d:Lcom/vivo/push/util/y;

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
    sget-object p0, Lcom/vivo/push/util/y;->d:Lcom/vivo/push/util/y;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-object p0

    .line 26
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 35
    sget-object v0, Lcom/vivo/push/util/y;->c:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_1

    .line 36
    iget-object p0, p0, Lcom/vivo/push/util/y;->f:Lcom/vivo/push/util/d;

    if-nez p0, :cond_0

    goto :goto_0

    .line 37
    :cond_0
    invoke-interface {p0, p1, p2}, Lcom/vivo/push/util/d;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    return-object v0
.end method

.method public final a()V
    .locals 1

    .line 31
    new-instance v0, Lcom/vivo/push/util/x;

    invoke-direct {v0}, Lcom/vivo/push/util/x;-><init>()V

    .line 32
    iget-object p0, p0, Lcom/vivo/push/util/y;->e:Landroid/content/Context;

    invoke-virtual {v0, p0}, Lcom/vivo/push/util/x;->a(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 33
    :cond_0
    invoke-virtual {v0}, Lcom/vivo/push/util/x;->a()V

    .line 34
    const-string p0, "SystemCache"

    const-string v0, "sp cache is cleared"

    invoke-static {p0, v0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final a(Landroid/content/Context;)Z
    .locals 1

    .line 1
    new-instance v0, Lcom/vivo/push/util/v;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/vivo/push/util/v;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/vivo/push/util/y;->f:Lcom/vivo/push/util/d;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Lcom/vivo/push/util/d;->a(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Lcom/vivo/push/util/x;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/vivo/push/util/x;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/vivo/push/util/y;->f:Lcom/vivo/push/util/d;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Lcom/vivo/push/util/d;->a(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    :cond_0
    if-nez v0, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lcom/vivo/push/util/y;->f:Lcom/vivo/push/util/d;

    .line 29
    .line 30
    :cond_1
    return v0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 28
    sget-object v0, Lcom/vivo/push/util/y;->c:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    iget-boolean v0, p0, Lcom/vivo/push/util/y;->g:Z

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/vivo/push/util/y;->f:Lcom/vivo/push/util/d;

    if-nez p0, :cond_0

    goto :goto_0

    .line 30
    :cond_0
    invoke-interface {p0, p1, p2}, Lcom/vivo/push/util/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method
