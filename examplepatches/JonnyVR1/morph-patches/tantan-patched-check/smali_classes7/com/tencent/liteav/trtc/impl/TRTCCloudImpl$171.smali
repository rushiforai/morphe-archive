.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkUserState(Ljava/lang/String;JII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$audioAvailable:Z

.field final synthetic val$listener:Lcom/tencent/trtc/TRTCCloudListener;

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudListener;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;->val$userId:Ljava/lang/String;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;->val$audioAvailable:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;->val$audioAvailable:Z

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onUserAudioAvailable(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
