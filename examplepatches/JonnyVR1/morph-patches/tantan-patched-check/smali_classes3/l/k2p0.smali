.class public Ll/k2p0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

.field public c:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k2p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;

    .line 5
    .line 6
    iput-object p2, p0, Ll/k2p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 7
    .line 8
    iput-object p3, p0, Ll/k2p0;->c:Ll/z20;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic H(Ll/k2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k2p0;->J(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/k2p0;->c:Ll/z20;

    .line 2
    .line 3
    iget-object v0, p0, Ll/k2p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;

    .line 4
    .line 5
    iget-object p0, p0, Ll/k2p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 6
    .line 7
    invoke-interface {p1, v0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/k2p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/k2p0;->c:Ll/z20;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->d:Lv/VText;

    .line 15
    .line 16
    new-instance v0, Ll/j2p0;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/j2p0;-><init>(Ll/k2p0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;)V
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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k2p0;->I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Aa:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k2p0;->K(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k2p0;->L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
