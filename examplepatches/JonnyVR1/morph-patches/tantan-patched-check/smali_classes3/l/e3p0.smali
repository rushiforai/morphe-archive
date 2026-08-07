.class public Ll/e3p0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;

.field public b:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e3p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;

    .line 5
    .line 6
    iput-object p2, p0, Ll/e3p0;->b:Ll/z20;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic H(Ll/e3p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e3p0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/e3p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e3p0;->L(Landroid/view/View;)V

    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e3p0;->b:Ll/z20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/e3p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-interface {p1, p0, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e3p0;->b:Ll/z20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/e3p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-interface {p1, p0, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/e3p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/e3p0;->b:Ll/z20;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;->g:Lv/VText;

    .line 15
    .line 16
    new-instance v1, Ll/c3p0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/c3p0;-><init>(Ll/e3p0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;->a:Lv/VDraweeView;

    .line 25
    .line 26
    new-instance v0, Ll/d3p0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/d3p0;-><init>(Ll/e3p0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;)V
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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e3p0;->J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Ga:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e3p0;->N(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e3p0;->O(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetUserItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
