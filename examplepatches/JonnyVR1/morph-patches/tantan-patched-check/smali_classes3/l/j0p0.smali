.class public Ll/j0p0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j0p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;

    .line 5
    .line 6
    iput-object p2, p0, Ll/j0p0;->c:Ll/y20;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic H(Ll/j0p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j0p0;->J(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/j0p0;->c:Ll/y20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/j0p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j0p0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;

    .line 5
    .line 6
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/j0p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/j0p0;->c:Ll/y20;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->b:Landroid/widget/TextView;

    .line 15
    .line 16
    new-instance v0, Ll/i0p0;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/i0p0;-><init>(Ll/j0p0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j0p0;->I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->va:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j0p0;->K(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j0p0;->L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
