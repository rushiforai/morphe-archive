.class public final synthetic Ll/x1g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x1g0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1g0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;

    invoke-static {p0, p1}, Ll/b2g0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
