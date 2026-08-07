.class public Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"

# interfaces
.implements Ll/sqq;


# instance fields
.field public a:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->actionListener:Ll/z20;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    invoke-interface {p1, p0, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kqq;->a(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kqq;->b(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-interface {p0, v0, p2, p1}, Ll/sqq;->c(Landroid/widget/TextView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x2

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p2}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    const/4 v1, 0x6

    .line 44
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 45
    .line 46
    invoke-static {v0, p2, v1, v2}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    const/high16 p2, 0x41400000    # 12.0f

    .line 54
    .line 55
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    iput p2, p3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 60
    .line 61
    iput p2, p3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 62
    .line 63
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;->a:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-virtual {p3, p2, p2, p2, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 66
    .line 67
    .line 68
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->withShadow:Z

    .line 69
    .line 70
    if-eqz p2, :cond_1

    .line 71
    .line 72
    const/high16 p2, 0x40c00000    # 6.0f

    .line 73
    .line 74
    :goto_0
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    int-to-float p2, p2

    .line 79
    goto :goto_1

    .line 80
    :cond_1
    const/4 p2, 0x0

    .line 81
    goto :goto_0

    .line 82
    :goto_1
    invoke-virtual {p0, p2}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 83
    .line 84
    .line 85
    new-instance p2, Ll/jqq;

    .line 86
    .line 87
    invoke-direct {p2, p1}, Ll/jqq;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogButton;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
