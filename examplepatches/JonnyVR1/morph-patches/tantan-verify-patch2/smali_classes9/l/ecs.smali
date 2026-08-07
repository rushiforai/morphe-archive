.class public final synthetic Ll/ecs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hcs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ecs;->a:Ll/hcs;

    iput-object p2, p0, Ll/ecs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    iput-object p3, p0, Ll/ecs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ecs;->a:Ll/hcs;

    iget-object v1, p0, Ll/ecs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    iget-object p0, p0, Ll/ecs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-static {v0, v1, p0}, Ll/hcs;->L3(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method
