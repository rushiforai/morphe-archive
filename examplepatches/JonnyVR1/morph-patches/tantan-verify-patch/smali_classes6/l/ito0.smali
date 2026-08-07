.class public final Ll/ito0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000c\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0004\u0010\u0010R\u0014\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0006\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/ito0;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;",
        "Ll/vpn0$a;",
        "itemData",
        "",
        "isWhiteTheme",
        "<init>",
        "(Ll/vpn0$a;Z)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "H",
        "(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;)V",
        "Ll/vpn0$a;",
        "Z",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final isWhiteTheme:Z

.field private final itemData:Ll/vpn0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/vpn0$a;Z)V
    .locals 0
    .param p1    # Ll/vpn0$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/ito0;->itemData:Ll/vpn0$a;

    .line 8
    .line 9
    iput-boolean p2, p0, Ll/ito0;->isWhiteTheme:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ito0;->itemData:Ll/vpn0$a;

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/ito0;->isWhiteTheme:Z

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;->a(Ll/vpn0$a;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ito0;->H(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceShipLinkItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
