.class public Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "YtFSMFireEventData"
.end annotation


# instance fields
.field public eventType:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

.field public extraData:Ljava/lang/Object;

.field public final synthetic this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;->eventType:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;->extraData:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method
