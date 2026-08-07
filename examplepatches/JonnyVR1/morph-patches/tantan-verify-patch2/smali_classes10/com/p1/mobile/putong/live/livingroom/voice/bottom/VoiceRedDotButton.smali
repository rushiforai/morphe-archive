.class public Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/TextView;

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;II)V
    .locals 1

    .line 1
    const-string v0, "context_single_room"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->a:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2, p3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lez p1, :cond_1

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->c:Landroid/widget/TextView;

    .line 11
    .line 12
    const/16 v2, 0x63

    .line 13
    .line 14
    if-le p1, v2, :cond_0

    .line 15
    .line 16
    const-string v2, "99+"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->b:Landroid/view/View;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :goto_1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->d:I

    .line 36
    .line 37
    return-void
.end method

.method public g0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->c:Landroid/widget/TextView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->d:I

    .line 16
    .line 17
    if-lez p0, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    :cond_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->A2:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->Z4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->b:Landroid/view/View;

    .line 21
    .line 22
    sget v0, Ll/mdc0;->q7:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->c:Landroid/widget/TextView;

    .line 31
    .line 32
    return-void
.end method

.method public setLocalIcon(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRedDotCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceRedDotButton;->d:I

    .line 2
    .line 3
    return-void
.end method
