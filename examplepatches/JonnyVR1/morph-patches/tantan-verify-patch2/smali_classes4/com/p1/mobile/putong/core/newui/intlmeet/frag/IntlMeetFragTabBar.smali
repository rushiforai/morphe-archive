.class public Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VText;

.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:I

.field public final g:I

.field public final h:I

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->g:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->h:I

    .line 11
    .line 12
    const/high16 v1, 0x42300000    # 44.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->i:I

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->j:I

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->v(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 27
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 28
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->g:I

    const/4 v0, 0x1

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->h:I

    const/high16 v0, 0x42300000    # 44.0f

    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->i:I

    .line 31
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->j:I

    .line 32
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->v(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->g:I

    const/4 p3, 0x1

    .line 36
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->h:I

    const/high16 p3, 0x42300000    # 44.0f

    .line 37
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->i:I

    .line 38
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->j:I

    .line 39
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->v(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->z(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->B(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method private setBarStyle(I)V
    .locals 5

    .line 1
    const-string v0, "#CC000000"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "#66000000"

    .line 8
    .line 9
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 23
    .line 24
    invoke-static {v3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v3, "#FE7E1D"

    .line 42
    .line 43
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 48
    .line 49
    invoke-static {p1, v3, v4}, Ll/vs9;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 54
    .line 55
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->d:Lv/VText;

    .line 64
    .line 65
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->d:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    if-ne p1, v3, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 91
    .line 92
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 97
    .line 98
    .line 99
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 105
    .line 106
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->d:Lv/VText;

    .line 110
    .line 111
    invoke-static {v3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->d:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    .line 122
    .line 123
    :cond_1
    return-void
.end method

.method private v(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic B(Ll/z20;Landroid/view/View;)V
    .locals 2

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->e:Lv/VText;

    .line 12
    .line 13
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {p1, p2, v1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->E(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public C(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->setBarStyle(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public E(I)V
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->setBarStyle(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->F(I)V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 11
    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public F(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_3

    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->j:I

    .line 5
    .line 6
    if-gtz p1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 10
    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->e:Lv/VText;

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->e:Lv/VText;

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->j:I

    .line 21
    .line 22
    const/16 v0, 0x63

    .line 23
    .line 24
    if-le p0, v0, :cond_1

    .line 25
    .line 26
    const-string p0, "99+"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void

    .line 37
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->e:Lv/VText;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setNewVisitorCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->j:I

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->F(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ofo;->b(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w(Lcom/p1/mobile/android/app/Frag;Ll/z20;)V
    .locals 1
    .param p2    # Ll/z20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->setBarStyle(I)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->b:Lv/VText;

    .line 6
    .line 7
    new-instance v0, Ll/mfo;

    .line 8
    .line 9
    invoke-direct {v0, p0, p2}, Ll/mfo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;Ll/z20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->d:Lv/VText;

    .line 16
    .line 17
    new-instance v0, Ll/nfo;

    .line 18
    .line 19
    invoke-direct {v0, p0, p2}, Ll/nfo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;Ll/z20;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic z(Ll/z20;Landroid/view/View;)V
    .locals 2

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->f:I

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p2, 0x0

    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-interface {p1, v0, v1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->E(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
