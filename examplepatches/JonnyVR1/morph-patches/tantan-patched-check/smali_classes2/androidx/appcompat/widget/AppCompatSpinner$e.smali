.class public Landroidx/appcompat/widget/AppCompatSpinner$e;
.super Landroidx/appcompat/widget/b;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/AppCompatSpinner$f;


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/AppCompatSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public J:Ljava/lang/CharSequence;

.field public K:Landroid/widget/ListAdapter;

.field public final L:Landroid/graphics/Rect;

.field public M:I

.field public final synthetic N:Landroidx/appcompat/widget/AppCompatSpinner;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/AppCompatSpinner;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4}, Landroidx/appcompat/widget/b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->L:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/b;->v(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/b;->B(Z)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/b;->G(I)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Landroidx/appcompat/widget/AppCompatSpinner$e$a;

    .line 25
    .line 26
    invoke-direct {p2, p0, p1}, Landroidx/appcompat/widget/AppCompatSpinner$e$a;-><init>(Landroidx/appcompat/widget/AppCompatSpinner$e;Landroidx/appcompat/widget/AppCompatSpinner;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/b;->D(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic J(Landroidx/appcompat/widget/AppCompatSpinner$e;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/appcompat/widget/b;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public K()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v1, v1, Landroidx/appcompat/widget/AppCompatSpinner;->h:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jnl0;->b(Landroid/view/View;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, v1, Landroidx/appcompat/widget/AppCompatSpinner;->h:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, v1, Landroidx/appcompat/widget/AppCompatSpinner;->h:Landroid/graphics/Rect;

    .line 30
    .line 31
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    neg-int v0, v0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, v1, Landroidx/appcompat/widget/AppCompatSpinner;->h:Landroid/graphics/Rect;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    move v0, v1

    .line 43
    :goto_0
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v3, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    iget-object v4, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 62
    .line 63
    iget v5, v4, Landroidx/appcompat/widget/AppCompatSpinner;->g:I

    .line 64
    .line 65
    const/4 v6, -0x2

    .line 66
    if-ne v5, v6, :cond_3

    .line 67
    .line 68
    iget-object v5, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->K:Landroid/widget/ListAdapter;

    .line 69
    .line 70
    check-cast v5, Landroid/widget/SpinnerAdapter;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-virtual {v4, v5, v6}, Landroidx/appcompat/widget/AppCompatSpinner;->a(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    iget-object v5, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 81
    .line 82
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 95
    .line 96
    iget-object v6, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 97
    .line 98
    iget-object v6, v6, Landroidx/appcompat/widget/AppCompatSpinner;->h:Landroid/graphics/Rect;

    .line 99
    .line 100
    iget v7, v6, Landroid/graphics/Rect;->left:I

    .line 101
    .line 102
    sub-int/2addr v5, v7

    .line 103
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 104
    .line 105
    sub-int/2addr v5, v6

    .line 106
    if-le v4, v5, :cond_2

    .line 107
    .line 108
    move v4, v5

    .line 109
    :cond_2
    sub-int v5, v3, v1

    .line 110
    .line 111
    sub-int/2addr v5, v2

    .line 112
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    invoke-virtual {p0, v4}, Landroidx/appcompat/widget/b;->x(I)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    const/4 v4, -0x1

    .line 121
    if-ne v5, v4, :cond_4

    .line 122
    .line 123
    sub-int v4, v3, v1

    .line 124
    .line 125
    sub-int/2addr v4, v2

    .line 126
    invoke-virtual {p0, v4}, Landroidx/appcompat/widget/b;->x(I)V

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_4
    invoke-virtual {p0, v5}, Landroidx/appcompat/widget/b;->x(I)V

    .line 131
    .line 132
    .line 133
    :goto_1
    iget-object v4, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 134
    .line 135
    invoke-static {v4}, Ll/jnl0;->b(Landroid/view/View;)Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-eqz v4, :cond_5

    .line 140
    .line 141
    sub-int/2addr v3, v2

    .line 142
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->r()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    sub-int/2addr v3, v1

    .line 147
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatSpinner$e;->L()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    sub-int/2addr v3, v1

    .line 152
    add-int/2addr v0, v3

    .line 153
    goto :goto_2

    .line 154
    :cond_5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatSpinner$e;->L()I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    add-int/2addr v1, v2

    .line 159
    add-int/2addr v0, v1

    .line 160
    :goto_2
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/b;->i(I)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public L()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->M:I

    .line 2
    .line 3
    return p0
.end method

.method public M(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/kkl0;->O(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->L:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public c(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->M:I

    .line 2
    .line 3
    return-void
.end method

.method public d(II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatSpinner$e;->K()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/b;->A(I)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Landroidx/appcompat/widget/b;->show()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/appcompat/widget/b;->g()Landroid/widget/ListView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v1, v2}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Landroid/view/View;->setTextDirection(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Landroid/view/View;->setTextAlignment(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getSelectedItemPosition()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/b;->H(I)V

    .line 36
    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->N:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    new-instance p2, Landroidx/appcompat/widget/AppCompatSpinner$e$b;

    .line 50
    .line 51
    invoke-direct {p2, p0}, Landroidx/appcompat/widget/AppCompatSpinner$e$b;-><init>(Landroidx/appcompat/widget/AppCompatSpinner$e;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Landroidx/appcompat/widget/AppCompatSpinner$e$c;

    .line 58
    .line 59
    invoke-direct {p1, p0, p2}, Landroidx/appcompat/widget/AppCompatSpinner$e$c;-><init>(Landroidx/appcompat/widget/AppCompatSpinner$e;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/b;->C(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public j()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->J:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->J:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-void
.end method

.method public l(Landroid/widget/ListAdapter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/widget/b;->l(Landroid/widget/ListAdapter;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e;->K:Landroid/widget/ListAdapter;

    .line 5
    .line 6
    return-void
.end method
