.class public Ll/exj;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/VoiceGiftRecordUserView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/exj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/VoiceGiftRecordUserView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/exj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/exj;->b:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/VoiceGiftRecordUserView;->a(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->J8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/VoiceGiftRecordUserView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/exj;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/VoiceGiftRecordUserView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
