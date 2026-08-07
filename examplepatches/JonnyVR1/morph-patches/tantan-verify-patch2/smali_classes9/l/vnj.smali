.class public final synthetic Ll/vnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vnj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;

    iput-object p2, p0, Ll/vnj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vnj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;

    iget-object p0, p0, Ll/vnj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;)V

    return-void
.end method
