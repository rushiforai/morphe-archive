.class public Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;


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

.method public static synthetic R(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dc0;->a(Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T(Ljava/lang/Boolean;Ll/x20;Ll/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->e:Lv/VText;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->c:Lv/VText;

    .line 14
    .line 15
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Qr:I

    .line 16
    .line 17
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->d:Lv/VText;

    .line 21
    .line 22
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Xi:I

    .line 23
    .line 24
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->d:Lv/VText;

    .line 28
    .line 29
    new-instance p1, Ll/ac0;

    .line 30
    .line 31
    invoke-direct {p1, p2}, Ll/ac0;-><init>(Ll/x20;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const/4 p1, 0x1

    .line 39
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->c:Lv/VText;

    .line 43
    .line 44
    sget v0, Lcom/p1/mobile/putong/core/R$string;->F:I

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->d:Lv/VText;

    .line 50
    .line 51
    sget v0, Lcom/p1/mobile/putong/core/R$string;->E:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->d:Lv/VText;

    .line 57
    .line 58
    new-instance v0, Ll/bc0;

    .line 59
    .line 60
    invoke-direct {v0, p2}, Ll/bc0;-><init>(Ll/x20;)V

    .line 61
    .line 62
    .line 63
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->e:Lv/VText;

    .line 67
    .line 68
    new-instance p1, Ll/cc0;

    .line 69
    .line 70
    invoke-direct {p1, p3}, Ll/cc0;-><init>(Ll/x20;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->S(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
