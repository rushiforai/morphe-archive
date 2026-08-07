.class public final Ll/agy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/isw0;

.field public final synthetic b:Ll/xfy0;


# direct methods
.method public constructor <init>(Ll/xfy0;Ll/isw0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/agy0;->a:Ll/isw0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/agy0;->b:Ll/xfy0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/agy0;->b:Ll/xfy0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/agy0;->b:Ll/xfy0;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {v1, v2}, Ll/xfy0;->c(Ll/xfy0;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/agy0;->b:Ll/xfy0;

    .line 11
    .line 12
    iget-object v1, v1, Ll/xfy0;->c:Ll/hcy0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/hcy0;->a0()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Ll/agy0;->b:Ll/xfy0;

    .line 21
    .line 22
    iget-object v1, v1, Ll/xfy0;->c:Ll/hcy0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/d6x0;->z()Ll/l8x0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "Connected to remote service"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/agy0;->b:Ll/xfy0;

    .line 38
    .line 39
    iget-object v1, v1, Ll/xfy0;->c:Ll/hcy0;

    .line 40
    .line 41
    iget-object p0, p0, Ll/agy0;->a:Ll/isw0;

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ll/hcy0;->J(Ll/isw0;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    monitor-exit v0

    .line 50
    return-void

    .line 51
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method
