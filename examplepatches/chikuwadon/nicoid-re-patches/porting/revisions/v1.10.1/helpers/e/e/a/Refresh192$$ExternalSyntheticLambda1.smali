.class public final synthetic Le/e/a/Refresh192$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Le/e/a/NetworkTask;

.field public final synthetic f$2:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic f$3:Ljava/lang/Object;

.field public final synthetic f$4:Le/e/a/Refresh192$Session;

.field public final synthetic f$5:Ljava/lang/Object;

.field public final synthetic f$6:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Le/e/a/NetworkTask;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$1:Le/e/a/NetworkTask;

    iput-object p3, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$2:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p4, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$3:Ljava/lang/Object;

    iput-object p5, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$4:Le/e/a/Refresh192$Session;

    iput-object p6, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$5:Ljava/lang/Object;

    iput-object p7, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$6:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$1:Le/e/a/NetworkTask;

    iget-object v2, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$2:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$3:Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$4:Le/e/a/Refresh192$Session;

    iget-object v5, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$5:Ljava/lang/Object;

    iget-object v6, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda1;->f$6:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static/range {v0 .. v6}, Le/e/a/Refresh192;->lambda$0(Ljava/lang/String;Le/e/a/NetworkTask;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicInteger;)V

    return-void
.end method
