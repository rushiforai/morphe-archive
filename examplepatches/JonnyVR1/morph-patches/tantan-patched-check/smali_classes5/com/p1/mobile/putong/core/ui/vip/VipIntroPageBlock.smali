.class public Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Z

.field public f:Z

.field public g:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vnb;->q1()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    .line 9
    .line 10
    invoke-static {}, Ll/vnb;->p1()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->f:Z

    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const p1, 0x3f333333    # 0.7f

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const p1, 0x3f666666    # 0.9f

    .line 25
    .line 26
    .line 27
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->g:F

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    .line 32
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->f:Z

    .line 33
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->g:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    .line 36
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->f:Z

    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->g:F

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sql0;->a(Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->c:Lv/VText;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/high16 v1, 0x41900000    # 18.0f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/high16 v1, 0x41980000    # 19.0f

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->d:Lv/VText;

    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    const/high16 v1, 0x41400000    # 12.0f

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const/high16 v1, 0x41500000    # 13.0f

    .line 25
    .line 26
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->c:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 36
    .line 37
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 38
    .line 39
    int-to-float v1, v1

    .line 40
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->g:F

    .line 41
    .line 42
    mul-float/2addr v1, v2

    .line 43
    float-to-int v1, v1

    .line 44
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->c:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->d:Lv/VText;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 58
    .line 59
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 60
    .line 61
    int-to-float v1, v1

    .line 62
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->g:F

    .line 63
    .line 64
    mul-float/2addr v1, v2

    .line 65
    float-to-int v1, v1

    .line 66
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->d:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->e:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->f:Z

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->b()V

    .line 10
    .line 11
    .line 12
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    if-ne p3, p1, :cond_2

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->c:Lv/VText;

    .line 17
    .line 18
    const p3, -0x173576

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->d:Lv/VText;

    .line 25
    .line 26
    const p3, 0x66e8ca8a

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->c:Lv/VText;

    .line 33
    .line 34
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->P6:I

    .line 35
    .line 36
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->d:Lv/VText;

    .line 40
    .line 41
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->O6:I

    .line 42
    .line 43
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->b:Lv/VDraweeView;

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->b:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
