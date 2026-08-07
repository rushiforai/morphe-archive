.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/g1t;


# instance fields
.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/xec0;->w:I

    .line 5
    .line 6
    invoke-static {p1, v0, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->h0(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public P(Ll/m4s;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/m4s;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "live"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->f:Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v2, "Live"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->f:Landroid/widget/TextView;

    .line 21
    .line 22
    const-string v2, "#FF0DC1"

    .line 23
    .line 24
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v2, "Chatting"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->f:Landroid/widget/TextView;

    .line 38
    .line 39
    const-string v2, "#00dd8d"

    .line 40
    .line 41
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->h:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/m4s;->a()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const/4 v3, 0x6

    .line 55
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->i0(Ljava/lang/String;I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->i:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/m4s;->c()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const/16 v3, 0x18

    .line 69
    .line 70
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->i0(Ljava/lang/String;I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->e:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/m4s;->b()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const-string v2, "context_common"

    .line 84
    .line 85
    invoke-static {v2, v1, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 89
    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    const-string v1, "https://auto.tancdn.com/v1/raw/c019f07a-76e8-45dc-a56c-df29985e7a3e10.pdf"

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_1
    const-string v1, "https://auto.tancdn.com/v1/raw/376ae722-c0a1-418c-a0cc-262f9c0c903910.pdf"

    .line 96
    .line 97
    :goto_1
    const/4 v2, -0x1

    .line 98
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 102
    .line 103
    if-eqz v0, :cond_2

    .line 104
    .line 105
    const-string p1, "https://auto.tancdn.com/v1/raw/7bac3ca8-6e95-4727-a9ad-b7aba5e0cd9010.pdf"

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    const-string p1, "https://auto.tancdn.com/v1/raw/a42a3c52-5f27-445e-8582-d52703a2b0f111.pdf"

    .line 109
    .line 110
    :goto_2
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public getView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s7n;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i0(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-gt p0, p2, :cond_1

    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    invoke-virtual {p1, p0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "..."

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlChatLivingStateView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method
