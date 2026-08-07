.class Lcom/tencent/trtc/TRTCSubCloud$a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/trtc/TRTCCloudListener;

.field final synthetic b:Ljava/util/ArrayList;

.field final synthetic c:Lcom/tencent/trtc/TRTCSubCloud$a;


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud$a;Lcom/tencent/trtc/TRTCCloudListener;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$a$2;->c:Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/trtc/TRTCSubCloud$a$2;->a:Lcom/tencent/trtc/TRTCCloudListener;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/trtc/TRTCSubCloud$a$2;->b:Ljava/util/ArrayList;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$a$2;->a:Lcom/tencent/trtc/TRTCCloudListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud$a$2;->b:Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/tencent/trtc/TRTCCloudListener;->onUserVoiceVolume(Ljava/util/ArrayList;I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
