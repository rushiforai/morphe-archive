.class public final synthetic Ll/fhe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public final synthetic b:Lcom/momo/xeengine/gift/GiftEntity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Lcom/momo/xeengine/gift/GiftEntity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fhe;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    iput-object p2, p0, Ll/fhe;->b:Lcom/momo/xeengine/gift/GiftEntity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fhe;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    iget-object p0, p0, Ll/fhe;->b:Lcom/momo/xeengine/gift/GiftEntity;

    invoke-static {v0, p0}, Ll/jhe;->k(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Lcom/momo/xeengine/gift/GiftEntity;)V

    return-void
.end method
