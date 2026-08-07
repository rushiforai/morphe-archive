.class Lcom/ss/bytertc/engine/utils/LogRecover$1;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/LogRecover;->startTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/utils/LogRecover;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/LogRecover;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/LogRecover$1;->this$0:Lcom/ss/bytertc/engine/utils/LogRecover;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/LogRecover$1;->this$0:Lcom/ss/bytertc/engine/utils/LogRecover;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/engine/utils/LogRecover$1$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/ss/bytertc/engine/utils/LogRecover$1$1;-><init>(Lcom/ss/bytertc/engine/utils/LogRecover$1;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogRecover;->access$000(Lcom/ss/bytertc/engine/utils/LogRecover;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
