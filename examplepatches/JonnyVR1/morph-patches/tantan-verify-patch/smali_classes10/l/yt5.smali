.class public final synthetic Ll/yt5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y8s;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/y8s;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yt5;->a:Ll/y8s;

    iput-object p2, p0, Ll/yt5;->b:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Ll/yt5;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yt5;->a:Ll/y8s;

    iget-object v1, p0, Ll/yt5;->b:Lkotlin/jvm/functions/Function1;

    iget-object p0, p0, Ll/yt5;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {v0, v1, p0, p1}, Ll/au5;->a(Ll/y8s;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
