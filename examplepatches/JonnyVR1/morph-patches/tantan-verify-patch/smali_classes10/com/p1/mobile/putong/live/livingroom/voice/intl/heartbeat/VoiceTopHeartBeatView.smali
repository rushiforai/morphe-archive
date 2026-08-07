.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VLinear;",
        "Ll/iam<",
        "Ll/u3p0;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v3p0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Ll/u3p0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public R(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    long-to-double p1, p1

    .line 4
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->d:Landroid/view/View;

    .line 5
    .line 6
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 7
    .line 8
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/civ;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/civ;->n()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    sget p1, Ll/obc0;->p9:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget p1, Ll/obc0;->B9:I

    .line 24
    .line 25
    :goto_0
    invoke-static {p1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u3p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->Q(Ll/u3p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->d:Landroid/view/View;

    .line 8
    .line 9
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/civ;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/civ;->n()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget v0, Ll/obc0;->p9:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget v0, Ll/obc0;->B9:I

    .line 27
    .line 28
    :goto_0
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
