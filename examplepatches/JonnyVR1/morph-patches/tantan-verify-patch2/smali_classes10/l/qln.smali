.class public final synthetic Ll/qln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tln;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/tln;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qln;->a:Ll/tln;

    iput-object p2, p0, Ll/qln;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iput-object p3, p0, Ll/qln;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qln;->a:Ll/tln;

    iget-object v1, p0, Ll/qln;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iget-object p0, p0, Ll/qln;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/tln;->L3(Ll/tln;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V

    return-void
.end method
