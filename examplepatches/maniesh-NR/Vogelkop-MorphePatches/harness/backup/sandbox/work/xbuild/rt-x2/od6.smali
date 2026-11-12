.class public abstract Lod6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Lpd6;->a:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v1}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_9} :catch_e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_9} :catch_e
    .catchall {:try_start_1 .. :try_end_9} :catchall_15

    sput-object v0, Lpd6;->a:Ljava/util/concurrent/FutureTask;

    sput-object v1, Lod6;->a:Ljava/lang/String;

    return-void

    :catch_e
    move-exception v1

    :try_start_f
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_15
    .catchall {:try_start_f .. :try_end_15} :catchall_15

    :catchall_15
    move-exception v1

    sput-object v0, Lpd6;->a:Ljava/util/concurrent/FutureTask;

    throw v1
.end method
