.class public Ll/b9t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z8t;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lv/navigationbar/VNavigationBar;

.field public b:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;

.field public c:Ll/z8t;

.field public d:Lv/VText;

.field public final e:Landroid/view/View;

.field public final f:Landroid/view/View;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationBar;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b9t;->e:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Ll/b9t;->f:Landroid/view/View;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/b9t;->r()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/b9t;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b9t;->c(Landroid/view/View;)V

    return-void
.end method

.method private synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b9t;->c:Ll/z8t;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/b9t;->f:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ll/bnl0;->G0(Z)I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/b9t;->C0()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v2, Ll/xec0;->O0:I

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;

    .line 27
    .line 28
    iput-object v0, p0, Ll/b9t;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;

    .line 29
    .line 30
    iget-object v2, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    new-array v4, v1, [Landroid/view/View;

    .line 33
    .line 34
    const/4 v5, 0x0

    .line 35
    aput-object v0, v4, v5

    .line 36
    .line 37
    invoke-virtual {v2, v4}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Lv/VText;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/b9t;->C0()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-direct {v0, v2}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/b9t;->d:Lv/VText;

    .line 50
    .line 51
    const/high16 v2, 0x41a80000    # 21.0f

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/b9t;->d:Lv/VText;

    .line 57
    .line 58
    const-string v2, "#cc000000"

    .line 59
    .line 60
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/b9t;->d:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {v0, v3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/b9t;->d:Lv/VText;

    .line 73
    .line 74
    sget v1, Ll/qa00;->c:I

    .line 75
    .line 76
    invoke-virtual {v0, v5, v1, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 80
    .line 81
    iget-object v1, p0, Ll/b9t;->d:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/b9t;->d(Ljava/lang/Boolean;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 102
    .line 103
    new-instance v1, Ll/a9t;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/a9t;-><init>(Ll/b9t;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 112
    .line 113
    sget v0, Ll/nbc0;->D1:I

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 116
    .line 117
    .line 118
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 11
    .line 12
    return-object p0
.end method

.method public b(Ll/z8t;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b9t;->c:Ll/z8t;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b9t;->d:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object v0, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/b9t;->d:Lv/VText;

    .line 19
    .line 20
    const-string p1, "\u9752\u5c11\u5e74\u6a21\u5f0f"

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Ll/b9t;->C0()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget v1, Ll/nbc0;->e:I

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/b9t;->d:Lv/VText;

    .line 40
    .line 41
    const-string p1, "\u76f4\u64ad"

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/b9t;->C0()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/nbc0;->G0:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/b9t;->d:Lv/VText;

    .line 30
    .line 31
    const-string v0, "#FFFFFF"

    .line 32
    .line 33
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/b9t;->e:Landroid/view/View;

    .line 41
    .line 42
    sget p1, Ll/nbc0;->D1:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p1, p0, Ll/b9t;->e:Landroid/view/View;

    .line 49
    .line 50
    sget v0, Ll/nbc0;->E1:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/b9t;->C0()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget v1, Ll/nbc0;->e:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/b9t;->d:Lv/VText;

    .line 71
    .line 72
    const-string p1, "#cc000000"

    .line 73
    .line 74
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public f(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b9t;->c:Ll/z8t;

    .line 2
    .line 3
    new-instance v1, Ll/evs;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/evs;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "p_live_featured"

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object v0, p0, Ll/b9t;->e:Landroid/view/View;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    sget p1, Ll/nbc0;->E1:I

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/b9t;->f:Landroid/view/View;

    .line 37
    .line 38
    sget v0, Ll/nbc0;->E1:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/b9t;->C0()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v1, Ll/nbc0;->e:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/b9t;->d:Lv/VText;

    .line 59
    .line 60
    const-string p1, "#cc000000"

    .line 61
    .line 62
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    sget p1, Ll/nbc0;->D1:I

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/b9t;->f:Landroid/view/View;

    .line 76
    .line 77
    sget v0, Ll/nbc0;->D1:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/b9t;->d:Lv/VText;

    .line 83
    .line 84
    const-string v0, "#FFFFFF"

    .line 85
    .line 86
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/b9t;->a:Lv/navigationbar/VNavigationBar;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/b9t;->C0()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    sget v0, Ll/nbc0;->G0:I

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p1, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z8t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b9t;->b(Ll/z8t;)V

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
