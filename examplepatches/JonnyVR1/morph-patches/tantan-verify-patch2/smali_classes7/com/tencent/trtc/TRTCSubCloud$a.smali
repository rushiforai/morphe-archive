.class Lcom/tencent/trtc/TRTCSubCloud$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/trtc/TRTCSubCloud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/trtc/TRTCSubCloud;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$a;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$a;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/tencent/trtc/TRTCSubCloud;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$6200(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    new-instance v3, Lcom/tencent/trtc/TRTCSubCloud$a$1;

    .line 25
    .line 26
    invoke-direct {v3, p0, v1}, Lcom/tencent/trtc/TRTCSubCloud$a$1;-><init>(Lcom/tencent/trtc/TRTCSubCloud$a;Ljava/util/ArrayList;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$6300(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/trtc/TRTCCloudListener;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Lcom/tencent/trtc/TRTCSubCloud$a$2;

    .line 37
    .line 38
    invoke-direct {v3, p0, v2, v1}, Lcom/tencent/trtc/TRTCSubCloud$a$2;-><init>(Lcom/tencent/trtc/TRTCSubCloud$a;Lcom/tencent/trtc/TRTCCloudListener;Ljava/util/ArrayList;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$6400(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$6500(Lcom/tencent/trtc/TRTCSubCloud;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-lez p0, :cond_1

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$6800(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/basic/util/e;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$6600(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$6700(Lcom/tencent/trtc/TRTCSubCloud;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    int-to-long v2, v0

    .line 63
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method
