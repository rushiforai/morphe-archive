.class Lcom/xiaomi/push/service/ax$1;
.super Ll/vsq0$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/ax;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/ax;

.field a:Z


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/ax;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/vsq0$d;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/xiaomi/push/service/ax$1;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public b()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "https://resolver.msg.xiaomi.net/psc/?t=a"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v0, v1, v2}, Ll/zwq0;->f(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/ezq0;->o([B)Ll/ezq0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax;Ll/ezq0;)Ll/ezq0;

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lcom/xiaomi/push/service/ax$1;->a:Z

    .line 31
    .line 32
    iget-object p0, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :catch_0
    move-exception p0

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "fetch config failure: "

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public c()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax;Ll/vsq0$d;)Ll/vsq0$d;

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/xiaomi/push/service/ax$1;->a:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 21
    .line 22
    invoke-static {v2}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    new-array v2, v2, [Lcom/xiaomi/push/service/ax$a;

    .line 31
    .line 32
    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, [Lcom/xiaomi/push/service/ax$a;

    .line 37
    .line 38
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    array-length v0, v1

    .line 40
    const/4 v2, 0x0

    .line 41
    :goto_0
    if-ge v2, v0, :cond_0

    .line 42
    .line 43
    aget-object v3, v1, v2

    .line 44
    .line 45
    iget-object v4, p0, Lcom/xiaomi/push/service/ax$1;->a:Lcom/xiaomi/push/service/ax;

    .line 46
    .line 47
    invoke-static {v4}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax;)Ll/ezq0;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v3, v4}, Lcom/xiaomi/push/service/ax$a;->a(Ll/ezq0;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    throw p0

    .line 60
    :cond_0
    return-void
.end method
