.class public Ll/uqe0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uqe0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/uqe0;

.field public final b:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/uqe0;Ljava/lang/Runnable;)V
    .locals 0
    .param p1    # Ll/uqe0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uqe0$a;->a:Ll/uqe0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/uqe0$a;->b:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/uqe0$a;->b:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/uqe0$a;->a:Ll/uqe0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/uqe0;->d:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_1
    iget-object p0, p0, Ll/uqe0$a;->a:Ll/uqe0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/uqe0;->b()V

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p0

    .line 21
    :catchall_1
    move-exception v0

    .line 22
    iget-object v1, p0, Ll/uqe0$a;->a:Ll/uqe0;

    .line 23
    .line 24
    iget-object v1, v1, Ll/uqe0;->d:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v1

    .line 27
    :try_start_2
    iget-object p0, p0, Ll/uqe0$a;->a:Ll/uqe0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/uqe0;->b()V

    .line 30
    .line 31
    .line 32
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 33
    throw v0

    .line 34
    :catchall_2
    move-exception p0

    .line 35
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 36
    throw p0
.end method
