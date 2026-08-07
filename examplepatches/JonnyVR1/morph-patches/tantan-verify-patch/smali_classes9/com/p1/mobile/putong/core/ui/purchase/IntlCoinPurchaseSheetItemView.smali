.class public Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VRelative;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/w7n;->a(Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/purchase/d;ILl/y20;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;->a:Lv/VRelative;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    sget v2, Ll/jbc0;->G9:I

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    sget v2, Ll/jbc0;->F9:I

    .line 28
    .line 29
    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;->d:Lv/VImage;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    if-ne p2, p4, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_2

    .line 42
    .line 43
    const/4 p2, 0x1

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move p2, v2

    .line 46
    :goto_2
    invoke-static {v1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;->b:Lv/VText;

    .line 50
    .line 51
    const/4 p4, 0x3

    .line 52
    invoke-static {p4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;->b:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-le v3, p4, :cond_3

    .line 78
    .line 79
    const/16 p4, 0x14

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_3
    const/16 p4, 0x18

    .line 83
    .line 84
    :goto_3
    invoke-static {p2, v2, p4}, Ll/z7a;->p0(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;->c:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    invoke-static {p2, p4}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    new-instance p2, Ll/v7n;

    .line 101
    .line 102
    invoke-direct {p2, p3, p1}, Ll/v7n;-><init>(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
