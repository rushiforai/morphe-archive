.class public final synthetic Ll/nd60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y8s;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nd60;->a:Ll/y8s;

    iput-object p2, p0, Ll/nd60;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iput-object p3, p0, Ll/nd60;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nd60;->a:Ll/y8s;

    iget-object v1, p0, Ll/nd60;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iget-object p0, p0, Ll/nd60;->c:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {v0, v1, p0, p1}, Ll/vd60;->e(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
