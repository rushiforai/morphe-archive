.class public final synthetic Ll/ae3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ll/fe3;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;Ljava/util/ArrayList;Ll/fe3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ae3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;

    iput-object p2, p0, Ll/ae3;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/ae3;->c:Ll/fe3;

    iput-object p4, p0, Ll/ae3;->d:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ae3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;

    iget-object v1, p0, Ll/ae3;->b:Ljava/util/ArrayList;

    iget-object v2, p0, Ll/ae3;->c:Ll/fe3;

    iget-object p0, p0, Ll/ae3;->d:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p0, p1}, Ll/fe3;->p(Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;Ljava/util/ArrayList;Ll/fe3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ljava/lang/Long;)V

    return-void
.end method
