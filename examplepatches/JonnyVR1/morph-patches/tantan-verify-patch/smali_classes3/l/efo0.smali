.class public Ll/efo0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

.field public final b:Ll/jfo0;


# direct methods
.method public constructor <init>(Ll/jfo0;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/efo0;->a:Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

    .line 5
    .line 6
    iput-object p1, p0, Ll/efo0;->b:Ll/jfo0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/efo0;->b:Ll/jfo0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/efo0;->a:Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->g(Ll/jfo0;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->b()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public K(Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;

    .line 6
    .line 7
    iget-object p0, p0, Ll/efo0;->a:Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->f(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/efo0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Y9:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/efo0;->I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/efo0;->J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
