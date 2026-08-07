.class public final synthetic Ll/che;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public final synthetic b:Ll/hre;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/che;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    iput-object p2, p0, Ll/che;->b:Ll/hre;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/che;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    iget-object p0, p0, Ll/che;->b:Ll/hre;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    invoke-static {v0, p0, p1}, Ll/jhe;->h(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method
