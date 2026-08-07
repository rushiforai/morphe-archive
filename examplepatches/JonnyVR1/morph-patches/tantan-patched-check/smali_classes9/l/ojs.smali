.class public final synthetic Ll/ojs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qjs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/qjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ojs;->a:Ll/qjs;

    iput-object p2, p0, Ll/ojs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ojs;->a:Ll/qjs;

    iget-object p0, p0, Ll/ojs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-static {v0, p0}, Ll/qjs;->b(Ll/qjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method
