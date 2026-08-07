.class public Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->reset()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$2;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

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
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reset()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->reset()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
