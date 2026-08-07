.class Lio/agora/utils2/internal/ProcessLifecycleOwner$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/utils2/internal/ProcessLifecycleOwner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/utils2/internal/ProcessLifecycleOwner;


# direct methods
.method public constructor <init>(Lio/agora/utils2/internal/ProcessLifecycleOwner;)V
    .locals 0

    iput-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner$2;->this$0:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object p0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner$2;->this$0:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lio/agora/utils2/internal/ProcessLifecycleOwner;->access$000(Lio/agora/utils2/internal/ProcessLifecycleOwner;Z)V

    return-void
.end method
