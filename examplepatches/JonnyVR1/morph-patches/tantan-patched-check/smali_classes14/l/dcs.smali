.class public final synthetic Ll/dcs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ics;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dcs;->a:Ll/ics;

    iput-object p2, p0, Ll/dcs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    iput-object p3, p0, Ll/dcs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dcs;->a:Ll/ics;

    iget-object v1, p0, Ll/dcs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    iget-object p0, p0, Ll/dcs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-static {v0, v1, p0}, Ll/ics;->V2(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method
