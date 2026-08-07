.class Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->scheduleTask(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

.field final synthetic val$type:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$1;->val$type:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$1;->val$type:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->scheduleTaskImpl(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
