.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onRequestToken(ILjava/lang/String;J[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$tinyID:J

.field final synthetic val$token:[B


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J[B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;->val$tinyID:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;->val$token:[B

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 4
    .line 5
    iget-wide v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;->val$tinyID:J

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->setTinyId(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 15
    .line 16
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;->val$token:[B

    .line 21
    .line 22
    invoke-virtual {v1, v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->setToken(Landroid/content/Context;[B)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
