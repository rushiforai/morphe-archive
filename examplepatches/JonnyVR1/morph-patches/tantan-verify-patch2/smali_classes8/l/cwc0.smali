.class public final synthetic Ll/cwc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/gwc0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;


# direct methods
.method public synthetic constructor <init>(Ll/gwc0;Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cwc0;->a:Ll/gwc0;

    iput-object p2, p0, Ll/cwc0;->b:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cwc0;->a:Ll/gwc0;

    iget-object p0, p0, Ll/cwc0;->b:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    invoke-static {v0, p0, p1}, Ll/gwc0;->e(Ll/gwc0;Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;Landroid/content/DialogInterface;)V

    return-void
.end method
