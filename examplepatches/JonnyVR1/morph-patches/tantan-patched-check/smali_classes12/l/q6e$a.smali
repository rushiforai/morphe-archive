.class Ll/q6e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q6e;->k(Ll/hhl;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ll/q6e;


# direct methods
.method public constructor <init>(Ll/q6e;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q6e$a;->c:Ll/q6e;

    .line 2
    .line 3
    iput-object p2, p0, Ll/q6e$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/q6e$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const-string v0, "checking map:"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/q6e$a;->c:Ll/q6e;

    .line 4
    .line 5
    iget-object v2, p0, Ll/q6e$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/q6e$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2, v3}, Ll/q6e;->h(Ll/q6e;Ljava/lang/String;Ljava/lang/String;)Ll/hhl;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v1

    .line 14
    const-string v2, "CosmosSdkDns"

    .line 15
    .line 16
    invoke-static {v2, v1}, Ll/s6e;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object v1, p0, Ll/q6e$a;->c:Ll/q6e;

    .line 20
    .line 21
    invoke-static {v1}, Ll/q6e;->i(Ll/q6e;)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    monitor-enter v1

    .line 26
    :try_start_1
    iget-object v2, p0, Ll/q6e$a;->c:Ll/q6e;

    .line 27
    .line 28
    invoke-static {v2}, Ll/q6e;->i(Ll/q6e;)Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object v3, p0, Ll/q6e$a;->a:Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    const-string v2, "CosmosSdkDns"

    .line 38
    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/q6e$a;->c:Ll/q6e;

    .line 45
    .line 46
    invoke-static {p0}, Ll/q6e;->i(Ll/q6e;)Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v2, p0}, Ll/s6e;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    monitor-exit v1

    .line 61
    return-void

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw p0
.end method
