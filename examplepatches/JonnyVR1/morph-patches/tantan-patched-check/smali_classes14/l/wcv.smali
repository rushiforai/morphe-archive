.class public Ll/wcv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tcv;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VFrame;

.field public c:Lv/VLinear;

.field public final d:Ll/bav;

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationBar;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bav;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bav;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wcv;->d:Ll/bav;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/wcv;->e:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/wcv;->a:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/wcv;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wcv;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c(Ll/tcv;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/wcv;->e:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    move v1, v0

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-ge v1, v3, :cond_2

    .line 22
    .line 23
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 28
    .line 29
    iget-object v4, p0, Ll/wcv;->e:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    return v2

    .line 44
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return v0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u5728\u7ebf\u4ea4\u53cb"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    const/high16 v1, 0x41a80000    # 21.0f

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Ll/m9c0;->C:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 35
    .line 36
    .line 37
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 40
    .line 41
    .line 42
    sget v1, Ll/qa00;->c:I

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {v0, v3, v1, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/wcv;->a:Lv/navigationbar/VNavigationBar;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/wcv;->a:Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    sget v1, Ll/m9c0;->H:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Lv/VFrame;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ll/wcv;->b:Lv/VFrame;

    .line 66
    .line 67
    new-instance v0, Lv/VLinear;

    .line 68
    .line 69
    invoke-direct {v0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Ll/wcv;->c:Lv/VLinear;

    .line 73
    .line 74
    iget-object v1, p0, Ll/wcv;->a:Lv/navigationbar/VNavigationBar;

    .line 75
    .line 76
    iget-object v4, p0, Ll/wcv;->b:Lv/VFrame;

    .line 77
    .line 78
    const/4 v5, 0x2

    .line 79
    new-array v5, v5, [Landroid/view/View;

    .line 80
    .line 81
    aput-object v0, v5, v3

    .line 82
    .line 83
    aput-object v4, v5, v2

    .line 84
    .line 85
    invoke-virtual {v1, v5}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/wcv;->a:Lv/navigationbar/VNavigationBar;

    .line 89
    .line 90
    sget v1, Ll/nbc0;->m1:I

    .line 91
    .line 92
    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/wcv;->a:Lv/navigationbar/VNavigationBar;

    .line 100
    .line 101
    new-instance v0, Ll/ucv;

    .line 102
    .line 103
    invoke-direct {v0, p1}, Ll/ucv;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    sget p0, Ll/m9c0;->c:I

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 116
    .line 117
    .line 118
    sget p0, Ll/m9c0;->c:I

    .line 119
    .line 120
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    .line 11
    sget p2, Ll/bnl0;->f:I

    .line 12
    .line 13
    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    const/high16 p2, 0x41000000    # 8.0f

    .line 17
    .line 18
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 23
    .line 24
    iget-object p0, p0, Ll/wcv;->c:Lv/VLinear;

    .line 25
    .line 26
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wcv;->d:Ll/bav;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wcv;->b:Lv/VFrame;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/bav;->h(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tcv;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wcv;->c(Ll/tcv;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    new-instance p2, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0, p2}, Ll/wcv;->d(Ljava/util/List;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Ll/wcv;->e:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/wcv;->e:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wcv;->c:Lv/VLinear;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    :goto_0
    return-void

    .line 37
    :cond_2
    new-instance v0, Ll/vcv;

    .line 38
    .line 39
    invoke-direct {v0, p0, p1}, Ll/vcv;-><init>(Ll/wcv;Lcom/p1/mobile/android/app/Act;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
