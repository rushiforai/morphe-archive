.class public final synthetic Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/ThreadFactory;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/util/concurrent/atomic/AtomicLong;

.field public final synthetic f$3:Ljava/lang/Boolean;

.field public final synthetic f$4:Ljava/lang/Integer;

.field public final synthetic f$5:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/ThreadFactory;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicLong;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$0:Ljava/util/concurrent/ThreadFactory;

    iput-object p2, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$2:Ljava/util/concurrent/atomic/AtomicLong;

    iput-object p4, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$3:Ljava/lang/Boolean;

    iput-object p5, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$4:Ljava/lang/Integer;

    iput-object p6, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$5:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-void
.end method


# virtual methods
.method public final newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 9

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$0:Ljava/util/concurrent/ThreadFactory;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$2:Ljava/util/concurrent/atomic/AtomicLong;

    iget-object v3, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$3:Ljava/lang/Boolean;

    iget-object v4, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$4:Ljava/lang/Integer;

    iget-object v5, p0, Lcom/google/common/util/concurrent/ThreadFactoryBuilder$0;->f$5:Ljava/lang/Thread$UncaughtExceptionHandler;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;->lambda$doBuild$0(Ljava/util/concurrent/ThreadFactory;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicLong;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Thread$UncaughtExceptionHandler;Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method
