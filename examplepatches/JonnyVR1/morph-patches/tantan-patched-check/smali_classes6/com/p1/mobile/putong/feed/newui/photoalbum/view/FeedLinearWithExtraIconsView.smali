.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
.super Lcom/p1/mobile/putong/feed/newui/view/FeedLinearFillerMeasure;
.source "SourceFile"


# instance fields
.field public b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lv/VImage;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedLinearFillerMeasure;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->b:Ljava/util/Map;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->c:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedLinearFillerMeasure;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->b:Ljava/util/Map;

    .line 21
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->c:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/view/FeedLinearFillerMeasure;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->b:Ljava/util/Map;

    .line 24
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->g(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v2, -0x2

    .line 19
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    const/16 v2, 0x10

    .line 23
    .line 24
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v1, v2, p2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->c:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final e(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Landroid/graphics/Rect;)Lv/VImage;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string p0, "IS_CACHE"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    new-instance v0, Lv/VImage;

    .line 22
    .line 23
    invoke-direct {v0, p2}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 27
    .line 28
    iget v1, p3, Landroid/graphics/Rect;->right:I

    .line 29
    .line 30
    iget v2, p3, Landroid/graphics/Rect;->bottom:I

    .line 31
    .line 32
    invoke-direct {p2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    iget p3, p3, Landroid/graphics/Rect;->top:I

    .line 36
    .line 37
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 38
    .line 39
    const/16 p3, 0x10

    .line 40
    .line 41
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 42
    .line 43
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->b:Ljava/util/Map;

    .line 47
    .line 48
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public final f(Landroid/graphics/Rect;)Landroid/widget/TextView;
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 13
    .line 14
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    .line 15
    .line 16
    invoke-direct {p0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    iput p1, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    const/16 p0, 0x11

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 29
    .line 30
    .line 31
    const/4 p0, -0x1

    .line 32
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    const/high16 p0, 0x41200000    # 10.0f

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 38
    .line 39
    .line 40
    const/high16 p0, 0x40400000    # 3.0f

    .line 41
    .line 42
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-virtual {v0, p1, v1, p0, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/4 p1, 0x1

    .line 59
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public final g(Landroid/view/View;)Z
    .locals 0

    .line 1
    const-string p0, "IS_CACHE"

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h()Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/high16 v1, 0x40800000    # 4.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, 0x41800000    # 16.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-direct {v0, v1, v4, v3, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/graphics/Rect;)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/graphics/Rect;)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 2

    .line 1
    const-string v0, "CERTIFICATION_ICON"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->e(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Landroid/graphics/Rect;)Lv/VImage;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    invoke-interface {v1, p1, p2, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->d(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/high16 v1, 0x40800000    # 4.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/high16 v3, 0x41880000    # 17.0f

    .line 10
    .line 11
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, -0x2

    .line 17
    invoke-direct {v0, v2, v4, v5, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->f(Landroid/graphics/Rect;)Landroid/widget/TextView;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    .line 25
    .line 26
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v4, "#1Afe7e1d"

    .line 30
    .line 31
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    int-to-float v4, v4

    .line 43
    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    const/high16 v3, 0x41200000    # 10.0f

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const/4 v4, 0x1

    .line 59
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 60
    .line 61
    .line 62
    const-string v3, "\u540c\u57ce"

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/high16 v4, 0x3fc00000    # 1.5f

    .line 72
    .line 73
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    const/high16 v5, 0x40200000    # 2.5f

    .line 82
    .line 83
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    invoke-virtual {v2, v3, v4, v1, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 88
    .line 89
    .line 90
    const-string v1, "#fe7e1d"

    .line 91
    .line 92
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->d(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 100
    .line 101
    .line 102
    return-object p0
.end method

.method public l(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/high16 v1, 0x41600000    # 14.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, -0x2

    .line 11
    invoke-direct {v0, p1, v2, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->f(Landroid/graphics/Rect;)Landroid/widget/TextView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v1, Ll/lbc0;->D3:I

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->j0:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->d(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public m(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/high16 v1, 0x41600000    # 14.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, -0x2

    .line 11
    invoke-direct {v0, p1, v2, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->f(Landroid/graphics/Rect;)Landroid/widget/TextView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v1, Ll/lbc0;->U:I

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u95ee\u7b54"

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->d(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isQATopicType()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->m(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->l(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicLinkType()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->o(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;

    .line 29
    .line 30
    .line 31
    :cond_2
    return-object p0
.end method

.method public o(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/high16 v1, 0x41600000    # 14.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, -0x2

    .line 11
    invoke-direct {v0, p1, v2, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->f(Landroid/graphics/Rect;)Landroid/widget/TextView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v1, Ll/lbc0;->W:I

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u6d3b\u52a8"

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->d(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public setFillerIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedLinearFillerMeasure;->a:I

    .line 2
    .line 3
    return-void
.end method
