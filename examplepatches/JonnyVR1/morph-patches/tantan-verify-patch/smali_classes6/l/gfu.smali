.class public final synthetic Ll/gfu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gfu;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    iput-object p2, p0, Ll/gfu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gfu;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    iget-object p0, p0, Ll/gfu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    check-cast p1, Ljava/lang/Long;

    check-cast p2, Landroid/view/View;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->b(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Long;Landroid/view/View;)V

    return-void
.end method
