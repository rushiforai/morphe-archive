.class Lcom/core/glcore/util/CameraDataCallThread$CameraDataCallBack;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/core/glcore/util/CameraDataCallThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CameraDataCallBack"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/core/glcore/util/CameraDataCallThread;


# direct methods
.method private constructor <init>(Lcom/core/glcore/util/CameraDataCallThread;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/CameraDataCallThread$CameraDataCallBack;->this$0:Lcom/core/glcore/util/CameraDataCallThread;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/core/glcore/util/CameraDataCallThread;Lcom/core/glcore/util/CameraDataCallThread$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/core/glcore/util/CameraDataCallThread$CameraDataCallBack;-><init>(Lcom/core/glcore/util/CameraDataCallThread;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/core/glcore/util/CameraDataCallThread$CameraDataCallBack;->this$0:Lcom/core/glcore/util/CameraDataCallThread;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/core/glcore/util/CameraDataCallThread;->access$100(Lcom/core/glcore/util/CameraDataCallThread;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/core/glcore/util/CameraDataCallThread$CameraDataCallBack;->this$0:Lcom/core/glcore/util/CameraDataCallThread;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/core/glcore/util/CameraDataCallThread;->access$200(Lcom/core/glcore/util/CameraDataCallThread;)Ll/xpl$b;

    .line 11
    .line 12
    .line 13
    monitor-exit p1

    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method
