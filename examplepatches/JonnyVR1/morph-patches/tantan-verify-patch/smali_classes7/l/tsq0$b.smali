.class Ll/tsq0$b;
.super Ll/tsq0$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tsq0;->n(Ll/tsq0$c;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic b:Ll/tsq0;


# direct methods
.method public constructor <init>(Ll/tsq0;Ll/tsq0$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tsq0$b;->b:Ll/tsq0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/tsq0$d;-><init>(Ll/tsq0$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tsq0$b;->b:Ll/tsq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tsq0;->b(Ll/tsq0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/tsq0$b;->b:Ll/tsq0;

    .line 9
    .line 10
    invoke-static {v1}, Ll/tsq0;->d(Ll/tsq0;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object p0, p0, Ll/tsq0$d;->a:Ll/tsq0$c;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/tsq0$c;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method
