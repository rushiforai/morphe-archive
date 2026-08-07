.class public Ll/ar0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ar0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ar0;


# direct methods
.method public constructor <init>(Ll/ar0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ar0$a;->a:Ll/ar0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar0$a;->a:Ll/ar0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ar0$a;->a:Ll/ar0;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {v1, v2}, Ll/ar0;->k(Ll/ar0;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/ar0$a;->a:Ll/ar0;

    .line 11
    .line 12
    invoke-static {v1}, Ll/ar0;->l(Ll/ar0;)Z

    .line 13
    .line 14
    .line 15
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    iget-object v2, p0, Ll/ar0$a;->a:Ll/ar0;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    :try_start_1
    invoke-static {v2}, Ll/ar0;->j(Ll/ar0;)Ll/ar0$b;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/ar0$a;->a:Ll/ar0;

    .line 27
    .line 28
    invoke-static {p0}, Ll/ar0;->j(Ll/ar0;)Ll/ar0$b;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/ar0$b;->j()V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-static {v2}, Ll/ar0;->m(Ll/ar0;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    monitor-exit v0

    .line 42
    return-void

    .line 43
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p0
.end method
