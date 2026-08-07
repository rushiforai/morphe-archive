.class Ll/hki$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hki$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/l1<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/util/Map;

.field final synthetic b:Ll/hki$c;

.field final synthetic c:Ljava/lang/Object;

.field final synthetic d:Ll/hki$b;


# direct methods
.method public constructor <init>(Ll/hki$b;Ljava/util/Map;Ll/hki$c;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hki$b$a;->d:Ll/hki$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hki$b$a;->a:Ljava/util/Map;

    .line 4
    .line 5
    iput-object p3, p0, Ll/hki$b$a;->b:Ll/hki$c;

    .line 6
    .line 7
    iput-object p4, p0, Ll/hki$b$a;->c:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hki$b$a;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-string p3, "result"

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-interface {p1, p3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/hki$b$a;->a:Ljava/util/Map;

    .line 11
    .line 12
    iget-object p3, p0, Ll/hki$b$a;->b:Ll/hki$c;

    .line 13
    .line 14
    iget-object p3, p3, Ll/hki$c;->e:Lcom/idv/identity/platform/config/OSSConfig;

    .line 15
    .line 16
    const-string v0, "ossConfig"

    .line 17
    .line 18
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/hki$b$a;->a:Ljava/util/Map;

    .line 28
    .line 29
    const-string p3, "msg"

    .line 30
    .line 31
    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p0}, Ll/hki$b$a;->b()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hki$b$a;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/hki$b$a;->c:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    :catchall_0
    :try_start_1
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_1
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 13
    throw p0
.end method

.method public c(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/hki$b$a;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "result"

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/hki$b$a;->b()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hki$b$a;->c(Ljava/util/Map;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
