.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;,
        Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$e;
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:I

.field public h:J

.field public i:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;

.field public k:Z

.field public l:Z

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/CharSequence;

.field public o:Ljava/lang/CharSequence;

.field public p:I

.field public q:Ljava/lang/String;

.field public r:Lv/text/CustomTypefaceSpan;

.field public s:I

.field public t:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->e:Z

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h:J

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/f9c0;->d:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->p:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s:I

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->v(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->e:Z

    const/4 v0, 0x3

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    const-wide/16 v0, 0x0

    .line 39
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h:J

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Ll/f9c0;->d:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->p:I

    const/4 v0, 0x0

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s:I

    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->v(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x1

    .line 44
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->e:Z

    const/4 p3, 0x3

    .line 45
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    const-wide/16 v0, 0x0

    .line 46
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h:J

    .line 47
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Ll/f9c0;->d:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->p:I

    const/4 p3, 0x0

    .line 48
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s:I

    .line 49
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->v(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->C()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->D(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->p:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f:Z

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$e;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method private getAnimMoveValue()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/cq8;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/cq8;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private getLimitLineCount()I
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 2
    .line 3
    const v0, 0x7fffffff

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Landroid/util/Pair;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->i:Landroid/util/Pair;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->k:Z

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Landroid/util/Pair;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->i:Landroid/util/Pair;

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q(Z)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->F(Z)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->G(Z)V

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->setExpandViewHeight(F)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->K(II)V

    return-void
.end method

.method private setExpandViewHeight(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    float-to-int p1, p1

    .line 10
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final A(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move p1, v0

    .line 14
    :goto_0
    array-length v1, p0

    .line 15
    if-ge p1, v1, :cond_2

    .line 16
    .line 17
    aget-char v1, p0, p1

    .line 18
    .line 19
    invoke-static {v1}, Ll/a9g0;->i(C)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    return v0
.end method

.method public final synthetic C()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 10
    .line 11
    const v3, 0x7fffffff

    .line 12
    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getLimitLineCount()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/high16 v2, -0x80000000

    .line 34
    .line 35
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v5, v1, v4}, Landroid/view/View;->measure(II)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    .line 56
    .line 57
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 58
    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f:Z

    .line 66
    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getLimitLineCount()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 75
    .line 76
    :goto_1
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 77
    .line 78
    .line 79
    :goto_2
    if-ne v1, v0, :cond_3

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 82
    .line 83
    const/16 v0, 0x8

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f:Z

    .line 90
    .line 91
    if-nez v3, :cond_4

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    :cond_4
    new-instance v2, Landroid/util/Pair;

    .line 99
    .line 100
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-direct {v2, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->i:Landroid/util/Pair;

    .line 112
    .line 113
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->G(Z)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final synthetic D(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->setExpandViewHeight(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public E()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getAnimMoveValue()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final F(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->o:Ljava/lang/CharSequence;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->n:Ljava/lang/CharSequence;

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final G(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Lcom/p1/mobile/android/R$string;->a:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->m:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public H(Z)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Ljava/lang/CharSequence;Ljava/lang/String;Lv/text/CustomTypefaceSpan;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;
    .locals 3

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->r:Lv/text/CustomTypefaceSpan;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->r()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    add-int/2addr p1, p2

    .line 52
    const/16 p2, 0x21

    .line 53
    .line 54
    invoke-virtual {v0, p3, v2, p1, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->t:Ljava/lang/CharSequence;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->t:Ljava/lang/CharSequence;

    .line 71
    .line 72
    :goto_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f:Z

    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->w()V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->e:Z

    .line 86
    .line 87
    const p2, 0x7fffffff

    .line 88
    .line 89
    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    .line 93
    .line 94
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 95
    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 103
    .line 104
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 116
    .line 117
    .line 118
    :goto_1
    const/4 p1, 0x0

    .line 119
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->E()V

    .line 123
    .line 124
    .line 125
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public final K(II)V
    .locals 4

    .line 1
    int-to-float v0, p1

    .line 2
    int-to-float v1, p2

    .line 3
    const/4 v2, 0x2

    .line 4
    new-array v2, v2, [F

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput v0, v2, v3

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aput v1, v2, v0

    .line 11
    .line 12
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/bq8;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/bq8;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;

    .line 25
    .line 26
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 30
    .line 31
    .line 32
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h:J

    .line 33
    .line 34
    invoke-virtual {v0, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public getTextView()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->i:Landroid/util/Pair;

    .line 10
    .line 11
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->i:Landroid/util/Pair;

    .line 20
    .line 21
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->K(II)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->z()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s:I

    .line 11
    .line 12
    if-eq p2, p1, :cond_0

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s:I

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->t:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f:Z

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->w()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final q(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getLimitLineCount()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    const p0, 0x7fffffff

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->z()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-le v0, v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of p0, p0, Lv/VText;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    return v1
.end method

.method public setLineLimit(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnSizeChangeEndListener(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$e;)V
    .locals 0

    return-void
.end method

.method public final t(Ljava/lang/CharSequence;)Landroid/text/Layout;
    .locals 10

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int/2addr v0, v1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int v5, v0, v1

    .line 13
    .line 14
    new-instance v2, Landroid/text/StaticLayout;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/TextView;->getLineSpacingExtra()F

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    const/4 v9, 0x0

    .line 37
    move-object v3, p1

    .line 38
    invoke-direct/range {v2 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 39
    .line 40
    .line 41
    return-object v2
.end method

.method public final u(Ljava/lang/String;Landroid/text/TextPaint;F)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "..."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->m:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "\r|\n"

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x0

    .line 37
    :goto_0
    if-lez v1, :cond_3

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    cmpg-float v3, v3, p3

    .line 53
    .line 54
    if-gtz v3, :cond_1

    .line 55
    .line 56
    return-object v2

    .line 57
    :cond_1
    add-int/lit8 v3, v1, -0x1

    .line 58
    .line 59
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->A(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    add-int/lit8 v1, v1, -0x1

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    if-ne v1, v3, :cond_2

    .line 73
    .line 74
    move-object v2, v0

    .line 75
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    return-object v2
.end method

.method public final v(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->a:Landroid/content/Context;

    .line 2
    .line 3
    new-instance p1, Landroid/util/Pair;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, v0, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->i:Landroid/util/Pair;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0x8

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Ll/nhc0;->q:[I

    .line 35
    .line 36
    invoke-virtual {v0, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    sget v0, Ll/nhc0;->v:I

    .line 41
    .line 42
    const/4 v1, 0x3

    .line 43
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 48
    .line 49
    sget v0, Ll/nhc0;->r:I

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    int-to-long v2, v0

    .line 57
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h:J

    .line 58
    .line 59
    sget v0, Ll/nhc0;->w:I

    .line 60
    .line 61
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->e:Z

    .line 66
    .line 67
    sget p1, Ll/nhc0;->t:I

    .line 68
    .line 69
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->l:Z

    .line 74
    .line 75
    sget p1, Ll/nhc0;->u:I

    .line 76
    .line 77
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f:Z

    .line 82
    .line 83
    sget p1, Ll/nhc0;->s:I

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->m:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_0

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->c:I

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->m:Ljava/lang/String;

    .line 112
    .line 113
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    sget p1, Lcom/p1/mobile/android/R$string;->a:I

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 127
    .line 128
    .line 129
    :cond_1
    return-void
.end method

.method public final w()V
    .locals 8

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->t:Ljava/lang/CharSequence;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->t(Ljava/lang/CharSequence;)Landroid/text/Layout;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->t:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 23
    .line 24
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 25
    .line 26
    if-gt v1, v3, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->t:Ljava/lang/CharSequence;

    .line 29
    .line 30
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {p0, v2, v1, v3}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->x(Ljava/lang/String;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;

    .line 45
    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    const/4 v3, 0x0

    .line 49
    const-string v4, ""

    .line 50
    .line 51
    move-object v5, v4

    .line 52
    move-object v4, v3

    .line 53
    move v3, v1

    .line 54
    :goto_0
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 55
    .line 56
    if-ge v1, v6, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineEnd(I)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    invoke-virtual {v2, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g:I

    .line 67
    .line 68
    add-int/lit8 v7, v7, -0x1

    .line 69
    .line 70
    if-ne v1, v7, :cond_2

    .line 71
    .line 72
    move-object v4, v3

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    move-object v5, v3

    .line 90
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 91
    .line 92
    move v3, v6

    .line 93
    goto :goto_0

    .line 94
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 101
    .line 102
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {p0, v0, v1, v5, v4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->y(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 107
    .line 108
    .line 109
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d:Z

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 112
    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->o:Ljava/lang/CharSequence;

    .line 116
    .line 117
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->n:Ljava/lang/CharSequence;

    .line 122
    .line 123
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final x(Ljava/lang/String;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->b:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    add-int/2addr v1, v3

    .line 28
    new-instance v8, Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    invoke-direct {v8}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v8, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v8, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 37
    .line 38
    .line 39
    new-instance p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$b;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$b;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)V

    .line 42
    .line 43
    .line 44
    sub-int v0, v1, v0

    .line 45
    .line 46
    const/16 v3, 0x11

    .line 47
    .line 48
    invoke-virtual {v8, p1, v0, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Landroid/graphics/Paint;->getTextSize()F

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    float-to-int v3, p1

    .line 56
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->p:I

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget p2, Ll/f9c0;->k:I

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 69
    .line 70
    move v4, p3

    .line 71
    invoke-static/range {v2 .. v7}, Ll/g23;->d(Ljava/lang/String;IIIILandroid/graphics/Typeface;)Landroid/graphics/Bitmap;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p2, Landroid/text/style/ImageSpan;

    .line 76
    .line 77
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-direct {p2, p3, p1}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 80
    .line 81
    .line 82
    const/16 p1, 0x21

    .line 83
    .line 84
    invoke-virtual {v8, p2, v0, v1, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_0

    .line 94
    .line 95
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->r:Lv/text/CustomTypefaceSpan;

    .line 96
    .line 97
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    add-int/2addr v0, v1

    .line 124
    invoke-virtual {v8, p2, p3, v0, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 125
    .line 126
    .line 127
    :cond_0
    iput-object v8, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->o:Ljava/lang/CharSequence;

    .line 128
    .line 129
    return-object v8
.end method

.method public final y(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->m:Ljava/lang/String;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p4, p2, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->u(Ljava/lang/String;Landroid/text/TextPaint;F)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    add-int/lit8 p2, p2, -0x3

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    sub-int/2addr p2, p3

    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    add-int/lit8 p3, p3, 0x3

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    add-int/2addr p3, p4

    .line 54
    new-instance p4, Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    invoke-direct {p4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p4, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, "..."

    .line 63
    .line 64
    invoke-virtual {p4, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p4, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    .line 70
    new-instance p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$a;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$a;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)V

    .line 73
    .line 74
    .line 75
    sub-int p2, p3, p2

    .line 76
    .line 77
    const/16 v0, 0x11

    .line 78
    .line 79
    invoke-virtual {p4, p1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_0

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->r:Lv/text/CustomTypefaceSpan;

    .line 91
    .line 92
    invoke-virtual {p4}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-virtual {p4}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->q:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p3, v0

    .line 119
    const/16 v0, 0x21

    .line 120
    .line 121
    invoke-virtual {p4, p1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 122
    .line 123
    .line 124
    :cond_0
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->n:Ljava/lang/CharSequence;

    .line 125
    .line 126
    return-object p4
.end method

.method public final z()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lv/VText;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VText;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 26
    .line 27
    const/high16 v1, 0x41a80000    # 21.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setLineHeight(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->l:Z

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->b:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c:Lv/VText;

    .line 51
    .line 52
    const/16 v0, 0x8

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    const-string p0, "FeedExpandableTextContainer\u6587\u672c\u4f38\u7f29\u63a7\u4ef6\u7684\u5b50view\u4e0d\u5408\u6cd5\u3002\u9700\u8981\u5b50View\u6570\u91cf\u5927\u4e8e\u4e24\u4e2a\uff0c\u5e76\u4e14\u90fd\u662fTextView\u3002"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
