.class public final Ll/x6h0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/x6h0$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/xj90;

.field public c:Landroid/widget/TextSwitcher;

.field public d:Ljava/lang/String;

.field public e:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/xj90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x6h0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/x6h0;->b:Ll/xj90;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/x6h0;Ll/x6h0$a;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x6h0;->i(Ll/x6h0$a;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final b(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 4
    .line 5
    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 6
    .line 7
    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 17
    .line 18
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 19
    .line 20
    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 21
    .line 22
    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 23
    .line 24
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object p0

    .line 30
    :cond_1
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    const/4 p1, -0x1

    .line 33
    const/4 v0, -0x2

    .line 34
    invoke-direct {p0, p1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/widget/TextSwitcher;
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->b:Lv/VLinear;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p0, v1}, Ll/x6h0;->e(Landroid/widget/TextView;)Ll/x6h0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v4, Landroid/widget/TextSwitcher;

    .line 35
    .line 36
    iget-object v5, p0, Ll/x6h0;->a:Landroid/content/Context;

    .line 37
    .line 38
    invoke-direct {v4, v5}, Landroid/widget/TextSwitcher;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iput-object v4, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 42
    .line 43
    invoke-virtual {p0, v3}, Ll/x6h0;->b(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ll/x6h0;->d(Ll/x6h0$a;)Landroid/widget/ViewSwitcher$ViewFactory;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v3, v1}, Landroid/widget/ViewSwitcher;->setFactory(Landroid/widget/ViewSwitcher$ViewFactory;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Ll/x6h0;->h(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 66
    .line 67
    invoke-virtual {v0, p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    iput-object p2, p0, Ll/x6h0;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    iget-object p0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_2
    :goto_0
    return-object v1
.end method

.method public final d(Ll/x6h0$a;)Landroid/widget/ViewSwitcher$ViewFactory;
    .locals 1

    .line 1
    new-instance v0, Ll/w6h0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/w6h0;-><init>(Ll/x6h0;Ll/x6h0$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final e(Landroid/widget/TextView;)Ll/x6h0$a;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/x6h0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 16
    .line 17
    div-float/2addr v0, p0

    .line 18
    new-instance p0, Ll/x6h0$a;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1}, Landroid/widget/TextView;->getGravity()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-direct {p0, v1, v0, v2, p1}, Ll/x6h0$a;-><init>(IFILandroid/graphics/Typeface;)V

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    instance-of v1, p0, Landroid/widget/TextView;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    check-cast p0, Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    return-object v0
.end method

.method public g()Landroid/widget/TextSwitcher;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x6h0;->b:Ll/xj90;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/xj90;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/x6h0;->b:Ll/xj90;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/xj90;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_0
    iget-object v2, p0, Ll/x6h0;->d:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    if-nez v3, :cond_3

    .line 48
    .line 49
    invoke-static {p2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_2

    .line 54
    .line 55
    move-object v2, v1

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    move-object v2, v0

    .line 58
    :cond_3
    :goto_1
    iget-object p2, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 59
    .line 60
    invoke-virtual {p2, v2}, Landroid/widget/TextSwitcher;->setCurrentText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    move-object v0, v1

    .line 66
    :cond_4
    iget-object p1, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Landroid/widget/TextSwitcher;->setCurrentText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iput-object v2, p0, Ll/x6h0;->d:Ljava/lang/String;

    .line 77
    .line 78
    :cond_5
    :goto_2
    return-void
.end method

.method public final synthetic i(Ll/x6h0$a;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    iget-object p0, p0, Ll/x6h0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    const/4 v2, -0x2

    .line 12
    invoke-direct {p0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    iget p0, p1, Ll/x6h0$a;->a:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x2

    .line 24
    iget v1, p1, Ll/x6h0$a;->b:F

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Ll/x6h0$a;->d:Landroid/graphics/Typeface;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, p0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    invoke-virtual {v0, p0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget p0, p1, Ll/x6h0$a;->c:I

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 45
    .line 46
    .line 47
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLines(I)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne p1, v0, :cond_1

    .line 11
    .line 12
    invoke-static {p2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_1

    .line 17
    .line 18
    move v3, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move v3, v1

    .line 21
    :goto_0
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    if-ne p2, v0, :cond_2

    .line 28
    .line 29
    move v1, v2

    .line 30
    :cond_2
    if-nez v3, :cond_3

    .line 31
    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_3
    iget-object p1, p0, Ll/x6h0;->b:Ll/xj90;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/xj90;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p2, p0, Ll/x6h0;->b:Ll/xj90;

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ll/xj90;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    if-eqz p1, :cond_6

    .line 50
    .line 51
    if-nez p2, :cond_4

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_4
    if-eqz v3, :cond_5

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_5
    move-object p1, p2

    .line 58
    :goto_1
    invoke-virtual {p0}, Ll/x6h0;->f()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-nez p2, :cond_6

    .line 67
    .line 68
    iget-object p2, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-virtual {p2, v0}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroid/widget/TextSwitcher;->setCurrentText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    :cond_6
    :goto_2
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x6h0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne p2, v0, :cond_0

    .line 10
    .line 11
    move p2, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p2, v1

    .line 14
    :goto_0
    iget-object v3, p0, Ll/x6h0;->b:Ll/xj90;

    .line 15
    .line 16
    invoke-virtual {v3, v0}, Ll/xj90;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, p0, Ll/x6h0;->b:Ll/xj90;

    .line 21
    .line 22
    sget-object v5, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    invoke-virtual {v4, v5}, Ll/xj90;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    move v0, v2

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v0, v1

    .line 33
    :goto_1
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    move v1, v2

    .line 42
    :cond_2
    const/4 p1, 0x0

    .line 43
    if-eqz p4, :cond_3

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-nez p2, :cond_4

    .line 52
    .line 53
    iget-object p2, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 59
    .line 60
    invoke-virtual {p2, p1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 64
    .line 65
    invoke-virtual {p0, v3}, Landroid/widget/TextSwitcher;->setCurrentText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    if-eqz p2, :cond_4

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-nez p2, :cond_4

    .line 78
    .line 79
    iget-object p2, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 80
    .line 81
    invoke-virtual {p2, p1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 85
    .line 86
    invoke-virtual {p2, p1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 90
    .line 91
    invoke-virtual {p0, v4}, Landroid/widget/TextSwitcher;->setCurrentText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    :cond_4
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-object p2, p0, Ll/x6h0;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    iget-object v0, p0, Ll/x6h0;->b:Ll/xj90;

    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ll/xj90;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p0}, Ll/x6h0;->f()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-virtual {p0, p1, p2, v1, v0}, Ll/x6h0;->l(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/x6h0;->c:Landroid/widget/TextSwitcher;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/x6h0;->d:Ljava/lang/String;

    .line 39
    .line 40
    :cond_3
    :goto_0
    return-void
.end method
