.class public Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->s(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$c;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$c;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    invoke-static {p2}, Ll/rcu;->a(Lcom/tantan/library/svga/data/cache/Resource;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->f(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
