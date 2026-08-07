.class public final synthetic Ll/hto0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkCardView;

.field public final synthetic b:Ll/vpn0$a;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkCardView;Ll/vpn0$a;Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hto0;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkCardView;

    iput-object p2, p0, Ll/hto0;->b:Ll/vpn0$a;

    iput-object p3, p0, Ll/hto0;->c:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hto0;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkCardView;

    iget-object v1, p0, Ll/hto0;->b:Ll/vpn0$a;

    iget-object p0, p0, Ll/hto0;->c:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkCardView;->a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkCardView;Ll/vpn0$a;Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;Landroid/view/View;)V

    return-void
.end method
