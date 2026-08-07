.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onRecvCustomCmdMsg(Ljava/lang/String;JIILjava/lang/String;ZIJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$cmdID:I

.field final synthetic val$missMsgCount:I

.field final synthetic val$msg:Ljava/lang/String;

.field final synthetic val$ordered:Z

.field final synthetic val$seq:I

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILjava/lang/String;ZI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$cmdID:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$seq:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$msg:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$ordered:Z

    .line 12
    .line 13
    iput p7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$missMsgCount:I

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$userId:Ljava/lang/String;

    .line 8
    .line 9
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$cmdID:I

    .line 10
    .line 11
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$seq:I

    .line 12
    .line 13
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$msg:Ljava/lang/String;

    .line 14
    .line 15
    const-string v5, "UTF-8"

    .line 16
    .line 17
    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/tencent/trtc/TRTCCloudListener;->onRecvCustomCmdMsg(Ljava/lang/String;II[B)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v1

    .line 26
    const-string v2, "TRTCCloudImpl"

    .line 27
    .line 28
    const-string v3, "onRecvCustomCmdMsg failed."

    .line 29
    .line 30
    invoke-static {v2, v3, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$ordered:Z

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$missMsgCount:I

    .line 38
    .line 39
    if-lez v1, :cond_0

    .line 40
    .line 41
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$userId:Ljava/lang/String;

    .line 42
    .line 43
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;->val$cmdID:I

    .line 44
    .line 45
    const/4 v3, -0x1

    .line 46
    invoke-virtual {v0, v2, p0, v3, v1}, Lcom/tencent/trtc/TRTCCloudListener;->onMissCustomCmdMsg(Ljava/lang/String;III)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
