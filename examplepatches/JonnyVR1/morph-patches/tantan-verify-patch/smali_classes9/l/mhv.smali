.class public final synthetic Ll/mhv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mhv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mhv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/aiv;->g0(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveData;

    move-result-object p0

    return-object p0
.end method
