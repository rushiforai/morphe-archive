.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;


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

.method public static bridge synthetic P(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->R(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    return-void
.end method

.method private R(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oyt;->a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S(Lcom/p1/mobile/android/app/Act;Ll/jl80;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V
    .locals 5

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Ll/l4g0;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$a;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$a;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/pf60;

    .line 17
    .line 18
    const-string v2, "live_popup_type"

    .line 19
    .line 20
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getPopupType()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/pf60;

    .line 28
    .line 29
    const-string v3, "live_user_type"

    .line 30
    .line 31
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getUserType()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->c:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getPictureUrl()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "context_square"

    .line 58
    .line 59
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->d:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getTitle()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->e:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getText()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->f:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getGotoText()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->g:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getCancelText()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->f:Lv/VText;

    .line 99
    .line 100
    new-instance v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;

    .line 101
    .line 102
    invoke-direct {v1, p0, p1, p3, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;Ll/jl80;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->g:Lv/VText;

    .line 109
    .line 110
    new-instance v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;

    .line 111
    .line 112
    invoke-direct {v1, p0, p3, p1, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
