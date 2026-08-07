.class public Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;


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

.method public static synthetic P(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tb0;->a(Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S(Ll/x20;Ll/x20;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/vb0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Ll/vb0;->d()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->f:Lv/VText;

    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->e:Lv/VText;

    .line 23
    .line 24
    const-string v2, "#bfbfbf"

    .line 25
    .line 26
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->c:Lv/VText;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->d:Lv/VImage;

    .line 39
    .line 40
    sget v1, Ll/dbc0;->l:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->g:Lv/VText;

    .line 46
    .line 47
    sget v1, Lcom/p1/mobile/putong/core/R$string;->E:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->f:Lv/VText;

    .line 54
    .line 55
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Wi:I

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->e:Lv/VText;

    .line 61
    .line 62
    const-string v2, "#212121"

    .line 63
    .line 64
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/vb0;->d()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->c:Lv/VText;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    const/4 v0, 0x1

    .line 80
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->d:Lv/VImage;

    .line 88
    .line 89
    sget v1, Ll/dbc0;->k:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->g:Lv/VText;

    .line 95
    .line 96
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Qs:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 99
    .line 100
    .line 101
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->g:Lv/VText;

    .line 102
    .line 103
    new-instance v1, Ll/rb0;

    .line 104
    .line 105
    invoke-direct {v1, p1}, Ll/rb0;-><init>(Ll/x20;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->h:Lv/VText;

    .line 112
    .line 113
    new-instance p1, Ll/sb0;

    .line 114
    .line 115
    invoke-direct {p1, p2}, Ll/sb0;-><init>(Ll/x20;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->R(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
