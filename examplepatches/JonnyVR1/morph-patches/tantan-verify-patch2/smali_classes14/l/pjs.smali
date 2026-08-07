.class public final synthetic Ll/pjs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rjs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/rjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pjs;->a:Ll/rjs;

    iput-object p2, p0, Ll/pjs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pjs;->a:Ll/rjs;

    iget-object p0, p0, Ll/pjs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-static {v0, p0}, Ll/rjs;->b(Ll/rjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method
