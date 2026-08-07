.class public Ll/d7o0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d7o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    iput-boolean p1, p0, Ll/d7o0;->b:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/d7o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/d7o0;->b:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->E9:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d7o0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
