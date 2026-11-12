.class public final synthetic Ll71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# instance fields
.field public final synthetic a:Lrn9;

.field public final synthetic b:Ljava/util/concurrent/Executor;

.field public final synthetic c:Ltya;


# direct methods
.method public synthetic constructor <init>(Lrn9;Ljava/util/concurrent/Executor;Ltya;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll71;->a:Lrn9;

    iput-object p2, p0, Ll71;->b:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Ll71;->c:Ltya;

    return-void
.end method


# virtual methods
.method public final onImageAvailable(Landroid/media/ImageReader;)V
    .registers 6

    iget-object p1, p0, Ll71;->a:Lrn9;

    iget-object v0, p0, Ll71;->b:Ljava/util/concurrent/Executor;

    iget-object p0, p0, Ll71;->c:Ltya;

    iget-object v1, p1, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_9
    iget-boolean v2, p1, Lrn9;->b:Z

    if-nez v2, :cond_17

    new-instance v2, Lxa;

    const/16 v3, 0xf

    invoke-direct {v2, p1, p0, v3}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_17
    monitor-exit v1

    return-void

    :goto_19
    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_9 .. :try_end_1a} :catchall_1b

    throw p0

    :catchall_1b
    move-exception p0

    goto :goto_19
.end method
