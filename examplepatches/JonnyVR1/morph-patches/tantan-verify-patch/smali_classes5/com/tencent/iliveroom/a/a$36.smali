.class Lcom/tencent/iliveroom/a/a$36;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setAudioExpandCountPerBlock(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$36;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$36;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$36;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/iliveroom/a/a$36;->a:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->p(Lcom/tencent/iliveroom/a/a;I)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$36;->b:Lcom/tencent/iliveroom/a/a;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->M(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Lcom/tencent/iliveroom/a/a$36$1;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/tencent/iliveroom/a/a$36$1;-><init>(Lcom/tencent/iliveroom/a/a$36;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
