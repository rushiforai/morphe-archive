.class public final synthetic Ll/l6g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6g0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6g0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResource;

    invoke-static {p0, p1}, Ll/p6g0;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResource;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
