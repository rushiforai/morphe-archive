.class public final synthetic Ll/rqj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uqj;

.field public final synthetic b:Ll/aiv$a;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;


# direct methods
.method public synthetic constructor <init>(Ll/uqj;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rqj;->a:Ll/uqj;

    iput-object p2, p0, Ll/rqj;->b:Ll/aiv$a;

    iput-object p3, p0, Ll/rqj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iput-object p4, p0, Ll/rqj;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rqj;->a:Ll/uqj;

    iget-object v1, p0, Ll/rqj;->b:Ll/aiv$a;

    iget-object v2, p0, Ll/rqj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iget-object p0, p0, Ll/rqj;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static {v0, v1, v2, p0, p1}, Ll/uqj;->K3(Ll/uqj;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method
